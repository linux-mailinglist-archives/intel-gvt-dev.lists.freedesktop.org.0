Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F4183F85
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Mar 2020 04:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8B6E03F;
	Fri, 13 Mar 2020 03:19:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71606E03F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Mar 2020 03:19:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 20:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="278065395"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2020 20:19:16 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] vfio: avoid inefficient operations on VFIO group in
 vfio_pin/unpin_pages
Date: Thu, 12 Mar 2020 23:09:47 -0400
Message-Id: <20200313030947.7884-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313030548.7705-1-yan.y.zhao@intel.com>
References: <20200313030548.7705-1-yan.y.zhao@intel.com>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, peterx@redhat.com,
 alex.williamson@redhat.com, zhenyuw@linux.intel.com, pbonzini@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

vfio_group_pin_pages() and vfio_group_unpin_pages() are introduced to
avoid inefficient search/check/ref/deref opertions associated with VFIO
group as those in each calling into vfio_pin_pages() and
vfio_unpin_pages().

VFIO group is taken as arg directly. The callers combine
search/check/ref/deref operations associated with VFIO group by calling
vfio_group_get_external_user()/vfio_group_get_external_user_from_dev()
beforehand, and vfio_group_put_external_user() afterwards.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/vfio/vfio.c  | 91 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/vfio.h |  6 +++
 2 files changed, 97 insertions(+)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 6997f711b925..210fcf426643 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1999,6 +1999,97 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
+/*
+ * Pin a set of guest IOVA PFNs and return their associated host PFNs for a
+ * VFIO group.
+ *
+ * The caller needs to call vfio_group_get_external_user() or
+ * vfio_group_get_external_user_from_dev() prior to calling this interface,
+ * so as to prevent the VFIO group from disposal in the middle of the call.
+ * But it can keep the reference to the VFIO group for several calls into
+ * this interface.
+ * After finishing using of the VFIO group, the caller needs to release the
+ * VFIO group by calling vfio_group_put_external_user().
+ *
+ * @group [in]		: VFIO group
+ * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be pinned.
+ * @npage [in]		: count of elements in user_iova_pfn array.
+ *			  This count should not be greater
+ *			  VFIO_PIN_PAGES_MAX_ENTRIES.
+ * @prot [in]		: protection flags
+ * @phys_pfn [out]	: array of host PFNs
+ * Return error or number of pages pinned.
+ */
+int vfio_group_pin_pages(struct vfio_group *group,
+			 unsigned long *user_iova_pfn, int npage,
+			 int prot, unsigned long *phys_pfn)
+{
+	struct vfio_container *container;
+	struct vfio_iommu_driver *driver;
+	int ret;
+
+	if (!group || !user_iova_pfn || !phys_pfn || !npage)
+		return -EINVAL;
+
+	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
+		return -E2BIG;
+
+	container = group->container;
+	driver = container->iommu_driver;
+	if (likely(driver && driver->ops->pin_pages))
+		ret = driver->ops->pin_pages(container->iommu_data,
+					     user_iova_pfn, npage,
+					     prot, phys_pfn);
+	else
+		ret = -ENOTTY;
+
+	return ret;
+}
+EXPORT_SYMBOL(vfio_group_pin_pages);
+
+/*
+ * Unpin a set of guest IOVA PFNs for a VFIO group.
+ *
+ * The caller needs to call vfio_group_get_external_user() or
+ * vfio_group_get_external_user_from_dev() prior to calling this interface,
+ * so as to prevent the VFIO group from disposal in the middle of the call.
+ * But it can keep the reference to the VFIO group for several calls into
+ * this interface.
+ * After finishing using of the VFIO group, the caller needs to release the
+ * VFIO group by calling vfio_group_put_external_user().
+ *
+ * @group [in]		: vfio group
+ * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be unpinned.
+ * @npage [in]		: count of elements in user_iova_pfn array.
+ *			  This count should not be greater than
+ *			  VFIO_PIN_PAGES_MAX_ENTRIES.
+ * Return error or number of pages unpinned.
+ */
+int vfio_group_unpin_pages(struct vfio_group *group,
+			   unsigned long *user_iova_pfn, int npage)
+{
+	struct vfio_container *container;
+	struct vfio_iommu_driver *driver;
+	int ret;
+
+	if (!group || !user_iova_pfn || !npage)
+		return -EINVAL;
+
+	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
+		return -E2BIG;
+
+	container = group->container;
+	driver = container->iommu_driver;
+	if (likely(driver && driver->ops->unpin_pages))
+		ret = driver->ops->unpin_pages(container->iommu_data,
+					       user_iova_pfn, npage);
+	else
+		ret = -ENOTTY;
+
+	return ret;
+}
+EXPORT_SYMBOL(vfio_group_unpin_pages);
+
 
 /*
  * This interface allows the CPUs to perform some sort of virtual DMA on
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 34b2fdf4de6e..be2bd358b952 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -111,6 +111,12 @@ extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
 extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
 			    int npage);
 
+extern int vfio_group_pin_pages(struct vfio_group *group,
+				unsigned long *user_iova_pfn, int npage,
+				int prot, unsigned long *phys_pfn);
+extern int vfio_group_unpin_pages(struct vfio_group *group,
+				  unsigned long *user_iova_pfn, int npage);
+
 extern int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
