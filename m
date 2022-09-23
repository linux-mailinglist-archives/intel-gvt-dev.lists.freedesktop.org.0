Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF745E7703
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Sep 2022 11:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1216510E7E5;
	Fri, 23 Sep 2022 09:27:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6610E7EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Sep 2022 09:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IcNqKe+S0ALFxpzz4hjhRgs9PZysWrEQTHJWjHSElpY=; b=xNg2JnWly4BD9inhAJdztpOqZ5
 iqbR0c6R8XJI3Vugsz47MVKaP30VweT6JxCbYN68hKOLFaAjBbKAA7byyI5oCfUUeV2uy8+hbQ1Mz
 L71GQyFF4hVXvLmcoQGgFr3FpBqAaxgsYhW5Jg2OzNQ7q9gdLcxxVCAx44nIK+ZfI7EETAl8qglEf
 6gcGyN+APRvoCXWstoLANBXo5vnUzAawKer7a2s3Fw9Z0uRBco05doCzi2UmVa97VQTEnD8dcfi16
 nMIBcxSiM0F0t4WMD79rn60IXNedjmbdb6jr+HlMqePWNG4eD3l0tpGY2dekzmeUsszGaVEf6TGx7
 RuXuaORQ==;
Received: from ip4d15bec4.dynamic.kabel-deutschland.de ([77.21.190.196]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1obexs-003Jsb-Aw; Fri, 23 Sep 2022 09:27:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 10/14] vfio/mdev: consolidate all the device_api sysfs into
 the core code
Date: Fri, 23 Sep 2022 11:26:48 +0200
Message-Id: <20220923092652.100656-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220923092652.100656-1-hch@lst.de>
References: <20220923092652.100656-1-hch@lst.de>
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

From: Jason Gunthorpe <jgg@nvidia.com>

Every driver just emits a static string, simply feed it through the ops
and provide a standard sysfs show function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  9 +----
 drivers/s390/cio/vfio_ccw_ops.c               |  9 +----
 drivers/s390/crypto/vfio_ap_ops.c             | 10 +-----
 drivers/vfio/mdev/mdev_driver.c               |  4 ++-
 drivers/vfio/mdev/mdev_sysfs.c                | 35 +++++++++++++------
 include/linux/mdev.h                          |  7 ++--
 samples/vfio-mdev/mbochs.c                    |  9 +----
 samples/vfio-mdev/mdpy.c                      |  9 +----
 samples/vfio-mdev/mtty.c                      | 10 +-----
 10 files changed, 37 insertions(+), 67 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 7b660f3fa2c92..b0c29e37f61b4 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -202,7 +202,7 @@ Directories and files under the sysfs for Each Physical Device
 
 * device_api
 
