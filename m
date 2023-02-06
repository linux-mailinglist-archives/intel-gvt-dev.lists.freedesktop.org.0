Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E6A68B81D
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Feb 2023 10:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C563610E351;
	Mon,  6 Feb 2023 09:06:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EB110E34E;
 Mon,  6 Feb 2023 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675674369; x=1707210369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kfq1KWsqadwVkhGpvsyOo0sMmifI+THGHlmz6hNva9U=;
 b=OoExqJubugfXmVw+LUjuEWAewL8uMzsTaTfO6O5s3C87Hd2nN4SGCVh6
 QPmQFxNoS+E/G9hj/QMUE8vnsJJ/nzT01uPEQjUyWWENdGL4R6q1frXHN
 vZsMg5MMdNcxIgtWtZt8r5lJcoEFcdTJ9peRMxUePuY9zq1lBo+IrmzkL
 JqKvDeca5szknSVPxQtYy0r8Zb8mdjyYOChm3lblGYpVLCEDE+nf22ffG
 Nu8z9F9fo/erD3KqrIV+7RtVXf1f+NT3AesMcEc4VZRKh/2uM+agMdLFY
 NTUQcvl6BP02EyoDsZPHD38Ik5X5nngJB3pncA+g+FGFediQ+JRbxTqNN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309495947"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="309495947"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911862885"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="911862885"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 01:06:08 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 14/14] vfio: Compile group optionally
Date: Mon,  6 Feb 2023 01:05:32 -0800
Message-Id: <20230206090532.95598-15-yi.l.liu@intel.com>
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
 chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

group code is not needed for vfio device cdev, so with vfio device cdev
introduced, the group infrastructures can be compiled out if only cdev
is needed.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/Kconfig  | 18 +++++++++++
 drivers/vfio/Makefile |  2 +-
 drivers/vfio/vfio.h   | 69 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/vfio.h  | 11 +++++++
 4 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index 0476abf154f2..de0fedcdf4d6 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -15,6 +15,7 @@ if VFIO
 config VFIO_DEVICE_CDEV
 	bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
 	depends on IOMMUFD
+	default !VFIO_GROUP
 	help
 	  The VFIO device cdev is another way for userspace to get device
 	  access. Userspace gets device fd by opening device cdev under
@@ -23,9 +24,26 @@ config VFIO_DEVICE_CDEV
 
 	  If you don't know what to do here, say N.
 
+config VFIO_ENABLE_GROUP
+	bool
+	default !VFIO_DEVICE_CDEV
+
+config VFIO_GROUP
+	bool "Support for the VFIO group /dev/vfio/$group_id"
+	select VFIO_ENABLE_GROUP
+	default y
+	help
+	   VFIO group is legacy interface for userspace. For userspaces
+	   adapted to iommufd and vfio device cdev, this can be N. For
+	   now, before iommufd is ready and userspace applications fully
+	   converted to iommufd and vfio device cdev, this should be Y.
+
+	   If you don't know what to do here, say Y.
+
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
 	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	depends on VFIO_ENABLE_GROUP
 	default y
 	help
 	  The VFIO container is the classic interface to VFIO for establishing
diff --git a/drivers/vfio/Makefile b/drivers/vfio/Makefile
index 245394aeb94b..4e81c3bbed30 100644
--- a/drivers/vfio/Makefile
+++ b/drivers/vfio/Makefile
@@ -2,9 +2,9 @@
 obj-$(CONFIG_VFIO) += vfio.o
 
 vfio-y += vfio_main.o \
-	  group.o \
 	  iova_bitmap.o
 vfio-$(CONFIG_VFIO_DEVICE_CDEV) += device_cdev.o
+vfio-$(CONFIG_VFIO_ENABLE_GROUP) += group.o
 vfio-$(CONFIG_IOMMUFD) += iommufd.o
 vfio-$(CONFIG_VFIO_CONTAINER) += container.o
 vfio-$(CONFIG_VFIO_VIRQFD) += virqfd.o
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 8a290c1455e1..9f823cfff7be 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -62,6 +62,7 @@ enum vfio_group_type {
 	VFIO_NO_IOMMU,
 };
 
+#if IS_ENABLED(CONFIG_VFIO_ENABLE_GROUP)
 struct vfio_group {
 	struct device 			dev;
 	struct cdev			cdev;
@@ -105,6 +106,74 @@ bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device);
 bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
+#else
+struct vfio_group;
+
+static inline int vfio_device_set_group(struct vfio_device *device,
+					enum vfio_group_type type)
+{
+	return 0;
+}
+
+static inline void vfio_device_remove_group(struct vfio_device *device)
+{
+}
+
+static inline void vfio_device_group_register(struct vfio_device *device)
+{
+}
+
+static inline void vfio_device_group_unregister(struct vfio_device *device)
+{
+}
+
+static inline int vfio_device_group_use_iommu(struct vfio_device *device)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void vfio_device_group_unuse_iommu(struct vfio_device *device)
+{
+}
+
+static inline void vfio_device_group_close(struct vfio_device_file *df)
+{
+}
+
+static inline struct vfio_group *vfio_group_from_file(struct file *file)
+{
+	return NULL;
+}
+
+static inline bool vfio_group_enforced_coherent(struct vfio_group *group)
+{
+	return true;
+}
+
+static inline void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
+{
+}
+
+static inline bool vfio_group_has_dev(struct vfio_group *group,
+				      struct vfio_device *device)
+{
+	return false;
+}
+
+static inline bool vfio_device_has_container(struct vfio_device *device)
+{
+	return false;
+}
+
+static inline int __init vfio_group_init(void)
+{
+	return 0;
+}
+
+static inline void vfio_group_cleanup(void)
+{
+}
+#endif /* CONFIG_VFIO_ENABLE_GROUP */
 
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
 /* events for the backend driver notify callback */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index fd4bf9c21ffe..4c7666f8c5da 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -43,7 +43,9 @@ struct vfio_device {
 	 */
 	const struct vfio_migration_ops *mig_ops;
 	const struct vfio_log_ops *log_ops;
+#if IS_ENABLED(CONFIG_VFIO_ENABLE_GROUP)
 	struct vfio_group *group;
+#endif
 	struct vfio_device_set *dev_set;
 	struct list_head dev_set_list;
 	unsigned int migration_flags;
@@ -56,8 +58,10 @@ struct vfio_device {
 	refcount_t refcount;	/* user count on registered device*/
 	unsigned int open_count;
 	struct completion comp;
+#if IS_ENABLED(CONFIG_VFIO_ENABLE_GROUP)
 	struct list_head group_next;
 	struct list_head iommu_entry;
+#endif
 	struct iommufd_access *iommufd_access;
 	void (*put_kvm)(struct kvm *kvm);
 #if IS_ENABLED(CONFIG_IOMMUFD)
@@ -255,7 +259,14 @@ int vfio_mig_get_next_state(struct vfio_device *device,
 /*
  * External user API
  */
+#if IS_ENABLED(CONFIG_VFIO_ENABLE_GROUP)
 struct iommu_group *vfio_file_iommu_group(struct file *file);
+#else
+static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
+{
+	return NULL;
+}
+#endif
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
-- 
2.34.1

