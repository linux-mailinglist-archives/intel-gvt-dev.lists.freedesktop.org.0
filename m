Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2986BCF23
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9D310ECC4;
	Thu, 16 Mar 2023 12:15:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0432710E19F;
 Thu, 16 Mar 2023 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678968931; x=1710504931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IYwmJkJhej3FobgFXSTgzXhZZzLMmukcDQZuUXtxfLM=;
 b=BNrhmac7hNCJajdDF4jZIeh5PSRBKCP4dRjpP5FwqKTJ3t1Y8lj1t8aO
 DxvPs7J6hc91wCzRnQBOC8Fe4L41LiLprAl/NUBdKqwqgHuXGfeUnwJ9D
 Y8c2AmXw67O/yVLYNKUEoJs1867sYZz0fJbhYEEMdJzRMx6dU8V3JuvV9
 4cwuiWBtsPM+3Oj7bCsWVnRUdnNiEywBZjQW9USK7u9kVi2fXE0lIulIh
 xVrDb3SvbGq6FNwc8KNzTMgDLCc6zU7eut1s+w2RHpSnDxzpacXUQIZUp
 w0QX6iYF+pRfUUkBHbhFUfeKM0p5nV/tGFQSP8oI8AAzmXT2Ubcdde2hr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336661405"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336661405"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="679874218"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="679874218"
Received: from unknown (HELO 984fee00a4c6.jf.intel.com) ([10.165.58.231])
 by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 05:15:30 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 4/5] vfio/mdev: Uses the vfio emulated iommufd ops set in
 the mdev sample drivers
Date: Thu, 16 Mar 2023 05:15:25 -0700
Message-Id: <20230316121526.5644-5-yi.l.liu@intel.com>
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

This harmonizes the no-DMA devices (the vfio-mdev sample drivers) with
the emulated devices (gvt-g, vfio-ap etc.). It makes it easier to add
BIND_IOMMUFD user interface which requires to return an iommufd ID to
represent the device/iommufd bond.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c     | 14 ++++++--------
 samples/vfio-mdev/mbochs.c |  3 +++
 samples/vfio-mdev/mdpy.c   |  3 +++
 samples/vfio-mdev/mtty.c   |  3 +++
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index e40c0e9fea30..345ff8cf29e7 100644
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

