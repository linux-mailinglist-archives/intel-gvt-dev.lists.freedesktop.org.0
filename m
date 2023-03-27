Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DD6C9FA4
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117B110E37F;
	Mon, 27 Mar 2023 09:34:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7473010E36E;
 Mon, 27 Mar 2023 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909639; x=1711445639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDM9jyf+OXhd1Zokm6qIgm/u2mKnKiVjbUza2h6GkY8=;
 b=npGvTU36mNijmwyapYATcT7ZVCTmf0y3kgiZ+19wo6s48k/NjXqwvlUm
 cG0ML0wgVAGmx2V70NC5eheAOIY/tnlR3Yu068UanMiuiHrvXvEadEue1
 9AyUQkZ2Urhg1PX+lXDjGwaVtJFuilKvOKRuOGe+FmVUXwN/rCMZ+scYh
 4vHzYZgMBsyVs9QAS6NE/2YbkCGdPnPFNsz1UeY2LvhnwFJAtG6XiQLc4
 TJ6E+qBv3zog2aOL+hl8rWw0Br8zvF4UpvoJi4eKMhm3cp+m+oUoVYe4Q
 8MAKl4fnc+t6cpix0OcNRdlFwYC6VnPl2krVSob0qfMP5bCQhUFpUc/Gm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402817958"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="402817958"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685908089"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="685908089"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 02:33:58 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 5/6] vfio/mdev: Uses the vfio emulated iommufd ops set in
 the mdev sample drivers
Date: Mon, 27 Mar 2023 02:33:50 -0700
Message-Id: <20230327093351.44505-6-yi.l.liu@intel.com>
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

This harmonizes the no-DMA devices (the vfio-mdev sample drivers) with
the emulated devices (gvt-g, vfio-ap etc.). It makes it easier to add
BIND_IOMMUFD user interface which requires to return an iommufd ID to
represent the device/iommufd bond.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c     | 14 ++++++--------
 samples/vfio-mdev/mbochs.c |  3 +++
 samples/vfio-mdev/mdpy.c   |  3 +++
 samples/vfio-mdev/mtty.c   |  3 +++
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 1ee558c0be25..890ea101685c 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -32,12 +32,8 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 		return 0;
 	}
 
-	/*
-	 * If the driver doesn't provide this op then it means the device does
-	 * not do DMA at all. So nothing to do.
-	 */
-	if (!vdev->ops->bind_iommufd)
-		return 0;
+	if (WARN_ON(!vdev->ops->bind_iommufd))
+		return -ENODEV;
 
 	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
 	if (ret)
@@ -119,7 +115,8 @@ EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
 /*
  * The emulated standard ops mean that vfio_device is going to use the
  * "mdev path" and will call vfio_pin_pages()/vfio_dma_rw(). Drivers using this
- * ops set should call vfio_register_emulated_iommu_dev().
+ * ops set should call vfio_register_emulated_iommu_dev(). Drivers that do
+ * not call vfio_pin_pages()/vfio_dma_rw() have no need to provide dma_unmap.
  */
 
 static void vfio_emulated_unmap(void *data, unsigned long iova,
@@ -127,7 +124,8 @@ static void vfio_emulated_unmap(void *data, unsigned long iova,
 {
 	struct vfio_device *vdev = data;
 
-	vdev->ops->dma_unmap(vdev, iova, length);
+	if (vdev->ops->dma_unmap)
+		vdev->ops->dma_unmap(vdev, iova, length);
 }
 
 static const struct iommufd_access_ops vfio_user_ops = {
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index e54eb752e1ba..19391dda5fba 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1374,6 +1374,9 @@ static const struct vfio_device_ops mbochs_dev_ops = {
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
 	.mmap = mbochs_mmap,
+	.bind_iommufd	= vfio_iommufd_emulated_bind,
+	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
+	.attach_ioas	= vfio_iommufd_emulated_attach_ioas,
 };
 
 static struct mdev_driver mbochs_driver = {
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index e8400fdab71d..5f48aef36995 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -663,6 +663,9 @@ static const struct vfio_device_ops mdpy_dev_ops = {
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
 	.mmap = mdpy_mmap,
+	.bind_iommufd	= vfio_iommufd_emulated_bind,
+	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
+	.attach_ioas	= vfio_iommufd_emulated_attach_ioas,
 };
 
 static struct mdev_driver mdpy_driver = {
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index e887de672c52..35460901b9f7 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1269,6 +1269,9 @@ static const struct vfio_device_ops mtty_dev_ops = {
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
+	.bind_iommufd	= vfio_iommufd_emulated_bind,
+	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
+	.attach_ioas	= vfio_iommufd_emulated_attach_ioas,
 };
 
 static struct mdev_driver mtty_driver = {
-- 
2.34.1

