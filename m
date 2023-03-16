Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15C6BCF21
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0FB10E19F;
	Thu, 16 Mar 2023 12:15:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A6710E19F;
 Thu, 16 Mar 2023 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678968929; x=1710504929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VEHHXnITvceKuvyRb8s0oNfR89Ml+qu80c673xN20U0=;
 b=e+ncf5i0lQdjSBCT7WVCUujrDJPiWVWOea+9beA4ffcd2D5S7Cl4Vef0
 Ls6IuxjHK9cZPJAtnMfCoBTljjiqkjVr/w8AB6UivBZmiJ78eGyzfHPDm
 TFqqRU5mzbKfifYGgDVOQ+pDAaPm2aThxehYglapVPbCP+DNZwBYjtvAa
 +Rs6N/FTiUYR31TttAKHY7ONHQbDSSIKmLXKcpkX87gFNA1szFvRVFjLN
 +6yOp87+rwKnK/SpjUjuJvHo21DmQhnVDS/etvBqG8CBXo3EMjuuNAmCN
 WuxteJJ+xCR5p/3lj9oZZWaqkRbfriQbuMUCdotjzZbznQDadpvSfQ/87 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336661384"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336661384"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="679874211"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="679874211"
Received: from unknown (HELO 984fee00a4c6.jf.intel.com) ([10.165.58.231])
 by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 05:15:28 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 2/5] vfio-iommufd: No need to record iommufd_ctx in
 vfio_device
Date: Thu, 16 Mar 2023 05:15:23 -0700
Message-Id: <20230316121526.5644-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316121526.5644-1-yi.l.liu@intel.com>
References: <20230316121526.5644-1-yi.l.liu@intel.com>
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c | 10 +---------
 include/linux/vfio.h   |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 6b4b495b24c4..b576d4c7b79b 100644
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
 
@@ -174,8 +168,6 @@ int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (WARN_ON(!vdev->iommufd_ictx))
-		return -EINVAL;
 	if (WARN_ON(!vdev->iommufd_access))
 		return -ENOENT;
 	if (vdev->iommufd_attached)
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

