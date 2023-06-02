Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2A72015B
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8528310E689;
	Fri,  2 Jun 2023 12:15:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D820510E67D;
 Fri,  2 Jun 2023 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708119; x=1717244119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LNuZa4AbKAzBgZdFFjleWRK4jBXLO0NTA5yaLW+RsbM=;
 b=i0/lQx0zXUfhYIqQGxVP0S051F5lPVmiORb6FcHwqvuFG6BVvurag0pd
 /c8MGIsRa2RB3/dDgGP4mnjGgZb3goQcygsYdtwWddmkgnn8Z5PFQ2NXQ
 pkkHyuIrxLhqGRr959Nd2rIL2vy9pyRmgnvouPJQVMLJEbFl5X2HrxIl6
 ai+F7y20fQfECwzngI138uk7zhb6m8/BrrXzhrq47kLXx81iDs5vSQAAg
 15dkSxxtaa0t4T+BhUrW41vWWdAzZrUZpXEfiss6tdtdTXWriPPeO9tkb
 jopuIUF/mbU/wSFl4z5L6p+yGZs3CVKUrYDJZk7L8hB3fg2tYJ/rCIbcq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335467469"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="335467469"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772876460"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="772876460"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 05:15:18 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v7 3/9] iommufd: Reserve all negative IDs in the iommufd xarray
Date: Fri,  2 Jun 2023 05:15:09 -0700
Message-Id: <20230602121515.79374-4-yi.l.liu@intel.com>
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

With this reservation, IOMMUFD users can encode the negative IDs for
specific purposes. e.g. VFIO needs two reserved values to tell userspace
the ID returned is not valid but has other meaning.

Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 3fbe636c3d8a..32ce7befc8dd 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -50,7 +50,7 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 	 * before calling iommufd_object_finalize().
 	 */
 	rc = xa_alloc(&ictx->objects, &obj->id, XA_ZERO_ENTRY,
-		      xa_limit_32b, GFP_KERNEL_ACCOUNT);
+		      xa_limit_31b, GFP_KERNEL_ACCOUNT);
 	if (rc)
 		goto out_free;
 	return obj;
-- 
2.34.1

