Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BE6EF739
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 17:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D204410EA08;
	Wed, 26 Apr 2023 15:03:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067DA10EA03;
 Wed, 26 Apr 2023 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682521430; x=1714057430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I1y3JP/wsE9bkUoFFWoc06itZ/dflYnGv/Lul+BQscA=;
 b=XfosTKt+S1/M4pTnz/wgWaOBVUVg+dgUg4vUECnaNhTBB28baF3uSTkB
 5ex8a/ZJaJswarIg/5fpZtsLM24ubpJ0PypbK+7hd0UFQ0JYxO/U/lM5p
 Xq8aRkejsLGQMCBANDU5N8AtcCXdqI5OR6du5Q9xrFNYzYEcgxS8j+XtL
 zKhlBmAaDmGmnPgWDCYGTdZIpXDRoWbexklDrUzH2Xrqz1esXnrwdgXx5
 Qqvp9uSBW577hM8/3USN2DhVsxZ85DNfA6HaIhQqI//TJ2QlMaj7+bmxd
 Xeo4UifcCREYUN9dkQI4tjnpoWtiA8cVjjjy2jQd2FRImdlKJve8S1oSt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="349944576"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="349944576"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 08:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805544145"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="805544145"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 08:03:48 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v10 12/22] vfio: Record devid in vfio_device_file
Date: Wed, 26 Apr 2023 08:03:11 -0700
Message-Id: <20230426150321.454465-13-yi.l.liu@intel.com>
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

.bind_iommufd() will generate an ID to represent this bond, which is
needed by userspace for further usage. Store devid in vfio_device_file
to avoid passing the pointer in multiple places.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c   | 14 ++++++++------
 drivers/vfio/vfio.h      | 10 +++++-----
 drivers/vfio/vfio_main.c |  6 +++---
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index cee81f5910d4..ce7ea27d049a 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -28,17 +28,17 @@ int vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
 	return 0;
 }
 
-int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
+int vfio_iommufd_bind(struct vfio_device_file *df)
 {
-	u32 device_id;
+	struct vfio_device *vdev = df->device;
+	struct iommufd_ctx *ictx = df->iommufd;
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	if (vdev->noiommu)
-		return vfio_iommufd_emulated_bind(vdev, ictx, &device_id);
+		return vfio_iommufd_emulated_bind(vdev, ictx, &df->devid);
 
-	/* The legacy path has no way to return the device id */
-	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+	return vdev->ops->bind_iommufd(vdev, ictx, &df->devid);
 }
 
 int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
@@ -61,8 +61,10 @@ int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
 	return vdev->ops->attach_ioas(vdev, &ioas_id);
 }
 
-void vfio_iommufd_unbind(struct vfio_device *vdev)
+void vfio_iommufd_unbind(struct vfio_device_file *df)
 {
+	struct vfio_device *vdev = df->device;
+
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	if (vdev->noiommu) {
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index b84fbcdd00aa..8f528612be07 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -24,6 +24,7 @@ struct vfio_device_file {
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
 	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
+	u32 devid; /* only valid when iommufd is valid */
 };
 
 void vfio_device_put_registration(struct vfio_device *device);
@@ -237,8 +238,8 @@ static inline void vfio_container_cleanup(void)
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
@@ -249,13 +250,12 @@ vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
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
index 13afcfac678e..d3e8f480be2c 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -435,7 +435,7 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 		return -ENODEV;
 
 	if (iommufd)
-		ret = vfio_iommufd_bind(device, iommufd);
+		ret = vfio_iommufd_bind(df);
 	else
 		ret = vfio_device_group_use_iommu(device);
 	if (ret)
@@ -450,7 +450,7 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 
 err_unuse_iommu:
 	if (iommufd)
-		vfio_iommufd_unbind(device);
+		vfio_iommufd_unbind(df);
 	else
 		vfio_device_group_unuse_iommu(device);
 err_module_put:
@@ -468,7 +468,7 @@ static void vfio_device_last_close(struct vfio_device_file *df)
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

