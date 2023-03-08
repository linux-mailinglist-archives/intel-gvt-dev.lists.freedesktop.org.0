Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E06B082A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C95B10E683;
	Wed,  8 Mar 2023 13:13:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73EA10E671;
 Wed,  8 Mar 2023 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678281233; x=1709817233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=orhBmr8BRwp6o5biW3bryky9mUz7L+UcOv8AJ7UhNN8=;
 b=O5+lPi9bFkO8EoEUWLQzm1NOTGq/UF2j4JFjmThe59EG9QNFeEMVRMKV
 WKBs/BHHBrBa3LagIFZCXCuPnPha4lv4hIAl0rZhdRoD2IRzQNwaRX+T8
 ZxNIP+3dzq24PV/NjUq42eHRCRVEneZfngrdGsERzdZJA45c7bAQ+lq6s
 Kb69od6g0vA32lPzZLs3KR3Ers8xdGByNzAUfc07OHzxT3q4kBx6eQdeO
 noB7Z4M2J8aKEorbTC9sG7iQH1sSTY+0tYNNQt1H2BOpEtziD/XlUB8Sf
 GjeF43WXjp5ZzSew3kg04MgH1nrBUwcXGsz5BAXQzWKi465iAkXNjvRQ0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338474819"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="338474819"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670330914"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="670330914"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 05:13:43 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v1 2/5] vfio-iommufd: No need to record iommufd_ctx in
 vfio_device
Date: Wed,  8 Mar 2023 05:13:37 -0800
Message-Id: <20230308131340.459224-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308131340.459224-1-yi.l.liu@intel.com>
References: <20230308131340.459224-1-yi.l.liu@intel.com>
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

iommufd_ctx is stored in vfio_device for emulated devices per bind_iommufd.
However, as iommufd_access is created in bind, no more need to stored it
since iommufd_access implicitly stores it.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c | 10 +---------
 include/linux/vfio.h   |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 1f87294c1931..b55f94271cc7 100644
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
@@ -162,8 +158,6 @@ void vfio_iommufd_emulated_unbind(struct vfio_device *vdev)
 		iommufd_access_destroy(vdev->iommufd_access);
 		vdev->iommufd_access = NULL;
 	}
-	iommufd_ctx_put(vdev->iommufd_ictx);
-	vdev->iommufd_ictx = NULL;
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_unbind);
 
@@ -171,8 +165,6 @@ int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (!vdev->iommufd_ictx)
-		return -EINVAL;
 	if (!vdev->iommufd_access)
 		return -ENOENT;
 	return iommufd_access_set_ioas(vdev->iommufd_access, *pt_id);
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

