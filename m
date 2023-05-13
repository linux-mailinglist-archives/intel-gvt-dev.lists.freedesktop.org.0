Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251CA701741
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B2B10E103;
	Sat, 13 May 2023 13:28:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431B710E0F0;
 Sat, 13 May 2023 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984537; x=1715520537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XZqHF42zwcmP7zlF0QkPpOxHtNXyFN10NVkmRvgrLJY=;
 b=TG/M6jgkzwYscsOdjHoJovaMou7fbE8iqnyr3S229WQAKv+pyYDm84xC
 baPgXx9sFrwOd3bbj1/PimC7X13pQSxKfd1D3iDKLbhccfBiDQecN7+TX
 2iD0u2GPpPvGH/CJyFBK9L4a/d41NYILYz9Bcl1jU97V5ySI0Ol3HKOEa
 JpKxFkdBfzrh6HAP6gBb9zKqZ4dVD26Fs64bHKPmJ4PSVo9Np3BmSYST+
 d98o76W6Cjsdk/JoZo+8FToOwHTXem67mS7NvJaqZgv5ZhlAXMbEYzVWU
 Clc32MuK+wV4QipoyoiSsNG8h1ZyQIWLUlZ0XM4uwsSCfvKBZX5g/4YWV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354100831"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="354100831"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703459525"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="703459525"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 06:28:56 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v11 19/23] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Date: Sat, 13 May 2023 06:28:23 -0700
Message-Id: <20230513132827.39066-20-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513132827.39066-1-yi.l.liu@intel.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
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

This adds ioctl for userspace to bind device cdev fd to iommufd.

    VFIO_DEVICE_BIND_IOMMUFD: bind device to an iommufd, hence gain DMA
			      control provided by the iommufd. open_device
			      op is called after bind_iommufd op.

Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/device_cdev.c | 130 +++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h        |  13 ++++
 drivers/vfio/vfio_main.c   |   5 ++
 include/linux/vfio.h       |   3 +-
 include/uapi/linux/vfio.h  |  28 ++++++++
 5 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 1c640016a824..291cc678a18b 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Intel Corporation.
  */
 #include <linux/vfio.h>
+#include <linux/iommufd.h>
 
 #include "vfio.h"
 
@@ -44,6 +45,135 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
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
+	 * In the time of close, there is no contention with another one
+	 * changing this flag.  So read df->access_granted without lock
+	 * and no smp_load_acquire() is ok.
+	 */
+	if (!df->access_granted)
+		return;
+
+	mutex_lock(&device->dev_set->lock);
+	vfio_device_close(df);
+	vfio_device_put_kvm(device);
+	iommufd_ctx_put(df->iommufd);
+	device->cdev_opened = false;
+	mutex_unlock(&device->dev_set->lock);
+	vfio_device_unblock_group(device);
+}
+
+static struct iommufd_ctx *vfio_get_iommufd_from_fd(int fd)
+{
+	struct iommufd_ctx *iommufd;
+	struct fd f;
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
+	unsigned long minsz;
+	int ret;
+
+	static_assert(__same_type(arg->out_devid, df->devid));
+
+	minsz = offsetofend(struct vfio_device_bind_iommufd, out_devid);
+
+	if (copy_from_user(&bind, arg, minsz))
+		return -EFAULT;
+
+	if (bind.argsz < minsz || bind.flags || bind.iommufd < 0)
+		return -EINVAL;
+
+	/* BIND_IOMMUFD only allowed for cdev fds */
+	if (df->group)
+		return -EINVAL;
+
+	if (vfio_device_is_noiommu(device) && !capable(CAP_SYS_RAWIO))
+		return -EPERM;
+
+	ret = vfio_device_block_group(device);
+	if (ret)
+		return ret;
+
+	mutex_lock(&device->dev_set->lock);
+	/* one device cannot be bound twice */
+	if (df->access_granted) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	df->iommufd = vfio_get_iommufd_from_fd(bind.iommufd);
+	if (IS_ERR(df->iommufd)) {
+		ret = PTR_ERR(df->iommufd);
+		df->iommufd = NULL;
+		goto out_unlock;
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
+	ret = vfio_device_open(df);
+	if (ret)
+		goto out_put_kvm;
+
+	ret = copy_to_user(&arg->out_devid, &df->devid,
+			   sizeof(df->devid)) ? -EFAULT : 0;
+	if (ret)
+		goto out_close_device;
+
+	/*
+	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
+	 * read/write/mmap
+	 */
+	smp_store_release(&df->access_granted, true);
+	device->cdev_opened = true;
+	mutex_unlock(&device->dev_set->lock);
+
+	if (vfio_device_is_noiommu(device))
+		dev_warn(device->dev, "noiommu device is bound to iommufd by user "
+			 "(%s:%d)\n", current->comm, task_pid_nr(current));
+	return 0;
+
+out_close_device:
+	vfio_device_close(df);
+out_put_kvm:
+	vfio_device_put_kvm(device);
+	iommufd_ctx_put(df->iommufd);
+	df->iommufd = NULL;
+out_unlock:
+	mutex_unlock(&device->dev_set->lock);
+	vfio_device_unblock_group(device);
+	return ret;
+}
+
 static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 6861f8ebb64d..8b359a7794be 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -279,6 +279,9 @@ static inline void vfio_device_del(struct vfio_device *device)
 
 void vfio_init_device_cdev(struct vfio_device *device);
 int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
+void vfio_device_cdev_close(struct vfio_device_file *df);
+long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
+				    struct vfio_device_bind_iommufd __user *arg);
 int vfio_cdev_init(struct class *device_class);
 void vfio_cdev_cleanup(void);
 #else
