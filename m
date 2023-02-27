Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E36A4049
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 12:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AD410E3B9;
	Mon, 27 Feb 2023 11:12:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A8610E3C1;
 Mon, 27 Feb 2023 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677496309; x=1709032309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pwLzr3zuaWxwn4DNYU0y0AuIDweLu4LqQti5Ck1WMzk=;
 b=A3S4tr8EYiwjmnUdTic4hqbzlcoZM2dX1ekKEG8NXfOs6V6Yy+TNUPXu
 l5RH0gK6nnIGyXiygTdBX2BbOB60121UKbujuI8dBgBP6HB6iBb1eofWG
 ErEUB2kWVAdMaB7cPEvY2yyx6Xmhb7vFQ6ic+63NNK95LxUsYU8EDz+pO
 AG6gpkcxJFVIvR+4eMSK6kanI4WxRcBEsjeB0Lz97TS6ouCGMCvh0OxLO
 wgzHpMWoyHa03w+Sz3OaiFysWTpmE//xgy325nJjaHrI4rvZ3joPCPjxL
 vGLSjeV6/OJd/MJNxMQPxaRvNIEZkMbuRle8gGYXwBVOK7+uGgNKtQIHF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="420097742"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="420097742"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="651189586"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="651189586"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 03:11:48 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 15/19] vfio: Add cdev for vfio_device
Date: Mon, 27 Feb 2023 03:11:31 -0800
Message-Id: <20230227111135.61728-16-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227111135.61728-1-yi.l.liu@intel.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
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
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/Kconfig       | 12 ++++++++
 drivers/vfio/Makefile      |  1 +
 drivers/vfio/device_cdev.c | 63 ++++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h        | 46 ++++++++++++++++++++++++++++
 drivers/vfio/vfio_main.c   | 22 ++++++++++---
 include/linux/vfio.h       |  4 +++
 6 files changed, 144 insertions(+), 4 deletions(-)
 create mode 100644 drivers/vfio/device_cdev.c

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index a8f544629467..169762316513 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -12,6 +12,18 @@ menuconfig VFIO
 	  If you don't know what to do here, say N.
 
 if VFIO
+config VFIO_DEVICE_CDEV
+	bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
+	depends on IOMMUFD && (X86 || S390 || ARM || ARM64)
+	help
+	  The VFIO device cdev is another way for userspace to get device
+	  access. Userspace gets device fd by opening device cdev under
+	  /dev/vfio/devices/vfioX, and then bind the device fd with an iommufd
+	  to set up secure context for device access. It is not available for
+	  SPAPR_TCE_IOMMU.
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
index 000000000000..9e2c1ecaaf4f
--- /dev/null
+++ b/drivers/vfio/device_cdev.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Intel Corporation.
+ */
+#include <linux/vfio.h>
+
+#include "vfio.h"
+
+static dev_t device_devt;
+
+void vfio_init_device_cdev(struct vfio_device *device)
+{
+	device->device.devt = MKDEV(MAJOR(device_devt), device->index);
+	cdev_init(&device->cdev, &vfio_device_fops);
+	device->cdev.owner = THIS_MODULE;
+}
+
+/*
+ * device access via the fd opened by this function is blocked until
+ * .open_device() is called successfully during BIND_IOMMUFD.
+ */
+int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
+{
+	struct vfio_device *device = container_of(inode->i_cdev,
+						  struct vfio_device, cdev);
+	struct vfio_device_file *df;
+	int ret;
+
+	if (!vfio_device_try_get_registration(device))
+		return -ENODEV;
+
+	df = vfio_allocate_device_file(device);
+	if (IS_ERR(df)) {
+		ret = PTR_ERR(df);
+		goto err_put_registration;
+	}
+
+	df->is_cdev_device = true;
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
+	return alloc_chrdev_region(&device_devt, 0,
+				   MINORMASK + 1, "vfio-dev");
+}
+
+void vfio_cdev_cleanup(void)
+{
+	unregister_chrdev_region(device_devt, MINORMASK + 1);
+}
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 54a48c8596f7..8661de75f94b 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -256,6 +256,52 @@ vfio_device_iommufd(struct vfio_device *device)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
+static inline int vfio_device_add(struct vfio_device *device)
+{
+	return cdev_device_add(&device->cdev, &device->device);
+}
+
+static inline void vfio_device_del(struct vfio_device *device)
+{
+	cdev_device_del(&device->cdev, &device->device);
+}
+
+void vfio_init_device_cdev(struct vfio_device *device);
+int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
+int vfio_cdev_init(struct class *device_class);
+void vfio_cdev_cleanup(void);
+#else
+static inline int vfio_device_add(struct vfio_device *device)
+{
+	return device_add(&device->device);
+}
+
+static inline void vfio_device_del(struct vfio_device *device)
+{
+	device_del(&device->device);
+}
+
+static inline void vfio_init_device_cdev(struct vfio_device *device)
+{
+}
+
+static inline int vfio_device_fops_cdev_open(struct inode *inode,
+					     struct file *filep)
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
index 5b485d3bb67e..3f83447d022e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -235,6 +235,7 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
 	device->device.release = vfio_device_release;
 	device->device.class = vfio.device_class;
 	device->device.parent = device->dev;
+	vfio_init_device_cdev(device);
 	return 0;
 
 out_uninit:
@@ -269,7 +270,7 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		return ret;
 
-	ret = device_add(&device->device);
+	ret = vfio_device_add(device);
 	if (ret)
 		goto err_out;
 
@@ -309,6 +310,13 @@ void vfio_unregister_group_dev(struct vfio_device *device)
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
@@ -334,9 +342,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 
 	vfio_device_group_unregister(device);
 
-	/* Balances device_add in register path */
-	device_del(&device->device);
-
 	/* Balances vfio_device_set_group in register path */
 	vfio_device_remove_group(device);
 }
@@ -1192,6 +1197,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 
 const struct file_operations vfio_device_fops = {
 	.owner		= THIS_MODULE,
+	.open		= vfio_device_fops_cdev_open,
 	.release	= vfio_device_fops_release,
 	.read		= vfio_device_fops_read,
 	.write		= vfio_device_fops_write,
@@ -1541,9 +1547,16 @@ static int __init vfio_init(void)
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
@@ -1554,6 +1567,7 @@ static int __init vfio_init(void)
 static void __exit vfio_cleanup(void)
 {
 	ida_destroy(&vfio.device_ida);
+	vfio_cdev_cleanup();
 	class_destroy(vfio.device_class);
 	vfio.device_class = NULL;
 	vfio_virqfd_exit();
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index c9b91c57de07..ce390533cb30 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/workqueue.h>
 #include <linux/poll.h>
+#include <linux/cdev.h>
 #include <uapi/linux/vfio.h>
 #include <linux/iova_bitmap.h>
 
@@ -51,6 +52,9 @@ struct vfio_device {
 	/* Members below here are private, not for driver use */
 	unsigned int index;
 	struct device device;	/* device.kref covers object life circle */
+#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
+	struct cdev cdev;
+#endif
 	refcount_t refcount;	/* user count on registered device*/
 	unsigned int open_count;
 	struct completion comp;
-- 
2.34.1

