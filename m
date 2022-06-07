Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8853C4EA
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Jun 2022 08:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E48113AA1;
	Fri,  3 Jun 2022 06:33:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2280113A89
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Jun 2022 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=p+7ZNFSgyXdbYpBBA4Nfm9fgDdjWj+h9Oxgi6DERdRw=; b=BM/IewDB+Dp79qYuVJA1YK4MYc
 aV9B9JfRmmb1msGxZJYQF3A8KeK3hCywNX0NBO8nbpaW4Xzt71YlkfXjo37Co6MmQUBRdiF5SQ4iS
 I0RfEwf5pPJJxdNQMRq+2xCbbXHLPbahnVIK43JDmix+8WWte/bznf8iwDUfmAU9AAGbHLQMLK4Xg
 Q8eD0/0dCOeJcJ4tLjCpcLdaJ5CkkK988ryWjHzorXCUA985E9TffaBJL5HZX/raDqgxZ4KgUQWpO
 h8pH6M2+QP1n+Ql0ySS6SvU6OYJrRuxOl1YGDIagf3iix0HrrKek3CWwnETB2PTp66NdV2aJyxwx8
 /ce7NfvQ==;
Received: from [2001:4bb8:185:a81e:b29a:8b56:eb9a:ca3b] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nx0sJ-00610v-Rg; Fri, 03 Jun 2022 06:33:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 2/8] vfio/mdev: embedd struct mdev_parent in the parent data
 structure
Date: Fri,  3 Jun 2022 08:33:22 +0200
Message-Id: <20220603063328.3715-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220603063328.3715-1-hch@lst.de>
References: <20220603063328.3715-1-hch@lst.de>
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
Cc: linux-s390@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 kvm@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Simplify mdev_{un}register_device by requiring the caller to pass in
a structure allocate as part of the parent device structure.  This
removes the need for a list of parents and the separate mdev_parent
refcount as we can simplify rely on the reference to the parent device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../driver-api/vfio-mediated-device.rst       |  12 +-
 Documentation/s390/vfio-ap.rst                |   2 +-
 Documentation/s390/vfio-ccw.rst               |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   5 +-
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/s390/cio/cio.h                        |   2 +
 drivers/s390/cio/vfio_ccw_ops.c               |   6 +-
 drivers/s390/crypto/vfio_ap_ops.c             |   5 +-
 drivers/s390/crypto/vfio_ap_private.h         |   1 +
 drivers/vfio/mdev/mdev_core.c                 | 116 +++---------------
 drivers/vfio/mdev/mdev_private.h              |  23 ----
 drivers/vfio/mdev/mdev_sysfs.c                |   4 +-
 include/linux/mdev.h                          |  15 ++-
 samples/vfio-mdev/mbochs.c                    |   5 +-
 samples/vfio-mdev/mdpy.c                      |   5 +-
 samples/vfio-mdev/mtty.c                      |   6 +-
 16 files changed, 65 insertions(+), 146 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index eded8719180fb..3749f59c855fa 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -60,19 +60,19 @@ devices as examples, as these devices are the first devices to use this module::
      |  MDEV CORE    |
      |   MODULE      |
      |   mdev.ko     |
-     | +-----------+ |  mdev_register_device() +--------------+
+     | +-----------+ |  mdev_register_parent() +--------------+
      | |           | +<------------------------+              |
      | |           | |                         |  nvidia.ko   |<-> physical
      | |           | +------------------------>+              |    device
      | |           | |        callbacks        +--------------+
      | | Physical  | |
-     | |  device   | |  mdev_register_device() +--------------+
+     | |  device   | |  mdev_register_parent() +--------------+
      | | interface | |<------------------------+              |
      | |           | |                         |  i915.ko     |<-> physical
      | |           | +------------------------>+              |    device
      | |           | |        callbacks        +--------------+
      | |           | |
