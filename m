Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE29720158
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92DF10E684;
	Fri,  2 Jun 2023 12:15:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8216310E67A;
 Fri,  2 Jun 2023 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708119; x=1717244119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PCisGYDRxuCZiZ9JGfK9mHAN8YQFOf+oWDiI76hrHHg=;
 b=TbcviiZs2EcDgwWBXSPH94T2+/tNU6JBje/E+abU23CZGbElwroZ+t+E
 h4T4r0+YOjHTOnctWs7W6A5rKDgxH7QBUF0xP0FAi0umk8OBS2yqzGr9x
 xi0VEpIF0YJz2tKKYXiKu5FOeWnrB2tA1aHmrLMJq6CLGNJx9L0CxN06L
 oYv5h7hqD/+d2FvqyLCUrFPjg1Yby1mV3ROvTjQvOWh4esuf1vk3wqpy9
 SKpFQ3nLEPwga+A4HIMBFjj4qfzrlRZFOuT04B1TCPsvEcsrbBWlDDUSp
 CnXvIoIF4Ggf2FUyJDEbiBBxiilGjzgnTP9YDQHKS9t84gmvRX2VlQN9C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335467450"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="335467450"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772876450"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="772876450"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 05:15:17 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v7 1/9] vfio/pci: Update comment around group_fd get in
 vfio_pci_ioctl_pci_hot_reset()
Date: Fri,  2 Jun 2023 05:15:07 -0700
Message-Id: <20230602121515.79374-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602121515.79374-1-yi.l.liu@intel.com>
References: <20230602121515.79374-1-yi.l.liu@intel.com>
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

This suits more on what the code does.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index a5ab416cf476..f824de4dbf27 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1308,9 +1308,8 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	}
 
 	/*
-	 * For each group_fd, get the group through the vfio external user
-	 * interface and store the group and iommu ID.  This ensures the group
-	 * is held across the reset.
+	 * Get the group file for each fd to ensure the group is held across
+	 * the reset
 	 */
 	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
 		struct file *file = fget(group_fds[file_idx]);
-- 
2.34.1

