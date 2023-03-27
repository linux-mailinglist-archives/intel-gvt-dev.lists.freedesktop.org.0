Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A4C6C9F9E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E69710E378;
	Mon, 27 Mar 2023 09:34:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D8710E36D;
 Mon, 27 Mar 2023 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909637; x=1711445637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okGxzd81Q5tsYlJwDdxwAay9Wu2nwtxEkgJJaf6riOA=;
 b=Y3o/L5MIssX4jkApvtBuSiJu8B/GkSiNcZy+AJ+GZRrkw01+bSQAeePz
 rjsqnJel3JPx9QT+06Vk3URD3WSqmmJK5hJjpQAe2FO689C5tP4fCc4nZ
 zm1dqYY0xkrDfRcK/cednNB4+kVVj4nOQjRV5dJoIHleoWCeGxK2hw6ah
 p0J9CTv62AwkwXmIDa9LKqzelSTdxTaO7OH/rPQWIXWFUy3A+AlbIp4s5
 NP7nc845T7prJfKWsT20DjhaLI2ZzQbDvsUNY/gZP871oIp4nRg1F6W0/
 g/HZ2jaLVWQBH21Cibt4X6ZVpc4/66DFMtm3b/4Rar0otYTOaj0ZDVSLv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402817933"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="402817933"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685908082"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="685908082"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 02:33:56 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 3/6] vfio-iommufd: No need to record iommufd_ctx in
 vfio_device
Date: Mon, 27 Mar 2023 02:33:48 -0700
Message-Id: <20230327093351.44505-4-yi.l.liu@intel.com>
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

iommufd_ctx is stored in vfio_device for emulated devices per bind_iommufd.
However, as iommufd_access is created in bind, no more need to stored it
since iommufd_access implicitly stores it.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c | 8 +-------
 include/linux/vfio.h   | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 0695a06db30d..78e2486586d7 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -142,14 +142,10 @@ int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	iommufd_ctx_get(ictx);
 	user = iommufd_access_create(ictx, &vfio_user_ops, vdev);
-	if (IS_ERR(user)) {
-		iommufd_ctx_put(ictx);
+	if (IS_ERR(user))
 		return PTR_ERR(user);
-	}
 	vdev->iommufd_access = user;
-	vdev->iommufd_ictx = ictx;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_bind);
@@ -163,8 +159,6 @@ void vfio_iommufd_emulated_unbind(struct vfio_device *vdev)
 		vdev->iommufd_attached = false;
 		vdev->iommufd_access = NULL;
 	}
-	iommufd_ctx_put(vdev->iommufd_ictx);
-	vdev->iommufd_ictx = NULL;
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_unbind);
 
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 93134b023968..3188d8a374bd 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -60,7 +60,6 @@ struct vfio_device {
 	void (*put_kvm)(struct kvm *kvm);
 #if IS_ENABLED(CONFIG_IOMMUFD)
 	struct iommufd_device *iommufd_device;
-	struct iommufd_ctx *iommufd_ictx;
 	bool iommufd_attached;
 #endif
 };
-- 
2.34.1

