Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E787201B6
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601CD10E6A0;
	Fri,  2 Jun 2023 12:17:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357AC10E695;
 Fri,  2 Jun 2023 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708243; x=1717244243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=owdvdOCDpio3vpbii6J0YECQbcXKaQhdXjotl7lRrJw=;
 b=W9Svf+gV1M0l105lx0f0zyaxb6nvF7ffKZHzzEm2z0NBl1rKK7+4WimE
 ZOjujDK7uo2Z6BbwCj3x+SlGmwzOWn5loGtv9hghz95uafaca2edvbL4R
 w3Vt9RPA5S6YS9VEDLUvnB6dDud7oREJ/Rlv4yRkdEJQTMb8UUplfjK+K
 aPRxPOKYRPQPJjfgzieVA8AhPFGlpA5FjTJZ5KAcVrVayvgSIIS9O6OKy
 9YIDheuKo70wfOmqXtC4CMVljFcm8vQUw3n6+iJCw/8fXxeH/0Q3kR/G2
 WmSKIFgN+aPvNMe5qfXQdmiKo8v40QwMXwkiWTLZ8FLqVlX8k8dIvl3WH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384136742"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="384136742"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037947431"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="1037947431"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2023 05:17:22 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v12 21/24] vfio: Determine noiommu device in
 __vfio_register_dev()
Date: Fri,  2 Jun 2023 05:16:50 -0700
Message-Id: <20230602121653.80017-22-yi.l.liu@intel.com>
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

This moves the noiommu device determination and noiommu taint out of
vfio_group_find_or_alloc(). noiommu device is determined in
__vfio_register_dev() and result is stored in flag vfio_device->noiommu,
the noiommu taint is added in the end of __vfio_register_dev().

This is also a preparation for compiling out vfio_group infrastructure
as it makes the noiommu detection and taint common between the cdev path
and group path though cdev path does not support noiommu.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 15 ---------------
 drivers/vfio/vfio_main.c | 31 ++++++++++++++++++++++++++++++-
 include/linux/vfio.h     |  1 +
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 653b62f93474..64cdd0ea8825 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -668,21 +668,6 @@ static struct vfio_group *vfio_group_find_or_alloc(struct device *dev)
 	struct vfio_group *group;
 
 	iommu_group = iommu_group_get(dev);
-	if (!iommu_group && vfio_noiommu) {
-		/*
-		 * With noiommu enabled, create an IOMMU group for devices that
-		 * don't already have one, implying no IOMMU hardware/driver
-		 * exists.  Taint the kernel because we're about to give a DMA
-		 * capable device to a user without IOMMU protection.
-		 */
-		group = vfio_noiommu_group_alloc(dev, VFIO_NO_IOMMU);
-		if (!IS_ERR(group)) {
-			add_taint(TAINT_USER, LOCKDEP_STILL_OK);
-			dev_warn(dev, "Adding kernel taint for vfio-noiommu group on device\n");
-		}
-		return group;
-	}
-
 	if (!iommu_group)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6d8f9b0f3637..00a699b9f76b 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -265,6 +265,18 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
 	return ret;
 }
 
+static int vfio_device_set_noiommu(struct vfio_device *device)
+{
+	struct iommu_group *iommu_group = iommu_group_get(device->dev);
+
+	if (!iommu_group && !vfio_noiommu)
+		return -EINVAL;
+
+	device->noiommu = !iommu_group;
+	iommu_group_put(iommu_group); /* Accepts NULL */
+	return 0;
+}
+
 static int __vfio_register_dev(struct vfio_device *device,
 			       enum vfio_group_type type)
 {
@@ -277,6 +289,13 @@ static int __vfio_register_dev(struct vfio_device *device,
 		     !device->ops->detach_ioas)))
 		return -EINVAL;
 
+	/* Only physical devices can be noiommu device */
+	if (type == VFIO_IOMMU) {
+		ret = vfio_device_set_noiommu(device);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * If the driver doesn't specify a set then the device is added to a
 	 * singleton set just for itself.
@@ -288,7 +307,8 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		return ret;
 
-	ret = vfio_device_set_group(device, type);
+	ret = vfio_device_set_group(device,
+				    device->noiommu ? VFIO_NO_IOMMU : type);
 	if (ret)
 		return ret;
 
@@ -301,6 +321,15 @@ static int __vfio_register_dev(struct vfio_device *device,
 
 	vfio_device_group_register(device);
 
+	if (device->noiommu) {
+		/*
+		 * noiommu deivces have no IOMMU hardware/driver.  Taint the
+		 * kernel because we're about to give a DMA capable device to
+		 * a user without IOMMU protection.
+		 */
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+		dev_warn(device->dev, "Adding kernel taint for vfio-noiommu on device\n");
+	}
 	return 0;
 err_out:
 	vfio_device_remove_group(device);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e80a8ac86e46..183e620009e7 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -67,6 +67,7 @@ struct vfio_device {
 	bool iommufd_attached;
 #endif
 	bool cdev_opened:1;
+	bool noiommu:1;
 };
 
 /**
-- 
2.34.1

