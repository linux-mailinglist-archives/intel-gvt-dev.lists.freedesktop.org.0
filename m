Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8713B88F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jan 2020 05:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761E36E844;
	Wed, 15 Jan 2020 04:03:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561846E844
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jan 2020 04:03:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 20:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="217983181"
Received: from unknown (HELO joy-OptiPlex-7040.sh.intel.com) ([10.239.13.9])
 by orsmga008.jf.intel.com with ESMTP; 14 Jan 2020 20:03:01 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: alex.williamson@redhat.com
Subject: [PATCH v2 1/2] vfio: introduce vfio_dma_rw to read/write a range of
 IOVAs
Date: Tue, 14 Jan 2020 22:53:03 -0500
Message-Id: <20200115035303.12362-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115034132.2753-1-yan.y.zhao@intel.com>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
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
Cc: kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, peterx@redhat.com,
 pbonzini@redhat.com, intel-gvt-dev@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

vfio_dma_rw will read/write a range of user space memory pointed to by
IOVA into/from a kernel buffer without pinning the user space memory.

TODO: mark the IOVAs to user space memory dirty if they are written in
vfio_dma_rw().

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/vfio/vfio.c             | 45 +++++++++++++++++++
 drivers/vfio/vfio_iommu_type1.c | 76 +++++++++++++++++++++++++++++++++
 include/linux/vfio.h            |  5 +++
 3 files changed, 126 insertions(+)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index c8482624ca34..8bd52bc841cf 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1961,6 +1961,51 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
+/*
+ * Read/Write a range of IOVAs pointing to user space memory into/from a kernel
+ * buffer without pinning the user space memory
+ * @dev [in]  : device
+ * @iova [in] : base IOVA of a user space buffer
+ * @data [in] : pointer to kernel buffer
+ * @len [in]  : kernel buffer length
+ * @write     : indicate read or write
+ * Return error code on failure or 0 on success.
+ */
+int vfio_dma_rw(struct device *dev, dma_addr_t iova, void *data,
+		   size_t len, bool write)
+{
+	struct vfio_container *container;
+	struct vfio_group *group;
+	struct vfio_iommu_driver *driver;
+	int ret = 0;
+
+	if (!dev || !data || len <= 0)
+		return -EINVAL;
+
+	group = vfio_group_get_from_dev(dev);
+	if (!group)
+		return -ENODEV;
+
+	ret = vfio_group_add_container_user(group);
+	if (ret)
+		goto out;
+
+	container = group->container;
+	driver = container->iommu_driver;
+
+	if (likely(driver && driver->ops->dma_rw))
+		ret = driver->ops->dma_rw(container->iommu_data,
+					   iova, data, len, write);
+	else
+		ret = -ENOTTY;
+
+	vfio_group_try_dissolve_container(group);
+out:
+	vfio_group_put(group);
+	return ret;
+}
+EXPORT_SYMBOL(vfio_dma_rw);
+
 static int vfio_register_iommu_notifier(struct vfio_group *group,
 					unsigned long *events,
 					struct notifier_block *nb)
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 2ada8e6cdb88..a2d850b97ae6 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -27,6 +27,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/mm.h>
+#include <linux/mmu_context.h>
 #include <linux/rbtree.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
@@ -2326,6 +2327,80 @@ static int vfio_iommu_type1_unregister_notifier(void *iommu_data,
 	return blocking_notifier_chain_unregister(&iommu->notifier, nb);
 }
 
+static size_t vfio_iommu_type1_rw_dma_nopin(struct vfio_iommu *iommu,
+					    dma_addr_t iova, void *data,
+					    size_t count, bool write)
+{
+	struct mm_struct *mm;
+	unsigned long vaddr;
+	struct vfio_dma *dma;
+	bool kthread = current->mm == NULL;
+	size_t done = 0;
+	size_t offset;
+
+	dma = vfio_find_dma(iommu, iova, 1);
+	if (!dma)
+		return 0;
+
+	if (write && !(dma->prot & IOMMU_WRITE))
+		return 0;
+
+	mm = get_task_mm(dma->task);
+
+	if (!mm)
+		return 0;
+
+	if (kthread)
+		use_mm(mm);
+	else if (current->mm != mm)
+		goto out;
+
+	offset = iova - dma->iova;
+
+	if (count > dma->size - offset)
+		count = dma->size - offset;
+
+	vaddr = dma->vaddr + offset;
+
+	if (write)
+		done = __copy_to_user((void __user *)vaddr, data, count) ?
+				       0 : count;
+	else
+		done = __copy_from_user(data, (void __user *)vaddr, count) ?
+					0 : count;
+
+	if (kthread)
+		unuse_mm(mm);
+out:
+	mmput(mm);
+	return done;
+}
+
+static int vfio_iommu_type1_dma_rw(void *iommu_data, dma_addr_t iova,
+				   void *data, size_t count, bool write)
+{
+	struct vfio_iommu *iommu = iommu_data;
+	int ret = 0;
+	size_t done = 0;
+
+	mutex_lock(&iommu->lock);
+	while (count > 0) {
+		done = vfio_iommu_type1_rw_dma_nopin(iommu, iova, data,
+						   count, write);
+		if (!done) {
+			ret = -EFAULT;
+			break;
+		}
+
+		count -= done;
+		data += done;
+		iova += done;
+	}
+
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
 static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
 	.name			= "vfio-iommu-type1",
 	.owner			= THIS_MODULE,
@@ -2338,6 +2413,7 @@ static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
 	.unpin_pages		= vfio_iommu_type1_unpin_pages,
 	.register_notifier	= vfio_iommu_type1_register_notifier,
 	.unregister_notifier	= vfio_iommu_type1_unregister_notifier,
+	.dma_rw			= vfio_iommu_type1_dma_rw,
 };
 
 static int __init vfio_iommu_type1_init(void)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e42a711a2800..962f76a2d668 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -82,6 +82,8 @@ struct vfio_iommu_driver_ops {
 					     struct notifier_block *nb);
 	int		(*unregister_notifier)(void *iommu_data,
 					       struct notifier_block *nb);
+	int		(*dma_rw)(void *iommu_data, dma_addr_t iova,
+				   void *data, size_t count, bool write);
 };
 
 extern int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops);
@@ -107,6 +109,9 @@ extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
 extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
 			    int npage);
 
+extern int vfio_dma_rw(struct device *dev, dma_addr_t iova, void *data,
+		       size_t len, bool write);
+
 /* each type has independent events */
 enum vfio_notify_type {
 	VFIO_IOMMU_NOTIFY = 0,
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