-     | |           | |  mdev_register_device() +--------------+
+     | |           | |  mdev_register_parent() +--------------+
      | |           | +<------------------------+              |
      | |           | |                         | ccw_device.ko|<-> physical
      | |           | +------------------------>+              |    device
@@ -127,8 +127,8 @@ vfio_device_ops.
 When a driver wants to add the GUID creation sysfs to an existing device it has
 probe'd to then it should call::
 
-	extern int  mdev_register_device(struct device *dev,
-	                                 struct mdev_driver *mdev_driver);
+	int mdev_register_parent(struct mdev_parent *parent, struct device *dev,
+			struct mdev_driver *mdev_driver);
 
 This will provide the 'mdev_supported_types/XX/create' files which can then be
 used to trigger the creation of a mdev_device. The created mdev_device will be
@@ -136,7 +136,7 @@ attached to the specified driver.
 
 When the driver needs to remove itself it calls::
 
-	extern void mdev_unregister_device(struct device *dev);
+	void mdev_unregister_parent(struct mdev_parent *parent);
 
 Which will unbind and destroy all the created mdevs and remove the sysfs files.
 
diff --git a/Documentation/s390/vfio-ap.rst b/Documentation/s390/vfio-ap.rst
index f57ae621f33e8..37e16158c7fbf 100644
--- a/Documentation/s390/vfio-ap.rst
+++ b/Documentation/s390/vfio-ap.rst
@@ -299,7 +299,7 @@ of the VFIO AP mediated matrix device driver::
    |  MDEV CORE  |
    |   MODULE    |
    |   mdev.ko   |
-   | +---------+ | mdev_register_device() +--------------+
+   | +---------+ | mdev_register_parent() +--------------+
    | |Physical | +<-----------------------+              |
    | | device  | |                        |  vfio_ap.ko  |<-> matrix
    | |interface| +----------------------->+              |    device
diff --git a/Documentation/s390/vfio-ccw.rst b/Documentation/s390/vfio-ccw.rst
index 8aad08a8b8a50..ea928a3806f43 100644
--- a/Documentation/s390/vfio-ccw.rst
+++ b/Documentation/s390/vfio-ccw.rst
@@ -156,7 +156,7 @@ Below is a high Level block diagram::
  |  MDEV CORE  |
  |   MODULE    |
  |   mdev.ko   |
- | +---------+ | mdev_register_device() +--------------+
+ | +---------+ | mdev_register_parent() +--------------+
  | |Physical | +<-----------------------+              |
  | | device  | |                        |  vfio_ccw.ko |<-> subchannel
  | |interface| +----------------------->+              |     device
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e2f6c56ab3420..37bda01c1bb97 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1960,7 +1960,7 @@ static void intel_gvt_clean_device(struct drm_i915_private *i915)
 	if (drm_WARN_ON(&i915->drm, !gvt))
 		return;
 
-	mdev_unregister_device(i915->drm.dev);
+	mdev_unregister_parent(&i915->vgpu.parent);
 	intel_gvt_cleanup_vgpu_type_groups(gvt);
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
 	intel_gvt_clean_vgpu_types(gvt);
@@ -2065,7 +2065,8 @@ static int intel_gvt_init_device(struct drm_i915_private *i915)
 	if (ret)
 		goto out_destroy_idle_vgpu;
 
-	ret = mdev_register_device(i915->drm.dev, &intel_vgpu_mdev_driver);
+	ret = mdev_register_parent(&i915->vgpu.parent, i915->drm.dev,
+				   &intel_vgpu_mdev_driver);
 	if (ret)
 		goto out_cleanup_vgpu_type_groups;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 00d7eeae33bd3..7d62cc9a57e4e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -32,6 +32,7 @@
 
 #include <uapi/drm/i915_drm.h>
 
+#include <linux/mdev.h>
 #include <linux/pm_qos.h>
 
 #include <drm/drm_connector.h>
