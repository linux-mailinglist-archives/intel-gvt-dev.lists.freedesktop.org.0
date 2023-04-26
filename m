Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CEE6EF6DE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 16:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3007F10E9DA;
	Wed, 26 Apr 2023 14:54:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7814B10E7A3;
 Wed, 26 Apr 2023 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682520877; x=1714056877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/ChmFWvOJoBSp4nMBstR02MUyL97oP5XH+845iXrIM=;
 b=girdFCGsbsJy4MBF94sOOmvNX6fuY59LNVj5fONkA0M8aE/HK2rP80i7
 mYkHfNWS+BxWa1El4JNvGV1mlit5Rwjhyt7RX+wlCT6ih/LwZLPrc539o
 ApIA8l3IxmcZtIAKa3jyneNwnJ/fnB6MMqPJP81S0bZxgNUKzd82nfWcG
 hUEjedDIm7PDNEJf6jBZ0IHgnpeQdrAWIucQ/Rz26BMDLdmc6JHVv/bA4
 Owftf4eivsThe63l8tBrInHiU9cqeBcQcPvSimiGc0fk8DuKNQOGtGj39
 arpR6kFeidwQFSmtPInh4K8F+j8deRye6CpHKzXwMRvt4/7Jd3EAsX00n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433410347"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="433410347"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 07:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758644051"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="758644051"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 07:54:36 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 7/9] vfio-iommufd: Add helper to retrieve iommufd_ctx and
 devid for vfio_device
Date: Wed, 26 Apr 2023 07:54:17 -0700
Message-Id: <20230426145419.450922-8-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145419.450922-1-yi.l.liu@intel.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
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

This is needed by the vfio-pci driver to report affected devices in the
hot reset for a given device.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c | 24 ++++++++++++++++++++++++
 drivers/vfio/iommufd.c         | 24 ++++++++++++++++++++++++
 include/linux/iommufd.h        |  6 ++++++
 include/linux/vfio.h           | 14 ++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 4b565a5b51da..40b52f1a071d 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -131,6 +131,18 @@ void iommufd_device_unbind(struct iommufd_device *idev)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_device_unbind, IOMMUFD);
 
+struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev)
+{
+	return idev->ictx;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_device_to_ictx, IOMMUFD);
+
+u32 iommufd_device_to_id(struct iommufd_device *idev)
+{
+	return idev->obj.id;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, IOMMUFD);
+
 static int iommufd_device_setup_msi(struct iommufd_device *idev,
 				    struct iommufd_hw_pagetable *hwpt,
 				    phys_addr_t sw_msi_start)
@@ -480,6 +492,18 @@ void iommufd_access_destroy(struct iommufd_access *access)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
 
+struct iommufd_ctx *iommufd_access_to_ictx(struct iommufd_access *access)
+{
+	return access->ictx;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_access_to_ictx, IOMMUFD);
+
+u32 iommufd_access_to_id(struct iommufd_access *access)
+{
+	return access->obj.id;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_access_to_id, IOMMUFD);
+
 int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
 {
 	struct iommufd_ioas *new_ioas;
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index ca29c4feded3..54ac7be49b80 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -69,6 +69,30 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
 		vdev->ops->unbind_iommufd(vdev);
 }
 
+struct iommufd_ctx *vfio_iommufd_physical_ictx(struct vfio_device *vdev)
+{
+	if (vdev->iommufd_device)
+		return iommufd_device_to_ictx(vdev->iommufd_device);
+	if (vdev->iommufd_access)
+		return iommufd_access_to_ictx(vdev->iommufd_access);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_physical_ictx);
+
+/*
+ * Return devid for devices that have been bound with iommufd,
+ * returns 0 if not bound yet.
+ */
+u32 vfio_iommufd_physical_devid(struct vfio_device *vdev)
+{
+	if (WARN_ON(!vdev->iommufd_device && !vdev->iommufd_access))
+		return 0;
+	if (vdev->iommufd_device)
+		return iommufd_device_to_id(vdev->iommufd_device);
+	else
+		return iommufd_access_to_id(vdev->iommufd_access);
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_physical_devid);
 /*
  * The physical standard ops mean that the iommufd_device is bound to the
  * physical device vdev->dev that was provided to vfio_init_group_dev(). Drivers
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 1129a36a74c4..68cd65274e28 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -24,6 +24,9 @@ void iommufd_device_unbind(struct iommufd_device *idev);
 int iommufd_device_attach(struct iommufd_device *idev, u32 *pt_id);
 void iommufd_device_detach(struct iommufd_device *idev);
 
+struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev);
+u32 iommufd_device_to_id(struct iommufd_device *idev);
+
 struct iommufd_access_ops {
 	u8 needs_pin_pages : 1;
 	void (*unmap)(void *data, unsigned long iova, unsigned long length);
@@ -45,6 +48,9 @@ iommufd_access_create(struct iommufd_ctx *ictx,
 void iommufd_access_destroy(struct iommufd_access *access);
 int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id);
 
+struct iommufd_ctx *iommufd_access_to_ictx(struct iommufd_access *access);
+u32 iommufd_access_to_id(struct iommufd_access *access);
+
 void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 298f4ef16be7..cead7aebd527 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -116,6 +116,8 @@ struct vfio_device_ops {
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
+struct iommufd_ctx *vfio_iommufd_physical_ictx(struct vfio_device *vdev);
+u32 vfio_iommufd_physical_devid(struct vfio_device *vdev);
 int vfio_iommufd_physical_bind(struct vfio_device *vdev,
 			       struct iommufd_ctx *ictx, u32 *out_device_id);
 void vfio_iommufd_physical_unbind(struct vfio_device *vdev);
@@ -125,6 +127,18 @@ int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
 void vfio_iommufd_emulated_unbind(struct vfio_device *vdev);
 int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
 #else
+static inline struct iommufd_ctx *
+vfio_iommufd_physical_ictx(struct vfio_device *vdev)
+{
+	return NULL;
+}
+
+static inline u32
+vfio_iommufd_physical_devid(struct vfio_device *vdev)
+{
+	return 0;
+}
+
 #define vfio_iommufd_physical_bind                                      \
 	((int (*)(struct vfio_device *vdev, struct iommufd_ctx *ictx,   \
 		  u32 *out_device_id)) NULL)
-- 
2.34.1

