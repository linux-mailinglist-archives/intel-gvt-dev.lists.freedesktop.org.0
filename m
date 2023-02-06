Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C851E68B81C
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Feb 2023 10:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9540810E34D;
	Mon,  6 Feb 2023 09:06:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA7810E341;
 Mon,  6 Feb 2023 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675674365; x=1707210365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hy92DpJJLbHqBdommpUCK8SJz1aa0zaHDXjA2R52pAI=;
 b=jaYZc1pxhr3PAHQxMl47GXhP1feF3/BKqDBEjFmSEYiiMtwoWVODC+jk
 yjvNWdrSw3Ike1iL4Ehav90N/FuhGnVrvU4pKfNQyLS/RZb0DCgRgZF9v
 BpNyhhNO01jwzKoILLsfbbE6kqShY6YoIOw2yHD2vIjIitC8fxIyy0kbE
 EXBguPj3q3RduSwZfgzY/PCooTeexj+8GD9EnDbxUNjjLvvEwIsOoxN0b
 Pz57D5D5Hv8HJjFlR6ei+EmQxTzUMP1Bo0xUzUD/UQXzjwHHoHtfct8/d
 IPyGxj7blekm+rp3IbzLRyyZ7dM8khI/ij/e4FcqV8wuByyvYg4xRnhjh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309495912"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="309495912"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911862872"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="911862872"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 01:06:03 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 12/14] vfio: Add cdev for vfio_device
Date: Mon,  6 Feb 2023 01:05:30 -0800
Message-Id: <20230206090532.95598-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206090532.95598-1-yi.l.liu@intel.com>
References: <20230206090532.95598-1-yi.l.liu@intel.com>
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
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, jasowang@redhat.com,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, peterx@redhat.com,
 eric.auger@redhat.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 chao.p.peng@linux.intel.com, Joao Martins <joao.m.martins@oracle.com>,
 lulu@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This allows user to directly open a vfio device w/o using the legacy
container/group interface, as a prerequisite for supporting new iommu
features like nested translation.

The device fd opened in this manner doesn't have the capability to access
the device as the fops open() doesn't open the device until the successful
BIND_IOMMUFD which be added in next patch.

With this patch, devices registered to vfio core have both group and device
interface created.

- group interface : /dev/vfio/$groupID
- device interface: /dev/vfio/devices/vfioX  (X is the minor number and
					      is unique across devices)

Given a vfio device the user can identify the matching vfioX by checking
the sysfs path of the device. Take PCI device (0000:6a:01.0) for example,
/sys/bus/pci/devices/0000\:6a\:01.0/vfio-dev/vfio0/dev contains the
major:minor of the matching vfioX.

Userspace then opens the /dev/vfio/devices/vfioX and checks with fstat
that the major:minor matches.

The vfio_device cdev logic in this patch:
*) __vfio_register_dev() path ends up doing cdev_device_add() for each
   vfio_device;
*) vfio_unregister_group_dev() path does cdev_device_del();

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 drivers/vfio/Kconfig       | 11 +++++++
 drivers/vfio/Makefile      |  1 +
 drivers/vfio/device_cdev.c | 64 ++++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h        | 26 ++++++++++++++++
 drivers/vfio/vfio_main.c   | 41 +++++++++++++++++++++---
 include/linux/vfio.h       |  2 ++
 6 files changed, 141 insertions(+), 4 deletions(-)
 create mode 100644 drivers/vfio/device_cdev.c

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index a8f544629467..0476abf154f2 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -12,6 +12,17 @@ menuconfig VFIO
 	  If you don't know what to do here, say N.
 
 if VFIO
+config VFIO_DEVICE_CDEV
+	bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
+	depends on IOMMUFD
+	help
+	  The VFIO device cdev is another way for userspace to get device
+	  access. Userspace gets device fd by opening device cdev under
+	  /dev/vfio/devices/vfioX, and then bind the device fd with an iommufd
+	  to set up secure context for device access.
+
+	  If you don't know what to do here, say N.
+
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
 	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
diff --git a/drivers/vfio/Makefile b/drivers/vfio/Makefile
index 70e7dcb302ef..245394aeb94b 100644
--- a/drivers/vfio/Makefile
+++ b/drivers/vfio/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_VFIO) += vfio.o
 vfio-y += vfio_main.o \
 	  group.o \
 	  iova_bitmap.o
+vfio-$(CONFIG_VFIO_DEVICE_CDEV) += device_cdev.o
 vfio-$(CONFIG_IOMMUFD) += iommufd.o
 vfio-$(CONFIG_VFIO_CONTAINER) += container.o
 vfio-$(CONFIG_VFIO_VIRQFD) += virqfd.o
diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
new file mode 100644
index 000000000000..f024833c9e2c
--- /dev/null
+++ b/drivers/vfio/device_cdev.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Intel Corporation.
+ */
+#include <linux/vfio.h>
+
+#include "vfio.h"
+
+static struct vfio {
+	dev_t device_devt;
+} vfio;
+
+void vfio_init_device_cdev(struct vfio_device *device)
+{
+	device->device.devt = MKDEV(MAJOR(vfio.device_devt), device->index);
+	cdev_init(&device->cdev, &vfio_device_fops);
+	device->cdev.owner = THIS_MODULE;
+}
+
+int vfio_device_fops_open(struct inode *inode, struct file *filep)
+{
+	struct vfio_device *device = container_of(inode->i_cdev,
+						  struct vfio_device, cdev);
+	struct vfio_device_file *df;
+	int ret;
+
+	if (!vfio_device_try_get_registration(device))
+		return -ENODEV;
+
+	/*
+	 * device access is blocked until .open_device() is called
+	 * in BIND_IOMMUFD.
+	 */
+	df = vfio_allocate_device_file(device, true);
+	if (IS_ERR(df)) {
+		ret = PTR_ERR(df);
+		goto err_put_registration;
+	}
+
+	filep->private_data = df;
+
+	return 0;
+
+err_put_registration:
+	vfio_device_put_registration(device);
+	return ret;
+}
+
+static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
+{
+	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
+}
+
+int vfio_cdev_init(struct class *device_class)
+{
+	device_class->devnode = vfio_device_devnode;
+	return alloc_chrdev_region(&vfio.device_devt, 0,
+				   MINORMASK + 1, "vfio-dev");
+}
+
+void vfio_cdev_cleanup(void)
+{
+	unregister_chrdev_region(vfio.device_devt, MINORMASK + 1);
+}
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 2debf0173861..c7c75865afec 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -250,6 +250,32 @@ static inline void vfio_iommufd_unbind(struct vfio_device *device)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
+void vfio_init_device_cdev(struct vfio_device *device);
+int vfio_device_fops_open(struct inode *inode, struct file *filep);
+int vfio_cdev_init(struct class *device_class);
+void vfio_cdev_cleanup(void);
+#else
+static inline void vfio_init_device_cdev(struct vfio_device *device)
+{
+}
+
+static inline int vfio_device_fops_open(struct inode *inode,
+					struct file *filep)
+{
+	return 0;
+}
+
+static inline int vfio_cdev_init(struct class *device_class)
+{
+	return 0;
+}
+
+static inline void vfio_cdev_cleanup(void)
+{
+}
+#endif /* CONFIG_VFIO_DEVICE_CDEV */
+
 #if IS_ENABLED(CONFIG_VFIO_VIRQFD)
 int __init vfio_virqfd_init(void);
 void vfio_virqfd_exit(void);
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index e07b185f9820..035730dc6ad4 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -235,6 +235,7 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
 	device->device.release = vfio_device_release;
 	device->device.class = vfio.device_class;
 	device->device.parent = device->dev;
+	vfio_init_device_cdev(device);
 	return 0;
 
 out_uninit:
@@ -243,6 +244,25 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
 	return ret;
 }
 
+static int vfio_device_add(struct vfio_device *device)
+{
+	int ret;
+
+	if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV))
+		ret = cdev_device_add(&device->cdev, &device->device);
+	else
+		ret = device_add(&device->device);
+	return ret;
+}
+
+static void vfio_device_del(struct vfio_device *device)
+{
+	if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV))
+		cdev_device_del(&device->cdev, &device->device);
+	else
+		device_del(&device->device);
+}
+
 static int __vfio_register_dev(struct vfio_device *device,
 			       enum vfio_group_type type)
 {
@@ -269,7 +289,7 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		return ret;
 
-	ret = device_add(&device->device);
+	ret = vfio_device_add(device);
 	if (ret)
 		goto err_out;
 
@@ -309,6 +329,13 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 	bool interrupted = false;
 	long rc;
 
+	/*
+	 * Balances vfio_device_add in register path. Putting it as the
+	 * first operation in unregister to prevent registration refcount
+	 * from incrementing per cdev open.
+	 */
+	vfio_device_del(device);
+
 	vfio_device_put_registration(device);
 	rc = try_wait_for_completion(&device->comp);
 	while (rc <= 0) {
@@ -334,9 +361,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 
 	vfio_device_group_unregister(device);
 
-	/* Balances device_add in register path */
-	device_del(&device->device);
-
 	/* Balances vfio_device_set_group in register path */
 	vfio_device_remove_group(device);
 }
@@ -1220,6 +1244,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 
 const struct file_operations vfio_device_fops = {
 	.owner		= THIS_MODULE,
+	.open		= vfio_device_fops_open,
 	.release	= vfio_device_fops_release,
 	.read		= vfio_device_fops_read,
 	.write		= vfio_device_fops_write,
@@ -1593,9 +1618,16 @@ static int __init vfio_init(void)
 		goto err_dev_class;
 	}
 
+	ret = vfio_cdev_init(vfio.device_class);
+	if (ret)
+		goto err_alloc_dev_chrdev;
+
 	pr_info(DRIVER_DESC " version: " DRIVER_VERSION "\n");
 	return 0;
 
+err_alloc_dev_chrdev:
+	class_destroy(vfio.device_class);
+	vfio.device_class = NULL;
 err_dev_class:
 	vfio_virqfd_exit();
 err_virqfd:
@@ -1606,6 +1638,7 @@ static int __init vfio_init(void)
 static void __exit vfio_cleanup(void)
 {
 	ida_destroy(&vfio.device_ida);
+	vfio_cdev_cleanup();
 	class_destroy(vfio.device_class);
 	vfio.device_class = NULL;
 	vfio_virqfd_exit();
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 83d1e0af0a70..fd4bf9c21ffe 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/workqueue.h>
 #include <linux/poll.h>
+#include <linux/cdev.h>
 #include <uapi/linux/vfio.h>
 #include <linux/iova_bitmap.h>
 
@@ -51,6 +52,7 @@ struct vfio_device {
 	/* Members below here are private, not for driver use */
 	unsigned int index;
 	struct device device;	/* device.kref covers object life circle */
+	struct cdev cdev;
 	refcount_t refcount;	/* user count on registered device*/
 	unsigned int open_count;
 	struct completion comp;
-- 
2.34.1

