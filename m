Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71016C9FA6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F2B10E388;
	Mon, 27 Mar 2023 09:34:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613DD10E374;
 Mon, 27 Mar 2023 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909640; x=1711445640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ch/bYiwA/al8uDthOgkt0aUcLuMsxVz1xbwcQeNOOX8=;
 b=iFukY4sZWSCeJQwnFk2DAQ9HPZBbC3os3oPFvcOauX0EQMg3EIF19N1A
 HtB1rRQYBb1/hz3fM85QG5QwY8pr7Ov4AymnsCSM9elLjyxyx3KEN1G/0
 0qRsR68bzZDkXJHBdad3B+zSNqe3oefPxXRO/PrT7ZZwDWM11HcTnL4X0
 PKiEICZvzfoHtCd11PaBqdMlJVk2WW36SoX72lb36DZkeRtNaliuhpfl9
 Ky15VRup1qfV3/8U4qF7wQ6RlDzyK15DZROxIeWWX0z8ylYNk6HsCuu+k
 KqVOV0Ovh4ow8wCrUoHp8mVy8OZ6+67CaBXGcvHvEL9n9xEL2f/HKiS7f Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402817969"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="402817969"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685908094"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="685908094"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 02:33:59 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 6/6] vfio: Check the presence for iommufd callbacks in
 __vfio_register_dev()
Date: Mon, 27 Mar 2023 02:33:51 -0700
Message-Id: <20230327093351.44505-7-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327093351.44505-1-yi.l.liu@intel.com>
References: <20230327093351.44505-1-yi.l.liu@intel.com>
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

After making the no-DMA drivers (samples/vfio-mdev) providing iommufd
callbacks, __vfio_register_dev() should check the presence of the iommufd
callbacks if CONFIG_IOMMUFD is enabled.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c   | 3 ---
 drivers/vfio/vfio_main.c | 5 +++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 890ea101685c..88b00c501015 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -32,9 +32,6 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 		return 0;
 	}
 
-	if (WARN_ON(!vdev->ops->bind_iommufd))
-		return -ENODEV;
-
 	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
 	if (ret)
 		return ret;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 43bd6b76e2b6..89497c933490 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -255,8 +255,9 @@ static int __vfio_register_dev(struct vfio_device *device,
 {
 	int ret;
 
-	if (WARN_ON(device->ops->bind_iommufd &&
-		    (!device->ops->unbind_iommufd ||
+	if (WARN_ON(IS_ENABLED(CONFIG_IOMMUFD) &&
+		    (!device->ops->bind_iommufd ||
+		     !device->ops->unbind_iommufd ||
 		     !device->ops->attach_ioas)))
 		return -EINVAL;
 
-- 
2.34.1