@@ -400,6 +401,7 @@ struct i915_frontbuffer_tracking {
 
 struct i915_virtual_gpu {
 	struct mutex lock; /* serialises sending of g2v_notify command pkts */
+	struct mdev_parent parent;
 	bool active;
 	u32 caps;
 	u32 *initial_mmio;
diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 1cb9daf9c6450..4ae462da7b45b 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -5,6 +5,7 @@
 #include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mdev.h>
 #include <asm/chpid.h>
 #include <asm/cio.h>
 #include <asm/fcx.h>
@@ -104,6 +105,7 @@ struct subchannel {
 	struct schib_config config;
 	u64 dma_mask;
 	char *driver_override; /* Driver name to force a match */
+	struct mdev_parent parent;
 } __attribute__ ((aligned(8)));
 
 DECLARE_PER_CPU_ALIGNED(struct irb, cio_irb);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index b49e2e9db2dc6..9192a21085ce4 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/vfio.h>
-#include <linux/mdev.h>
 #include <linux/nospec.h>
 #include <linux/slab.h>
 
@@ -660,10 +659,11 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 
 int vfio_ccw_mdev_reg(struct subchannel *sch)
 {
-	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_driver);
+	return mdev_register_parent(&sch->parent, &sch->dev,
+				    &vfio_ccw_mdev_driver);
 }
 
 void vfio_ccw_mdev_unreg(struct subchannel *sch)
 {
-	mdev_unregister_device(&sch->dev);
+	mdev_unregister_parent(&sch->parent);
 }
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index a7d2a95796d36..834945150dc9f 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1485,7 +1485,8 @@ int vfio_ap_mdev_register(void)
 	if (ret)
 		return ret;
 
-	ret = mdev_register_device(&matrix_dev->device, &vfio_ap_matrix_driver);
+	ret = mdev_register_parent(&matrix_dev->parent, &matrix_dev->device,
+				   &vfio_ap_matrix_driver);
 	if (ret)
 		goto err_driver;
 	return 0;
@@ -1497,6 +1498,6 @@ int vfio_ap_mdev_register(void)
 
 void vfio_ap_mdev_unregister(void)
 {
-	mdev_unregister_device(&matrix_dev->device);
+	mdev_unregister_parent(&matrix_dev->parent);
 	mdev_unregister_driver(&vfio_ap_matrix_driver);
 }
diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
index a26efd804d0df..b97dc548a7c95 100644
--- a/drivers/s390/crypto/vfio_ap_private.h
+++ b/drivers/s390/crypto/vfio_ap_private.h
@@ -46,6 +46,7 @@ struct ap_matrix_dev {
 	struct list_head mdev_list;
 	struct mutex lock;
 	struct ap_driver  *vfio_ap_drv;
+	struct mdev_parent parent;
 };
 
 extern struct ap_matrix_dev *matrix_dev;
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index b8b9e7911e559..8b5a2b3f0c882 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -20,8 +20,6 @@
 #define DRIVER_AUTHOR		"NVIDIA Corporation"
 #define DRIVER_DESC		"Mediated device Core Driver"
 
-static LIST_HEAD(parent_list);
-static DEFINE_MUTEX(parent_list_lock);
 static struct class_compat *mdev_bus_compat_class;
 
 static LIST_HEAD(mdev_list);
@@ -63,28 +61,6 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype)
 }
 EXPORT_SYMBOL(mtype_get_parent_dev);
 
-/* Should be called holding parent_list_lock */
-static struct mdev_parent *__find_parent_device(struct device *dev)
-{
-	struct mdev_parent *parent;
-
-	list_for_each_entry(parent, &parent_list, next) {
-		if (parent->dev == dev)
-			return parent;
-	}
-	return NULL;
-}
-
-void mdev_release_parent(struct kref *kref)
-{
-	struct mdev_parent *parent = container_of(kref, struct mdev_parent,
-						  ref);
-	struct device *dev = parent->dev;
-
-	kfree(parent);
-	put_device(dev);
-}
-
 /* Caller must hold parent unreg_sem read or write lock */
 static void mdev_device_remove_common(struct mdev_device *mdev)
 {
@@ -107,125 +83,69 @@ static int mdev_device_remove_cb(struct device *dev, void *data)
 }
 
 /*
- * mdev_register_device : Register a device
+ * mdev_register_parent: Register a device as parent for mdevs
+ * @parent: parent structure registered
  * @dev: device structure representing parent device.
  * @mdev_driver: Device driver to bind to the newly created mdev
  *
- * Add device to list of registered parent devices.
  * Returns a negative value on error, otherwise 0.
  */
