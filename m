Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A04732C1D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Jun 2023 11:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D878210E5D1;
	Fri, 16 Jun 2023 09:40:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D8B10E5E0;
 Fri, 16 Jun 2023 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686908432; x=1718444432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7jJAYZoIpN+qQ1kmOpqEa17zY0TCcEYE6qyrVcGekBs=;
 b=VBSVgYaNpnHSmMopkfU6JQ3gsKeLJT/rJdurhfDfJKYTw+9Y2F+XbQ3O
 Lon7s5eQ5cfsRdXy0qGwIjvjuhUVBWvK3nOCo8sWaFiQve8g+HrUlH1vO
 zxzfjr3ZnufqKjDKLzV8LEeMS1ujMGTp3fPHgzaaI8C4ozcFEHYwkTGbI
 +A+cZnQP/P7QHXWCgz7dcVVqZYP9yxmElGIryH0WKjtAirucVv7uQnroQ
 ac5E7qZ0xmwQVjkBKce6D61k1YAwexErVmzglmscatr/Wc5wXMOPTbYRp
 Q48E6L75rTOxGI0GeBZEyXKSY+OOU/JfApT2RE3oRj5GBUUeD/vFHR7dB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361700474"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="361700474"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715951278"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="715951278"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2023 02:40:30 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v13 20/22] vfio: Move the IOMMU_CAP_CACHE_COHERENCY check in
 __vfio_register_dev()
Date: Fri, 16 Jun 2023 02:39:44 -0700
Message-Id: <20230616093946.68711-21-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616093946.68711-1-yi.l.liu@intel.com>
References: <20230616093946.68711-1-yi.l.liu@intel.com>
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

The IOMMU_CAP_CACHE_COHERENCY check only applies to the physical devices
that are IOMMU-backed. But it is now in the group code. If want to compile
vfio_group infrastructure out, this check needs to be moved out of the group
code.

Another reason for this change is to fail the device registration for the
physical devices that do not have IOMMU if the group code is not compiled
as the cdev interface does not support such devices.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 10 ----------
 drivers/vfio/vfio_main.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 41a09a2df690..c2e0128323a7 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -687,16 +687,6 @@ static struct vfio_group *vfio_group_find_or_alloc(struct device *dev)
 	if (!iommu_group)
 		return ERR_PTR(-EINVAL);
 
-	/*
-	 * VFIO always sets IOMMU_CACHE because we offer no way for userspace to
-	 * restore cache coherency. It has to be checked here because it is only
-	 * valid for cases where we are using iommu groups.
-	 */
-	if (!device_iommu_capable(dev, IOMMU_CAP_CACHE_COHERENCY)) {
-		iommu_group_put(iommu_group);
-		return ERR_PTR(-EINVAL);
-	}
-
 	mutex_lock(&vfio.group_lock);
 	group = vfio_group_find_from_iommu(iommu_group);
 	if (group) {
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 51c80eb32af6..ffb4585b7f0e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -292,6 +292,17 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		return ret;
 
+	/*
+	 * VFIO always sets IOMMU_CACHE because we offer no way for userspace to
+	 * restore cache coherency. It has to be checked here because it is only
+	 * valid for cases where we are using iommu groups.
+	 */
+	if (type == VFIO_IOMMU && !vfio_device_is_noiommu(device) &&
+	    !device_iommu_capable(device->dev, IOMMU_CAP_CACHE_COHERENCY)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
 	ret = vfio_device_add(device);
 	if (ret)
 		goto err_out;
-- 
2.34.1

