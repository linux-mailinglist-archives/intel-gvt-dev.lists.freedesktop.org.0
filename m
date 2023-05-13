Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753FE701730
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F9F10E0BF;
	Sat, 13 May 2023 13:28:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F2510E0C4;
 Sat, 13 May 2023 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984528; x=1715520528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FUWs4Mw3PjPMcX84sV7pRwLYHb9EPg8CqNbysfrjwFU=;
 b=iGUBrkUNhyD0y73opLNkI0Lq70DEVmYEbiSzkdMv8q8ExtyiN13IObhH
 tsHb+7ce0HGqOi8bpmLnnRorDMo2FvmD1QIVeNdNnsjnrvCT/xsQYxz1H
 f07W4SHh2QtR9/TJrP9jUrUT1fAKxxLd8LE9UytjMbN6p5KyxKY6y84Wm
 b0Kz1Byyod+EtFNVQNudVgm/KqQTTFFJ+gjOThByrg0vFiLkQuBVV5oZ3
 rM4lPy9dwGPSzdjAgbpR3LR/ZmJr9c53gXchdCEUfBUrFTeL6NFEdTHLw
 skuwevuvvijie5FE7/JoGAqknz/w3g+P4T0DPu6rz95UCgwSiXY9o2bIu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354100750"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="354100750"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703459499"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="703459499"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 06:28:46 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v11 12/23] vfio: Record devid in vfio_device_file
Date: Sat, 13 May 2023 06:28:16 -0700
Message-Id: <20230513132827.39066-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513132827.39066-1-yi.l.liu@intel.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
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
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

.bind_iommufd() will generate an ID to represent this bond, which is
needed by userspace for further usage. Store devid in vfio_device_file
to avoid passing the pointer in multiple places.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c   | 14 ++++++++------
 drivers/vfio/vfio.h      | 10 +++++-----
 drivers/vfio/vfio_main.c |  6 +++---
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index acc683a3620b..07b58c4625b5 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -64,17 +64,17 @@ int vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
 	return 0;
 }
 
-int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
+int vfio_iommufd_bind(struct vfio_device_file *df)
 {
-	u32 device_id;
+	struct vfio_device *vdev = df->device;
+	struct iommufd_ctx *ictx = df->iommufd;
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	if (vfio_device_is_noiommu(vdev))
-		return vfio_iommufd_noiommu_bind(vdev, ictx, &device_id);
+		return vfio_iommufd_noiommu_bind(vdev, ictx, &df->devid);
 
-	/* The legacy path has no way to return the device id */
-	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+	return vdev->ops->bind_iommufd(vdev, ictx, &df->devid);
 }
 
 int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
@@ -97,8 +97,10 @@ int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
 	return vdev->ops->attach_ioas(vdev, &ioas_id);
 }
 
-void vfio_iommufd_unbind(struct vfio_device *vdev)
+void vfio_iommufd_unbind(struct vfio_device_file *df)
 {
+	struct vfio_device *vdev = df->device;
+
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	if (vfio_device_is_noiommu(vdev)) {
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index c7431ca19d9e..429166fe0e33 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -24,6 +24,7 @@ struct vfio_device_file {
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
 	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
+	u32 devid; /* only valid when iommufd is valid */
 };
 
 void vfio_device_put_registration(struct vfio_device *device);
@@ -236,8 +237,8 @@ static inline void vfio_container_cleanup(void)
 #if IS_ENABLED(CONFIG_IOMMUFD)
 int vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
 				      struct iommufd_ctx *ictx);
-int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
-void vfio_iommufd_unbind(struct vfio_device *device);
+int vfio_iommufd_bind(struct vfio_device_file *df);
+void vfio_iommufd_unbind(struct vfio_device_file *df);
 int vfio_iommufd_compat_attach_ioas(struct vfio_device *device,
 				    struct iommufd_ctx *ictx);
 #else
@@ -248,13 +249,12 @@ vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
 	return -EOPNOTSUPP;
 }
 
-static inline int vfio_iommufd_bind(struct vfio_device *device,
-				    struct iommufd_ctx *ictx)
+static inline int vfio_iommufd_bind(struct vfio_device_file *fd)
 {
 	return -EOPNOTSUPP;
 }
 
-static inline void vfio_iommufd_unbind(struct vfio_device *device)
+static inline void vfio_iommufd_unbind(struct vfio_device_file *df)
 {
 }
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 513f9516aed2..39d552e5160b 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -446,7 +446,7 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 		return -ENODEV;
 
 	if (iommufd)
-		ret = vfio_iommufd_bind(device, iommufd);
+		ret = vfio_iommufd_bind(df);
 	else
 		ret = vfio_device_group_use_iommu(device);
 	if (ret)
@@ -461,7 +461,7 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 
 err_unuse_iommu:
 	if (iommufd)
-		vfio_iommufd_unbind(device);
+		vfio_iommufd_unbind(df);
 	else
 		vfio_device_group_unuse_iommu(device);
 err_module_put:
@@ -479,7 +479,7 @@ static void vfio_device_last_close(struct vfio_device_file *df)
 	if (device->ops->close_device)
 		device->ops->close_device(device);
 	if (iommufd)
-		vfio_iommufd_unbind(device);
+		vfio_iommufd_unbind(df);
 	else
 		vfio_device_group_unuse_iommu(device);
 	module_put(device->dev->driver->owner);
-- 
2.34.1

