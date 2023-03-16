Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2D6BD010
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B2710E230;
	Thu, 16 Mar 2023 12:56:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5C10ECCC;
 Thu, 16 Mar 2023 12:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971352; x=1710507352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+7RX2IzBAM2FptZAjIkdhtONXLdSJXGxTFXM3ZBcaQ=;
 b=TynkdYjs2s8GZDZNOeNn9Mqa8dypjeEByBhfwHfjUOx2sRkI2DG+7tFA
 SCiBRZJHtMfpiPNmkDE9Y6178cIUp7ZkV115SKX1TmL17qTXSS0Ikz+oK
 AIAfQ8ji1hQdYgohKiDYUA5Ig7mKGAZ6IIr6qzk9uVT/jmRA1QAx7cQKC
 6dV/B+QoUN6pmHxJ8dIhshqpV9uLAoF05EmdwRmtF0B2amVlg7SZNJzTz
 WU4RnSnG1ThwYLCG/U0golswHai2cEEhpmx01lJn4gDlLYFrebYmoZos4
 AkFSmuZbhTPqigYOy4Cpj9YUw185iBbSwcjYo7PtvboLo9iaafBNlSoOm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336668107"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336668107"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="790277817"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="790277817"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2023 05:55:51 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v7 10/22] vfio: Make vfio_device_open() single open for device
 cdev path
Date: Thu, 16 Mar 2023 05:55:22 -0700
Message-Id: <20230316125534.17216-11-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316125534.17216-1-yi.l.liu@intel.com>
References: <20230316125534.17216-1-yi.l.liu@intel.com>
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

Thus, when moving to the new uAPI we block the ability of opening
a device multiple times. Given old group path still allows it we store
a vfio_group pointer in struct vfio_device_file to differentiate.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 2 ++
 drivers/vfio/vfio.h      | 2 ++
 drivers/vfio/vfio_main.c | 7 +++++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 4de7a8fc3be1..c0065e359db6 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -245,6 +245,8 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
 		goto err_out;
 	}
 
+	df->group = device->group;
+
 	ret = vfio_device_group_open(df);
 	if (ret)
 		goto err_free;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index b2f20b78a707..f1a448f9d067 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -18,6 +18,8 @@ struct vfio_container;
 
 struct vfio_device_file {
 	struct vfio_device *device;
+	struct vfio_group *group;
+
 	bool access_granted;
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index b515bbda4c74..b3b7e2436aec 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -477,6 +477,13 @@ int vfio_device_open(struct vfio_device_file *df)
 
 	lockdep_assert_held(&device->dev_set->lock);
 
+	/*
+	 * Only the group path allows the device opened multiple times.
+	 * The device cdev path doesn't have a secure way for it.
+	 */
+	if (device->open_count != 0 && !df->group)
+		return -EINVAL;
+
 	device->open_count++;
 	if (device->open_count == 1) {
 		ret = vfio_device_first_open(df);
-- 
2.34.1

