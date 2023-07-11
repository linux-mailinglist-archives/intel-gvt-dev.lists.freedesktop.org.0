Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC074E4D2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jul 2023 04:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE2B10E308;
	Tue, 11 Jul 2023 02:59:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40EC10E2F8;
 Tue, 11 Jul 2023 02:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689044388; x=1720580388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1sQkWuUWd1EgQZC0VeeoQ5zSEsWEi8gzSk5vg+yuDhg=;
 b=LsYOpEXNZs8ztvqqgH1vDfxVEyRCQ4w1O8C2ViHObrMVjKlg9ODHZ933
 cHV2nikfsoOMGUt9eKxAS3ohwJaF4kIv6naf093Pzw2J3uxItMQ2TiAaD
 Y9QlQ+Q8XgMMIriapzPysmd84A/gEwtN/pAxbLPw5wC7/pomldwE1a4i4
 BS3t5PXs/hDPs5Ufh8dfiHK12PuF4vJcJA1eBmS4+IE2brDMUBMUJHJ6d
 gFKFpBGPrJyQnigJ91JZewH8exYT3mtKmW9JoFphcmWnZ66cRD/O+ENe7
 9Ra5LKREM2qL8LUuL4EcwhbvyTO2b6RWwFLHwEj5as6m3ufHCpBi3Vz9j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361973152"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="361973152"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724250901"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="724250901"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 19:59:47 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v14 17/26] vfio: Move device_del() before waiting for the last
 vfio_device registration refcount
Date: Mon, 10 Jul 2023 19:59:19 -0700
Message-Id: <20230711025928.6438-18-yi.l.liu@intel.com>
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

device_del() destroys the vfio-dev/vfioX under the sysfs for vfio_device.
There is no reason to keep it while the device is going to be unregistered.

This movement is also a preparation for adding vfio_device cdev. Kernel
should remove the cdev node of the vfio_device to avoid new registration
refcount increment while the device is going to be unregistered.

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

