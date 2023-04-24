Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53E6D3198
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 16:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E6710E2DE;
	Sat,  1 Apr 2023 14:44:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528D510E05B;
 Sat,  1 Apr 2023 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680360278; x=1711896278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1njmBfLyEIbN6KIP5rpN8/ygwQRUQXPg4sAwefM7UhA=;
 b=GHpkaQlcX/EHyOS/C1QY2DI22MgfBNfLxPZe5dYhmmBo4qWDyDKwSKzl
 FyjyxvddldnKRxF9Lc70vK6BiIQelOHL5ngtxOqS5NrsJ3w1iH8b5PO+f
 AqogmEmcJZbzEDv50o4he+Jb9P/PuMr7G4SrzkhwWzPvxVxHDL7DIMIz5
 dQSeHI+RFbhBqs5oZ8Y0CMpDdUufe/OoE2fkAFZLPEibpD9UL4X9fv5iq
 2zEfM7AjYboow6ucPPjM2p3hGCx9tcAZxzDGWdl0XrirPdYi0AneasSmj
 Rk7J8EedWEwN9SWZqe4A9cH5shKlLBlwVRJH1nPY8YBge3AMU/Nn3IDUu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340385150"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="340385150"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 07:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662705844"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="662705844"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 07:44:37 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 08/12] vfio/pci: Renaming for accepting device fd in hot
 reset path
Date: Sat,  1 Apr 2023 07:44:25 -0700
Message-Id: <20230401144429.88673-9-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401144429.88673-1-yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, yi.l.liu@intel.com, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

No functional change is intended.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 52 ++++++++++++++++----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 2a510b71edcb..da6325008872 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -177,10 +177,10 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
 	}
 }
 
-struct vfio_pci_group_info;
+struct vfio_pci_file_info;
 static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups,
+				      struct vfio_pci_file_info *info,
 				      struct iommufd_ctx *iommufd_ctx);
 
 /*
@@ -800,7 +800,7 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 	return 0;
 }
 
-struct vfio_pci_group_info {
+struct vfio_pci_file_info {
 	int count;
 	struct file **files;
 };
@@ -1257,14 +1257,14 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 }
 
 static int
-vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
-				    struct vfio_pci_hot_reset *hdr,
-				    bool slot,
-				    struct vfio_pci_hot_reset __user *arg)
+vfio_pci_ioctl_pci_hot_reset_files(struct vfio_pci_core_device *vdev,
+				   struct vfio_pci_hot_reset *hdr,
+				   bool slot,
+				   struct vfio_pci_hot_reset __user *arg)
 {
-	int32_t *group_fds;
+	int32_t *fds;
 	struct file **files;
-	struct vfio_pci_group_info info;
+	struct vfio_pci_file_info info;
 	int file_idx, count = 0, ret = 0;
 
 	/*
@@ -1281,17 +1281,17 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
 	if (hdr->count > count)
 		return -EINVAL;
 
-	group_fds = kcalloc(hdr->count, sizeof(*group_fds), GFP_KERNEL);
+	fds = kcalloc(hdr->count, sizeof(*fds), GFP_KERNEL);
 	files = kcalloc(hdr->count, sizeof(*files), GFP_KERNEL);
-	if (!group_fds || !files) {
-		kfree(group_fds);
+	if (!fds || !files) {
+		kfree(fds);
 		kfree(files);
 		return -ENOMEM;
 	}
 
-	if (copy_from_user(group_fds, arg->group_fds,
-			   hdr->count * sizeof(*group_fds))) {
-		kfree(group_fds);
+	if (copy_from_user(fds, arg->group_fds,
+			   hdr->count * sizeof(*fds))) {
+		kfree(fds);
 		kfree(files);
 		return -EFAULT;
 	}
@@ -1301,7 +1301,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
 	 * the reset
 	 */
 	for (file_idx = 0; file_idx < hdr->count; file_idx++) {
-		struct file *file = fget(group_fds[file_idx]);
+		struct file *file = fget(fds[file_idx]);
 
 		if (!file) {
 			ret = -EBADF;
@@ -1318,9 +1318,9 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
 		files[file_idx] = file;
 	}
 
-	kfree(group_fds);
+	kfree(fds);
 
-	/* release reference to groups on error */
+	/* release reference to fds on error */
 	if (ret)
 		goto hot_reset_release;
 
@@ -1358,7 +1358,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 		return -ENODEV;
 
 	if (hdr.count)
-		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
+		return vfio_pci_ioctl_pci_hot_reset_files(vdev, &hdr, slot, arg);
 
 	iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
 
@@ -2329,16 +2329,16 @@ const struct pci_error_handlers vfio_pci_core_err_handlers = {
 };
 EXPORT_SYMBOL_GPL(vfio_pci_core_err_handlers);
 
-static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
-			       struct vfio_pci_group_info *groups)
+static bool vfio_dev_in_files(struct vfio_pci_core_device *vdev,
+			      struct vfio_pci_file_info *info)
 {
 	unsigned int i;
 
-	if (!groups)
+	if (!info)
 		return false;
 
-	for (i = 0; i < groups->count; i++)
-		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
+	for (i = 0; i < info->count; i++)
+		if (vfio_file_has_dev(info->files[i], &vdev->vdev))
 			return true;
 	return false;
 }
@@ -2429,7 +2429,7 @@ static bool vfio_dev_in_iommufd_ctx(struct vfio_pci_core_device *vdev,
  * get each memory_lock.
  */
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups,
+				      struct vfio_pci_file_info *info,
 				      struct iommufd_ctx *iommufd_ctx)
 {
 	struct vfio_pci_core_device *cur_mem;
@@ -2478,7 +2478,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		 * the calling device is in a singleton dev_set.
 		 */
 		if (cur_vma->vdev.open_count &&
-		    !vfio_dev_in_groups(cur_vma, groups) &&
+		    !vfio_dev_in_files(cur_vma, info) &&
 		    !vfio_dev_in_iommufd_ctx(cur_vma, iommufd_ctx) &&
 		    (dev_set->device_count > 1)) {
 			ret = -EINVAL;
-- 
2.34.1

