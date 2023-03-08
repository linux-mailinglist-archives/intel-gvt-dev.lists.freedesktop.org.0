Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A46B08CE
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2103210E607;
	Wed,  8 Mar 2023 13:29:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F4D10E5E1;
 Wed,  8 Mar 2023 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282166; x=1709818166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0L0vMMuWTJTwe95x2UEU2BefzXax/kTZVXcty/RFtNc=;
 b=TYfbn25KFbts+yju3XD/Svzkp8GK/0WA2MBUPkdZZVHl0mjfZD9C9CuV
 WFXBUiI1uky1rAYGLYKhlbZPJyhnjNfQ3oOKbuzPNGCQlMb9kk1tVCMyJ
 efDU+PKw2FaRwI+vZDIRlwmVEf7knlQiZDTM+2wWlbSdvTxQ+IgrlxEMl
 iwNKvnlPIL3g7L0NURcW18qfijOSMm5QIgAJmIJ98y0k7dc+9sSL+tnyn
 bCIF8AVfwvi7cZXX2A581sV8s8VnystNDGNsCKvHppLTjnAW510OjDCcy
 8Npoa1HFByJbl/2cZqDOYm3HIC/mCQrCLk7dbdTDX+tBM/6pLz7WG7t4n Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165217"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165217"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789376"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789376"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:24 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 11/24] vfio/pci: Accept device fd in
 VFIO_DEVICE_PCI_HOT_RESET ioctl
Date: Wed,  8 Mar 2023 05:28:50 -0800
Message-Id: <20230308132903.465159-12-yi.l.liu@intel.com>
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

VFIO PCI device hot reset requires user to provide a set of FDs to prove
ownership on the affected devices in the hot reset. Either group fd or
device fd can be used. But when user uses vfio device cdev, there is only
device fd, hence VFIO_DEVICE_PCI_HOT_RESET needs to be extended to accept
device fds.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c             | 15 +-----------
 drivers/vfio/pci/vfio_pci_core.c | 22 +++++++++++------
 drivers/vfio/vfio.h              |  1 +
 drivers/vfio/vfio_main.c         | 42 ++++++++++++++++++++++++++++++++
 include/linux/vfio.h             |  1 +
 include/uapi/linux/vfio.h        |  6 +++--
 6 files changed, 63 insertions(+), 24 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 4a220d5bf79b..6280368eb0bd 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -852,23 +852,10 @@ void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
 	spin_unlock(&group->kvm_ref_lock);
 }
 
-/**
- * vfio_file_has_dev - True if the VFIO file is a handle for device
- * @file: VFIO file to check
- * @device: Device that must be part of the file
- *
- * Returns true if given file has permission to manipulate the given device.
- */
-bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
+bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device)
 {
-	struct vfio_group *group = vfio_group_from_file(file);
-
-	if (!group)
-		return false;
-
 	return group == device->group;
 }
-EXPORT_SYMBOL_GPL(vfio_file_has_dev);
 
 static char *vfio_devnode(const struct device *dev, umode_t *mode)
 {
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 265a0058436c..123b468ead73 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1300,7 +1300,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 		return -ENOMEM;
 	}
 
-	if (copy_from_user(user_fds, arg->group_fds,
+	if (copy_from_user(user_fds, arg->fds,
 			   hdr.count * sizeof(*user_fds))) {
 		kfree(user_fds);
 		kfree(files);
@@ -1308,8 +1308,8 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	}
 
 	/*
-	 * Get the group file for each fd to ensure the group held across
-	 * the reset
+	 * Get the file for each fd to ensure the group/device file
+	 * is held across the reset
 	 */
 	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
 		struct file *file = fget(user_fds[file_idx]);
@@ -1319,8 +1319,14 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 			break;
 		}
 
-		/* Ensure the FD is a vfio group FD.*/
-		if (!vfio_file_is_group(file)) {
+		/*
+		 * For vfio group FD, sanitize the file is enough.
+		 * For vfio device FD, needs to ensure it has got the
+		 * access to device, otherwise it cannot be used as
+		 * proof of device ownership.
+		 */
+		if (!vfio_file_is_valid(file) ||
+		    (!vfio_file_is_group(file) && !vfio_file_has_device_access(file))) {
 			fput(file);
 			ret = -EINVAL;
 			break;
@@ -2440,9 +2446,9 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		 * by other users.
 		 *
 		 * For the devices that have been opened, needs to check the
-		 * ownership.  If the user provides a set of group fds, test
-		 * whether all the opened affected devices are contained by the
-		 * set of groups provided by the user.
+		 * ownership.  If the user provides a set of group/device
+		 * fds, test whether all the opened devices are contained
+		 * by the set of groups/devices provided by the user.
 		 */
 		if (cur_vma->vdev.open_count &&
 		    !vfio_dev_in_user_fds(cur_vma, user_info)) {
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index e60c409868f8..464263288d16 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -96,6 +96,7 @@ void vfio_device_group_close(struct vfio_device_file *df);
 struct vfio_group *vfio_group_from_file(struct file *file);
 bool vfio_group_enforced_coherent(struct vfio_group *group);
 void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
+bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device);
 bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 027410e8d4a8..cf9994a65df3 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1277,6 +1277,48 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 
+/**
+ * vfio_file_has_device_access - True if the file has opened device
+ * @file: VFIO device file
+ */
+bool vfio_file_has_device_access(struct file *file)
+{
+	struct vfio_device_file *df;
+
+	if (vfio_group_from_file(file) ||
+	    !vfio_device_from_file(file))
+		return false;
+
+	df = file->private_data;
+
+	return READ_ONCE(df->access_granted);
+}
+EXPORT_SYMBOL_GPL(vfio_file_has_device_access);
+
+/**
+ * vfio_file_has_dev - True if the VFIO file is a handle for device
+ * @file: VFIO file to check
+ * @device: Device that must be part of the file
+ *
+ * Returns true if given file has permission to manipulate the given device.
+ */
+bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
+{
+	struct vfio_group *group;
+	struct vfio_device *vdev;
+
+	group = vfio_group_from_file(file);
+	if (group)
+		return vfio_group_has_dev(group, device);
+
+	vdev = vfio_device_from_file(file);
+	if (device)
+		return vdev == device;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(vfio_file_has_dev);
+
 /*
  * Sub-module support
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index b14dcdd0b71f..1c69be2d687e 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -248,6 +248,7 @@ bool vfio_file_is_group(struct file *file);
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+bool vfio_file_has_device_access(struct file *file);
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index f96e5689cffc..d80141969cd1 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -679,7 +679,9 @@ struct vfio_pci_hot_reset_info {
  * the calling user must ensure all affected devices, if opened, are
  * owned by itself.
  *
- * The ownership is proved by an array of group fds.
+ * The ownership can be proved by:
+ *   - An array of group fds
+ *   - An array of device fds
  *
  * Return: 0 on success, -errno on failure.
  */
@@ -687,7 +689,7 @@ struct vfio_pci_hot_reset {
 	__u32	argsz;
 	__u32	flags;
 	__u32	count;
-	__s32	group_fds[];
+	__s32	fds[];
 };
 
 #define VFIO_DEVICE_PCI_HOT_RESET	_IO(VFIO_TYPE, VFIO_BASE + 13)
-- 
2.34.1

