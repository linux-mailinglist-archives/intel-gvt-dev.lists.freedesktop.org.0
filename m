Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A79B6EF73B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E6A10EA07;
	Wed, 26 Apr 2023 15:03:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7085C10E9C9;
 Wed, 26 Apr 2023 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682521435; x=1714057435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WFAskGSZ4sRwGClphsOafTN8Hu2qpEcUwsbPFoUsF98=;
 b=ameA0k5pc9OgGpNN+NgmtdHNHGk+SOiGYe8BZ6UalQ7UxXgIW/wZSk5k
 4jbK/QHKbrZ2rMoNrNbRj7iDHKBMMp0qtokhipE7R8A4m8EIl6P06g0fN
 76r768oDCIxw0oxyrmOapnBO+rwtj+5CtClwCpCb03qCACbdqU61LRFkx
 rpk8fCBnDtquA7RPpLH0RAXsB6joJSocGpDt7uJxfQhoMpXni5uLBDlI2
 r3zHJHOBx9AfK0Hz6cOJ02t6MQiOm3FWEqTWFu7O1/Cw8gd2komrrFZS8
 0w1tj37wzehJmOTPe7JX9GRfnZe1BWwkM75aYUvssWDnBFigLg1BVtzdr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="349944636"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="349944636"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 08:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805544241"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="805544241"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 08:03:54 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v10 16/22] vfio: Name noiommu vfio_device with "noiommu-"
 prefix
Date: Wed, 26 Apr 2023 08:03:15 -0700
Message-Id: <20230426150321.454465-17-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426150321.454465-1-yi.l.liu@intel.com>
References: <20230426150321.454465-1-yi.l.liu@intel.com>
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

For noiommu device, vfio core names the cdev node with prefix "noiommu-".

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/vfio_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 0f1139126622..c0459872d79a 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -269,10 +269,6 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (!device->dev_set)
 		vfio_assign_device_set(device, device);
 
-	ret = dev_set_name(&device->device, "vfio%d", device->index);
-	if (ret)
-		return ret;
-
 	ret = vfio_device_set_group(device, type);
 	if (ret)
 		return ret;
@@ -281,6 +277,11 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		goto err_out;
 
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

