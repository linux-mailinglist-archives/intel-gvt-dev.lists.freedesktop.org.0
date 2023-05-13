Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20207016DC
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2797010E0BD;
	Sat, 13 May 2023 13:21:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E34910E0B6;
 Sat, 13 May 2023 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984100; x=1715520100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Jud81j68GXwp1AZyUJqqegxBroEGFVO9r8F7tMxbEk=;
 b=VmnZAbkWd6jxEEfnxQQHRv6VQAIG99jzkrr54FzcoftnaE819hs6Jj6N
 SUKS7nQiobqHwrKrwKWCzuW+EwmsGs5mBrgPlWB8HoqpMkRW3+sDA7muz
 EwjIyQ7KaLaFyzildCq6oHHWgDGGbthQHQfuahzpTVXVPATb5iHWG3Cn6
 AdV85G2dsJigy69aAmCdtj+WQZLs+WphyA5y16i4mnhbBEFOWf5QzBSE+
 VpzEzzfzaLnGv9mE5qcOR8nPgW+9fBP7omBDTbnAPWhqKzMm7Fa+Df4Dl
 ICp9XEqbzlPCNfHBVv0kLdYhVzwja3lvYzi9wTJ59k/Xwz7yc/Ks3zMIw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="416598951"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="416598951"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="790126430"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="790126430"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by FMSMGA003.fm.intel.com with ESMTP; 13 May 2023 06:21:39 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 01/10] vfio-iommufd: Create iommufd_access for noiommu
 devices
Date: Sat, 13 May 2023 06:21:27 -0700
Message-Id: <20230513132136.15021-2-yi.l.liu@intel.com>
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

This binds noiommu device to iommufd and creates iommufd_access for this
bond. This is useful for adding an iommufd-based device ownership check
for VFIO_DEVICE_PCI_HOT_RESET since this model requires all the other
affected devices bound to the same iommufd as the device to be reset.
For noiommu devices, there is no backend iommu, so create iommufd_access
instead of iommufd_device.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c | 43 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/vfio.h   |  1 +
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 88b00c501015..c1379e826052 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -10,6 +10,42 @@
 MODULE_IMPORT_NS(IOMMUFD);
 MODULE_IMPORT_NS(IOMMUFD_VFIO);
 
+static void vfio_noiommu_access_unmap(void *data, unsigned long iova,
+				      unsigned long length)
+{
+}
+
+static const struct iommufd_access_ops vfio_user_noiommu_ops = {
+	.needs_pin_pages = 1,
+	.unmap = vfio_noiommu_access_unmap,
+};
+
+static int vfio_iommufd_noiommu_bind(struct vfio_device *vdev,
+				     struct iommufd_ctx *ictx,
+				     u32 *out_device_id)
+{
+	struct iommufd_access *user;
+
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	user = iommufd_access_create(ictx, &vfio_user_noiommu_ops,
+				     vdev, out_device_id);
+	if (IS_ERR(user))
+		return PTR_ERR(user);
+	vdev->noiommu_access = user;
+	return 0;
+}
+
+static void vfio_iommufd_noiommu_unbind(struct vfio_device *vdev)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (vdev->noiommu_access) {
+		iommufd_access_destroy(vdev->noiommu_access);
+		vdev->noiommu_access = NULL;
+	}
+}
+
 int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 {
 	u32 ioas_id;
@@ -29,7 +65,8 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 		 */
 		if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
 			return -EPERM;
-		return 0;
+
+		return vfio_iommufd_noiommu_bind(vdev, ictx, &device_id);
 	}
 
 	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
@@ -59,8 +96,10 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev))
+	if (vfio_device_is_noiommu(vdev)) {
+		vfio_iommufd_noiommu_unbind(vdev);
 		return;
+	}
 
 	if (vdev->ops->unbind_iommufd)
 		vdev->ops->unbind_iommufd(vdev);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 2c137ea94a3e..16fd04490550 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -57,6 +57,7 @@ struct vfio_device {
 	struct list_head group_next;
 	struct list_head iommu_entry;
 	struct iommufd_access *iommufd_access;
+	struct iommufd_access *noiommu_access;
 	void (*put_kvm)(struct kvm *kvm);
 #if IS_ENABLED(CONFIG_IOMMUFD)
 	struct iommufd_device *iommufd_device;
-- 
2.34.1