-int mdev_register_device(struct device *dev, struct mdev_driver *mdev_driver)
+int mdev_register_parent(struct mdev_parent *parent, struct device *dev,
+		struct mdev_driver *mdev_driver)
 {
-	int ret;
-	struct mdev_parent *parent;
 	char *env_string = "MDEV_STATE=registered";
 	char *envp[] = { env_string, NULL };
+	int ret;
 
 	/* check for mandatory ops */
 	if (!mdev_driver->supported_type_groups)
 		return -EINVAL;
 
-	dev = get_device(dev);
-	if (!dev)
-		return -EINVAL;
-
-	mutex_lock(&parent_list_lock);
-
-	/* Check for duplicate */
-	parent = __find_parent_device(dev);
-	if (parent) {
-		parent = NULL;
-		ret = -EEXIST;
-		goto add_dev_err;
-	}
-
-	parent = kzalloc(sizeof(*parent), GFP_KERNEL);
-	if (!parent) {
-		ret = -ENOMEM;
-		goto add_dev_err;
-	}
-
-	kref_init(&parent->ref);
+	memset(parent, 0, sizeof(*parent));
 	init_rwsem(&parent->unreg_sem);
-
 	parent->dev = dev;
 	parent->mdev_driver = mdev_driver;
 
 	if (!mdev_bus_compat_class) {
 		mdev_bus_compat_class = class_compat_register("mdev_bus");
-		if (!mdev_bus_compat_class) {
-			ret = -ENOMEM;
-			goto add_dev_err;
-		}
+		if (!mdev_bus_compat_class)
+			return -ENOMEM;
 	}
 
 	ret = parent_create_sysfs_files(parent);
 	if (ret)
-		goto add_dev_err;
+		return ret;
 
 	ret = class_compat_create_link(mdev_bus_compat_class, dev, NULL);
 	if (ret)
 		dev_warn(dev, "Failed to create compatibility class link\n");
 
-	list_add(&parent->next, &parent_list);
-	mutex_unlock(&parent_list_lock);
-
 	dev_info(dev, "MDEV: Registered\n");
 	kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
-
 	return 0;
-
-add_dev_err:
-	mutex_unlock(&parent_list_lock);
-	if (parent)
-		mdev_put_parent(parent);
-	else
-		put_device(dev);
-	return ret;
 }
-EXPORT_SYMBOL(mdev_register_device);
+EXPORT_SYMBOL(mdev_register_parent);
 
 /*
- * mdev_unregister_device : Unregister a parent device
- * @dev: device structure representing parent device.
- *
- * Remove device from list of registered parent devices. Give a chance to free
- * existing mediated devices for given device.
+ * mdev_unregister_parent : Unregister a parent device
+ * @parent: parent structure to unregister
  */
