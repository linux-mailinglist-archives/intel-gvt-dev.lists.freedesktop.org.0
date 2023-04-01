Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE916D3215
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 17:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477EB10E227;
	Sat,  1 Apr 2023 15:18:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DED10E24B;
 Sat,  1 Apr 2023 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680362326; x=1711898326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=opGN95o7pF1df9Ozf4TXyBS5az+9mr8bUEPUq1TuJqs=;
 b=QRRSgHjAPNVtiPxODl2L+TkzFKIbZvCarKzcB5cTZXW3LriuBNL0qQW8
 PICW+pn5vj9cUlBhphnsFXh+p4NwNYBR6pSpm0qC0Ma5hlQ9PqXPlaI5Y
 Sody69iL2EoBzfhyPX+7LzZ0YtNascdlWMBwixmNXDKsVMUviDLHOQHTn
 GqcRPSP024Ju57yoVLn7VmEAPQLlqRunsad9MHT+PtxC6M7PACt6Tlvum
 EfSAEsy0qXe5E2W5XWlYKimaoFW3cbxk9IwJwNacEymVuJ0Kz37luYxMg
 FQKb+fj4xtEl06jcN77tmlPB0EIxf3ewj6aTkm4IuYtGKB7QRy3IMpF8Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404411349"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="404411349"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 08:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="678937218"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="678937218"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 01 Apr 2023 08:18:45 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 18/25] vfio: Determine noiommu in vfio_device registration
Date: Sat,  1 Apr 2023 08:18:26 -0700
Message-Id: <20230401151833.124749-19-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401151833.124749-1-yi.l.liu@intel.com>
References: <20230401151833.124749-1-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, yi.l.liu@intel.com, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
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
 drivers/vfio/group.c     | 2 +-
 drivers/vfio/vfio.h      | 6 +++---
 drivers/vfio/vfio_main.c | 2 ++
 include/linux/vfio.h     | 1 +
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index de9f09c7cf00..8c88bff0fc59 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -192,7 +192,7 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 		vfio_device_group_get_kvm_safe(device);
 
 	df->iommufd = device->group->iommufd;
-	if (df->iommufd && vfio_device_is_noiommu(device)) {
+	if (df->iommufd && device->noiommu) {
 		if (device->open_count == 0) {
 			ret = vfio_iommufd_enable_noiommu_compat(device,
 								 df->iommufd);
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index b47b186573ac..41dfc9d5205a 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -108,10 +108,10 @@ bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
 
-static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
+static inline void vfio_device_set_noiommu(struct vfio_device *device)
 {
-	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
-	       vdev->group->type == VFIO_NO_IOMMU;
+	device->noiommu = IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
+			  device->group->type == VFIO_NO_IOMMU;
 }
 
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index bc2ecbb7c22a..989c40a49171 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -277,6 +277,8 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		return ret;
 
+	vfio_device_set_noiommu(device);
+
 	ret = device_add(&device->device);
 	if (ret)
 		goto err_out;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 1445eb185121..672c0d9ac3fa 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -63,6 +63,7 @@ struct vfio_device {
 	bool iommufd_attached;
 #endif
 	bool cdev_opened;
+	bool noiommu;
 };
 
 /**
-- 
2.34.1

