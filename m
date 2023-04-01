Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E86D31FC
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 17:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490D910E113;
	Sat,  1 Apr 2023 15:18:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B67610E10B;
 Sat,  1 Apr 2023 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680362318; x=1711898318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GLz5NXI+1KYeMmg5ytUfNGqA8vEqwpVcpTZviemQX7A=;
 b=JgoyUmFQKcln+u79l2MRh9GGhDxkRwxu+aVfPYaWNUH0sQGtjyaof87c
 pRthtC+wiE/QpAbhET9DUKflxaUDADov2g8A558MPQwO8jR+Odo9LJxlC
 nQp9ONU1GPTQAluu2tYJVxEpruYStVhllzuP44WX9OESRqaxlGiawbKc2
 uEyYnakim37V+a7eVfbHazOO45ABs5zU3YZQuEq2QDScHnrGnI+R0NleE
 XpwkR8/XldqYcrd189qFscZqdX0kkSR1hKIkiRLZxw1u2kzwjsD2Lovoi
 vBjnsudNpD0D7iv0kfnCD0B7EotpTviN1KDJCwvaS62byIB6Ho4Ot3oMz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404411196"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="404411196"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 08:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="678937156"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="678937156"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 01 Apr 2023 08:18:37 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 03/25] vfio: Remove vfio_file_is_group()
Date: Sat,  1 Apr 2023 08:18:11 -0700
Message-Id: <20230401151833.124749-4-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401151833.124749-1-yi.l.liu@intel.com>
References: <20230401151833.124749-1-yi.l.liu@intel.com>
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

since no user of vfio_file_is_group() now.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c | 10 ----------
 include/linux/vfio.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index ede4723c5f72..4f937ebaf6f7 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -792,16 +792,6 @@ struct iommu_group *vfio_file_iommu_group(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_file_iommu_group);
 
-/**
- * vfio_file_is_group - True if the file is a vfio group file
- * @file: VFIO group file
- */
-bool vfio_file_is_group(struct file *file)
-{
-	return vfio_group_from_file(file);
-}
-EXPORT_SYMBOL_GPL(vfio_file_is_group);
-
 bool vfio_group_enforced_coherent(struct vfio_group *group)
 {
 	struct vfio_device *device;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index d9a0770e5fc1..7519ae89fcd6 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -264,7 +264,6 @@ int vfio_mig_get_next_state(struct vfio_device *device,
  * External user API
  */
 struct iommu_group *vfio_file_iommu_group(struct file *file);
-bool vfio_file_is_group(struct file *file);
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
-- 
2.34.1

