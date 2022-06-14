Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D954A875
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jun 2022 06:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A6B10F861;
	Tue, 14 Jun 2022 04:55:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8F210F861
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jun 2022 04:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LNY5oxy8o9gg/fzryvGUmlH0ofkm+8CBQ+aFJfGdo1M=; b=YS9G+Fy4ly7+RZRW4EVKTRDSKw
 VohezoLiASZpKgqxPl4L89uPKtxbonbHMABuIwxsPqH7iGkaZSZFOCDvzgFI7J7JIMf5aqsPPR2bE
 hBO9jhftAFl5UZ5+0fBgd3my+nfiqDLSqUjEmPhZ+qpoe/zwcT9kcWY5y3T9DptWmFmrdeTcZkx+Y
 nXwfcFA3UGDwQaui39armjORbZa7qNdLlqpNXEjFaKbMLZTgTtM5XPRz95U04S7VUNoflYD3VIcSh
 Frg7ygcYVg08nbZ8OQP0h3tK1oQEiC8xaL3iCNNDlL5740cvGmrMi9JuV8HZNxX1ycDGsfAvVeupq
 qcRKsX/A==;
Received: from [2001:4bb8:180:36f6:1fed:6d48:cf16:d13c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o0yZt-0072j6-6B; Tue, 14 Jun 2022 04:54:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 10/13] vfio/mdev: consolidate all the name sysfs into the core
 code
Date: Tue, 14 Jun 2022 06:54:25 +0200
Message-Id: <20220614045428.278494-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614045428.278494-1-hch@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
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

Every driver just emits a static string, simply add a field to the
mdev_type for the driver to fill out or fall back to the sysfs name and
provide a standard sysfs show function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../driver-api/vfio-mediated-device.rst       |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  8 -------
 drivers/s390/cio/vfio_ccw_ops.c               |  9 +-------
 drivers/s390/crypto/vfio_ap_ops.c             |  9 --------
 drivers/vfio/mdev/mdev_sysfs.c                | 11 ++++++++++
 include/linux/mdev.h                          |  1 +
 samples/vfio-mdev/mbochs.c                    | 20 ++++--------------
 samples/vfio-mdev/mdpy.c                      | 21 +++++--------------
 samples/vfio-mdev/mtty.c                      | 18 ++++------------
 9 files changed, 27 insertions(+), 72 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index e9913bfb4393b..87d207744db79 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -219,7 +219,7 @@ Directories and files under the sysfs for Each Physical Device
 
 * name
 
-  This attribute should show human readable name. This is optional attribute.
+  This attribute shows a human readable name.
 
 * description
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 44a418d897377..191e64ef70acf 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -138,20 +138,12 @@ static ssize_t description_show(struct mdev_type *mtype,
 		       type->weight);
 }
 
-static ssize_t name_show(struct mdev_type *mtype,
-			 struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", mtype->sysfs_name);
-}
-
 static MDEV_TYPE_ATTR_RO(available_instances);
 static MDEV_TYPE_ATTR_RO(description);
