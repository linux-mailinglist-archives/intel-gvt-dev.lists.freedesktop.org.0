Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C457D732C07
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Jun 2023 11:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B26F10E5CB;
	Fri, 16 Jun 2023 09:40:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF1610E59C;
 Fri, 16 Jun 2023 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686908409; x=1718444409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w64PBZBpwikwjApBh0qcsx7B85QSOftXwQDkYqhx5Os=;
 b=kf1X2ty7WhMiK1t9gpk8fBROlt36XYTBjHoeZ5KUV/mre00eWBlFUNf2
 OyM/ZI1K8OxIvuThw+EOSp7flNePLA2uz+ygPLRkRIaCl9QDzfwVb87El
 KGw8p5yfO/nUNH+VBj0oudYB3HaOhYW/ZNgQ8LULJxlxFFJQcyiRz+YpJ
 xdZZsFOJDZIK1xlU1Q6vGYl9fph1vMyrt0duyaD2hvMU0NHHMlj0GFBs5
 zQTQR1ZwgjeyCAVZ+ABkjxNar8eSSZJp4s/ilB5XY/tW/KwHOL3id9MHn
 XqZKRwi4x805G8jQ4KcfUqYmdm5haVmPJ46JWXgjAS3f2KvKbY047ldhn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361700266"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="361700266"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715951114"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="715951114"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2023 02:40:08 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v13 09/22] vfio: Make vfio_df_open() single open for device
 cdev path
Date: Fri, 16 Jun 2023 02:39:33 -0700
Message-Id: <20230616093946.68711-10-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616093946.68711-1-yi.l.liu@intel.com>
References: <20230616093946.68711-1-yi.l.liu@intel.com>
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

Thus, when moving to the new uAPI we block the ability of opening
a device multiple times. Given old group path still allows it we store
a vfio_group pointer in struct vfio_device_file to differentiate.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 2 ++
 drivers/vfio/vfio.h      | 1 +
 drivers/vfio/vfio_main.c | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 2751d61689c4..4e6277191eb4 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -245,6 +245,8 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
 		goto err_out;
 	}
 
+	df->group = device->group;
+
 	ret = vfio_df_group_open(df);
 	if (ret)
 		goto err_free;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index ae7dd2ca14b9..85484a971a3e 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -18,6 +18,7 @@ struct vfio_container;
 
 struct vfio_device_file {
 	struct vfio_device *device;
+	struct vfio_group *group;
 
 	u8 access_granted;
 	spinlock_t kvm_ref_lock; /* protect kvm field */
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index c37fc14599d0..be5e4ddd5901 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -492,6 +492,13 @@ int vfio_df_open(struct vfio_device_file *df)
 
 	lockdep_assert_held(&device->dev_set->lock);
 
+	/*
+	 * Only the group path allows the device to be opened multiple
+	 * times.  The device cdev path doesn't have a secure way for it.
+	 */
+	if (device->open_count != 0 && !df->group)
+		return -EINVAL;
+
 	device->open_count++;
 	if (device->open_count == 1) {
 		ret = vfio_df_device_first_open(df);
-- 
2.34.1

