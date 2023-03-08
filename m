Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329316B08CC
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C49B10E603;
	Wed,  8 Mar 2023 13:29:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8873310E602;
 Wed,  8 Mar 2023 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282164; x=1709818164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z989pXr8cKO9ICuEG/SHwdMZNnkhbkrQGmWc0s0dx1c=;
 b=FXUCyU9sgZqpUUqSL6sTqIePQLNSVw4q3QZ/08nmCdOVYXtTLVOr7dKb
 WbGzYvnsc5MJSCoU3aUZhXWeD6AHEer998CDYb7MG6vx3K6Cqi9fIBmlV
 MusTNzJS+DkfIye/MzV3qaYcMJC9+BMHP4q/dHMkiFyEuBWhERMyENNZI
 gRBkeVSU1lL9RLWWVnY3inqRGcGgtW7NQPElinp8+PORHjyzKc7EdBnU7
 9CenZgqaOPcPtaM5E4BXPI0It0sDTnxxgz/9673sDpMMK7Nu/7FNv6NyH
 U9ikBZLWI+JM4chfemM5trB61uMakRgFcX0T4sskFFuaXoUuXQJDss+wR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165208"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165208"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789357"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789357"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:23 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 10/24] vfio/pci: Rename the helpers and data in hot reset
 path to accept device fd
Date: Wed,  8 Mar 2023 05:28:49 -0800
Message-Id: <20230308132903.465159-11-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308132903.465159-1-yi.l.liu@intel.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
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

No function change is intended, just to make the helpers and structures
to be prepared to accept device fds as proof of device ownership.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 40 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index f13b093557a9..265a0058436c 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -177,10 +177,10 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
 	}
 }
 
-struct vfio_pci_group_info;
+struct vfio_pci_user_file_info;
 static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups);
+				      struct vfio_pci_user_file_info *user_info);
 
 /*
  * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
@@ -799,7 +799,7 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 	return 0;
 }
 
-struct vfio_pci_group_info {
+struct vfio_pci_user_file_info {
 	int count;
 	struct file **files;
 };
@@ -1260,9 +1260,9 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 {
 	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
 	struct vfio_pci_hot_reset hdr;
-	int32_t *group_fds;
+	int32_t *user_fds;
 	struct file **files;
-	struct vfio_pci_group_info info;
+	struct vfio_pci_user_file_info info;
 	bool slot = false;
 	int file_idx, count = 0, ret = 0;
 
@@ -1292,17 +1292,17 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	if (!hdr.count || hdr.count > count)
 		return -EINVAL;
 
-	group_fds = kcalloc(hdr.count, sizeof(*group_fds), GFP_KERNEL);
+	user_fds = kcalloc(hdr.count, sizeof(*user_fds), GFP_KERNEL);
 	files = kcalloc(hdr.count, sizeof(*files), GFP_KERNEL);
-	if (!group_fds || !files) {
-		kfree(group_fds);
+	if (!user_fds || !files) {
+		kfree(user_fds);
 		kfree(files);
 		return -ENOMEM;
 	}
 
-	if (copy_from_user(group_fds, arg->group_fds,
-			   hdr.count * sizeof(*group_fds))) {
-		kfree(group_fds);
+	if (copy_from_user(user_fds, arg->group_fds,
+			   hdr.count * sizeof(*user_fds))) {
+		kfree(user_fds);
 		kfree(files);
 		return -EFAULT;
 	}
@@ -1312,7 +1312,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	 * the reset
 	 */
 	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
-		struct file *file = fget(group_fds[file_idx]);
+		struct file *file = fget(user_fds[file_idx]);
 
 		if (!file) {
 			ret = -EBADF;
@@ -1329,9 +1329,9 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 		files[file_idx] = file;
 	}
 
-	kfree(group_fds);
+	kfree(user_fds);
 
-	/* release reference to groups on error */
+	/* release reference to user_fds on error */
 	if (ret)
 		goto hot_reset_release;
 
@@ -2312,13 +2312,13 @@ const struct pci_error_handlers vfio_pci_core_err_handlers = {
 };
 EXPORT_SYMBOL_GPL(vfio_pci_core_err_handlers);
 
-static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
-			       struct vfio_pci_group_info *groups)
+static bool vfio_dev_in_user_fds(struct vfio_pci_core_device *vdev,
+				 struct vfio_pci_user_file_info *user_info)
 {
 	unsigned int i;
 
-	for (i = 0; i < groups->count; i++)
-		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
+	for (i = 0; i < user_info->count; i++)
+		if (vfio_file_has_dev(user_info->files[i], &vdev->vdev))
 			return true;
 	return false;
 }
@@ -2398,7 +2398,7 @@ static int vfio_pci_dev_set_pm_runtime_get(struct vfio_device_set *dev_set)
  * get each memory_lock.
  */
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups)
+				      struct vfio_pci_user_file_info *user_info)
 {
 	struct vfio_pci_core_device *cur_mem;
 	struct vfio_pci_core_device *cur_vma;
@@ -2445,7 +2445,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		 * set of groups provided by the user.
 		 */
 		if (cur_vma->vdev.open_count &&
-		    !vfio_dev_in_groups(cur_vma, groups)) {
+		    !vfio_dev_in_user_fds(cur_vma, user_info)) {
 			ret = -EINVAL;
 			goto err_undo;
 		}
-- 
2.34.1

