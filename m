Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868216EF6D8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 16:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F6410E7A3;
	Wed, 26 Apr 2023 14:54:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714C810E530;
 Wed, 26 Apr 2023 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682520876; x=1714056876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=we3Zabe+6AgPN8c/FPEQV6hmIff3h/EBF2BbVZP1HZQ=;
 b=O7vDQNbhUKyujEmrsuyKmfTlfAmgelud2flgcv/zAoXm1q/icHDXcKss
 8EsMsCUy866Xxqz0J9rcmVo9Z+bfSrIz1+rIizPsbfXkqPnSwlSpywS16
 fB302FqKQdXByDt/yMLVWaTztG2yW6CHHUZIFWPKC6Rskzp9FfABLnK1R
 8gVkGYT2/XEB2U3coSkRNEnxKwM1dxuXUNRZZ8KulabOygrGzxxRTQPGB
 0TOos/YR5NM0aP9V/EfhzdTp1qfywoHXD3ja8PXJ9ddcOeHXUPHNT3Qao
 io5LsXNGVIgpMzFKTH/VYmLZOQjbGwBjyqn0CUlRRcKEDbBQkYNouiD0X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433410337"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="433410337"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 07:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758644040"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="758644040"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 07:54:35 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 6/9] iommufd: Reserved -1 in the iommufd xarray
Date: Wed, 26 Apr 2023 07:54:16 -0700
Message-Id: <20230426145419.450922-7-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145419.450922-1-yi.l.liu@intel.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
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
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VFIO needs two reserved values. 0 is already reserved by initializing
xarray with XA_FLAGS_ALLOC1. This reserves -1 by limiting the xa alloc
range.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 3fbe636c3d8a..51b27c96c52f 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -28,6 +28,9 @@ struct iommufd_object_ops {
 static const struct iommufd_object_ops iommufd_object_ops[];
 static struct miscdevice vfio_misc_dev;
 
+/* -1 is reserved */
+#define iommufd_xa_limit_32b XA_LIMIT(0, (-2U))
+
 struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     size_t size,
 					     enum iommufd_object_type type)
@@ -50,7 +53,7 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 	 * before calling iommufd_object_finalize().
 	 */
 	rc = xa_alloc(&ictx->objects, &obj->id, XA_ZERO_ENTRY,
-		      xa_limit_32b, GFP_KERNEL_ACCOUNT);
+		      iommufd_xa_limit_32b, GFP_KERNEL_ACCOUNT);
 	if (rc)
 		goto out_free;
 	return obj;
-- 
2.34.1

