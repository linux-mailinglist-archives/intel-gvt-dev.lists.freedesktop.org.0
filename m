Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E26A403B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 12:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CC610E3D5;
	Mon, 27 Feb 2023 11:12:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3038410E3BE;
 Mon, 27 Feb 2023 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677496308; x=1709032308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S9kGZ5rf4tbPiAQVbmwVPQqiKdbambEtt1XUmIOW9yw=;
 b=THgKCHBdZlqahfV5QrKgR4yl7wj6FLkiCt9QNSq5tRMKv2pxdS+ht+uC
 YH4DE+/E4cAFJ99Qt4HHUXLjwQtndPL8w83lQSfq0g3nQAMFY80x8gh4v
 dz51ng0JrlXNNNq3sqyGAIpm3kW1vjqycd2TyitbmuAfWFYlbCCqlgCrc
 SwF74hev7tA4Nho41Wk4Cy8nZ/DIvCfMrjVGeoIEWkFmHpxEbNICHl5+W
 DaYdKf8BQOCeuOPpcUJ+z6Byy3BZYeda7zibU3wtFWJBHNepUkJVyxT4b
 uv4JSxLdVk0th2tb4ToYpradnSG33IEJFebagUrsd0sKKr2KCUPE1Qep+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="420097730"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="420097730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="651189577"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="651189577"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 03:11:47 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 14/19] vfio: Make vfio_device_open() single open for device
 cdev path
Date: Mon, 27 Feb 2023 03:11:30 -0800
Message-Id: <20230227111135.61728-15-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227111135.61728-1-yi.l.liu@intel.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 xudong.hao@intel.com, peterx@redhat.com, yan.y.zhao@intel.com,
 eric.auger@redhat.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VFIO group has historically allowed multi-open of the device FD. This
was made secure because the "open" was executed via an ioctl to the
group FD which is itself only single open.

However, no known use of multiple device FDs today. It is kind of a
strange thing to do because new device FDs can naturally be created
via dup().

When we implement the new device uAPI (only used in cdev path) there is
no natural way to allow the device itself from being multi-opened in a
secure manner. Without the group FD we cannot prove the security context
of the opener.

Thus, when moving to the new uAPI we block the ability to multi-open
the device. Old group path still allows it.

vfio_device_open() needs to sustain both the legacy behavior i.e. multi-open
in the group path and the new behavior i.e. single-open in the cdev path.
This mixture leads to the introduction of a new is_cdev_device flag in struct
vfio_device_file.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/vfio.h      |  2 ++
 drivers/vfio/vfio_main.c | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index a61d4df30716..54a48c8596f7 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -18,6 +18,8 @@ struct vfio_container;
 
 struct vfio_device_file {
 	struct vfio_device *device;
+	bool is_cdev_device;
+
 	bool access_granted;
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index a51c0a0e8a1a..5b485d3bb67e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -472,6 +472,13 @@ int vfio_device_open(struct vfio_device_file *df,
 
 	lockdep_assert_held(&device->dev_set->lock);
 
+	/*
+	 * Device cdev path cannot support multiple device open since
+	 * it doesn't have a secure way for it.
+	 */
+	if (device->open_count != 0 && df->is_cdev_device)
+		return -EINVAL;
+
 	device->open_count++;
 	if (device->open_count == 1) {
 		ret = vfio_device_first_open(df, dev_id, pt_id);
@@ -535,7 +542,8 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
-	vfio_device_group_close(df);
+	if (!df->is_cdev_device)
+		vfio_device_group_close(df);
 
 	vfio_device_put_registration(device);
 
-- 
2.34.1

