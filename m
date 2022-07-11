Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C0A56804E
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Jul 2022 09:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DD21123E0;
	Wed,  6 Jul 2022 07:43:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDE6112404
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 Jul 2022 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5Ajl/tFHQLoMgXVwluAwsv9O0zp854GlZxbgDKDVmRU=; b=AyNV0saI6ntcLSexk38muaff4w
 gHfeRwS1JxURyRhHf1veWhiGQ43FIGKRwnAPCQN+M+KVjy9ZFzRzyV8ZRtq3pqz0IhTcPfWSf391x
 it1WNgEurWWLsHXSpiQOqec38ncknzsmcz9hi57p/u1RurkbDHAf6k+T4eSmCKJgkd3RF/XiNWFt6
 kqkuDWHIosk+AG1JUwfbf0WohhogDZTcMHFuN8KWVCvUj/+QTNvdzQuVgQa16CvMLp157feDX/nha
 eV2F1FWwEAEu2xtlebPNxO9GaD6JAtE5TM+AyKwZwbQrqKU/edTvrMgmCNLuS/nFRQrmi7eFWMeZX
 NRjlKKbg==;
Received: from [2001:4bb8:189:3c4a:34cd:2d1d:8766:aad] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o8zgg-0079yt-00; Wed, 06 Jul 2022 07:43:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 14/15] vfio/mdev: add mdev available instance checking to the
 core
Date: Wed,  6 Jul 2022 09:42:18 +0200
Message-Id: <20220706074219.3614-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706074219.3614-1-hch@lst.de>
References: <20220706074219.3614-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Many of the mdev drivers use a simple counter for keeping track of the
available instances. Move this code to the core code and store the counter
in the mdev_parent. Implement it using correct locking, fixing mdpy.

Drivers just provide the value in the mdev_driver at registration time
and the core code takes care of maintaining it and exposing the value in
sysfs.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
[count instances per-parent instead of per-type]
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/s390/cio/vfio_ccw_drv.c       |  1 -
 drivers/s390/cio/vfio_ccw_ops.c       | 14 +-------------
 drivers/s390/cio/vfio_ccw_private.h   |  2 --
 drivers/s390/crypto/vfio_ap_ops.c     | 21 +++------------------
 drivers/s390/crypto/vfio_ap_private.h |  2 --
 drivers/vfio/mdev/mdev_core.c         | 18 +++++++++++++++---
 include/linux/mdev.h                  |  3 +++
 samples/vfio-mdev/mdpy.c              | 23 ++++-------------------
 8 files changed, 26 insertions(+), 58 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 750d0315f1f5b..449c76b29a3b5 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -149,7 +149,6 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	INIT_LIST_HEAD(&private->crw);
 	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
 	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
-	atomic_set(&private->avail, 1);
 
 	private->cp.guest_cp = kcalloc(CCWCHAIN_LEN_MAX, sizeof(struct ccw1),
 				       GFP_KERNEL);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 6f6a0f2695059..c05d80add7be2 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -70,13 +70,6 @@ static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static unsigned int vfio_ccw_get_available(struct mdev_type *mtype)
-{
-	struct vfio_ccw_private *private = dev_get_drvdata(mtype->parent->dev);
-
-	return atomic_read(&private->avail);
-}
-
 static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 {
 	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
@@ -85,9 +78,6 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	if (private->state == VFIO_CCW_STATE_NOT_OPER)
 		return -ENODEV;
 
-	if (atomic_dec_if_positive(&private->avail) < 0)
-		return -EPERM;
-
 	memset(&private->vdev, 0, sizeof(private->vdev));
 	vfio_init_group_dev(&private->vdev, &mdev->dev,
 			    &vfio_ccw_dev_ops);
@@ -108,7 +98,6 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 
 err_atomic:
 	vfio_uninit_group_dev(&private->vdev);
-	atomic_inc(&private->avail);
 	private->mdev = NULL;
 	private->state = VFIO_CCW_STATE_IDLE;
 	return ret;
@@ -135,7 +124,6 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 	vfio_uninit_group_dev(&private->vdev);
 	cp_free(&private->cp);
 	private->mdev = NULL;
-	atomic_inc(&private->avail);
 }
 
 static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
