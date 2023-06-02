Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186307201B8
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C776210E69E;
	Fri,  2 Jun 2023 12:17:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586B210E6A1;
 Fri,  2 Jun 2023 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708244; x=1717244244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LeOKu9sKBvsX3/QW8tj+Bho1wk3YtDCVNdCvqStJ7Gk=;
 b=X2k9HJSAe4O17+K9ZoQvDS5RETqLct6bGfnVWaXoYBNfzLDnqrjRQv5Z
 lVUf2dodmAidzZhhCoDIih+qP0VAUPgAqBfE9mulEApFp+EEis13riVrV
 1BsKU5IoSzRAGsLrr+OjeMIAiG9qf9H9RwIta5HUZpEiY23nFW7qDp15B
 2rPX4KRf2KyLJnixsyb2lPug2ULIOy91AohR+3WGKIwjTQ/Ek9CwiVkMo
 2og8U3/P8OUKEesKfqkubThwQ+ABtxBfUgG9IgGN/FVH//bLeseK8F7Jd
 g2tU36Mb0kuLYFrz7ECmYtxRelXq4eFc5u1zCRy9Nt/Q07xVrQ32CR0N6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384136760"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="384136760"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037947437"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="1037947437"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2023 05:17:23 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v12 22/24] vfio: Remove vfio_device_is_noiommu()
Date: Fri,  2 Jun 2023 05:16:51 -0700
Message-Id: <20230602121653.80017-23-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602121653.80017-1-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
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

This converts noiommu test to use vfio_device->noiommu flag. Per this
change, vfio_device_is_noiommu() is removed.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c   | 2 +-
 drivers/vfio/iommufd.c | 4 ++--
 drivers/vfio/vfio.h    | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 64cdd0ea8825..08d37811507e 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -191,7 +191,7 @@ static int vfio_df_group_open(struct vfio_device_file *df)
 		vfio_device_group_get_kvm_safe(device);
 
 	df->iommufd = device->group->iommufd;
-	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
+	if (df->iommufd && device->noiommu && device->open_count == 0) {
 		/*
 		 * Require no compat ioas to be assigned to proceed.  The basic
 		 * statement is that the user cannot have done something that
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index a59ed4f881aa..fac8ca74ec85 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -37,7 +37,7 @@ int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	/* compat noiommu does not need to do ioas attach */
-	if (vfio_device_is_noiommu(vdev))
+	if (vdev->noiommu)
 		return 0;
 
 	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
@@ -54,7 +54,7 @@ void vfio_df_iommufd_unbind(struct vfio_device_file *df)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev))
+	if (vdev->noiommu)
 		return;
 
 	if (vdev->ops->unbind_iommufd)
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 1b89e8bc8571..b138b8334fe0 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -106,11 +106,6 @@ bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
 
-static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
-{
-	return vdev->group->type == VFIO_NO_IOMMU;
-}
-
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
 /**
  * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
@@ -271,7 +266,7 @@ void vfio_init_device_cdev(struct vfio_device *device);
 static inline int vfio_device_add(struct vfio_device *device)
 {
 	/* cdev does not support noiommu device */
-	if (vfio_device_is_noiommu(device))
+	if (device->noiommu)
 		return device_add(&device->device);
 	vfio_init_device_cdev(device);
 	return cdev_device_add(&device->cdev, &device->device);
@@ -279,7 +274,7 @@ static inline int vfio_device_add(struct vfio_device *device)
 
 static inline void vfio_device_del(struct vfio_device *device)
 {
-	if (vfio_device_is_noiommu(device))
+	if (device->noiommu)
 		device_del(&device->device);
 	else
 		cdev_device_del(&device->cdev, &device->device);
-- 
2.34.1