-
-void mdev_unregister_device(struct device *dev)
+void mdev_unregister_parent(struct mdev_parent *parent)
 {
-	struct mdev_parent *parent;
 	char *env_string = "MDEV_STATE=unregistered";
 	char *envp[] = { env_string, NULL };
 
-	mutex_lock(&parent_list_lock);
-	parent = __find_parent_device(dev);
-
-	if (!parent) {
-		mutex_unlock(&parent_list_lock);
-		return;
-	}
-	dev_info(dev, "MDEV: Unregistering\n");
-
-	list_del(&parent->next);
-	mutex_unlock(&parent_list_lock);
+	dev_info(parent->dev, "MDEV: Unregistering\n");
 
 	down_write(&parent->unreg_sem);
-
-	class_compat_remove_link(mdev_bus_compat_class, dev, NULL);
-
-	device_for_each_child(dev, NULL, mdev_device_remove_cb);
-
+	class_compat_remove_link(mdev_bus_compat_class, parent->dev, NULL);
+	device_for_each_child(parent->dev, NULL, mdev_device_remove_cb);
 	parent_remove_sysfs_files(parent);
 	up_write(&parent->unreg_sem);
 
-	mdev_put_parent(parent);
-
-	/* We still have the caller's reference to use for the uevent */
-	kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
+	kobject_uevent_env(&parent->dev->kobj, KOBJ_CHANGE, envp);
 }