@@ -613,6 +601,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 
 struct mdev_driver vfio_ccw_mdev_driver = {
 	.device_api = VFIO_DEVICE_API_CCW_STRING,
+	.max_instances = 1,
 	.driver = {
 		.name = "vfio_ccw_mdev",
 		.owner = THIS_MODULE,
@@ -620,7 +609,6 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 	},
 	.probe = vfio_ccw_mdev_probe,
 	.remove = vfio_ccw_mdev_remove,
-	.get_available = vfio_ccw_get_available,
 };
 
 int vfio_ccw_mdev_reg(struct subchannel *sch)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index b7163bac8cc75..9be5baed0cb7f 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -72,7 +72,6 @@ struct vfio_ccw_crw {
  * @sch: pointer to the subchannel
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
- * @avail: available for creating a mediated device
  * @mdev: pointer to the mediated device
  * @nb: notifier for vfio events
  * @io_region: MMIO region to input/output I/O arguments/results
@@ -96,7 +95,6 @@ struct vfio_ccw_private {
 	struct subchannel	*sch;
 	int			state;
 	struct completion	*completion;
-	atomic_t		avail;
 	struct mdev_device	*mdev;
 	struct notifier_block	nb;
 	struct ccw_io_region	*io_region;
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index edeec11c56560..69ed88fdaf383 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -461,14 +461,9 @@ static int vfio_ap_mdev_probe(struct mdev_device *mdev)
 	struct ap_matrix_mdev *matrix_mdev;
 	int ret;
 
-	if ((atomic_dec_if_positive(&matrix_dev->available_instances) < 0))
-		return -EPERM;
-
 	matrix_mdev = kzalloc(sizeof(*matrix_mdev), GFP_KERNEL);
-	if (!matrix_mdev) {
-		ret = -ENOMEM;
-		goto err_dec_available;
-	}
+	if (!matrix_mdev)
+		return -ENOMEM;
 	vfio_init_group_dev(&matrix_mdev->vdev, &mdev->dev,
 			    &vfio_ap_matrix_dev_ops);
 
@@ -491,8 +486,6 @@ static int vfio_ap_mdev_probe(struct mdev_device *mdev)
 	mutex_unlock(&matrix_dev->lock);
 	vfio_uninit_group_dev(&matrix_mdev->vdev);
 	kfree(matrix_mdev);
-err_dec_available:
-	atomic_inc(&matrix_dev->available_instances);
 	return ret;
 }
 
@@ -508,12 +501,6 @@ static void vfio_ap_mdev_remove(struct mdev_device *mdev)
 	mutex_unlock(&matrix_dev->lock);
 	vfio_uninit_group_dev(&matrix_mdev->vdev);
 	kfree(matrix_mdev);
-	atomic_inc(&matrix_dev->available_instances);
-}
-
-static unsigned int vfio_ap_mdev_get_available(struct mdev_type *mtype)
-{
-	return atomic_read(&matrix_dev->available_instances);
 }
 
 struct vfio_ap_queue_reserved {
@@ -1427,6 +1414,7 @@ static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
 
 static struct mdev_driver vfio_ap_matrix_driver = {
 	.device_api = VFIO_DEVICE_API_AP_STRING,
+	.max_instances = MAX_ZDEV_ENTRIES_EXT,
 	.driver = {
 		.name = "vfio_ap_mdev",
 		.owner = THIS_MODULE,
@@ -1435,15 +1423,12 @@ static struct mdev_driver vfio_ap_matrix_driver = {
 	},
 	.probe = vfio_ap_mdev_probe,
 	.remove = vfio_ap_mdev_remove,
-	.get_available = vfio_ap_mdev_get_available,
 };
 
 int vfio_ap_mdev_register(void)
 {
 	int ret;
 
-	atomic_set(&matrix_dev->available_instances, MAX_ZDEV_ENTRIES_EXT);
-
 	ret = mdev_register_driver(&vfio_ap_matrix_driver);
 	if (ret)
 		return ret;
diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
index 5dc5050d03791..b808b343b771f 100644
--- a/drivers/s390/crypto/vfio_ap_private.h
+++ b/drivers/s390/crypto/vfio_ap_private.h
@@ -28,7 +28,6 @@
  * struct ap_matrix_dev - Contains the data for the matrix device.
  *
  * @device:	generic device structure associated with the AP matrix device
- * @available_instances: number of mediated matrix devices that can be created
  * @info:	the struct containing the output from the PQAP(QCI) instruction
  * @mdev_list:	the list of mediated matrix devices created
  * @lock:	mutex for locking the AP matrix device. This lock will be
@@ -40,7 +39,6 @@
  */
 struct ap_matrix_dev {
 	struct device device;
-	atomic_t available_instances;
 	struct ap_config_info info;
 	struct list_head mdev_list;
 	struct mutex lock;
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 93f8caf2e5f77..9bc897235c492 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -70,6 +70,7 @@ int mdev_register_parent(struct mdev_parent *parent, struct device *dev,
 	parent->mdev_driver = mdev_driver;
 	parent->types = types;
 	parent->nr_types = nr_types;
+	parent->available_instances = mdev_driver->max_instances;
 
 	if (!mdev_bus_compat_class) {
 		mdev_bus_compat_class = class_compat_register("mdev_bus");
@@ -115,14 +116,17 @@ EXPORT_SYMBOL(mdev_unregister_parent);
 static void mdev_device_release(struct device *dev)
 {
 	struct mdev_device *mdev = to_mdev_device(dev);
-
-	/* Pairs with the get in mdev_device_create() */
-	kobject_put(&mdev->type->kobj);
+	struct mdev_parent *parent = mdev->type->parent;
 
 	mutex_lock(&mdev_list_lock);
 	list_del(&mdev->next);
+	if (!parent->mdev_driver->get_available)
+		parent->available_instances++;
 	mutex_unlock(&mdev_list_lock);
 
+	/* Pairs with the get in mdev_device_create() */
+	kobject_put(&mdev->type->kobj);
+
 	dev_dbg(&mdev->dev, "MDEV: destroying\n");
 	kfree(mdev);
 }
@@ -144,6 +148,14 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 		}
 	}
 
+	if (!drv->get_available) {
+		if (!parent->available_instances) {
+			mutex_unlock(&mdev_list_lock);
+			return -EUSERS;
+		}
+		parent->available_instances--;
+	}
+
 	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
 	if (!mdev) {
 		mutex_unlock(&mdev_list_lock);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index dc38ad2b07883..641ed18a61247 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -45,6 +45,7 @@ struct mdev_parent {
 	struct rw_semaphore unreg_sem;
 	struct mdev_type **types;
 	unsigned int nr_types;
+	unsigned int available_instances;
 };
 
 static inline struct mdev_device *to_mdev_device(struct device *dev)
@@ -55,6 +56,7 @@ static inline struct mdev_device *to_mdev_device(struct device *dev)
 /**
  * struct mdev_driver - Mediated device driver
  * @device_api: string to return for the device_api sysfs
+ * @max_instances: maximum number of instances supported (optional)
  * @probe: called when new device created
  * @remove: called when device removed
  * @get_available: Return the max number of instances that can be created
@@ -63,6 +65,7 @@ static inline struct mdev_device *to_mdev_device(struct device *dev)
  **/
 struct mdev_driver {
 	const char *device_api;
+	unsigned int max_instances;
 	int (*probe)(struct mdev_device *dev);
 	void (*remove)(struct mdev_device *dev);
 	unsigned int (*get_available)(struct mdev_type *mtype);
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 250b7ea2df2e4..7f7ac5491407e 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -42,11 +42,6 @@
 
 MODULE_LICENSE("GPL v2");
 
-static int max_devices = 4;
-module_param_named(count, max_devices, int, 0444);
-MODULE_PARM_DESC(count, "number of " MDPY_NAME " devices");
-
-
 #define MDPY_TYPE_1 "vga"
 #define MDPY_TYPE_2 "xga"
 #define MDPY_TYPE_3 "hd"
@@ -93,7 +88,6 @@ static struct class	*mdpy_class;
 static struct cdev	mdpy_cdev;
 static struct device	mdpy_dev;
 static struct mdev_parent mdpy_parent;
-static u32		mdpy_count;
 static const struct vfio_device_ops mdpy_dev_ops;
 
 /* State of each mdev device */
@@ -234,9 +228,6 @@ static int mdpy_probe(struct mdev_device *mdev)
 	u32 fbsize;
 	int ret;
 
-	if (mdpy_count >= max_devices)
-		return -ENOMEM;
-
 	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
 	if (mdev_state == NULL)
 		return -ENOMEM;
@@ -265,8 +256,6 @@ static int mdpy_probe(struct mdev_device *mdev)
 	mdpy_create_config_space(mdev_state);
 	mdpy_reset(mdev_state);
 
-	mdpy_count++;
-
 	ret = vfio_register_emulated_iommu_dev(&mdev_state->vdev);
 	if (ret)
 		goto err_mem;
@@ -293,8 +282,6 @@ static void mdpy_remove(struct mdev_device *mdev)
 	kfree(mdev_state->vconfig);
 	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state);
-
-	mdpy_count--;
 }
 
 static ssize_t mdpy_read(struct vfio_device *vdev, char __user *buf,
@@ -658,11 +645,6 @@ static ssize_t mdpy_show_description(struct mdev_type *mtype, char *buf)
 		       type->width, type->height);
 }
 
-static unsigned int mdpy_get_available(struct mdev_type *mtype)
-{
-	return max_devices - mdpy_count;
-}
-
 static const struct vfio_device_ops mdpy_dev_ops = {
 	.read = mdpy_read,
 	.write = mdpy_write,
@@ -672,6 +654,7 @@ static const struct vfio_device_ops mdpy_dev_ops = {
 
 static struct mdev_driver mdpy_driver = {
 	.device_api = VFIO_DEVICE_API_PCI_STRING,
+	.max_instances = 4,
 	.driver = {
 		.name = "mdpy",
 		.owner = THIS_MODULE,
@@ -680,7 +663,6 @@ static struct mdev_driver mdpy_driver = {
 	},
 	.probe = mdpy_probe,
 	.remove	= mdpy_remove,
-	.get_available = mdpy_get_available,
 	.show_description = mdpy_show_description,
 };
 
@@ -757,5 +739,8 @@ static void __exit mdpy_dev_exit(void)
 	mdpy_class = NULL;
 }
 
+module_param_named(count, mdpy_driver.max_instances, int, 0444);
+MODULE_PARM_DESC(count, "number of " MDPY_NAME " devices");
+
 module_init(mdpy_dev_init)
 module_exit(mdpy_dev_exit)
-- 
2.30.2

