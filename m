Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD637016F3
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7399110E0BC;
	Sat, 13 May 2023 13:21:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2EE10E0C9;
 Sat, 13 May 2023 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984106; x=1715520106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ughe9Kcl9gMYisiLlx4VKGCel5QfZCognMPvf6ESs4U=;
 b=QiG1ojnlelEoi1DT9SgZKler+JrT7qDvSeugHKjiPmv+pfeOb0bCZi9E
 kSGz8M58fBd5+9hZjqGAtgzn5pL8TlCGTduzae3B7gKES0xrnwUuSyGiL
 jbck/2U1ZESAHcWqXtMbZIy0X/PWngIxpGZfUAxVj9PjVxhLemkqif/Pa
 NEciBKk1GXrz7+5AzqQaCHdVryLB8VmkM0IWGm9u5fRw2lTvgVS2kpMRC
 jGN5Ojz3erRi7Okam/qS9dTPtrmyyIQYLNqQx3Ik4vuqbu0sqIIHRKPSD
 eyHizVfxL3jRDiFuOmZNP1qzExHV5VJ7OE0Pesj+MzQPoTOh9Q2Ehech+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="416598999"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="416598999"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="790126455"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="790126455"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by FMSMGA003.fm.intel.com with ESMTP; 13 May 2023 06:21:45 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 05/10] iommufd: Reserve all negative IDs in the iommufd
 xarray
Date: Sat, 13 May 2023 06:21:31 -0700
Message-Id: <20230513132136.15021-6-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513132136.15021-1-yi.l.liu@intel.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
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

Hence IOMMUFD users can encode the negative IDs for specific purposes.
e.g. VFIO needs two reserved values to tell userspace the ID returned
is not valid but has other meaning.

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

