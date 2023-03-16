Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B81E6BCFC4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343DA10ECC4;
	Thu, 16 Mar 2023 12:42:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D36910E1EB;
 Thu, 16 Mar 2023 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678970544; x=1710506544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5VOwMbZ7NFEp3Vz3lWCBa2rwgc7032UbcA9JSi84oFw=;
 b=PKPVLC3qtPzSd9lh+0OEdioQxPJRET9bELqHs0zmVgnQErJp/BQmZA8X
 BOhF7J0Rp+1+qjxZQ3HGBfxjsA/CC4FpQMjGvVUsdWJroTrsKE0VUEhuj
 g4S789RnC77YKnJSqk6PVNZoq4kOFL6H68bUfe8QxLjy/pyORLvJkzV6N
 elAp+9QkLQ+IwQeGh0WCpeybDSx1rAEz5XbflGRcSSD2swfPy+yUn6ej5
 T2eYL9EpsJqWCWY5agMx7YEr2d08FfYmkbVhN+zxnwKKTlRSyOwIy9Xw4
 ChNpnjdhz2hjbOSfCroJ2hqVFgMbDznz+xaOZ9J9orw9gfD3rr7wVq8rh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="321812086"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="321812086"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="1009207959"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009207959"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2023 05:42:11 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH 4/7] vfio/pci: Renaming for accepting device fd in hot reset
 path
Date: Thu, 16 Mar 2023 05:41:53 -0700
Message-Id: <20230316124156.12064-5-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316124156.12064-1-yi.l.liu@intel.com>
References: <20230316124156.12064-1-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 xudong.hao@intel.com, peterx@redhat.com, yan.y.zhao@intel.com,
 eric.auger@redhat.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

No functional change is intended.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 55 ++++++++++++++++----------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index b68fcba67a4b..b6b5624c8b15 100644
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
@@ -2469,7 +2469,8 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		 * cannot race being opened by another user simultaneously.
 		 *
 		 * Otherwise all opened devices in the dev_set must be
-		 * contained by the set of groups provided by the user.
+		 * contained by the set of groups/devices provided by
+		 * the user.
 		 *
 		 * If user provides a zero-length array, then all the
 		 * opened devices must be bound to a same iommufd_ctx.
@@ -2478,7 +2479,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
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

