Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7B701700
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1796810E0CD;
	Sat, 13 May 2023 13:21:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86FA10E0CA;
 Sat, 13 May 2023 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984109; x=1715520109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JPKn3Comiif0UnOhEse9L3Rl82bLgc6qyUnZga0nLkQ=;
 b=emHKufkf77NNUdJrtnU16j55cNxGLuC/xQPFANUDDnFGvrfmcRVWRdoZ
 koIC278W1id4jCf8nBW1MwB6Jw59o/ndQkjAUaV7fK4i3e0PILmAehdYW
 HxLE0WI9l3kHLSl41sFQzm44Q+g3x1Pnat7HVuFHaUjYHtirvVT5cuYIR
 69vCWZwoXNbp7cVq6qWNN6Qc4AIrcHbekXKfVuDbunh1mpn070CHLoaJ4
 uKVRYqTJkjvp73Wi/1RlvWxI60jjSRULdjrVQ3RtNXQtlJnO1eCWHpbwC
 FnVV/qFTZmadhCnwAfMafu/+PJbCt8WRLNBs67C+dTrKI2Ax9aVRDf05N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="416599032"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="416599032"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="790126468"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="790126468"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by FMSMGA003.fm.intel.com with ESMTP; 13 May 2023 06:21:48 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 08/10] iommufd: Add iommufd_ctx_has_group()
Date: Sat, 13 May 2023 06:21:34 -0700
Message-Id: <20230513132136.15021-9-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513132136.15021-1-yi.l.liu@intel.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
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

to check if any device within the given iommu_group has been bound with
the iommufd_ctx. This helpful for the checking on device ownership for
the devices which have been bound but cannot be bound to any other iommufd
as the iommu_group has been bound.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c | 29 +++++++++++++++++++++++++++++
 include/linux/iommufd.h        |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 81466b97023f..5e5f7912807b 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -98,6 +98,35 @@ struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_device_bind, IOMMUFD);
 
+/**
+ * iommufd_ctx_has_group - True if the struct device is bound to this ictx
+ * @ictx: iommufd file descriptor
+ * @group: Pointer to a physical iommu_group struct
+ *
+ * True if a iommufd_device_bind() is present for any device within the
+ * group.
+ */
+bool iommufd_ctx_has_group(struct iommufd_ctx *ictx, struct iommu_group *group)
+{
+	struct iommufd_object *obj;
+	unsigned long index;
+
+	if (!ictx || !group)
+		return false;
+
+	xa_lock(&ictx->objects);
+	xa_for_each(&ictx->objects, index, obj) {
+		if (obj->type == IOMMUFD_OBJ_DEVICE &&
+		    container_of(obj, struct iommufd_device, obj)->group == group) {
+			xa_unlock(&ictx->objects);
+			return true;
+		}
+	}
+	xa_unlock(&ictx->objects);
+	return false;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_ctx_has_group, IOMMUFD);
+
 /**
  * iommufd_device_unbind - Undo iommufd_device_bind()
  * @idev: Device returned by iommufd_device_bind()
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 68cd65274e28..e49c16cd6831 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -16,6 +16,7 @@ struct page;
 struct iommufd_ctx;
 struct iommufd_access;
 struct file;
+struct iommu_group;
 
 struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
 					   struct device *dev, u32 *id);
@@ -56,6 +57,7 @@ void iommufd_ctx_get(struct iommufd_ctx *ictx);
 #if IS_ENABLED(CONFIG_IOMMUFD)
 struct iommufd_ctx *iommufd_ctx_from_file(struct file *file);
 void iommufd_ctx_put(struct iommufd_ctx *ictx);
+bool iommufd_ctx_has_group(struct iommufd_ctx *ictx, struct iommu_group *group);
 
 int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 			     unsigned long length, struct page **out_pages,
@@ -77,6 +79,12 @@ static inline void iommufd_ctx_put(struct iommufd_ctx *ictx)
 {
 }
 
+static inline bool iommufd_ctx_has_group(struct iommufd_ctx *ictx,
+					 struct iommu_group *group)
+{
+	return false;
+}
+
 static inline int iommufd_access_pin_pages(struct iommufd_access *access,
 					   unsigned long iova,
 					   unsigned long length,
-- 
2.34.1

