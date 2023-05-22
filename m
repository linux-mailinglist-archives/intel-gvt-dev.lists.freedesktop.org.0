Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C570BC89
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 May 2023 13:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A082B10E2F4;
	Mon, 22 May 2023 11:57:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D11810E2F1;
 Mon, 22 May 2023 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684756675; x=1716292675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PCisGYDRxuCZiZ9JGfK9mHAN8YQFOf+oWDiI76hrHHg=;
 b=BQb+ZoTc49vgkP/Uh0VgjIXTPDtUg5WomE0HkHUSJyBdxTS/9Ff/OQHu
 Rf2AkiKKNC2qqoCd8+JsiU8Q47PzlYDlraOTr2chAm659NUKTN4INrbys
 0OupTX/ZhFs4xXTx8numD/osrYpmlBF+s/t04dvBUd34XpBK5zu0vXdvo
 0++Bfq77xU2ppdv4FvlOm+V0KFJ/SBhYR7MgrMnfV7TATZqvt78VgC05A
 mZr4yT7DmLSG9lKweIduIO3ffv8hMu/d7qciY7lr70wXmE+SSGsfk+lPb
 YQse+zIl3RbqqX7zvGcXZlijNXzDxLDdWvK8LRlCeI7ZlFf+Ptk3BtJfG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="356128158"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="356128158"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="815660173"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="815660173"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga002.fm.intel.com with ESMTP; 22 May 2023 04:57:54 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 02/10] vfio/pci: Update comment around group_fd get in
 vfio_pci_ioctl_pci_hot_reset()
Date: Mon, 22 May 2023 04:57:43 -0700
Message-Id: <20230522115751.326947-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522115751.326947-1-yi.l.liu@intel.com>
References: <20230522115751.326947-1-yi.l.liu@intel.com>
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

