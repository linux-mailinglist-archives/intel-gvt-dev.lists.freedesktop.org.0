Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345BF6EF745
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 17:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014C110EA15;
	Wed, 26 Apr 2023 15:04:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B270210EA0C;
 Wed, 26 Apr 2023 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682521442; x=1714057442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eVa/8+m4qoOsEu6nBJUPnyZZwCEFpFMmNTSX4ei3TF8=;
 b=k+o/8iE26kN/SedQSDL3MaiebWEUYTEidj+FlVeKp51OMg5n/MKXQRJh
 bjiQ+rPog5PBA+AvzHaqV6zRNI6OhQGfK7VaKroGNaodX+3cQeSBnGv6p
 g+gk7fQ6aoFOQOWamtuPLidLrnFBsTHwqVqk8e32+GMAefBIn051CEPRu
 zeXZQcZCYV+dup3n7pjIk8TV60PpdxqXE+aVXxpuqk+JjnnJfTIXuNJhK
 8IgzDpbvc9WaOvuE8iXoZdRXLWO81GcyNgmzKHhyP9WCYp062EVFQW/wg
 ek1J98jE0JVwtHuAxVfhP+EEzyn+ITCiZSiSYZ69nDQKB4FsTtlSV+iMg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="349944704"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="349944704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 08:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805544332"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="805544332"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 08:04:01 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v10 21/22] vfio: Compile group optionally
Date: Wed, 26 Apr 2023 08:03:20 -0700
Message-Id: <20230426150321.454465-22-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426150321.454465-1-yi.l.liu@intel.com>
References: <20230426150321.454465-1-yi.l.liu@intel.com>
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
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

group code is not needed for vfio device cdev, so with vfio device cdev
introduced, the group infrastructures can be compiled out if only cdev
is needed.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/Kconfig    |   4 +-
 drivers/vfio/Kconfig             |  14 +++++
 drivers/vfio/Makefile            |   2 +-
 drivers/vfio/pci/vfio_pci_core.c |  21 ++++++-
 drivers/vfio/vfio.h              | 102 +++++++++++++++++++++++++++++--
 include/linux/vfio.h             |  25 +++++++-
 6 files changed, 153 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/iommufd/Kconfig b/drivers/iommu/iommufd/Kconfig
index ada693ea51a7..99d4b075df49 100644
--- a/drivers/iommu/iommufd/Kconfig
+++ b/drivers/iommu/iommufd/Kconfig
@@ -14,8 +14,8 @@ config IOMMUFD
 if IOMMUFD
 config IOMMUFD_VFIO_CONTAINER
 	bool "IOMMUFD provides the VFIO container /dev/vfio/vfio"
-	depends on VFIO && !VFIO_CONTAINER
-	default VFIO && !VFIO_CONTAINER
+	depends on VFIO_GROUP && !VFIO_CONTAINER
+	default VFIO_GROUP && !VFIO_CONTAINER
 	help
 	  IOMMUFD will provide /dev/vfio/vfio instead of VFIO. This relies on
 	  IOMMUFD providing compatibility emulation to give the same ioctls.
diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index e2105b4dac2d..62c58830a8d5 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -4,6 +4,8 @@ menuconfig VFIO
 	select IOMMU_API
 	depends on IOMMUFD || !IOMMUFD
 	select INTERVAL_TREE
+	select VFIO_GROUP if SPAPR_TCE_IOMMU || IOMMUFD=n
+	select VFIO_DEVICE_CDEV if !VFIO_GROUP
 	select VFIO_CONTAINER if IOMMUFD=n
 	help
 	  VFIO provides a framework for secure userspace device drivers.
@@ -15,6 +17,7 @@ if VFIO
 config VFIO_DEVICE_CDEV
 	bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
 	depends on IOMMUFD
+	default !VFIO_GROUP
 	help
 	  The VFIO device cdev is another way for userspace to get device
 	  access. Userspace gets device fd by opening device cdev under
@@ -23,9 +26,20 @@ config VFIO_DEVICE_CDEV
 
 	  If you don't know what to do here, say N.
 
+config VFIO_GROUP
+	bool "Support for the VFIO group /dev/vfio/$group_id"
+	default y
+	help
+	   VFIO group support provides the traditional model for accessing
+	   devices through VFIO and is used by the majority of userspace
+	   applications and drivers making use of VFIO.
+
+	   If you don't know what to do here, say Y.
+
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
 	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	depends on VFIO_GROUP
 	default y
 	help
 	  The VFIO container is the classic interface to VFIO for establishing
diff --git a/drivers/vfio/Makefile b/drivers/vfio/Makefile
index 245394aeb94b..57c3515af606 100644
--- a/drivers/vfio/Makefile
+++ b/drivers/vfio/Makefile
@@ -2,9 +2,9 @@
 obj-$(CONFIG_VFIO) += vfio.o
 
 vfio-y += vfio_main.o \
-	  group.o \
 	  iova_bitmap.o
 vfio-$(CONFIG_VFIO_DEVICE_CDEV) += device_cdev.o
