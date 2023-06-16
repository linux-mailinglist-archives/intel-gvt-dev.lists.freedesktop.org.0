Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AEA732BA6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Jun 2023 11:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C41610E59A;
	Fri, 16 Jun 2023 09:30:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4838110E589;
 Fri, 16 Jun 2023 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686907848; x=1718443848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udkX/cgsswy+TExcMSy8dLbUVqPVtulKW+w7yxu9SyI=;
 b=JRsfXbOzgVPInbD5YoiJOu6LPD3+W0LXvcJUrb9zkYz4cuKtQUjlFrMr
 RP5YpOpZv/VeW7sYUJNBPimsY+gLagTtTexkVceUK40dlOaC4q9pN2V2Y
 Qwu+crkUvTqeEVsRkqcKZpsO22UOD4L1fs1R/gv9mSmTwZN5rfdWF32xF
 GxAGUDoObEfIBTpYfGZc5ShAZUAAZI5a6Y50cX6Vs0vXtBiaulFPwnHwu
 h2/5rV2Mp4ZkCc0VJBJndlF6qqH5kzCKgwc3Ch6MuOxOnoki89zDP3mUy
 3yC1vdzhwByG6DAMJoUkWhjwLIFmZXTInXxVi3UslvLF0xW/q/SguWRb7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387863482"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="387863482"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742601939"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="742601939"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 02:30:47 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 05/10] iommufd: Add helper to retrieve iommufd_ctx and devid
Date: Fri, 16 Jun 2023 02:30:37 -0700
Message-Id: <20230616093042.65094-6-yi.l.liu@intel.com>
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

This is needed by the vfio-pci driver to report affected devices in the
hot-reset for a given device.

Tested-by: Terrence Xu <terrence.xu@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c | 12 ++++++++++++
 include/linux/iommufd.h        |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 4571344c8508..96d4281bfa7c 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -146,6 +146,18 @@ void iommufd_device_unbind(struct iommufd_device *idev)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_device_unbind, IOMMUFD);
 
+struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev)
+{
+	return idev->ictx;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_device_to_ictx, IOMMUFD);
+
+u32 iommufd_device_to_id(struct iommufd_device *idev)
+{
+	return idev->obj.id;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, IOMMUFD);
+
 static int iommufd_device_setup_msi(struct iommufd_device *idev,
 				    struct iommufd_hw_pagetable *hwpt,
 				    phys_addr_t sw_msi_start)
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index f241bafa03da..68defed9ea48 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -25,6 +25,9 @@ void iommufd_device_unbind(struct iommufd_device *idev);
 int iommufd_device_attach(struct iommufd_device *idev, u32 *pt_id);
 void iommufd_device_detach(struct iommufd_device *idev);
 
+struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev);
+u32 iommufd_device_to_id(struct iommufd_device *idev);
+
 struct iommufd_access_ops {
 	u8 needs_pin_pages : 1;
 	void (*unmap)(void *data, unsigned long iova, unsigned long length);
-- 
2.34.1