-static MDEV_TYPE_ATTR_RO(name);
 
 static const struct attribute *gvt_type_attrs[] = {
 	&mdev_type_attr_available_instances.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_name.attr,
 	NULL,
 };
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 730d87a96a305..35389f4b67dc5 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -70,13 +70,6 @@ static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static ssize_t name_show(struct mdev_type *mtype,
-			 struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "I/O subchannel (Non-QDIO)\n");
-}
-static MDEV_TYPE_ATTR_RO(name);
-
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -88,7 +81,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 static MDEV_TYPE_ATTR_RO(available_instances);
 
 static const struct attribute *mdev_types_attrs[] = {
-	&mdev_type_attr_name.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -642,6 +634,7 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 int vfio_ccw_mdev_reg(struct subchannel *sch)
 {
 	strcat(sch->mdev_type.sysfs_name, "io");
+	strcat(sch->mdev_type.pretty_name, "I/O subchannel (Non-QDIO)");
 	sch->mdev_types[0] = &sch->mdev_type;
 	return mdev_register_parent(&sch->parent, &sch->dev,
 				    &vfio_ccw_mdev_driver, sch->mdev_types,
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index da21fd60877fb..d6b2e819a615e 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -511,14 +511,6 @@ static void vfio_ap_mdev_remove(struct mdev_device *mdev)
 	atomic_inc(&matrix_dev->available_instances);
 }
 
-static ssize_t name_show(struct mdev_type *mtype,
-			 struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_AP_MDEV_NAME_HWVIRT);
-}
-
-static MDEV_TYPE_ATTR_RO(name);
-
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -530,7 +522,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 static MDEV_TYPE_ATTR_RO(available_instances);
 
 static const struct attribute *vfio_ap_mdev_type_attrs[] = {
-	&mdev_type_attr_name.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index 20763f1aa9f5a..8384e2992c706 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -81,9 +81,20 @@ static ssize_t device_api_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(device_api);
 
+static ssize_t name_show(struct mdev_type *mtype,
+			 struct mdev_type_attribute *attr, char *buf)
+{
+	if (!mtype->pretty_name[0])
+		return sprintf(buf, "%s\n", mtype->sysfs_name);
+	return sprintf(buf, "%s\n", mtype->pretty_name);
+}
+
+static MDEV_TYPE_ATTR_RO(name);
+
 static struct attribute *mdev_types_core_attrs[] = {
 	&mdev_type_attr_create.attr,
 	&mdev_type_attr_device_api.attr,
+	&mdev_type_attr_name.attr,
 	NULL,
 };
 
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 81e11e18b3e41..64ca2ba806ed3 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -26,6 +26,7 @@ struct mdev_device {
 struct mdev_type {
 	/* set by the driver before calling mdev_register parent: */
 	char sysfs_name[32];
+	char pretty_name[32]; /* optional */
 
 	/* set by the core, can be used drivers */
 	struct mdev_parent *parent;
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 199846f01de92..c8271168a96ad 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -101,26 +101,25 @@ MODULE_PARM_DESC(mem, "megabytes available to " MBOCHS_NAME " devices");
 
 static struct mbochs_type {
 	struct mdev_type type;
-	const char *name;
 	u32 mbytes;
 	u32 max_x;
 	u32 max_y;
 } mbochs_types[] = {
 	{
 		.type.sysfs_name	= MBOCHS_TYPE_1,
-		.name	= MBOCHS_CLASS_NAME "-" MBOCHS_TYPE_1,
+		.type.pretty_name	= MBOCHS_CLASS_NAME "-" MBOCHS_TYPE_1,
 		.mbytes = 4,
 		.max_x  = 800,
 		.max_y  = 600,
 	}, {
 		.type.sysfs_name	= MBOCHS_TYPE_2,
-		.name	= MBOCHS_CLASS_NAME "-" MBOCHS_TYPE_2,
+		.type.pretty_name	= MBOCHS_CLASS_NAME "-" MBOCHS_TYPE_2,
 		.mbytes = 16,
 		.max_x  = 1920,
 		.max_y  = 1440,
 	}, {
 		.type.sysfs_name	= MBOCHS_TYPE_3,
-		.name	= MBOCHS_CLASS_NAME "-" MBOCHS_TYPE_3,
+		.type.pretty_name	= MBOCHS_CLASS_NAME "-" MBOCHS_TYPE_3,
 		.mbytes = 64,
 		.max_x  = 0,
 		.max_y  = 0,
@@ -547,7 +546,7 @@ static int mbochs_probe(struct mdev_device *mdev)
 		goto err_mem;
 
 	dev_info(dev, "%s: %s, %d MB, %ld pages\n", __func__,
-		 type->name, type->mbytes, mdev_state->pagecount);
+		 type->type.pretty_name, type->mbytes, mdev_state->pagecount);
 
 	mutex_init(&mdev_state->ops_lock);
 	mdev_state->mdev = mdev;
@@ -1334,16 +1333,6 @@ static const struct attribute_group *mdev_dev_groups[] = {
 	NULL,
 };
 
-static ssize_t name_show(struct mdev_type *mtype,
-			 struct mdev_type_attribute *attr, char *buf)
-{
-	struct mbochs_type *type =
-		container_of(mtype, struct mbochs_type, type);
-
-	return sprintf(buf, "%s\n", type->name);
-}
-static MDEV_TYPE_ATTR_RO(name);
-
 static ssize_t description_show(struct mdev_type *mtype,
 				struct mdev_type_attribute *attr, char *buf)
 {
@@ -1368,7 +1357,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 static MDEV_TYPE_ATTR_RO(available_instances);
 
 static const struct attribute *mdev_types_attrs[] = {
-	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 401a9a622673c..1b2117772192f 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -53,7 +53,6 @@ MODULE_PARM_DESC(count, "number of " MDPY_NAME " devices");
 
 static struct mdpy_type {
 	struct mdev_type type;
-	const char *name;
 	u32 format;
 	u32 bytepp;
 	u32 width;
@@ -61,21 +60,21 @@ static struct mdpy_type {
 } mdpy_types[] = {
 	{
 		.type.sysfs_name 	= MDPY_TYPE_1,
-		.name	= MDPY_CLASS_NAME "-" MDPY_TYPE_1,
+		.type.pretty_name	= MDPY_CLASS_NAME "-" MDPY_TYPE_1,
 		.format = DRM_FORMAT_XRGB8888,
 		.bytepp = 4,
 		.width	= 640,
 		.height = 480,
 	}, {
 		.type.sysfs_name 	= MDPY_TYPE_2,
-		.name	= MDPY_CLASS_NAME "-" MDPY_TYPE_2,
+		.type.pretty_name	= MDPY_CLASS_NAME "-" MDPY_TYPE_2,
 		.format = DRM_FORMAT_XRGB8888,
 		.bytepp = 4,
 		.width	= 1024,
 		.height = 768,
 	}, {
 		.type.sysfs_name 	= MDPY_TYPE_3,
-		.name	= MDPY_CLASS_NAME "-" MDPY_TYPE_3,
+		.type.pretty_name	= MDPY_CLASS_NAME "-" MDPY_TYPE_3,
 		.format = DRM_FORMAT_XRGB8888,
 		.bytepp = 4,
 		.width	= 1920,
@@ -256,8 +255,8 @@ static int mdpy_probe(struct mdev_device *mdev)
 		ret = -ENOMEM;
 		goto err_vconfig;
 	}
-	dev_info(dev, "%s: %s (%dx%d)\n", __func__, type->name, type->width,
-		 type->height);
+	dev_info(dev, "%s: %s (%dx%d)\n", __func__, type->type.pretty_name,
+		 type->width, type->height);
 
 	mutex_init(&mdev_state->ops_lock);
 	mdev_state->mdev = mdev;
@@ -651,15 +650,6 @@ static const struct attribute_group *mdev_dev_groups[] = {
 	NULL,
 };
 
-static ssize_t name_show(struct mdev_type *mtype,
-			 struct mdev_type_attribute *attr, char *buf)
-{
-	struct mdpy_type *type = container_of(mtype, struct mdpy_type, type);
-
-	return sprintf(buf, "%s\n", type->name);
-}
-static MDEV_TYPE_ATTR_RO(name);
-
 static ssize_t description_show(struct mdev_type *mtype,
 				struct mdev_type_attribute *attr, char *buf)
 {
@@ -679,7 +669,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 static MDEV_TYPE_ATTR_RO(available_instances);
 
 static const struct attribute *mdev_types_attrs[] = {
-	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 2a470424628af..b95a4491265c5 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -146,10 +146,11 @@ struct mdev_state {
 static struct mtty_type {
 	struct mdev_type type;
 	int nr_ports;
-	const char *name;
 } mtty_types[2] = {
-	{ .nr_ports = 1, .type.sysfs_name = "1", .name = "Single port serial" },
-	{ .nr_ports = 2, .type.sysfs_name = "2", .name = "Dual port serial" },
+	{ .nr_ports = 1, .type.sysfs_name = "1",
+	  .type.pretty_name = "Single port serial" },
+	{ .nr_ports = 2, .type.sysfs_name = "2",
+	  .type.pretty_name = "Dual port serial" },
 };
 
 static struct mdev_type *mtty_mdev_types[] = {
@@ -1246,16 +1247,6 @@ static const struct attribute_group *mdev_dev_groups[] = {
 	NULL,
 };
 
-static ssize_t name_show(struct mdev_type *mtype,
-			 struct mdev_type_attribute *attr, char *buf)
-{
-	struct mtty_type *type = container_of(mtype, struct mtty_type, type);
-
-	return sysfs_emit(buf, "%s\n", type->name);
-}
-
-static MDEV_TYPE_ATTR_RO(name);
-
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -1269,7 +1260,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 static MDEV_TYPE_ATTR_RO(available_instances);
 
 static const struct attribute *mdev_types_attrs[] = {
-	&mdev_type_attr_name.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
-- 
2.30.2