+vfio-$(CONFIG_VFIO_GROUP) += group.o
 vfio-$(CONFIG_IOMMUFD) += iommufd.o
 vfio-$(CONFIG_VFIO_CONTAINER) += container.o
 vfio-$(CONFIG_VFIO_VIRQFD) += virqfd.o
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index f70e3b948b16..c03eda173209 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -798,6 +798,9 @@ vfio_devset_iommufd_has_group(struct vfio_device_set *dev_set,
 
 	lockdep_assert_held(&dev_set->lock);
 
+	if (!iommu_group)
+		return false;
+
 	list_for_each_entry(cur, &dev_set->device_list, dev_set_list) {
 		grp = iommu_group_get(cur->dev);
 		if (!grp)
@@ -840,8 +843,19 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 		return -EAGAIN; /* Something changed, try again */
 
 	iommu_group = iommu_group_get(&pdev->dev);
-	if (!iommu_group)
-		return -EPERM; /* Cannot reset non-isolated devices */
+	/*
+	 * With CONFIG_VFIO_GROUP enabled, device should always have
+	 * iommu_group.
+	 */
+	if (IS_ENABLED(CONFIG_VFIO_GROUP) && !iommu_group)
+		return -EPERM;
+
+	/*
+	 * With CONFIG_VFIO_GROUP disabled, only cdev interface is
+	 * available.
+	 */
+	if (WARN_ON(unlikely(!IS_ENABLED(CONFIG_VFIO_GROUP) && !fill->devid)))
+		return -EINVAL;
 
 	if (fill->devid) {
 		struct vfio_device *vdev;
@@ -875,7 +889,8 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 	fill->devices[fill->cur].bus = pdev->bus->number;
 	fill->devices[fill->cur].devfn = pdev->devfn;
 	fill->cur++;
-	iommu_group_put(iommu_group);
+	if (iommu_group)
+		iommu_group_put(iommu_group);
 	return 0;
 }
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index c8579d63b2b9..fe35e1aa91a2 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -36,6 +36,12 @@ vfio_allocate_device_file(struct vfio_device *device);
 
 extern const struct file_operations vfio_device_fops;
 
+#ifdef CONFIG_VFIO_NOIOMMU
+extern bool vfio_noiommu __read_mostly;
+#else
+enum { vfio_noiommu = false };
+#endif
+
 enum vfio_group_type {
 	/*
 	 * Physical device with IOMMU backing.
@@ -60,6 +66,7 @@ enum vfio_group_type {
 	VFIO_NO_IOMMU,
 };
 
+#if IS_ENABLED(CONFIG_VFIO_GROUP)
 struct vfio_group {
 	struct device 			dev;
 	struct cdev			cdev;
@@ -112,6 +119,95 @@ static inline int vfio_device_set_noiommu(struct vfio_device *device)
 			  device->group->type == VFIO_NO_IOMMU;
 	return 0;
 }
+#else
+struct vfio_group;
+
+static inline int vfio_device_block_group(struct vfio_device *device)
+{
+	return 0;
+}
+
+static inline void vfio_device_unblock_group(struct vfio_device *device)
+{
+}
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
+
+static inline int vfio_device_set_noiommu(struct vfio_device *device)
+{
+	struct iommu_group *iommu_group;
+
+	device->noiommu = false;
+
+	iommu_group = iommu_group_get(device->dev);
+	if (!iommu_group) {
+		if (!IS_ENABLED(CONFIG_VFIO_NOIOMMU) || !vfio_noiommu)
+			return -EINVAL;
+		device->noiommu = vfio_noiommu;
+	} else {
+		iommu_group_put(iommu_group);
+	}
+
+	return 0;
+}
+#endif /* CONFIG_VFIO_GROUP */
 
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
 /**
@@ -357,12 +453,6 @@ static inline void vfio_virqfd_exit(void)
 }
 #endif
 
-#ifdef CONFIG_VFIO_NOIOMMU
-extern bool vfio_noiommu __read_mostly;
-#else
-enum { vfio_noiommu = false };
-#endif
-
 #ifdef CONFIG_HAVE_KVM
 void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
 void vfio_device_put_kvm(struct vfio_device *device);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 918a348bc5d5..851a5ef87cd0 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -43,7 +43,11 @@ struct vfio_device {
 	 */
 	const struct vfio_migration_ops *mig_ops;
 	const struct vfio_log_ops *log_ops;
+#if IS_ENABLED(CONFIG_VFIO_GROUP)
 	struct vfio_group *group;
+	struct list_head group_next;
+	struct list_head iommu_entry;
+#endif
 	struct vfio_device_set *dev_set;
 	struct list_head dev_set_list;
 	unsigned int migration_flags;
@@ -59,8 +63,6 @@ struct vfio_device {
 	refcount_t refcount;	/* user count on registered device*/
 	unsigned int open_count;
 	struct completion comp;
-	struct list_head group_next;
-	struct list_head iommu_entry;
 	struct iommufd_access *iommufd_access;
 	void (*put_kvm)(struct kvm *kvm);
 #if IS_ENABLED(CONFIG_IOMMUFD)
@@ -290,12 +292,29 @@ int vfio_mig_get_next_state(struct vfio_device *device,
 /*
  * External user API
  */
+#if IS_ENABLED(CONFIG_VFIO_GROUP)
 struct iommu_group *vfio_file_iommu_group(struct file *file);
 bool vfio_file_is_group(struct file *file);
+bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
+#else
+static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
+{
+	return NULL;
+}
+
+static inline bool vfio_file_is_group(struct file *file)
+{
+	return false;
+}
+
+static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
+{
+	return false;
+}
+#endif
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
-bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-- 
2.34.1

