Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5CB757E8A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 15:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4821B10E37E;
	Tue, 18 Jul 2023 13:56:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DD710E372;
 Tue, 18 Jul 2023 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689688572; x=1721224572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ehYluT/f0F+1shIL+ejEfudcxMv7lj3Qour9CZ02eSM=;
 b=jlftAq3w2OkeMFKugD9B9fmOG7hStjidh3/LzcPq9exiBkS4m/4gj24o
 LAG5HXCMHW8KTZz3m7Y1Sa4K5SSnzyfdgHtxnuCeAgyJX+Az5vI3mNHlD
 LANvGB9b2E+0fEu31XGJ8pyKBLgjpnUgEXTf9h+Xt5RJDZ/ZECpfcT9Tg
 xmJ5b63C8rE4+6vLjel1T1+ZUN5kbEnZCtSO9yuQ5ogeL6a8jcqpZgnLA
 4Ijo05q8p2cjYsOZ8031fs2KxXjVh7U9oK4jLbCDQZBMPUBr3bNPYXQA7
 3QqhgqKVDm9/GM/fTKmY+6e6WjvSGpg7dSP748/HvznftHzPd3szPV+L1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452590807"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452590807"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970251118"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="970251118"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 06:56:10 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v15 21/26] vfio: Avoid repeated user pointer cast in
 vfio_device_fops_unl_ioctl()
Date: Tue, 18 Jul 2023 06:55:46 -0700
Message-Id: <20230718135551.6592-22-yi.l.liu@intel.com>
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

This adds a local variable to store the user pointer cast result from arg.
It avoids the repeated casts in the code when more ioctls are added.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/vfio_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 5f7c3151d8c0..a2744cb64c6d 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1146,6 +1146,7 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 {
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
+	void __user *uptr = (void __user *)arg;
 	int ret;
 
 	/* Paired with smp_store_release() following vfio_df_open() */
@@ -1158,7 +1159,7 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 
 	switch (cmd) {
 	case VFIO_DEVICE_FEATURE:
-		ret = vfio_ioctl_device_feature(device, (void __user *)arg);
+		ret = vfio_ioctl_device_feature(device, uptr);
 		break;
 
 	default:
-- 
2.34.1

