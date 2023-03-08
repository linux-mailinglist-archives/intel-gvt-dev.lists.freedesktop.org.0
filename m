Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0386B08F5
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D528610E682;
	Wed,  8 Mar 2023 13:29:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A25D10E624;
 Wed,  8 Mar 2023 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282176; x=1709818176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuqafYByKK/jWkKRq463YXQFQwOvpfEb1z0GI9PVpxY=;
 b=Dh5NfmHFutfwxWeEwtLnvQ/95VB75apgQtO1vnWaoW7RyzVm7YbORkvp
 zh/mtOYWkh4ZSTM0fpEoZVEoU/iZx3x/HHwxdwXKfgyqaD+ZecsyVLPYQ
 BNrQSgwj9cbGZLWMr9lJIrDyzl6Po+5kdJkJ5gCvfjvDy4Xnc1Z01sQIv
 njpOJwm3aHnTuJa+GesVLpwAb7rAihZsmrVtUoHqRI48Mz/vFM6oSyITK
 Jok2BUA8/7C5ubh+CH9Bam2D89EuTbbLDew0RlcgqwawclbBXnvqxV2tT
 WK/3ydefx8P7fFfly1lA5QMFIEEhfWXSpstJoWa1qvmTxHQydIY3UVL7w w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165295"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165295"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789423"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789423"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:35 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 17/24] vfio-iommufd: Make vfio_iommufd_bind() selectively
 return devid
Date: Wed,  8 Mar 2023 05:28:56 -0800
Message-Id: <20230308132903.465159-18-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308132903.465159-1-yi.l.liu@intel.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
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
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 xudong.hao@intel.com, peterx@redhat.com, yan.y.zhao@intel.com,
 eric.auger@redhat.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

bind_iommufd() will generate an ID to represent this bond, it is needed
by userspace for further usage. devid is stored in vfio_device_file to
avoid passing devid pointer in multiple places.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c   | 13 ++++++++++---
 drivers/vfio/vfio.h      |  6 ++++--
 drivers/vfio/vfio_main.c |  8 +++++---
 include/linux/iommufd.h  |  2 ++
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 8c518f8bd39a..b2cdb6b2b37f 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -28,7 +28,8 @@ static int vfio_iommufd_device_probe_comapt_noiommu(struct vfio_device *vdev,
 	return 0;
 }
 
-int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
+int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx,
+		      u32 *devid)
 {
 	u32 device_id;
 	int ret;
@@ -44,8 +45,14 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 	if (WARN_ON(!vdev->ops->bind_iommufd))
 		return -ENODEV;
 
-	/* The legacy path has no way to return the device id */
-	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+	if (ret)
+		return ret;
+
+	if (devid)
+		*devid = device_id;
+
+	return 0;
 }
 
 int vfio_iommufd_attach_compat_ioas(struct vfio_device *vdev,
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 615ffd58562b..98cee2f765e9 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -24,6 +24,7 @@ struct vfio_device_file {
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
 	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
+	u32 devid; /* only valid when iommufd is valid */
 };
 
 void vfio_device_put_registration(struct vfio_device *device);
@@ -236,13 +237,14 @@ static inline void vfio_container_cleanup(void)
 #endif
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
-int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
+int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx,
+		      u32 *devid);
 void vfio_iommufd_unbind(struct vfio_device *device);
 int vfio_iommufd_attach_compat_ioas(struct vfio_device *vdev,
 				    struct iommufd_ctx *ictx);
 #else
 static inline int vfio_iommufd_bind(struct vfio_device *device,
-				    struct iommufd_ctx *ictx)
+				    struct iommufd_ctx *ictx, u32 *devid)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 8c73df1a400e..a66ca138059b 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -444,7 +444,7 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 	 * to be done here just go ahead to open device.
 	 */
 	if (iommufd)
-		ret = vfio_iommufd_bind(device, iommufd);
+		ret = vfio_iommufd_bind(device, iommufd, &df->devid);
 	else if (vfio_device_group_uses_container(df))
 		ret = vfio_device_group_use_iommu(device);
 	if (ret)
@@ -476,10 +476,12 @@ static void vfio_device_last_close(struct vfio_device_file *df)
 
 	if (device->ops->close_device)
 		device->ops->close_device(device);
-	if (iommufd)
+	if (iommufd) {
 		vfio_iommufd_unbind(device);
-	else if (vfio_device_group_uses_container(df))
+		df->devid = IOMMUFD_INVALID_ID;
+	} else if (vfio_device_group_uses_container(df)) {
 		vfio_device_group_unuse_iommu(device);
+	}
 	module_put(device->dev->driver->owner);
 }
 
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 7a0d7f2c4237..48b9bfab9891 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -10,6 +10,8 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 
+#define IOMMUFD_INVALID_ID 0
+
 struct device;
 struct iommufd_device;
 struct page;
-- 
2.34.1