@@ -302,6 +305,16 @@ static inline int vfio_device_fops_cdev_open(struct inode *inode,
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
index c87cc7afe92c..c9fa39ac4b02 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -574,6 +574,8 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 
 	if (df->group)
 		vfio_device_group_close(df);
+	else
+		vfio_device_cdev_close(df);
 
 	vfio_device_put_registration(device);
 
@@ -1147,6 +1149,9 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 	struct vfio_device *device = df->device;
 	int ret;
 
+	if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
+		return vfio_device_ioctl_bind_iommufd(df, (void __user *)arg);
+
 	/* Paired with smp_store_release() following vfio_device_open() */
 	if (!smp_load_acquire(&df->access_granted))
 		return -EINVAL;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 873275419f13..cf9d082a623c 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -67,6 +67,7 @@ struct vfio_device {
 	struct iommufd_device *iommufd_device;
 	bool iommufd_attached;
 #endif
+	bool cdev_opened:1;
 };
 
 /**
@@ -169,7 +170,7 @@ vfio_iommufd_physical_devid(struct vfio_device *vdev)
 
 static inline bool vfio_device_cdev_opened(struct vfio_device *device)
 {
-	return false;
+	return device->cdev_opened;
 }
 
 /**
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 24858b650562..07c917de31e9 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -194,6 +194,34 @@ struct vfio_group_status {
 
 /* --------------- IOCTLs for DEVICE file descriptors --------------- */
 
+/*
+ * VFIO_DEVICE_BIND_IOMMUFD - _IOR(VFIO_TYPE, VFIO_BASE + 19,
+ *				   struct vfio_device_bind_iommufd)
+ *
+ * Bind a vfio_device to the specified iommufd.
+ *
+ * User is restricted from accessing the device before the binding operation
+ * is completed.
+ *
+ * Unbind is automatically conducted when device fd is closed.
+ *
+ * @argsz:	 User filled size of this data.
+ * @flags:	 Must be 0.
+ * @iommufd:	 iommufd to bind.
+ * @out_devid:	 The device id generated by this bind. devid is a handle for
+ *		 this device/iommufd bond and can be used in IOMMUFD commands.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vfio_device_bind_iommufd {
+	__u32		argsz;
+	__u32		flags;
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