-  This attribute should show which device API is being created, for example,
+  This attribute shows which device API is being created, for example,
   "vfio-pci" for a PCI device.
 
 * available_instances
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1947f553fcd38..9b2d3b078a2c9 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -123,12 +123,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 	return sprintf(buf, "%u\n", type->avail_instance);
 }
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-
 static ssize_t description_show(struct mdev_type *mtype,
 				struct mdev_type_attribute *attr, char *buf)
 {
@@ -151,13 +145,11 @@ static ssize_t name_show(struct mdev_type *mtype,
 }
 
 static MDEV_TYPE_ATTR_RO(available_instances);
-static MDEV_TYPE_ATTR_RO(device_api);
 static MDEV_TYPE_ATTR_RO(description);
 static MDEV_TYPE_ATTR_RO(name);
 
 static const struct attribute *gvt_type_attrs[] = {
 	&mdev_type_attr_available_instances.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_description.attr,
 	&mdev_type_attr_name.attr,
 	NULL,
@@ -1549,6 +1541,7 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
 }
 
 static struct mdev_driver intel_vgpu_mdev_driver = {
+	.device_api	= VFIO_DEVICE_API_PCI_STRING,
 	.driver = {
 		.name		= "intel_vgpu_mdev",
 		.owner		= THIS_MODULE,
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 3db6251b31143..4c7b181519228 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -51,13 +51,6 @@ static ssize_t name_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_CCW_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -70,7 +63,6 @@ static MDEV_TYPE_ATTR_RO(available_instances);
 
 static const struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -628,6 +620,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 };
 
 struct mdev_driver vfio_ccw_mdev_driver = {
+	.device_api = VFIO_DEVICE_API_CCW_STRING,
 	.driver = {
 		.name = "vfio_ccw_mdev",
 		.owner = THIS_MODULE,
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 24d131c502ca3..d440acfbb261e 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -808,17 +808,8 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_AP_STRING);
-}
-
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static const struct attribute *vfio_ap_mdev_type_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1799,6 +1790,7 @@ static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
 };
 
 static struct mdev_driver vfio_ap_matrix_driver = {
+	.device_api = VFIO_DEVICE_API_AP_STRING,
 	.driver = {
 		.name = "vfio_ap_mdev",
 		.owner = THIS_MODULE,
diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
index 5b3c94f4fb13d..60e8b9f6474e8 100644
--- a/drivers/vfio/mdev/mdev_driver.c
+++ b/drivers/vfio/mdev/mdev_driver.c
@@ -55,8 +55,10 @@ struct bus_type mdev_bus_type = {
  **/
 int mdev_register_driver(struct mdev_driver *drv)
 {
-	if (!drv->types_attrs)
+	if (!drv->types_attrs || !drv->device_api)
 		return -EINVAL;
+
+	/* initialize common driver fields */
 	drv->driver.bus = &mdev_bus_type;
 	return driver_register(&drv->driver);
 }
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index 38b4c2466ec43..60fc52ff92448 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -72,9 +72,30 @@ static ssize_t create_store(struct mdev_type *mtype,
 
 	return count;
 }
-
 static MDEV_TYPE_ATTR_WO(create);
 
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", mtype->parent->mdev_driver->device_api);
+}
+static MDEV_TYPE_ATTR_RO(device_api);
+
+static struct attribute *mdev_types_core_attrs[] = {
+	&mdev_type_attr_create.attr,
+	&mdev_type_attr_device_api.attr,
+	NULL,
+};
+
+static struct attribute_group mdev_type_core_group = {
+	.attrs = mdev_types_core_attrs,
+};
+
+static const struct attribute_group *mdev_type_groups[] = {
+	&mdev_type_core_group,
+	NULL,
+};
+
 static void mdev_type_release(struct kobject *kobj)
 {
 	struct mdev_type *type = to_mdev_type(kobj);
@@ -85,8 +106,9 @@ static void mdev_type_release(struct kobject *kobj)
 }
 
 static struct kobj_type mdev_type_ktype = {
-	.sysfs_ops = &mdev_type_sysfs_ops,
-	.release = mdev_type_release,
+	.sysfs_ops	= &mdev_type_sysfs_ops,
+	.release	= mdev_type_release,
+	.default_groups	= mdev_type_groups,
 };
 
 static int mdev_type_add(struct mdev_parent *parent, struct mdev_type *type)
@@ -106,10 +128,6 @@ static int mdev_type_add(struct mdev_parent *parent, struct mdev_type *type)
 		return ret;
 	}
 
-	ret = sysfs_create_file(&type->kobj, &mdev_type_attr_create.attr);
-	if (ret)
-		goto attr_create_failed;
-
 	type->devices_kobj = kobject_create_and_add("devices", &type->kobj);
 	if (!type->devices_kobj) {
 		ret = -ENOMEM;
@@ -124,8 +142,6 @@ static int mdev_type_add(struct mdev_parent *parent, struct mdev_type *type)
 attrs_failed:
 	kobject_put(type->devices_kobj);
 attr_devices_failed:
-	sysfs_remove_file(&type->kobj, &mdev_type_attr_create.attr);
-attr_create_failed:
 	kobject_del(&type->kobj);
 	kobject_put(&type->kobj);
 	return ret;
@@ -136,7 +152,6 @@ static void mdev_type_remove(struct mdev_type *type)
 	sysfs_remove_files(&type->kobj, type->parent->mdev_driver->types_attrs);
 
 	kobject_put(type->devices_kobj);
-	sysfs_remove_file(&type->kobj, &mdev_type_attr_create.attr);
 	kobject_del(&type->kobj);
 	kobject_put(&type->kobj);
 }
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index e445f809ceca3..af1ff0165b8d3 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -61,11 +61,6 @@ struct mdev_type_attribute {
 			 size_t count);
 };
 
-#define MDEV_TYPE_ATTR(_name, _mode, _show, _store)		\
-struct mdev_type_attribute mdev_type_attr_##_name =		\
-	__ATTR(_name, _mode, _show, _store)
-#define MDEV_TYPE_ATTR_RW(_name) \
-	struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RW(_name)
 #define MDEV_TYPE_ATTR_RO(_name) \
 	struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RO(_name)
 #define MDEV_TYPE_ATTR_WO(_name) \
@@ -73,12 +68,14 @@ struct mdev_type_attribute mdev_type_attr_##_name =		\
 
 /**
  * struct mdev_driver - Mediated device driver
+ * @device_api: string to return for the device_api sysfs
  * @probe: called when new device created
  * @remove: called when device removed
  * @types_attrs: attributes to the type kobjects.
  * @driver: device driver structure
  **/
 struct mdev_driver {
+	const char *device_api;
 	int (*probe)(struct mdev_device *dev);
 	void (*remove)(struct mdev_device *dev);
 	const struct attribute * const *types_attrs;
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 4d0839cb51943..a2fc13fade757 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1384,17 +1384,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static const struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1410,6 +1402,7 @@ static const struct vfio_device_ops mbochs_dev_ops = {
 };
 
 static struct mdev_driver mbochs_driver = {
+	.device_api = VFIO_DEVICE_API_PCI_STRING,
 	.driver = {
 		.name = "mbochs",
 		.owner = THIS_MODULE,
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 4a341f4849e73..f9069ed2750fa 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -689,17 +689,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static const struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -714,6 +706,7 @@ static const struct vfio_device_ops mdpy_dev_ops = {
 };
 
 static struct mdev_driver mdpy_driver = {
+	.device_api = VFIO_DEVICE_API_PCI_STRING,
 	.driver = {
 		.name = "mdpy",
 		.owner = THIS_MODULE,
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 814a7f98738a2..064e71b28dd19 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1277,17 +1277,8 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static const struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1302,6 +1293,7 @@ static const struct vfio_device_ops mtty_dev_ops = {
 };
 
 static struct mdev_driver mtty_driver = {
+	.device_api = VFIO_DEVICE_API_PCI_STRING,
 	.driver = {
 		.name = "mtty",
 		.owner = THIS_MODULE,
-- 
2.30.2

