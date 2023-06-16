Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFF732BB0
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Jun 2023 11:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3355C10E5AB;
	Fri, 16 Jun 2023 09:30:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A5A10E589;
 Fri, 16 Jun 2023 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686907848; x=1718443848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzrAn20ByJL63NIYU7HEQmy4xx7HzzCXurkAzXmi5jA=;
 b=XnvDsxC8iUbtrp1+wWLmOD2IYxUjT4XbYRyNq7yfThXXeryUh8CSG4VV
 /U2SdhkrjoQcJabX+i6BFT+uBRCs2katjesK10tgUBWkx9f6pWekPQEBm
 y0z74Zotpub5NRoqsK9535CWLhNfgJoO/Rh8SOyv8zVM+GSeMlEfI6L/C
 vciSO+P1L2FGAVjTnBHpnshjZZZMaa8+siH68HhObhYgaJ7YHHf7BtuS5
 IsLFZxy+pfsYhEpuk2YilVSQy3cBOyyyVocohZy0bIoFvEyNXL6rtwLXn
 fK2JGjGaD5WeU5DmZvopdDk+cEn8SYMaYNT8C+Qos1frWLXn9ePpO8G3L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387863495"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="387863495"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742601943"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="742601943"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 02:30:48 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 06/10] vfio: Mark cdev usage in vfio_device
Date: Fri, 16 Jun 2023 02:30:38 -0700
Message-Id: <20230616093042.65094-7-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616093042.65094-1-yi.l.liu@intel.com>
References: <20230616093042.65094-1-yi.l.liu@intel.com>
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

This can be used to differentiate whether to report group_id or devid in
the revised VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl. At this moment, no
cdev path yet, so the vfio_device_cdev_opened() helper always returns false.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 include/linux/vfio.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 2c137ea94a3e..2a45853773a6 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -139,6 +139,11 @@ int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
 	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
 #endif
 
+static inline bool vfio_device_cdev_opened(struct vfio_device *device)
+{
+	return false;
+}
+
 /**
  * struct vfio_migration_ops - VFIO bus device driver migration callbacks
  *
-- 
2.34.1

