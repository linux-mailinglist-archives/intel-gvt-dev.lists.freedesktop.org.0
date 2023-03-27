Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E256CA006
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0A10E338;
	Mon, 27 Mar 2023 09:40:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34D710E36D;
 Mon, 27 Mar 2023 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679910051; x=1711446051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQbomtpxKk9OYrNRZAPa6vDhDDjp7Q007RS+G2Nbq0Q=;
 b=bGLxucViqYx4paNIv7NfQRRq/BIIfuhgJWLbPjdqjvMOi1uZpk/Do4XW
 xfhI/H0x5GGUCn3aGjmw1TAFqQzvMvCnWNUD1luBf4AKETUWaLsKHdJbg
 cq5GIyHUiJT28s/kyjIotn7s8jBgxN2SCOz9+8vJ2768kZX3I/8W/BFNT
 MSoaeQfR8fLnPgiKflmNdr7s+XlqbWFQOHIAkjFiaeVJNxdyPRMBKU67K
 AhAh5e8k+pwVnaR4RpjcXJx3XGN8IWDV85XPFbzrxisTgmsVfEH8ks0Oh
 IJOoGQiup1Uuxt1Yp/Nvk9MDrU+ZutdzKmn09QSTcoyywxWMtj0vjbV4k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426485238"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="426485238"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660775647"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="660775647"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 02:40:51 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 03/24] vfio: Remove vfio_file_is_group()
Date: Mon, 27 Mar 2023 02:40:26 -0700
Message-Id: <20230327094047.47215-4-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327094047.47215-1-yi.l.liu@intel.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
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
Tested-by: Terrence Xu <terrence.xu@intel.com>
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
index 79c47733ae0d..3b55dd71299b 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -257,7 +257,6 @@ int vfio_mig_get_next_state(struct vfio_device *device,
  * External user API
  */
 struct iommu_group *vfio_file_iommu_group(struct file *file);
-bool vfio_file_is_group(struct file *file);
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
-- 
2.34.1

