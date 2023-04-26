Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB36EF6C4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 16:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE75210E39F;
	Wed, 26 Apr 2023 14:54:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7510E39F;
 Wed, 26 Apr 2023 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682520866; x=1714056866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ei+ldlGBA0woJE13bWLVPf1qW3075XzsC5F91f4P4Ag=;
 b=FSY4ouGrW6qyIfEZgQaIB/Dyn+ASlIGiVbrQ2YIey+VJYjN0mGLRqjoZ
 1qeOE11wVRxTcfWxm8rHsngjP4JXfEOk49sk/YCEOsk+vEDVG2WQx7sDi
 VJTRiffJAWiSaA9Jxbp1VmdnhX5zQ/gXLSuZ5BmhtvDMk1vURu4oJTems
 FRZcGWkVSCTCvIwVKTKXUf4tUiqPrP4VJ3nwmjEEEldrn+IyHq7Wz4ibG
 owjT9F2iePrinEGSrzUZ4keG5mn1ajZ+sG0ZkqAAi51hpPKwn//nBWRLo
 hb12ze0LJjquBqDUez+AjjuT171R9QKxJ7XEMJu/1xFBEHOFNQA66KT6W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433410234"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="433410234"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 07:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758643988"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="758643988"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 07:54:24 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 1/9] vfio: Determine noiommu in vfio_device registration
Date: Wed, 26 Apr 2023 07:54:11 -0700
Message-Id: <20230426145419.450922-2-yi.l.liu@intel.com>
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

This adds a noiommu flag in vfio_device, hence caller of the
vfio_device_is_noiommu() just refers to the flag for noiommu
check.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c   | 4 ++--
 drivers/vfio/vfio.h      | 7 ++++---
 drivers/vfio/vfio_main.c | 4 ++++
 include/linux/vfio.h     | 1 +
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 88b00c501015..895852ad37ed 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -18,7 +18,7 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev)) {
+	if (vdev->noiommu) {
 		if (!capable(CAP_SYS_RAWIO))
 			return -EPERM;
 
@@ -59,7 +59,7 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev))
+	if (vdev->noiommu)
 		return;
 
 	if (vdev->ops->unbind_iommufd)
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 7b19c621e0e6..1ddf43863ad6 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -88,10 +88,11 @@ bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
 
-static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
+static inline int vfio_device_set_noiommu(struct vfio_device *device)
 {
-	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
-	       vdev->group->type == VFIO_NO_IOMMU;
+	device->noiommu = IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
+			  device->group->type == VFIO_NO_IOMMU;
+	return 0;
 }
 
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 89497c933490..09be9df2ceca 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -276,6 +276,10 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		return ret;
 
+	ret = vfio_device_set_noiommu(device);
+	if (ret)
+		goto err_out;
+
 	ret = device_add(&device->device);
 	if (ret)
 		goto err_out;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 2c137ea94a3e..4ee613924435 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -62,6 +62,7 @@ struct vfio_device {
 	struct iommufd_device *iommufd_device;
 	bool iommufd_attached;
 #endif
+	bool noiommu;
 };
 
 /**
-- 
2.34.1

