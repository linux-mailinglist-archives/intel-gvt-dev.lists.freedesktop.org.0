Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB6732C10
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Jun 2023 11:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D0F10E5D1;
	Fri, 16 Jun 2023 09:40:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D056010E5CE;
 Fri, 16 Jun 2023 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686908418; x=1718444418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WgZ5awANFSlN9fbVVjctLbLRvAhiilRbLT9mJCLKiZ0=;
 b=S57GQWSWv9tHkVV575UKrNr76QY5utweVFkn0eEO8T9LMEnIY4BpuqyM
 zBXNPCwSu+OMegplhFKLJO/xaI8uWkz2NdVOGZLnT+rBojg2Od8w/ThH6
 foZ+STrGPLpsQJGtpu1L+oGyK6t2/EotBVvMvPz9+yHrE2T2ktSrYmhs+
 0x6VASnH5pj+6BIB9Oho7ac0027MX4sU1FmjtAQSCzr2GnAg3UqbDiosW
 uHTif7VznfhpuNV9HlPpj9OcFWA+LLfdCg5+cHklztFJ4e8Wv757F8yt1
 otDhVTTIEssf1q87gYifCvtUQA5RH8C8dGtr/+wfkmX421s70YFE5EWtX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361700356"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="361700356"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715951189"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="715951189"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2023 02:40:16 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v13 13/22] vfio-iommufd: Add detach_ioas support for physical
 VFIO devices
Date: Fri, 16 Jun 2023 02:39:37 -0700
Message-Id: <20230616093946.68711-14-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616093946.68711-1-yi.l.liu@intel.com>
References: <20230616093946.68711-1-yi.l.liu@intel.com>
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

This prepares for adding DETACH ioctl for physical VFIO devices.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 Documentation/driver-api/vfio.rst             |  8 +++++---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  1 +
 drivers/vfio/iommufd.c                        | 20 +++++++++++++++++++
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  2 ++
 drivers/vfio/pci/mlx5/main.c                  |  1 +
 drivers/vfio/pci/vfio_pci.c                   |  1 +
 drivers/vfio/platform/vfio_amba.c             |  1 +
 drivers/vfio/platform/vfio_platform.c         |  1 +
 drivers/vfio/vfio_main.c                      |  3 ++-
 include/linux/vfio.h                          |  8 +++++++-
 10 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
index 68abc089d6dd..363e12c90b87 100644
--- a/Documentation/driver-api/vfio.rst
+++ b/Documentation/driver-api/vfio.rst
@@ -279,6 +279,7 @@ similar to a file operations structure::
 					struct iommufd_ctx *ictx, u32 *out_device_id);
 		void	(*unbind_iommufd)(struct vfio_device *vdev);
 		int	(*attach_ioas)(struct vfio_device *vdev, u32 *pt_id);
+		void	(*detach_ioas)(struct vfio_device *vdev);
 		int	(*open_device)(struct vfio_device *vdev);
 		void	(*close_device)(struct vfio_device *vdev);
 		ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
@@ -315,9 +316,10 @@ container_of().
 	- The [un]bind_iommufd callbacks are issued when the device is bound to
 	  and unbound from iommufd.
 
-	- The attach_ioas callback is issued when the device is attached to an
-	  IOAS managed by the bound iommufd. The attached IOAS is automatically
-	  detached when the device is unbound from iommufd.
+	- The [de]attach_ioas callback is issued when the device is attached to
+	  and detached from an IOAS managed by the bound iommufd. However, the
+	  attached IOAS can also be automatically detached when the device is
+	  unbound from iommufd.
 
 	- The read/write/mmap callbacks implement the device region access defined
 	  by the device's own VFIO_DEVICE_GET_REGION_INFO ioctl.
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index c89a047a4cd8..d540cf683d93 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -594,6 +594,7 @@ static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.bind_iommufd	= vfio_iommufd_physical_bind,
 	.unbind_iommufd	= vfio_iommufd_physical_unbind,
 	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
