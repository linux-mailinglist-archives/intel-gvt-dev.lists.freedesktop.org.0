Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA586EF6D5
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 16:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDAF10E694;
	Wed, 26 Apr 2023 14:54:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B0810E39F;
 Wed, 26 Apr 2023 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682520875; x=1714056875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=io8hL9bTUpAjOWSG+LYha6CPKcMkhPDUJOxDgMz4F3c=;
 b=di0q9kjddOmMibLKyv3hwMmpwoEqs2DfvTGMsVHkLGHkcpRXOOVphFi1
 LnclwTjfu1iXZtDVGrHN4vvQJbcrtQfXCSLyPxkO1tMlN1/UarYgmgBb7
 S68Ei4h/gJ567LigzfYgyF3mV3CTAV7c2aWLvhTWxgWl+53ztTljiFPxF
 ND5hKFL85CQKEq9TfTVViraiLMkWEHkY9OZ4jNJ2g7BJvHXEFzVtcm1bU
 MEzWSoXdluBVQdYnq6IZWsxNKIU7mLzHtzuL6nhi7vnsTAADgWrdMQQXK
 QfqPR0cjh6AGhtH1J7vmMok1ex6OqRDMMY+WiV53wmC/YwViy1K6240CC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433410320"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="433410320"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 07:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758644033"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="758644033"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 07:54:34 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 5/9] vfio: Mark cdev usage in vfio_device
Date: Wed, 26 Apr 2023 07:54:15 -0700
Message-Id: <20230426145419.450922-6-yi.l.liu@intel.com>
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

Use it to differentiate whether to report group_id or dev_id in revised
VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl. Though it is not set at this
moment introducing it now allows us to get hot reset ready for cdev.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 include/linux/vfio.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 4ee613924435..298f4ef16be7 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -63,6 +63,7 @@ struct vfio_device {
 	bool iommufd_attached;
 #endif
 	bool noiommu;
+	bool cdev_opened;
 };
 
 /**
@@ -140,6 +141,12 @@ int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
 	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
 #endif
 
+static inline bool vfio_device_cdev_opened(struct vfio_device *device)
+{
+	lockdep_assert_held(&device->dev_set->lock);
+	return device->cdev_opened;
+}
+
 /**
  * struct vfio_migration_ops - VFIO bus device driver migration callbacks
  *
-- 
2.34.1

