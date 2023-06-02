Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF87201A9
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E5B10E6A0;
	Fri,  2 Jun 2023 12:17:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D068F10E67A;
 Fri,  2 Jun 2023 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708241; x=1717244241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3SKwcwtKPsnn2wY4GVS5Sn5aLN1q8hmsyWBXcjuuDE=;
 b=FLWaTjzz8cxVIUwmJfiSnn83+EgJv2/cVpDttMTbWSIXVOUukFkMmgk5
 TSrhO3ZgYLSUlXrSoVUc39pRsQUnw/WDIOKTBDDJtUmdSWQMrh/h3l9/s
 nK3DOQz2tMJyenAtB9Tdq6bN8tg7lu+dc/BKjHkdJ9wy7LhNVQ8psbM3F
 gp9JKz0UTF8O1cFVVdaTRQksi8pvno9qBugzom4iS5u1+cowhOFH7iaAl
 yhu+pt0GuT1LnEDR8ouO4CvE5VABWEG5Yy6tMmvtQJFc4xu65ZKne2IM/
 4r+xTAxM2R4UzeXd17v7O1jeTScs6qC1tYUuzQiHZ+DS1mXTEfeG1rTxu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384136731"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="384136731"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037947425"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="1037947425"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2023 05:17:20 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v12 20/24] vfio: Only check group->type for noiommu test
Date: Fri,  2 Jun 2023 05:16:49 -0700
Message-Id: <20230602121653.80017-21-yi.l.liu@intel.com>
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

group->type can be VFIO_NO_IOMMU only when vfio_noiommu option is true.
And vfio_noiommu option can only be true if CONFIG_VFIO_NOIOMMU is enabled.
So checking group->type is enough when testing noiommu.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c | 3 +--
 drivers/vfio/vfio.h  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 41a09a2df690..653b62f93474 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -133,8 +133,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 
 	iommufd = iommufd_ctx_from_file(f.file);
 	if (!IS_ERR(iommufd)) {
-		if (IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
-		    group->type == VFIO_NO_IOMMU)
+		if (group->type == VFIO_NO_IOMMU)
 			ret = iommufd_vfio_compat_set_no_iommu(iommufd);
 		else
 			ret = iommufd_vfio_compat_ioas_create(iommufd);
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 5835c74e97ce..1b89e8bc8571 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -108,8 +108,7 @@ void vfio_group_cleanup(void);
 
 static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
 {
-	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
-	       vdev->group->type == VFIO_NO_IOMMU;
+	return vdev->group->type == VFIO_NO_IOMMU;
 }
 
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
-- 
2.34.1