+	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
 };
 
 static struct fsl_mc_driver vfio_fsl_mc_driver = {
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 4fc674c01a05..86df5415759a 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -140,6 +140,14 @@ int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 {
 	int rc;
 
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (WARN_ON(!vdev->iommufd_device))
+		return -EINVAL;
+
+	if (vdev->iommufd_attached)
+		return -EBUSY;
+
 	rc = iommufd_device_attach(vdev->iommufd_device, pt_id);
 	if (rc)
 		return rc;
@@ -148,6 +156,18 @@ int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
 
+void vfio_iommufd_physical_detach_ioas(struct vfio_device *vdev)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (WARN_ON(!vdev->iommufd_device) || !vdev->iommufd_attached)
+		return;
+
+	iommufd_device_detach(vdev->iommufd_device);
+	vdev->iommufd_attached = false;
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_physical_detach_ioas);
+
 /*
  * The emulated standard ops mean that vfio_device is going to use the
  * "mdev path" and will call vfio_pin_pages()/vfio_dma_rw(). Drivers using this
diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
index a117eaf21c14..b2f9778c8366 100644
--- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
+++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
@@ -1373,6 +1373,7 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_migrn_ops = {
 	.bind_iommufd = vfio_iommufd_physical_bind,
 	.unbind_iommufd = vfio_iommufd_physical_unbind,
 	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
 };
 
 static const struct vfio_device_ops hisi_acc_vfio_pci_ops = {
@@ -1391,6 +1392,7 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_ops = {
 	.bind_iommufd = vfio_iommufd_physical_bind,
 	.unbind_iommufd = vfio_iommufd_physical_unbind,
 	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
 };
 
 static int hisi_acc_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
diff --git a/drivers/vfio/pci/mlx5/main.c b/drivers/vfio/pci/mlx5/main.c
index d95fd382814c..42ec574a8622 100644
--- a/drivers/vfio/pci/mlx5/main.c
+++ b/drivers/vfio/pci/mlx5/main.c
@@ -1320,6 +1320,7 @@ static const struct vfio_device_ops mlx5vf_pci_ops = {
 	.bind_iommufd = vfio_iommufd_physical_bind,
 	.unbind_iommufd = vfio_iommufd_physical_unbind,
 	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
 };
 
 static int mlx5vf_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 29091ee2e984..cb5b7f865d58 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -141,6 +141,7 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.bind_iommufd	= vfio_iommufd_physical_bind,
 	.unbind_iommufd	= vfio_iommufd_physical_unbind,
 	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
+	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
 };
 
 static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index 83fe54015595..6464b3939ebc 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -119,6 +119,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
 	.bind_iommufd	= vfio_iommufd_physical_bind,
 	.unbind_iommufd	= vfio_iommufd_physical_unbind,
 	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
+	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
 };
 
 static const struct amba_id pl330_ids[] = {
diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 22a1efca32a8..8cf22fa65baa 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -108,6 +108,7 @@ static const struct vfio_device_ops vfio_platform_ops = {
 	.bind_iommufd	= vfio_iommufd_physical_bind,
 	.unbind_iommufd	= vfio_iommufd_physical_unbind,
 	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
+	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
 };
 
 static struct platform_driver vfio_platform_driver = {
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 3a4b7eb128df..c71c0d1a079f 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -273,7 +273,8 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (WARN_ON(IS_ENABLED(CONFIG_IOMMUFD) &&
 		    (!device->ops->bind_iommufd ||
 		     !device->ops->unbind_iommufd ||
-		     !device->ops->attach_ioas)))
+		     !device->ops->attach_ioas ||
+		     !device->ops->detach_ioas)))
 		return -EINVAL;
 
 	/*
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 06a5221949c5..f2f02273ece1 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -73,7 +73,9 @@ struct vfio_device {
  * @bind_iommufd: Called when binding the device to an iommufd
  * @unbind_iommufd: Opposite of bind_iommufd
  * @attach_ioas: Called when attaching device to an IOAS/HWPT managed by the
- *		 bound iommufd. Undo in unbind_iommufd.
+ *		 bound iommufd. Undo in unbind_iommufd if @detach_ioas is not
+ *		 called.
+ * @detach_ioas: Opposite of attach_ioas
  * @open_device: Called when the first file descriptor is opened for this device
  * @close_device: Opposite of open_device
  * @read: Perform read(2) on device file descriptor
@@ -97,6 +99,7 @@ struct vfio_device_ops {
 				struct iommufd_ctx *ictx, u32 *out_device_id);
 	void	(*unbind_iommufd)(struct vfio_device *vdev);
 	int	(*attach_ioas)(struct vfio_device *vdev, u32 *pt_id);
+	void	(*detach_ioas)(struct vfio_device *vdev);
 	int	(*open_device)(struct vfio_device *vdev);
 	void	(*close_device)(struct vfio_device *vdev);
 	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
@@ -120,6 +123,7 @@ int vfio_iommufd_physical_bind(struct vfio_device *vdev,
 			       struct iommufd_ctx *ictx, u32 *out_device_id);
 void vfio_iommufd_physical_unbind(struct vfio_device *vdev);
 int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
+void vfio_iommufd_physical_detach_ioas(struct vfio_device *vdev);
 int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
 			       struct iommufd_ctx *ictx, u32 *out_device_id);
 void vfio_iommufd_emulated_unbind(struct vfio_device *vdev);
@@ -144,6 +148,8 @@ vfio_iommufd_get_dev_id(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 	((void (*)(struct vfio_device *vdev)) NULL)
 #define vfio_iommufd_physical_attach_ioas \
 	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
+#define vfio_iommufd_physical_detach_ioas \
+	((void (*)(struct vfio_device *vdev)) NULL)
 #define vfio_iommufd_emulated_bind                                      \
 	((int (*)(struct vfio_device *vdev, struct iommufd_ctx *ictx,   \
 		  u32 *out_device_id)) NULL)
-- 
2.34.1

