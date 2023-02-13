Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E7694A9E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Feb 2023 16:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1144810E603;
	Mon, 13 Feb 2023 15:14:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253A510E609;
 Mon, 13 Feb 2023 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676301258; x=1707837258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CzcwFRuRHGuRhT4hUBMtWnKCin1oHYB8n/oS+HSYTCQ=;
 b=i7VVYxwo4vIsLpfnTAL/rVBifs/iLjIPIWmR4IKE8Lhw8/3OnZP6SNeJ
 mgPfC+FnL2kEO2zXRrRelY77VMgZ7Qp+GdVKm14xKXH4OzkPCcRjnYB4c
 CDYvJ3lASwUKtPHBKqrynXa/IIoco6aTquUldjpkjB4LsfrdNYwKkgB4g
 49yCbxZyn5DUKHw8jPbUPvy1+IaZuDdhDaYrBZebFuq+5Xf1kYb1b7zTm
 +ILeacRIqB1NPk6des4XUuVwviK4DoGHi3l4H2HQYnn+vvlcmNSoAbXVz
 LIw24c30pgo95CwsG4lbL+x6mbXpCk5ulNVZ81sD9UNuCxLzl852kdg+u A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="318931639"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="318931639"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701289684"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="701289684"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 07:13:59 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: joro@8bytes.org, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, robin.murphy@arm.com
Subject: [PATCH v3 11/15] vfio: Add cdev_device_open_cnt to vfio_group
Date: Mon, 13 Feb 2023 07:13:44 -0800
Message-Id: <20230213151348.56451-12-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213151348.56451-1-yi.l.liu@intel.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
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
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, jasowang@redhat.com,
 cohuck@redhat.com, peterx@redhat.com, eric.auger@redhat.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

for counting the devices that are opened via the cdev path. This count
is increased and decreased by the cdev path. The group path checks it
to achieve exclusion with the cdev path. With this, only one path (group
path or cdev path) will claim DMA ownership. This avoids scenarios in
which devices within the same group may be opened via different paths.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c | 5 +++++
 drivers/vfio/vfio.h  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 9f3f6f0e4942..f3f5f4589cdd 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -403,6 +403,11 @@ static int vfio_group_fops_open(struct inode *inode, struct file *filep)
 		goto out_unlock;
 	}
 
+	if (group->cdev_device_open_cnt) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
 	/*
 	 * Do we need multiple instances of the group open?  Seems not.
 	 */
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 6f063e31d08a..7a77fb12bd2c 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -84,6 +84,7 @@ struct vfio_group {
 	struct blocking_notifier_head	notifier;
 	struct iommufd_ctx		*iommufd;
 	spinlock_t			kvm_ref_lock;
+	unsigned int			cdev_device_open_cnt;
 };
 
 int vfio_device_set_group(struct vfio_device *device,
-- 
2.34.1

