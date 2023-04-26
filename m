Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43806EF6CB
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 16:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B844F10E436;
	Wed, 26 Apr 2023 14:54:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076A610E436;
 Wed, 26 Apr 2023 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682520869; x=1714056869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sdoYFPhd6sLPYPVG93DO+sP/RGUhPCk04kqwDwb+nRY=;
 b=gWUQy0Sx4SdCWnqExy1Wfu1gV+y6kb01sWoojm4vfMtZCBVC+9HZGufK
 1fWRWVAF9MQwnVScQrhOnverjLAht/PyABr6HkJFd3aieK2EfGkXhWjfr
 2KSTFgFyh+pwwOX+g0VV9rsnh6puGF7KHmB/G5RzjGGVd8ZCgk7TqJWQo
 8j+ehpIkDaB8EB3IkFc/+ARfw3DGKwDlPRH3at1M0LI8DijoUrWHFu2FO
 gFYfPtmPLF2yOEXKhyuEFB9MPw+rvTjpp37ToREsNydMbPqi9pxeHCJ4g
 lr42tgyl+wUIiO/hrsGzpXg/hik6u7MzrgHCPLQ2NMP1fucqXSyHpktsV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433410252"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="433410252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 07:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758644002"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="758644002"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 07:54:27 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 2/9] vfio-iommufd: Create iommufd_access for noiommu devices
Date: Wed, 26 Apr 2023 07:54:12 -0700
Message-Id: <20230426145419.450922-3-yi.l.liu@intel.com>
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

This binds noiommu device to iommufd and creates iommufd_access for this
bond. This is useful for adding an iommufd-based device ownership check
for VFIO_DEVICE_PCI_HOT_RESET since this model requires all the other
affected devices bound to the same iommufd as the device to be reset.
For noiommu devices, there is no backend iommu, so create iommufd_access
instead of iommufd_device.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 895852ad37ed..ca29c4feded3 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -29,7 +29,8 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 		 */
 		if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
 			return -EPERM;
-		return 0;
+
+		return vfio_iommufd_emulated_bind(vdev, ictx, &device_id);
 	}
 
 	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
@@ -59,8 +60,10 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vdev->noiommu)
+	if (vdev->noiommu) {
+		vfio_iommufd_emulated_unbind(vdev);
 		return;
+	}
 
 	if (vdev->ops->unbind_iommufd)
 		vdev->ops->unbind_iommufd(vdev);
@@ -110,10 +113,14 @@ int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
 
 /*
- * The emulated standard ops mean that vfio_device is going to use the
- * "mdev path" and will call vfio_pin_pages()/vfio_dma_rw(). Drivers using this
- * ops set should call vfio_register_emulated_iommu_dev(). Drivers that do
- * not call vfio_pin_pages()/vfio_dma_rw() have no need to provide dma_unmap.
+ * The emulated standard ops can be used by below usages:
+ * 1) The vfio_device that is going to use the "mdev path" and will call
+ *    vfio_pin_pages()/vfio_dma_rw().  Such drivers using should call
+ *    vfio_register_emulated_iommu_dev().  Drivers that do not call
+ *    vfio_pin_pages()/vfio_dma_rw() have no need to provide dma_unmap.
+ * 2) The noiommu device which doesn't have backend iommu but creating
+ *    an iommufd_access allows generating a dev_id for it. noiommu device
+ *    is not allowed to do map/unmap so this becomes a nop.
  */
 
 static void vfio_emulated_unmap(void *data, unsigned long iova,
@@ -121,7 +128,8 @@ static void vfio_emulated_unmap(void *data, unsigned long iova,
 {
 	struct vfio_device *vdev = data;
 
-	if (vdev->ops->dma_unmap)
+	/* noiommu devices cannot do map/unmap */
+	if (vdev->noiommu && vdev->ops->dma_unmap)
 		vdev->ops->dma_unmap(vdev, iova, length);
 }
 
-- 
2.34.1

