Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5046757E7C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 15:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A069A10E37D;
	Tue, 18 Jul 2023 13:56:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F12810E36A;
 Tue, 18 Jul 2023 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689688567; x=1721224567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tro7ldK39c/D+P73wAYl8xylrR+MAx9kksAZpQYgz6M=;
 b=iyHfL0Du9XX6kjWxMrEwa+OKll6ljmlANPy2yAt02h8Yex6Dun5w669k
 C/kOVx/dS4+aAngeaZRp/2G7tnkXxtiEmoRpYIs96Q7uctTp6LJ5TNK9N
 aIJqnjDLbPcYXHTHdH18SLdLUpiX0OR1eecj4UN7wCETofCyv4vg9IqOC
 cStbK/U8CEhcLu+dfoiYzP5YVnWkcy9u2EKxUGmktGoTL/FMsMz0BcGew
 Xx2uMXJquvLFNkZB8mYj/fzWmjlDJLIuTkVmSAiiKS/RAgKWDn9g7xDQ8
 dqf5tTdSvpbB6JFHFwZCn7JFkDI2RchTlApzqzgUORjPz5wikHCD5cdHU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452590744"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452590744"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970251060"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="970251060"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 06:56:06 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v15 17/26] vfio: Move device_del() before waiting for the last
 vfio_device registration refcount
Date: Tue, 18 Jul 2023 06:55:42 -0700
Message-Id: <20230718135551.6592-18-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718135551.6592-1-yi.l.liu@intel.com>
References: <20230718135551.6592-1-yi.l.liu@intel.com>
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

device_del() destroys the vfio-dev/vfioX under the sysfs for vfio_device.
There is no reason to keep it while the device is going to be unregistered.

This movement is also a preparation for adding vfio_device cdev. Kernel
should remove the cdev node of the vfio_device to avoid new registration
refcount increment while the device is going to be unregistered.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/vfio_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6d45caa1f9a0..294bb5ecfc1c 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -338,6 +338,9 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 	 */
 	vfio_device_group_unregister(device);
 
+	/* Balances device_add in register path */
+	device_del(&device->device);
+
 	vfio_device_put_registration(device);
 	rc = try_wait_for_completion(&device->comp);
 	while (rc <= 0) {
@@ -361,9 +364,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 		}
 	}
 
-	/* Balances device_add in register path */
-	device_del(&device->device);
-
 	/* Balances vfio_device_set_group in register path */
 	vfio_device_remove_group(device);
 }
-- 
2.34.1

