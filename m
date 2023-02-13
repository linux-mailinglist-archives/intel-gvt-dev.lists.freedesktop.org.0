Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B826694A98
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Feb 2023 16:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1D610E61A;
	Mon, 13 Feb 2023 15:14:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5EF10E60C;
 Mon, 13 Feb 2023 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676301257; x=1707837257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JtAFhP/VnAXYVDiJzOl296b6o/1eoPofk+WST27JVD4=;
 b=QpN763ZSx07/RO0FLiMosuKbZq2ozNRrygPcP5uqTSM5YOiVNAEjK8JI
 l5VldMVJW92rDFeKuHAJDF+cPd27iRnNNG0bZm4/J7eDbEHiKD/0odbb9
 TcNV2PZT1BNoyN+ESaNU0OTIBXzIB9blkWInQgp3J/A2OpajIQ8x2HEmK
 HEp1lkYsNdH/NQthCOFMVBjMJeCQnxUqPxWDIb6BNhOG1wwxvJV3iZgo3
 zVvx1dGrnq6WEeovFq6xmxbC84kqc8JjlJrcbgK3sh7unHtaBkItMryV2
 CT5hPEMS04yNHq2T/XNo5RcC6XlQ3lz2xKsi1Lfi6RnytnhbWZcUXtv30 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="318931659"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="318931659"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701289692"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="701289692"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 07:14:01 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: joro@8bytes.org, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, robin.murphy@arm.com
Subject: [PATCH v3 13/15] vfio: Add cdev for vfio_device
Date: Mon, 13 Feb 2023 07:13:46 -0800
Message-Id: <20230213151348.56451-14-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213151348.56451-1-yi.l.liu@intel.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
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
 cohuck@redhat.com, peterx@redhat.com, eric.auger@redhat.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
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
---
 drivers/vfio/Kconfig       | 11 +++++++
 drivers/vfio/Makefile      |  1 +
 drivers/vfio/device_cdev.c | 64 ++++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h        | 26 ++++++++++++++++
 drivers/vfio/vfio_main.c   | 41 +++++++++++++++++++++---
 include/linux/vfio.h       |  4 +++
 6 files changed, 143 insertions(+), 4 deletions(-)
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
index 000000000000..07869fde1c0c
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
+ * cdev open op. device access via the fd opened by this function
+ * is blocked until .open_device() is called successfully during
+ * BIND_IOMMUFD.
+ */
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
index 620ebcf966fc..be93a1c953f8 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -244,6 +244,32 @@ static inline void vfio_iommufd_unbind(struct vfio_device *device)
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
index c0be4b27f96c..a7eb2727c613 100644
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
@@ -1214,6 +1238,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 
 const struct file_operations vfio_device_fops = {
 	.owner		= THIS_MODULE,
+	.open		= vfio_device_fops_open,
 	.release	= vfio_device_fops_release,
 	.read		= vfio_device_fops_read,
 	.write		= vfio_device_fops_write,
@@ -1587,9 +1612,16 @@ static int __init vfio_init(void)
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
@@ -1600,6 +1632,7 @@ static int __init vfio_init(void)
 static void __exit vfio_cleanup(void)
 {
 	ida_destroy(&vfio.device_ida);
+	vfio_cdev_cleanup();
 	class_destroy(vfio.device_class);
 	vfio.device_class = NULL;
 	vfio_virqfd_exit();
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 50ee3efbc1f9..6b554ce6245a 100644
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

