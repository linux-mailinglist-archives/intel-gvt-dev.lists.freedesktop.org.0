Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDC6B08E9
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAA210E62F;
	Wed,  8 Mar 2023 13:29:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B82D10E5E2;
 Wed,  8 Mar 2023 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282169; x=1709818169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NxJ2YuHrmW/4nZRdgi+pj1OdZn9UVNaWl2X9mKXSHs=;
 b=YERnDN+piEZIdsAov5hcJXvjIznXMEXly4AX55EZHDoPc93s49VxrG6G
 P58c6sbVEolr4IkeMf+7FwlTS62E6oRPX41tqUL8BKDLgYNEWSkkhZZpO
 E0J6TXOMjMO9518hmExxQN1Vt4PK1yXSlG302SxX1cjKgs+bA1C+S/3j8
 tdqAb4EUa7v+NXRwSQA7kMSpo/GPGFwQoBZW3n5eZFc30F6YXfg0SzvRw
 ZSfRy0mW0wiP6NowR/+oLtE7/onTW8rkod3uhYLXrV8j014lys1PM61GY
 Jqr2e4ieSDQ2GeNDqjdKpAEkl4mdGnaSUY0MImTM0keNRFpuKPyOosp45 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165237"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165237"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789391"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789391"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:28 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 13/24] vfio/iommufd: Split the compat_ioas attach out from
 vfio_iommufd_bind()
Date: Wed,  8 Mar 2023 05:28:52 -0800
Message-Id: <20230308132903.465159-14-yi.l.liu@intel.com>
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

This makes the group code call .bind_iommufd and .attach_ioas in two steps
instead of in a single step. This prepares the bind_iommufd and attach_ioas
support in the coming cdev path.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c   | 26 ++++++++++-----
 drivers/vfio/iommufd.c | 75 ++++++++++++++++++++++++++----------------
 drivers/vfio/vfio.h    |  8 +++++
 3 files changed, 73 insertions(+), 36 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 6280368eb0bd..555d68aefa71 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -177,7 +177,7 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 	mutex_lock(&device->group->group_lock);
 	if (!vfio_group_has_iommu(device->group)) {
 		ret = -EINVAL;
-		goto out_unlock;
+		goto err_unlock;
 	}
 
 	mutex_lock(&device->dev_set->lock);
@@ -194,9 +194,14 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 	df->iommufd = device->group->iommufd;
 
 	ret = vfio_device_open(df);
-	if (ret) {
-		df->iommufd = NULL;
-		goto out_put_kvm;
+	if (ret)
+		goto err_put_kvm;
+
+	if (device->group->iommufd) {
+		ret = vfio_iommufd_attach_compat_ioas(device,
+						      device->group->iommufd);
+		if (ret)
+			goto err_close_device;
 	}
 
 	/*
@@ -205,13 +210,18 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 	 */
 	smp_store_release(&df->access_granted, true);
 
-out_put_kvm:
+	mutex_unlock(&device->dev_set->lock);
+	mutex_unlock(&device->group->group_lock);
+	return 0;
+
+err_close_device:
+	vfio_device_close(df);
+err_put_kvm:
+	df->iommufd = NULL;
 	if (device->open_count == 0)
 		vfio_device_put_kvm(device);
-
 	mutex_unlock(&device->dev_set->lock);
-
-out_unlock:
+err_unlock:
 	mutex_unlock(&device->group->group_lock);
 	return ret;
 }
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 30c0da2e11f9..8c518f8bd39a 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -10,52 +10,71 @@
 MODULE_IMPORT_NS(IOMMUFD);
 MODULE_IMPORT_NS(IOMMUFD_VFIO);
 
-int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
+static int vfio_iommufd_device_probe_comapt_noiommu(struct vfio_device *vdev,
+						    struct iommufd_ctx *ictx)
 {
 	u32 ioas_id;
+
+	if (!capable(CAP_SYS_RAWIO))
+		return -EPERM;
+
+	/*
+	 * Require no compat ioas to be assigned to proceed.  The basic
+	 * statement is that the user cannot have done something that
+	 * implies they expected translation to exist
+	 */
+	if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
+		return -EPERM;
+	return 0;
+}
+
+int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
+{
 	u32 device_id;
 	int ret;
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	if (vfio_device_is_noiommu(vdev)) {
-		if (!capable(CAP_SYS_RAWIO))
-			return -EPERM;
-
-		/*
-		 * Require no compat ioas to be assigned to proceed. The basic
-		 * statement is that the user cannot have done something that
-		 * implies they expected translation to exist
-		 */
-		if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
-			return -EPERM;
-		return 0;
+		ret = vfio_iommufd_device_probe_comapt_noiommu(vdev, ictx);
+		if (ret)
+			return ret;
 	}
 
 	if (WARN_ON(!vdev->ops->bind_iommufd))
 		return -ENODEV;
 
-	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
-	if (ret)
-		return ret;
+	/* The legacy path has no way to return the device id */
+	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+}
 
-	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
-	if (ret)
-		goto err_unbind;
-	ret = vdev->ops->attach_ioas(vdev, &ioas_id);
-	if (ret)
-		goto err_unbind;
+int vfio_iommufd_attach_compat_ioas(struct vfio_device *vdev,
+				    struct iommufd_ctx *ictx)
+{
+	u32 ioas_id;
+	int ret;
+
+	lockdep_assert_held(&vdev->dev_set->lock);
 
 	/*
-	 * The legacy path has no way to return the device id or the selected
-	 * pt_id
+	 * If the driver doesn't provide this op then it means the device does
+	 * not do DMA at all. So nothing to do.
 	 */
-	return 0;
+	if (WARN_ON(!vdev->ops->bind_iommufd))
+		return -ENODEV;
 
-err_unbind:
-	if (vdev->ops->unbind_iommufd)
-		vdev->ops->unbind_iommufd(vdev);
-	return ret;
+	if (vfio_device_is_noiommu(vdev)) {
+		if (WARN_ON(vfio_iommufd_device_probe_comapt_noiommu(vdev, ictx)))
+			return -EINVAL;
+		return 0;
+	}
+
+	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
+	if (ret)
+		return ret;
+
+	/* The legacy path has no way to return the selected pt_id */
+	return vdev->ops->attach_ioas(vdev, &ioas_id);
 }
 
 void vfio_iommufd_unbind(struct vfio_device *vdev)
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 464263288d16..3356321805e9 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -232,6 +232,8 @@ static inline void vfio_container_cleanup(void)
 #if IS_ENABLED(CONFIG_IOMMUFD)
 int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
 void vfio_iommufd_unbind(struct vfio_device *device);
+int vfio_iommufd_attach_compat_ioas(struct vfio_device *vdev,
+				    struct iommufd_ctx *ictx);
 #else
 static inline int vfio_iommufd_bind(struct vfio_device *device,
 				    struct iommufd_ctx *ictx)
@@ -242,6 +244,12 @@ static inline int vfio_iommufd_bind(struct vfio_device *device,
 static inline void vfio_iommufd_unbind(struct vfio_device *device)
 {
 }
+
+static inline int vfio_iommufd_attach_compat_ioas(struct vfio_device *vdev,
+						  struct iommufd_ctx *ictx)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_VFIO_VIRQFD)
-- 
2.34.1

