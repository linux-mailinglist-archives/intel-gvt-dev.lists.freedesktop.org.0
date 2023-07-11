Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66B774E4E6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jul 2023 05:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BF910E2F9;
	Tue, 11 Jul 2023 03:00:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9D410E302;
 Tue, 11 Jul 2023 02:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689044395; x=1720580395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eHPns7k1QmUrqabjYUd5HnssmG+fpnnjXdPgPppcU80=;
 b=EyS2zgJElVEa/r4tbTE72yncDS5tJm3gobL+TXOXgSyv0fEZzMEuivY2
 cXfSVNbRE0tYYLalBIBEA9SPKj6VKSzfy6t7hjBmu0jFzAnpCDF9oF4ou
 XSkcOozg1AkIXYxrB7FKi5HaQkSNAtbfmzvaDkGpBhwx2xdhNQ1OLtt12
 rPBT3sLbrDK5AsF2dd4nO1H7Zxn4v8q6zu4pBdxhIg+tLFL7BmBFhNVmR
 jUQbxZYiYJ0IHnxc0gSFWR8Heex1MrOSm+NU+7tUyvaXX8W+egmYydN+g
 CUqUfGPfZvyneGYPzgV9p41+ssDXNRn38z90Id2Len97wLO2a9ot506xV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361973238"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="361973238"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724250942"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="724250942"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 19:59:54 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v14 24/26] vfio: Move the IOMMU_CAP_CACHE_COHERENCY check in
 __vfio_register_dev()
Date: Mon, 10 Jul 2023 19:59:26 -0700
Message-Id: <20230711025928.6438-25-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711025928.6438-1-yi.l.liu@intel.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
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
index 5c17ad812313..610a429c6191 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -682,16 +682,6 @@ static struct vfio_group *vfio_group_find_or_alloc(struct device *dev)
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
index ba1d84afe081..902f06e52c48 100644
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

