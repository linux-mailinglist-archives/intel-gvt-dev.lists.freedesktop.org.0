Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C46D324F
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 17:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0D410E331;
	Sat,  1 Apr 2023 15:19:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1723310E139;
 Sat,  1 Apr 2023 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680362327; x=1711898327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQ3o8IsEThomvWbYBo9On/FLVyvK6wQgWjHFyMOy86I=;
 b=EBN4iovjJ1J+HQNYl1XZq6vCwO1xykWmUC+7Ii3xiOjzl9HLcyHpbzGe
 GzHItZCNysX/gyrfs5ICycKwDvD3dc4pOIlzwiMrCTaoTge8mpTpPrvJi
 Vu29aUXX5BdWoazNWUYmeY2Ij59PIiwjVVZRFvLpd/tm5QHHwe4vWpzOM
 ZFJ8r08SxKVqNyF97im3zfQrGJT0myLUNjn/WkRFGbNRqhgQytL486WTp
 3s75vjfs1oiFgi0MbVzmXx1m7aGF40DPoTjRkddsObEXTlgUZUdWRcAPb
 mdV49bDy7VeOsEPVPuSS/+WCz/AetBezxpGBMNi4ZDIRkiM/6VW6t762/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404411360"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="404411360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 08:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="678937221"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="678937221"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 01 Apr 2023 08:18:46 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 19/25] vfio: Name noiommu vfio_device with "noiommu-" prefix
Date: Sat,  1 Apr 2023 08:18:27 -0700
Message-Id: <20230401151833.124749-20-yi.l.liu@intel.com>
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

For noiommu device, vfio core names the cdev node with prefix "noiommu-".

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/vfio_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 989c40a49171..0337d1ace716 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -269,16 +269,17 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (!device->dev_set)
 		vfio_assign_device_set(device, device);
 
-	ret = dev_set_name(&device->device, "vfio%d", device->index);
-	if (ret)
-		return ret;
-
 	ret = vfio_device_set_group(device, type);
 	if (ret)
 		return ret;
 
 	vfio_device_set_noiommu(device);
 
+	ret = dev_set_name(&device->device, "%svfio%d",
+			   device->noiommu ? "noiommu-" : "", device->index);
+	if (ret)
+		goto err_out;
+
 	ret = device_add(&device->device);
 	if (ret)
 		goto err_out;
-- 
2.34.1

