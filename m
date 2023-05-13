Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6070173E
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7B410E0F0;
	Sat, 13 May 2023 13:28:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C69910E0E6;
 Sat, 13 May 2023 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984534; x=1715520534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TWV894DTZrYaN7h4aj49YReKCmOsfie/espg2ZPGgRk=;
 b=SLSmh3tt+hbOtn+aRG+4Y1dSmC+tj7M/314uTYgZtc7XJei0pBmsY4qm
 4RR8/9JgcBJnuPrp+HmR05uh5mWTNCictbpwMfWpU3XGm2/8ZNweqAmvS
 ZMBzPFRPOkoiSnxcw6nApOQ7PkStP263EMP2xA6slnVXvWkH5SW5A4LXQ
 KQ5Oya1MOIFqOxxPPUAKJ1YgSD92r/6fb//YnWiIyEZE+ba0lmCz7g0PO
 kWvh13o7x7JMLSaS6QRqafqa32WOdl0KxZnNxknDNekcfqqQKW9wpBCSM
 bUI3PDEQwo14ZclsDAFjLBADKVK2UFs7vc3s9bQ3s2LZJUQO3JwF5yquO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354100811"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="354100811"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703459516"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="703459516"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 06:28:53 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v11 17/23] vfio: Move vfio_device_group_unregister() to be the
 first operation in unregister
Date: Sat, 13 May 2023 06:28:21 -0700
Message-Id: <20230513132827.39066-18-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513132827.39066-1-yi.l.liu@intel.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
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

This can avoid endless vfio_device refcount increasement by userspace,
which would keep blocking the vfio_unregister_group_dev().

Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/vfio_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 89720b73fa30..541bfd9ce004 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -333,6 +333,12 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 	bool interrupted = false;
 	long rc;
 
+	/*
+	 * Prevent new device opened by userspace via the
+	 * VFIO_GROUP_GET_DEVICE_FD in the group path.
+	 */
+	vfio_device_group_unregister(device);
+
 	vfio_device_put_registration(device);
 	rc = try_wait_for_completion(&device->comp);
 	while (rc <= 0) {
@@ -356,8 +362,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 		}
 	}
 
-	vfio_device_group_unregister(device);
-
 	/* Balances device_add in register path */
 	device_del(&device->device);
 
-- 
2.34.1

