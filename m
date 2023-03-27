Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0AC6C9F9A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB6F10E338;
	Mon, 27 Mar 2023 09:33:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F210E338;
 Mon, 27 Mar 2023 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909635; x=1711445635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sTUWE0zIue9rn+1zVTq2OYPpArHNzBrN70lBtzwd6gM=;
 b=NtQEp17W8hpfQMgMF8zmJ8GBaWsf3iNYgBKN7Nr9b9uwIaK1PxiBEee/
 ypXyPUhFSoerCtyNeLT7wDSM/iYgMHrY4zJmsKmN1EzyBmvHMlTZf3Wkj
 G5O5Yo1xCHqfPTJYug0xha3+M6WE4thRjpcQDMRIIURzMovZS8ofLCdYp
 sNQGQ/C29rFLrl5qYkfCc3YZ4ynU+jMFRUEElNQGEq2ez4oqaZSuELvUR
 B5GkUhL22ovvh8sz9qe2/1Un5RLCbbVinNj8e4gS439p81DomGxmPI0Fp
 1+oX7XWV1C8GWBeQPyE9JFF747khvDt/FigIP2nOwo8sVh8Z3KyKKi4ud g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402817912"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="402817912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685908076"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="685908076"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 02:33:54 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 1/6] iommu/iommufd: Pass iommufd_ctx pointer in
 iommufd_get_ioas()
Date: Mon, 27 Mar 2023 02:33:46 -0700
Message-Id: <20230327093351.44505-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327093351.44505-1-yi.l.liu@intel.com>
References: <20230327093351.44505-1-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, yi.l.liu@intel.com, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

no need to pass the iommufd_ucmd pointer.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/ioas.c            | 14 +++++++-------
 drivers/iommu/iommufd/iommufd_private.h |  4 ++--
 drivers/iommu/iommufd/selftest.c        |  6 +++---
 drivers/iommu/iommufd/vfio_compat.c     |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/iommufd/ioas.c b/drivers/iommu/iommufd/ioas.c
index 31577e9d434f..d5624577f79f 100644
--- a/drivers/iommu/iommufd/ioas.c
+++ b/drivers/iommu/iommufd/ioas.c
@@ -71,7 +71,7 @@ int iommufd_ioas_iova_ranges(struct iommufd_ucmd *ucmd)
 	if (cmd->__reserved)
 		return -EOPNOTSUPP;
 
-	ioas = iommufd_get_ioas(ucmd, cmd->ioas_id);
+	ioas = iommufd_get_ioas(ucmd->ictx, cmd->ioas_id);
 	if (IS_ERR(ioas))
 		return PTR_ERR(ioas);
 
@@ -151,7 +151,7 @@ int iommufd_ioas_allow_iovas(struct iommufd_ucmd *ucmd)
 	if (cmd->__reserved)
 		return -EOPNOTSUPP;
 
-	ioas = iommufd_get_ioas(ucmd, cmd->ioas_id);
+	ioas = iommufd_get_ioas(ucmd->ictx, cmd->ioas_id);
 	if (IS_ERR(ioas))
 		return PTR_ERR(ioas);
 	iopt = &ioas->iopt;
@@ -213,7 +213,7 @@ int iommufd_ioas_map(struct iommufd_ucmd *ucmd)
 	if (cmd->iova >= ULONG_MAX || cmd->length >= ULONG_MAX)
 		return -EOVERFLOW;
 
-	ioas = iommufd_get_ioas(ucmd, cmd->ioas_id);
+	ioas = iommufd_get_ioas(ucmd->ictx, cmd->ioas_id);
 	if (IS_ERR(ioas))
 		return PTR_ERR(ioas);
 
@@ -253,7 +253,7 @@ int iommufd_ioas_copy(struct iommufd_ucmd *ucmd)
 	    cmd->dst_iova >= ULONG_MAX)
 		return -EOVERFLOW;
 
