Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF9D6B08ED
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBDD10E678;
	Wed,  8 Mar 2023 13:29:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4D210E630;
 Wed,  8 Mar 2023 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282182; x=1709818182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oI7un8hHPHJZ9QJcGeUUyGy3MTiXa7ydO6MKY5W5FZo=;
 b=OU2QwZqi9qHmlm28SOzBjdb6r9f2gx+ejaBDWlz2uY+aHVcmU7qiZZgd
 JwEbVbBj9jybWSXZm5/DeVE1yQ4iUlecmenvqz5AzzCvmB+WIIbSgc5TJ
 Td7n+8N0DCv46mPXBEZpv4PcfOEbVK9UgFGu4MzSNlj8D5cbeUowzSN8j
 Wz9xGIkdUEwRdNcakYgp2VSD5tkGrmOHI3b+0OAXL+RLRtYwtLDAq0XIH
 0UHTVNofq81MJaRx7906zeAO3jgUYSI8IdZspHojU0Tsjr6BD9qyPL3S6
 prihev0MNPvHkwDMNmWFXlFl3TT3WBkNf2HK5F5bxC1tIQSI1R6kWU2KA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165336"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165336"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789456"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789456"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:41 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 21/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Date: Wed,  8 Mar 2023 05:29:00 -0800
Message-Id: <20230308132903.465159-22-yi.l.liu@intel.com>
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

This adds ioctl for userspace to bind device cdev fd to iommufd.

    VFIO_DEVICE_BIND_IOMMUFD: bind device to an iommufd, hence gain DMA
			      control provided by the iommufd. open_device
			      op is called after bind_iommufd op.
			      VFIO no iommu mode is indicated by passing
			      a negative iommufd value.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/device_cdev.c | 166 +++++++++++++++++++++++++++++++++++++
 drivers/vfio/group.c       |  15 ++++
 drivers/vfio/vfio.h        |  15 ++++
 drivers/vfio/vfio_main.c   |  29 ++++++-
 include/uapi/linux/vfio.h  |  37 +++++++++
 5 files changed, 258 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 1c640016a824..568cc9da16c7 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Intel Corporation.
  */
 #include <linux/vfio.h>
+#include <linux/iommufd.h>
 
 #include "vfio.h"
 
@@ -44,6 +45,171 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 	return ret;
 }
 
