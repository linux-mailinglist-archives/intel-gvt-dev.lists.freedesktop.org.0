Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3A16A0AD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Feb 2020 09:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8066E1D6;
	Mon, 24 Feb 2020 08:56:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B446E1D6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Feb 2020 08:56:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 00:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; d="scan'208";a="231068681"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 00:56:06 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: alex.williamson@redhat.com
Subject: [PATCH v3 1/7] vfio: allow external user to get vfio group from device
Date: Mon, 24 Feb 2020 03:46:41 -0500
Message-Id: <20200224084641.31696-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224084350.31574-1-yan.y.zhao@intel.com>
References: <20200224084350.31574-1-yan.y.zhao@intel.com>
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

external user is able to
1. add a device into an vfio group
2. call vfio_group_get_external_user_from_dev() with the device pointer
to get vfio_group associated with this device and increments the container
user counter to prevent the VFIO group from disposal before KVM exits.
3. When the external KVM finishes, it calls vfio_group_put_external_user()
to release the VFIO group.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/vfio/vfio.c  | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/vfio.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index c8482624ca34..914bdf4b9d73 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1720,6 +1720,43 @@ struct vfio_group *vfio_group_get_external_user(struct file *filep)
 }
 EXPORT_SYMBOL_GPL(vfio_group_get_external_user);
 
+/**
+ * External user API, exported by symbols to be linked dynamically.
+ *
+ * The protocol includes:
+ * 1. External user add a device into a vfio group
+ *
+ * 2. The external user calls vfio_group_get_external_user_from_dev()
+ * with the device pointer
+ * to verify that:
+ *	- there's a vfio group associated with it and is initialized;
+ *	- IOMMU is set for the vfio group.
+ * If both checks passed, vfio_group_get_external_user_from_dev()
+ * increments the container user counter to prevent
+ * the VFIO group from disposal before KVM exits.
+ *
+ * 3. When the external KVM finishes, it calls
+ * vfio_group_put_external_user() to release the VFIO group.
+ * This call decrements the container user counter.
+ */
+
+struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev)
+{
+	struct vfio_group *group;
+	int ret;
+
+	group = vfio_group_get_from_dev(dev);
+	if (!group)
+		return ERR_PTR(-ENODEV);
+
+	ret = vfio_group_add_container_user(group);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return group;
+}
+EXPORT_SYMBOL_GPL(vfio_group_get_external_user_from_dev);
+
 void vfio_group_put_external_user(struct vfio_group *group)
 {
 	vfio_group_try_dissolve_container(group);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e42a711a2800..2e1fa0c7396f 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -94,6 +94,8 @@ extern void vfio_unregister_iommu_driver(
  */
 extern struct vfio_group *vfio_group_get_external_user(struct file *filep);
 extern void vfio_group_put_external_user(struct vfio_group *group);
+extern
+struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev);
 extern bool vfio_external_group_match_file(struct vfio_group *group,
 					   struct file *filep);
 extern int vfio_external_user_iommu_id(struct vfio_group *group);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
