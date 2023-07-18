Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16102757E57
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 15:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A1F10E353;
	Tue, 18 Jul 2023 13:55:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4171110E348;
 Tue, 18 Jul 2023 13:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689688555; x=1721224555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDJ4P+I4IB3h9bC/RQx8HmPKkha0YdsOaiuNrvOnXiQ=;
 b=eHqs4HyzoTKEoxUuZI3n3q7UQNqzoXDWk7GWKke04iWeuNLTSluxsZC4
 ZLgzYhHbXqvdtBRPXWYtxMOMouoql4+5qPqPv6kg9IRqvhPth1v+SZSzA
 1IBe2aSM+KobAF6iRn66s/VDiVTT7YjktUotWRU3kP+G6WXf30sQ/0T+p
 BTNA0xWFt5r80OvBn/2XGnlBJDCcVlzseANZpMu6rPHydvH3YIHaUMUQ/
 KM5nwgbMUQixYdB52X4nRYRJ+VsIQF56XfwrzeKN9GFNAheYs4pIkKHyf
 C4SgtxC/VCG1IXjN/X4ARWUQyGWxl/j8/7u0seEt+JtGUY7Dst/JrgeND g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452590552"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452590552"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970250933"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="970250933"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 06:55:54 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v15 02/26] vfio: Refine vfio file kAPIs for KVM
Date: Tue, 18 Jul 2023 06:55:27 -0700
Message-Id: <20230718135551.6592-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718135551.6592-1-yi.l.liu@intel.com>
References: <20230718135551.6592-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, yi.l.liu@intel.com,
 kvm@vger.kernel.org, lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org,
 nicolinc@nvidia.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This prepares for making the below kAPIs to accept both group file
and device file instead of only vfio group file.

  bool vfio_file_enforced_coherent(struct file *file);
  void vfio_file_set_kvm(struct file *file, struct kvm *kvm);

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Tested-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 53 +++++++++++++---------------------------
 drivers/vfio/vfio.h      |  3 +++
 drivers/vfio/vfio_main.c | 49 +++++++++++++++++++++++++++++++++++++
 include/linux/vfio.h     |  1 +
 virt/kvm/vfio.c          | 10 ++++----
 5 files changed, 75 insertions(+), 41 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index fbba9fc15e57..b56e19d2a02d 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -754,6 +754,15 @@ bool vfio_device_has_container(struct vfio_device *device)
 	return device->group->container;
 }
 