+static void vfio_device_get_kvm_safe(struct vfio_device_file *df)
+{
+	spin_lock(&df->kvm_ref_lock);
+	if (df->kvm)
+		_vfio_device_get_kvm_safe(df->device, df->kvm);
+	spin_unlock(&df->kvm_ref_lock);
+}
+
+void vfio_device_cdev_close(struct vfio_device_file *df)
+{
+	struct vfio_device *device = df->device;
+
+	/*
+	 * As df->access_granted writer is under dev_set->lock as well,
+	 * so this read no need to use smp_load_acquire() to pair with
+	 * smp_store_release() in the caller of vfio_device_open().
+	 */
+	if (!df->access_granted)
+		return;
+
+	mutex_lock(&device->dev_set->lock);
+	vfio_device_close(df);
+	vfio_device_put_kvm(device);
+	if (df->iommufd)
+		iommufd_ctx_put(df->iommufd);
+	mutex_unlock(&device->dev_set->lock);
+	vfio_device_unblock_group(device);
+}
+
+static int vfio_device_cdev_probe_noiommu(struct vfio_device *device)
+{
+	struct iommu_group *iommu_group;
+	int ret = 0;
+
+	if (!IS_ENABLED(CONFIG_VFIO_NOIOMMU) || !vfio_noiommu)
+		return -EINVAL;
+
+	if (!capable(CAP_SYS_RAWIO))
+		return -EPERM;
+
+	iommu_group = iommu_group_get(device->dev);
+	if (!iommu_group)
+		return 0;
+
+	/*
+	 * We cannot support noiommu mode for devices that are protected
+	 * by IOMMU.  So check the iommu_group, if it is a no-iommu group
+	 * created by VFIO, we support. If not, we refuse.
+	 */
+	if (!vfio_group_find_noiommu_group_from_iommu(iommu_group))
+		ret = -EINVAL;
+	iommu_group_put(iommu_group);
+	return ret;
+}
+
+static struct iommufd_ctx *vfio_get_iommufd_from_fd(int fd)
+{
+	struct fd f;
+	struct iommufd_ctx *iommufd;
+
+	f = fdget(fd);
+	if (!f.file)
+		return ERR_PTR(-EBADF);
+
+	iommufd = iommufd_ctx_from_file(f.file);
+
+	fdput(f);
+	return iommufd;
+}
+
+long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
+				    struct vfio_device_bind_iommufd __user *arg)
+{
+	struct vfio_device *device = df->device;
+	struct vfio_device_bind_iommufd bind;
+	struct iommufd_ctx *iommufd = NULL;
+	unsigned long minsz;
+	int ret;
+
+	static_assert(__same_type(arg->out_devid, bind.out_devid));
+
+	minsz = offsetofend(struct vfio_device_bind_iommufd, out_devid);
+
+	if (copy_from_user(&bind, arg, minsz))
+		return -EFAULT;
+
+	if (bind.argsz < minsz || bind.flags)
+		return -EINVAL;
+
+	if (!device->ops->bind_iommufd)
+		return -ENODEV;
+
+	ret = vfio_device_block_group(device);
+	if (ret)
+		return ret;
+
+	mutex_lock(&device->dev_set->lock);
+	/* If already got access, should fail it. */
+	if (df->access_granted) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* iommufd < 0 means noiommu mode */
+	if (bind.iommufd < 0) {
+		ret = vfio_device_cdev_probe_noiommu(device);
+		if (ret)
+			goto out_unlock;
+	} else {
+		iommufd = vfio_get_iommufd_from_fd(bind.iommufd);
+		if (IS_ERR(iommufd)) {
+			ret = PTR_ERR(iommufd);
+			goto out_unlock;
+		}
+	}
+
+	/*
+	 * Before the device open, get the KVM pointer currently
+	 * associated with the device file (if there is) and obtain
+	 * a reference.  This reference is held until device closed.
+	 * Save the pointer in the device for use by drivers.
+	 */
+	vfio_device_get_kvm_safe(df);
+
+	df->iommufd = iommufd;
+	ret = vfio_device_open(df);
+	if (ret)
+		goto out_put_kvm;
+
+	if (df->iommufd)
+		bind.out_devid = df->devid;
+	else
+		bind.out_devid = IOMMUFD_INVALID_ID;
+
+	ret = copy_to_user(&arg->out_devid, &bind.out_devid,
+			   sizeof(bind.out_devid)) ? -EFAULT : 0;
+	if (ret)
+		goto out_close_device;
+
+	if (bind.iommufd < 0)
+		dev_warn(device->dev, "device is bound to vfio-noiommu by user "
+			 "(%s:%d)\n", current->comm, task_pid_nr(current));
+
+	/*
+	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
+	 * read/write/mmap
+	 */
+	smp_store_release(&df->access_granted, true);
+	mutex_unlock(&device->dev_set->lock);
+
+	return 0;
+
+out_close_device:
+	vfio_device_close(df);
+out_put_kvm:
+	df->iommufd = NULL;
+	vfio_device_put_kvm(device);
+	if (iommufd)
+		iommufd_ctx_put(iommufd);
+out_unlock:
+	mutex_unlock(&device->dev_set->lock);
+	vfio_device_unblock_group(device);
+	return ret;
+}
+
 static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 51c027134814..fc49f2459b1a 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -701,6 +701,21 @@ static struct vfio_group *vfio_group_find_or_alloc(struct device *dev)
 	return group;
 }
 
