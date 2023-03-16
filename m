Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DB6BCFF6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926E10E1E0;
	Thu, 16 Mar 2023 12:55:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8528710E19D;
 Thu, 16 Mar 2023 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971341; x=1710507341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JW3PYKWoybv02jkMZv3/3uD6SqSJnbCZLDmpFVRAyn4=;
 b=nC1SzkNP/csw5Cick0IOFSGSBVUoYNbCMdMR5Yj9AUu2bReUKQpjg6Mr
 NPD0ZcatuXOl6r6jyILWj4MitwZ3n6kDIing97mlFyH+kNzDPje3UsVRz
 zm+7F7caeJclIzpq2byC74RIjx1Bm57++Cl7iGwQUcUf8B9WC4KpoBXEz
 m+1O4gcCvDf5wmh6mFf6uHMk49kEwmYDHScsvoTM7Bfc3xW3xuliV6eFZ
 hz7paYmu3yW8xQtmgeaLfl079+wmdKRMk1dsH2coZlmTYGhBrIE5DL76p
 XtS9de2Ox3yEO3vxf7Bn+qMfTSQVDxgz0adbuDOqHeLWzSiuPUlpIy3GO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336668014"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336668014"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="790277748"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="790277748"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2023 05:55:40 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v7 03/22] vfio: Remove vfio_file_is_group()
Date: Thu, 16 Mar 2023 05:55:15 -0700
Message-Id: <20230316125534.17216-4-yi.l.liu@intel.com>
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

since no user of vfio_file_is_group() now.

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
index 5a2e8a9d538d..a689c64432b7 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -247,7 +247,6 @@ int vfio_mig_get_next_state(struct vfio_device *device,
  * External user API
  */
 struct iommu_group *vfio_file_iommu_group(struct file *file);
-bool vfio_file_is_group(struct file *file);
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
-- 
2.34.1