-	src_ioas = iommufd_get_ioas(ucmd, cmd->src_ioas_id);
+	src_ioas = iommufd_get_ioas(ucmd->ictx, cmd->src_ioas_id);
 	if (IS_ERR(src_ioas))
 		return PTR_ERR(src_ioas);
 	rc = iopt_get_pages(&src_ioas->iopt, cmd->src_iova, cmd->length,
@@ -262,7 +262,7 @@ int iommufd_ioas_copy(struct iommufd_ucmd *ucmd)
 	if (rc)
 		return rc;
 
-	dst_ioas = iommufd_get_ioas(ucmd, cmd->dst_ioas_id);
+	dst_ioas = iommufd_get_ioas(ucmd->ictx, cmd->dst_ioas_id);
 	if (IS_ERR(dst_ioas)) {
 		rc = PTR_ERR(dst_ioas);
 		goto out_pages;
@@ -292,7 +292,7 @@ int iommufd_ioas_unmap(struct iommufd_ucmd *ucmd)
 	unsigned long unmapped = 0;
 	int rc;
 
-	ioas = iommufd_get_ioas(ucmd, cmd->ioas_id);
+	ioas = iommufd_get_ioas(ucmd->ictx, cmd->ioas_id);
 	if (IS_ERR(ioas))
 		return PTR_ERR(ioas);
 
@@ -381,7 +381,7 @@ int iommufd_ioas_option(struct iommufd_ucmd *ucmd)
 	if (cmd->__reserved)
 		return -EOPNOTSUPP;
 
-	ioas = iommufd_get_ioas(ucmd, cmd->object_id);
+	ioas = iommufd_get_ioas(ucmd->ictx, cmd->object_id);
 	if (IS_ERR(ioas))
 		return PTR_ERR(ioas);
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 9d7f71510ca1..2e6e8e217cce 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -211,10 +211,10 @@ struct iommufd_ioas {
 	struct list_head hwpt_list;
 };
 
-static inline struct iommufd_ioas *iommufd_get_ioas(struct iommufd_ucmd *ucmd,
+static inline struct iommufd_ioas *iommufd_get_ioas(struct iommufd_ctx *ictx,
 						    u32 id)
 {
-	return container_of(iommufd_get_object(ucmd->ictx, id,
+	return container_of(iommufd_get_object(ictx, id,
 					       IOMMUFD_OBJ_IOAS),
 			    struct iommufd_ioas, obj);
 }
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index cfb5fe9a5e0e..8667eb222cf1 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -75,7 +75,7 @@ void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
 		return;
 	*flags &= ~(u32)MOCK_FLAGS_ACCESS_SYZ;
 
-	ioas = iommufd_get_ioas(ucmd, ioas_id);
+	ioas = iommufd_get_ioas(ucmd->ictx, ioas_id);
 	if (IS_ERR(ioas))
 		return;
 	*iova = iommufd_test_syz_conv_iova(&ioas->iopt, iova);
@@ -279,7 +279,7 @@ static int iommufd_test_mock_domain(struct iommufd_ucmd *ucmd,
 	struct iommufd_ioas *ioas;
 	int rc;
 
-	ioas = iommufd_get_ioas(ucmd, cmd->id);
+	ioas = iommufd_get_ioas(ucmd->ictx, cmd->id);
 	if (IS_ERR(ioas))
 		return PTR_ERR(ioas);
 
@@ -322,7 +322,7 @@ static int iommufd_test_add_reserved(struct iommufd_ucmd *ucmd,
 	struct iommufd_ioas *ioas;
 	int rc;
 
-	ioas = iommufd_get_ioas(ucmd, mockpt_id);
+	ioas = iommufd_get_ioas(ucmd->ictx, mockpt_id);
 	if (IS_ERR(ioas))
 		return PTR_ERR(ioas);
 	down_write(&ioas->iopt.iova_rwsem);
diff --git a/drivers/iommu/iommufd/vfio_compat.c b/drivers/iommu/iommufd/vfio_compat.c
index 514494a0025b..fe02517c73cc 100644
--- a/drivers/iommu/iommufd/vfio_compat.c
+++ b/drivers/iommu/iommufd/vfio_compat.c
@@ -137,7 +137,7 @@ int iommufd_vfio_ioas(struct iommufd_ucmd *ucmd)
 		return iommufd_ucmd_respond(ucmd, sizeof(*cmd));
 
 	case IOMMU_VFIO_IOAS_SET:
-		ioas = iommufd_get_ioas(ucmd, cmd->ioas_id);
+		ioas = iommufd_get_ioas(ucmd->ictx, cmd->ioas_id);
 		if (IS_ERR(ioas))
 			return PTR_ERR(ioas);
 		xa_lock(&ucmd->ictx->objects);
-- 
2.34.1