+struct vfio_group *vfio_group_from_file(struct file *file)
+{
+	struct vfio_group *group = file->private_data;
+
+	if (file->f_op != &vfio_group_fops)
+		return NULL;
+	return group;
+}
+
 /**
  * vfio_file_iommu_group - Return the struct iommu_group for the vfio group file
  * @file: VFIO group file
@@ -764,13 +773,13 @@ bool vfio_device_has_container(struct vfio_device *device)
  */
 struct iommu_group *vfio_file_iommu_group(struct file *file)
 {
-	struct vfio_group *group = file->private_data;
+	struct vfio_group *group = vfio_group_from_file(file);
 	struct iommu_group *iommu_group = NULL;
 
 	if (!IS_ENABLED(CONFIG_SPAPR_TCE_IOMMU))
 		return NULL;
 
-	if (!vfio_file_is_group(file))
+	if (!group)
 		return NULL;
 
 	mutex_lock(&group->group_lock);
@@ -784,33 +793,20 @@ struct iommu_group *vfio_file_iommu_group(struct file *file)
 EXPORT_SYMBOL_GPL(vfio_file_iommu_group);
 
 /**
- * vfio_file_is_group - True if the file is usable with VFIO aPIS
+ * vfio_file_is_group - True if the file is a vfio group file
  * @file: VFIO group file
  */
 bool vfio_file_is_group(struct file *file)
 {
-	return file->f_op == &vfio_group_fops;
+	return vfio_group_from_file(file);
 }
 EXPORT_SYMBOL_GPL(vfio_file_is_group);
 
-/**
- * vfio_file_enforced_coherent - True if the DMA associated with the VFIO file
- *        is always CPU cache coherent
- * @file: VFIO group file
- *
- * Enforced coherency means that the IOMMU ignores things like the PCIe no-snoop
- * bit in DMA transactions. A return of false indicates that the user has
- * rights to access additional instructions such as wbinvd on x86.
- */
-bool vfio_file_enforced_coherent(struct file *file)
+bool vfio_group_enforced_coherent(struct vfio_group *group)
 {
-	struct vfio_group *group = file->private_data;
 	struct vfio_device *device;
 	bool ret = true;
 
-	if (!vfio_file_is_group(file))
-		return true;
-
 	/*
 	 * If the device does not have IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
 	 * any domain later attached to it will also not support it. If the cap
@@ -828,28 +824,13 @@ bool vfio_file_enforced_coherent(struct file *file)
 	mutex_unlock(&group->device_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 
-/**
- * vfio_file_set_kvm - Link a kvm with VFIO drivers
- * @file: VFIO group file
- * @kvm: KVM to link
- *
- * When a VFIO device is first opened the KVM will be available in
- * device->kvm if one was associated with the group.
- */
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
+void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
 {
-	struct vfio_group *group = file->private_data;
-
-	if (!vfio_file_is_group(file))
-		return;
-
 	spin_lock(&group->kvm_ref_lock);
 	group->kvm = kvm;
 	spin_unlock(&group->kvm_ref_lock);
 }
-EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 
 /**
  * vfio_file_has_dev - True if the VFIO file is a handle for device
@@ -860,9 +841,9 @@ EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
  */
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
 {
-	struct vfio_group *group = file->private_data;
+	struct vfio_group *group = vfio_group_from_file(file);
 
-	if (!vfio_file_is_group(file))
+	if (!group)
 		return false;
 
 	return group == device->group;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 87d3dd6b9ef9..b1e327a85a32 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -90,6 +90,9 @@ void vfio_device_group_unregister(struct vfio_device *device);
 int vfio_device_group_use_iommu(struct vfio_device *device);
 void vfio_device_group_unuse_iommu(struct vfio_device *device);
 void vfio_device_group_close(struct vfio_device *device);
+struct vfio_group *vfio_group_from_file(struct file *file);
+bool vfio_group_enforced_coherent(struct vfio_group *group);
+void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
 bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 39c1158ffef0..4665791aa2eb 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1190,6 +1190,55 @@ const struct file_operations vfio_device_fops = {
 	.mmap		= vfio_device_fops_mmap,
 };
 
+/**
+ * vfio_file_is_valid - True if the file is valid vfio file
+ * @file: VFIO group file or VFIO device file
+ */
+bool vfio_file_is_valid(struct file *file)
+{
+	return vfio_group_from_file(file);
+}
+EXPORT_SYMBOL_GPL(vfio_file_is_valid);
+
+/**
+ * vfio_file_enforced_coherent - True if the DMA associated with the VFIO file
+ *        is always CPU cache coherent
+ * @file: VFIO group file or VFIO device file
+ *
+ * Enforced coherency means that the IOMMU ignores things like the PCIe no-snoop
+ * bit in DMA transactions. A return of false indicates that the user has
+ * rights to access additional instructions such as wbinvd on x86.
+ */
+bool vfio_file_enforced_coherent(struct file *file)
+{
+	struct vfio_group *group;
+
+	group = vfio_group_from_file(file);
+	if (group)
+		return vfio_group_enforced_coherent(group);
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
+
+/**
+ * vfio_file_set_kvm - Link a kvm with VFIO drivers
+ * @file: VFIO group file or VFIO device file
+ * @kvm: KVM to link
+ *
+ * When a VFIO device is first opened the KVM will be available in
+ * device->kvm if one was associated with the file.
+ */
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
+{
+	struct vfio_group *group;
+
+	group = vfio_group_from_file(file);
+	if (group)
+		vfio_group_set_kvm(group, kvm);
+}
+EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
+
 /*
  * Sub-module support
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 7079911edfb1..06a5221949c5 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -272,6 +272,7 @@ int vfio_mig_get_next_state(struct vfio_device *device,
  */
 struct iommu_group *vfio_file_iommu_group(struct file *file);
 bool vfio_file_is_group(struct file *file);
+bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index 9584eb57e0ed..b33c7b8488b3 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -64,18 +64,18 @@ static bool kvm_vfio_file_enforced_coherent(struct file *file)
 	return ret;
 }
 
-static bool kvm_vfio_file_is_group(struct file *file)
+static bool kvm_vfio_file_is_valid(struct file *file)
 {
 	bool (*fn)(struct file *file);
 	bool ret;
 
-	fn = symbol_get(vfio_file_is_group);
+	fn = symbol_get(vfio_file_is_valid);
 	if (!fn)
 		return false;
 
 	ret = fn(file);
 
-	symbol_put(vfio_file_is_group);
+	symbol_put(vfio_file_is_valid);
 
 	return ret;
 }
@@ -154,8 +154,8 @@ static int kvm_vfio_group_add(struct kvm_device *dev, unsigned int fd)
 	if (!filp)
 		return -EBADF;
 
-	/* Ensure the FD is a vfio group FD.*/
-	if (!kvm_vfio_file_is_group(filp)) {
+	/* Ensure the FD is a vfio FD. */
+	if (!kvm_vfio_file_is_valid(filp)) {
 		ret = -EINVAL;
 		goto err_fput;
 	}
-- 
2.34.1

