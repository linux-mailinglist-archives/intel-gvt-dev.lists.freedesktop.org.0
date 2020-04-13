Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A741A62E0
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Apr 2020 08:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A5F6E18E;
	Mon, 13 Apr 2020 06:05:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86A76E18E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Apr 2020 06:05:18 +0000 (UTC)
IronPort-SDR: nKAciOGcA7tNrh0Lqh/0QohIzgzeWTPlP0qF0R/QZqBoft4Zq2ORCzIRc7U5efgz3Ir1hd49H1
 xf6Vw0DKFFEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2020 23:05:17 -0700
IronPort-SDR: roeKVt03RrchyMNuA8CrXSyOrbiZ5X+JKJ9kqReJE3JUUjKofhNcZ7rvaWNpS8f5VdpZlMviVm
 2Are1mH2PCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,377,1580803200"; d="scan'208";a="245065924"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga008.fm.intel.com with ESMTP; 12 Apr 2020 23:05:10 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5 4/4] drm/i915/gvt: export migration_version to mdev sysfs
 (under mdev device node)
Date: Mon, 13 Apr 2020 01:55:32 -0400
Message-Id: <20200413055532.27363-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200413055201.27053-1-yan.y.zhao@intel.com>
References: <20200413055201.27053-1-yan.y.zhao@intel.com>
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 libvir-list@redhat.com, Zhengxiao.zx@alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, corbet@lwn.net, yi.l.liu@intel.com, eskultet@redhat.com,
 ziye.yang@intel.com, mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com,
 Yan Zhao <yan.y.zhao@intel.com>, xin.zeng@intel.com, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, dinechin@redhat.com, alex.williamson@redhat.com,
 changpeng.liu@intel.com, berrange@redhat.com, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

mdev device par of migration_version attribute for Intel vGPU is rw.
It is located at
/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/migration_version,
or /sys/bus/mdev/devices/$mdev_UUID/migration_version

It's used to check migration compatibility for two vGPUs.
migration_version string is defined by vendor driver and opaque to
userspace.

For Intel vGPU of gen8 and gen9, the format of migration_version string
is:
  <vendor id>-<device id>-<vgpu type>-<software version>.

For future software versions, e.g. when vGPUs have aggregations, it may
also include aggregation count into migration_version string of a vGPU.

For future platforms, the format of migration_version string is to be
expanded to include more meta data to identify Intel vGPUs for live
migration compatibility check

For old platforms, and for GVT not supporting vGPU live migration
feature, -ENODEV is returned on read(2)/write(2) of migration_version
attribute.
For vGPUs running old GVT who do not expose migration_version
attribute, live migration is regarded as not supported for those vGPUs.

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Erik Skultety <eskultet@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: "Wang, Zhi A" <zhi.a.wang@intel.com>
c: Neo Jia <cjia@nvidia.com>
Cc: Kirti Wankhede <kwankhede@nvidia.com>

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h   |  2 ++
 drivers/gpu/drm/i915/gvt/kvmgt.c | 55 ++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index b26e42596565..664efc83f82e 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -205,6 +205,8 @@ struct intel_vgpu {
 	struct idr object_idr;
 
 	u32 scan_nonprivbb;
+
+	char *migration_version;
 };
 
 static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 2f2d4c40f966..4903599cb0ef 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -728,8 +728,13 @@ static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
 	kvmgt_vdev(vgpu)->mdev = mdev;
 	mdev_set_drvdata(mdev, vgpu);
 
+	vgpu->migration_version =
+		intel_gvt_get_vfio_migration_version(gvt, type->name);
+
 	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
 		     dev_name(mdev_dev(mdev)));
+
+
 	ret = 0;
 
 out:
@@ -744,6 +749,7 @@ static int intel_vgpu_remove(struct mdev_device *mdev)
 		return -EBUSY;
 
 	intel_gvt_ops->vgpu_destroy(vgpu);
+	kfree(vgpu->migration_version);
 	return 0;
 }
 
@@ -1964,8 +1970,57 @@ static const struct attribute_group intel_vgpu_group = {
 	.attrs = intel_vgpu_attrs,
 };
 
+static ssize_t migration_version_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct mdev_device *mdev = mdev_from_dev(dev);
+	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+
+	if (!vgpu->migration_version) {
+		gvt_vgpu_err("Migration not supported on this vgpu. Please search previous detailed log\n");
+		return -ENODEV;
+	}
+
+	return snprintf(buf, strlen(vgpu->migration_version) + 2,
+			"%s\n", vgpu->migration_version);
+
+}
+
+static ssize_t migration_version_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct mdev_device *mdev = mdev_from_dev(dev);
+	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct intel_gvt *gvt = vgpu->gvt;
+	int ret = 0;
+
+	if (!vgpu->migration_version) {
+		gvt_vgpu_err("Migration not supported on this vgpu. Please search previous detailed log\n");
+		return -ENODEV;
+	}
+
+	ret = intel_gvt_check_vfio_migration_version(gvt,
+			vgpu->migration_version, buf);
+	return (ret < 0 ? ret : count);
+}
+
+static DEVICE_ATTR_RW(migration_version);
+
+static struct attribute *intel_vgpu_migration_attrs[] = {
+	&dev_attr_migration_version.attr,
+	NULL,
+};
+/* this group has no name, so will be displayed
+ * immediately under sysfs node of the mdev device
+ */
+static const struct attribute_group intel_vgpu_group_empty_name = {
+	.attrs = intel_vgpu_migration_attrs,
+};
+
 static const struct attribute_group *intel_vgpu_groups[] = {
 	&intel_vgpu_group,
+	&intel_vgpu_group_empty_name,
 	NULL,
 };
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