+struct vfio_group *
+vfio_group_find_noiommu_group_from_iommu(struct iommu_group *iommu_group)
+{
+	struct vfio_group *group;
+	bool found = false;
+
+	mutex_lock(&vfio.group_lock);
+	group = vfio_group_find_from_iommu(iommu_group);
+	if (group && group->type == VFIO_NO_IOMMU)
+		found = true;
+	mutex_unlock(&vfio.group_lock);
+
+	return found ? group : NULL;
+}
+
 int vfio_device_set_group(struct vfio_device *device,
 			  enum vfio_group_type type)
 {
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 3f359f04b754..5df737b24102 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -91,6 +91,8 @@ struct vfio_group {
 
 int vfio_device_block_group(struct vfio_device *device);
 void vfio_device_unblock_group(struct vfio_device *device);
+struct vfio_group *
+vfio_group_find_noiommu_group_from_iommu(struct iommu_group *iommu_group);
 int vfio_device_set_group(struct vfio_device *device,
 			  enum vfio_group_type type);
 void vfio_device_remove_group(struct vfio_device *device);
@@ -273,6 +275,9 @@ static inline void vfio_device_del(struct vfio_device *device)
 
 void vfio_init_device_cdev(struct vfio_device *device);
 int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
+void vfio_device_cdev_close(struct vfio_device_file *df);
+long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
+				    struct vfio_device_bind_iommufd __user *arg);
 int vfio_cdev_init(struct class *device_class);
 void vfio_cdev_cleanup(void);
 #else
@@ -296,6 +301,16 @@ static inline int vfio_device_fops_cdev_open(struct inode *inode,
 	return 0;
 }
 
+static inline void vfio_device_cdev_close(struct vfio_device_file *df)
+{
+}
+
+static inline long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
+						  struct vfio_device_bind_iommufd __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int vfio_cdev_init(struct class *device_class)
 {
 	return 0;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index b0c2a7544524..08bb1705d02d 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -575,6 +575,8 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 
 	if (df->group)
 		vfio_device_group_close(df);
+	else
+		vfio_device_cdev_close(df);
 
 	vfio_device_put_registration(device);
 
@@ -1148,7 +1150,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 	struct vfio_device *device = df->device;
 	int ret;
 
-	/* Paired with smp_store_release() in vfio_device_group_open() */
+	if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
+		return vfio_device_ioctl_bind_iommufd(df, (void __user *)arg);
+
+	/*
+	 * Paired with smp_store_release() in the caller of
+	 * vfio_device_open(). e.g. vfio_device_group_open()
+	 * and vfio_device_ioctl_bind_iommufd()
+	 */
 	if (!smp_load_acquire(&df->access_granted))
 		return -EINVAL;
 
@@ -1179,7 +1188,11 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
-	/* Paired with smp_store_release() in vfio_device_group_open() */
+	/*
+	 * Paired with smp_store_release() in the caller of
+	 * vfio_device_open(). e.g. vfio_device_group_open()
+	 * and vfio_device_ioctl_bind_iommufd()
+	 */
 	if (!smp_load_acquire(&df->access_granted))
 		return -EINVAL;
 
@@ -1196,7 +1209,11 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
-	/* Paired with smp_store_release() in vfio_device_group_open() */
+	/*
+	 * Paired with smp_store_release() in the caller of
+	 * vfio_device_open(). e.g. vfio_device_group_open()
+	 * and vfio_device_ioctl_bind_iommufd()
+	 */
 	if (!smp_load_acquire(&df->access_granted))
 		return -EINVAL;
 
@@ -1211,7 +1228,11 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
-	/* Paired with smp_store_release() in vfio_device_group_open() */
+	/*
+	 * Paired with smp_store_release() in the caller of
+	 * vfio_device_open(). e.g. vfio_device_group_open()
+	 * and vfio_device_ioctl_bind_iommufd()
+	 */
 	if (!smp_load_acquire(&df->access_granted))
 		return -EINVAL;
 
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 382d95455f89..a53afe349a34 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -194,6 +194,43 @@ struct vfio_group_status {
 
 /* --------------- IOCTLs for DEVICE file descriptors --------------- */
 
+/*
+ * VFIO_DEVICE_BIND_IOMMUFD - _IOR(VFIO_TYPE, VFIO_BASE + 19,
+ *				   struct vfio_device_bind_iommufd)
+ *
+ * Bind a vfio_device to the specified iommufd.
+ *
+ * The user should provide a device cookie when calling this ioctl. The
+ * cookie is carried only in event e.g. I/O fault reported to userspace
+ * via iommufd. The user should use devid returned by this ioctl to mark
+ * the target device in other ioctls (e.g. iommu hardware infomration query
+ * via iommufd, and etc.).
+ *
+ * User is not allowed to access the device before the binding operation
+ * is completed.
+ *
+ * Unbind is automatically conducted when device fd is closed.
+ *
+ * @argsz:	 user filled size of this data.
+ * @flags:	 reserved for future extension.
+ * @dev_cookie:	 a per device cookie provided by userspace.
+ * @iommufd:	 iommufd to bind. a negative value means noiommu.
+ * @out_devid:	 the device id generated by this bind. This field is valid
+ *		as long as the input @iommufd is valid. Otherwise, it is
+ *		meaningless.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vfio_device_bind_iommufd {
+	__u32		argsz;
+	__u32		flags;
+	__aligned_u64	dev_cookie;
+	__s32		iommufd;
+	__u32		out_devid;
+};
+
+#define VFIO_DEVICE_BIND_IOMMUFD	_IO(VFIO_TYPE, VFIO_BASE + 19)
+
 /**
  * VFIO_DEVICE_GET_INFO - _IOR(VFIO_TYPE, VFIO_BASE + 7,
  *						struct vfio_device_info)
-- 
2.34.1