-EXPORT_SYMBOL(mdev_unregister_device);
+EXPORT_SYMBOL(mdev_unregister_parent);
 
 static void mdev_device_release(struct device *dev)
 {
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 7c9fc79f3d838..297f911fdc890 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -13,17 +13,6 @@
 int  mdev_bus_register(void);
 void mdev_bus_unregister(void);
 
-struct mdev_parent {
-	struct device *dev;
-	struct mdev_driver *mdev_driver;
-	struct kref ref;
-	struct list_head next;
-	struct kset *mdev_types_kset;
-	struct list_head type_list;
-	/* Synchronize device creation/removal with parent unregistration */
-	struct rw_semaphore unreg_sem;
-};
-
 struct mdev_type {
 	struct kobject kobj;
 	struct kobject *devices_kobj;
@@ -48,16 +37,4 @@ void mdev_remove_sysfs_files(struct mdev_device *mdev);
 int mdev_device_create(struct mdev_type *kobj, const guid_t *uuid);
 int  mdev_device_remove(struct mdev_device *dev);
 
-void mdev_release_parent(struct kref *kref);
-
-static inline void mdev_get_parent(struct mdev_parent *parent)
-{
-	kref_get(&parent->ref);
-}
-
-static inline void mdev_put_parent(struct mdev_parent *parent)
-{
-	kref_put(&parent->ref, mdev_release_parent);
-}
-
 #endif /* MDEV_PRIVATE_H */
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index 0ccfeb3dda245..becce814aabfb 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -83,7 +83,7 @@ static void mdev_type_release(struct kobject *kobj)
 
 	pr_debug("Releasing group %s\n", kobj->name);
 	/* Pairs with the get in add_mdev_supported_type() */
-	mdev_put_parent(type->parent);
+	put_device(type->parent->dev);
 	kfree(type);
 }
 
@@ -112,7 +112,7 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 	type->kobj.kset = parent->mdev_types_kset;
 	type->parent = parent;
 	/* Pairs with the put in mdev_type_release() */
-	mdev_get_parent(parent);
+	get_device(parent->dev);
 	type->type_group_id = type_group_id;
 
 	ret = kobject_init_and_add(&type->kobj, &mdev_type_ktype, NULL,
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 555c1d015b5f0..327ce3e5c6b5f 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -23,6 +23,16 @@ struct mdev_device {
 	bool active;
 };
 
+/* embedded into the struct device that the mdev devices hang off */
+struct mdev_parent {
+	struct device *dev;
+	struct mdev_driver *mdev_driver;
+	struct kset *mdev_types_kset;
+	struct list_head type_list;
+	/* Synchronize device creation/removal with parent unregistration */
+	struct rw_semaphore unreg_sem;
+};
+
 static inline struct mdev_device *to_mdev_device(struct device *dev)
 {
 	return container_of(dev, struct mdev_device, dev);
@@ -75,8 +85,9 @@ static inline const guid_t *mdev_uuid(struct mdev_device *mdev)
 
 extern struct bus_type mdev_bus_type;
 
-int mdev_register_device(struct device *dev, struct mdev_driver *mdev_driver);
-void mdev_unregister_device(struct device *dev);
+int mdev_register_parent(struct mdev_parent *parent, struct device *dev,
+		struct mdev_driver *mdev_driver);
+void mdev_unregister_parent(struct mdev_parent *parent);
 
 int mdev_register_driver(struct mdev_driver *drv);
 void mdev_unregister_driver(struct mdev_driver *drv);
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 344c2901a82bf..f0967a81eabe7 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -129,6 +129,7 @@ static dev_t		mbochs_devt;
 static struct class	*mbochs_class;
 static struct cdev	mbochs_cdev;
 static struct device	mbochs_dev;
+static struct mdev_parent mbochs_parent;
 static atomic_t mbochs_avail_mbytes;
 static const struct vfio_device_ops mbochs_dev_ops;
 
@@ -1457,7 +1458,7 @@ static int __init mbochs_dev_init(void)
 	if (ret)
 		goto err_class;
 
-	ret = mdev_register_device(&mbochs_dev, &mbochs_driver);
+	ret = mdev_register_parent(&mbochs_parent, &mbochs_dev, &mbochs_driver);
 	if (ret)
 		goto err_device;
 
@@ -1478,7 +1479,7 @@ static int __init mbochs_dev_init(void)
 static void __exit mbochs_dev_exit(void)
 {
 	mbochs_dev.bus = NULL;
-	mdev_unregister_device(&mbochs_dev);
+	mdev_unregister_parent(&mbochs_parent);
 
 	device_unregister(&mbochs_dev);
 	mdev_unregister_driver(&mbochs_driver);
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index e8c46eb2e2468..8ab88a1d149cb 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -84,6 +84,7 @@ static dev_t		mdpy_devt;
 static struct class	*mdpy_class;
 static struct cdev	mdpy_cdev;
 static struct device	mdpy_dev;
+static struct mdev_parent mdpy_parent;
 static u32		mdpy_count;
 static const struct vfio_device_ops mdpy_dev_ops;
 
@@ -766,7 +767,7 @@ static int __init mdpy_dev_init(void)
 	if (ret)
 		goto err_class;
 
-	ret = mdev_register_device(&mdpy_dev, &mdpy_driver);
+	ret = mdev_register_parent(&mdpy_parent, &mdpy_dev, &mdpy_driver);
 	if (ret)
 		goto err_device;
 
@@ -787,7 +788,7 @@ static int __init mdpy_dev_init(void)
 static void __exit mdpy_dev_exit(void)
 {
 	mdpy_dev.bus = NULL;
-	mdev_unregister_device(&mdpy_dev);
+	mdev_unregister_parent(&mdpy_parent);
 
 	device_unregister(&mdpy_dev);
 	mdev_unregister_driver(&mdpy_driver);
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index f42a59ed2e3fe..20136def93fdb 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -74,6 +74,7 @@ static struct mtty_dev {
 	struct cdev	vd_cdev;
 	struct idr	vd_idr;
 	struct device	dev;
+	struct mdev_parent parent;
 } mtty_dev;
 
 struct mdev_region_info {
@@ -1352,7 +1353,8 @@ static int __init mtty_dev_init(void)
 	if (ret)
 		goto err_class;
 
-	ret = mdev_register_device(&mtty_dev.dev, &mtty_driver);
+	ret = mdev_register_parent(&mtty_dev.parent, &mtty_dev.dev,
+				   &mtty_driver);
 	if (ret)
 		goto err_device;
 	return 0;
@@ -1372,7 +1374,7 @@ static int __init mtty_dev_init(void)
 static void __exit mtty_dev_exit(void)
 {
 	mtty_dev.dev.bus = NULL;
-	mdev_unregister_device(&mtty_dev.dev);
+	mdev_unregister_parent(&mtty_dev.parent);
 
 	device_unregister(&mtty_dev.dev);
 	idr_destroy(&mtty_dev.vd_idr);
-- 
2.30.2

