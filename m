Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C051474E4CC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jul 2023 04:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1510E2FF;
	Tue, 11 Jul 2023 02:59:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D410E2F6;
 Tue, 11 Jul 2023 02:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689044385; x=1720580385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q1IBxtENreckLEiMRnEpt2ROIh6+2qhm+jn2dP7M9Lo=;
 b=igawP1wC/9aoOwvrwQZ3YhkpVEp1xsBuxCkV/l3DUIX42qGija8rTrpD
 4lOKXnhwMF1I1kuIOg0jO+z3wECxp+aOW4l3qzGlFjZpEtifSbSlNaA1G
 Wb3EPZE/r8KhuCrc6CDVaPg6AViedPDmummM4DAH+vSWa8UBwZ96GOj/a
 GxPT0pu9nYUP6V59nMD8l5FcYOJM1fJjSRQaCz0Ps7HXYDvAWNpKtMuaU
 E0aTe3TuUiHHjl66WFVNFQmCZrpb0zUFjr3dEDPE3vfZ7B5+LmNXtvdw9
 69lCI9baZ2hajC/OJ/bqqFsx3e7NLaK4fgbwGtxRfsWruGWexPJAOSBd7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361973100"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="361973100"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724250855"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="724250855"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 19:59:41 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v14 12/26] vfio: Record devid in vfio_device_file
Date: Mon, 10 Jul 2023 19:59:14 -0700
Message-Id: <20230711025928.6438-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711025928.6438-1-yi.l.liu@intel.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
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

.bind_iommufd() will generate an ID to represent this bond, which is
needed by userspace for further usage. Store devid in vfio_device_file
to avoid passing the pointer in multiple places.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c   | 12 +++++++-----
 drivers/vfio/vfio.h      | 10 +++++-----
 drivers/vfio/vfio_main.c |  6 +++---
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 91fdae69bb45..4fc674c01a05 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -18,14 +18,14 @@ bool vfio_iommufd_device_has_compat_ioas(struct vfio_device *vdev,
 	return !iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
 }
 
-int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
+int vfio_df_iommufd_bind(struct vfio_device_file *df)
 {
-	u32 device_id;
+	struct vfio_device *vdev = df->device;
+	struct iommufd_ctx *ictx = df->iommufd;
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	/* The legacy path has no way to return the device id */
-	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+	return vdev->ops->bind_iommufd(vdev, ictx, &df->devid);
 }
 
 int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
@@ -48,8 +48,10 @@ int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
 	return vdev->ops->attach_ioas(vdev, &ioas_id);
 }
 
-void vfio_iommufd_unbind(struct vfio_device *vdev)
+void vfio_df_iommufd_unbind(struct vfio_device_file *df)
 {
+	struct vfio_device *vdev = df->device;
+
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	if (vfio_device_is_noiommu(vdev))
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 04755379940c..58801adc1a7e 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -21,6 +21,7 @@ struct vfio_device_file {
 	struct vfio_group *group;
 
 	u8 access_granted;
+	u32 devid; /* only valid when iommufd is valid */
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
 	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
@@ -236,8 +237,8 @@ static inline void vfio_container_cleanup(void)
 #if IS_ENABLED(CONFIG_IOMMUFD)
 bool vfio_iommufd_device_has_compat_ioas(struct vfio_device *vdev,
 					 struct iommufd_ctx *ictx);
-int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
-void vfio_iommufd_unbind(struct vfio_device *device);
+int vfio_df_iommufd_bind(struct vfio_device_file *df);
+void vfio_df_iommufd_unbind(struct vfio_device_file *df);
 int vfio_iommufd_compat_attach_ioas(struct vfio_device *device,
 				    struct iommufd_ctx *ictx);
 #else
@@ -248,13 +249,12 @@ vfio_iommufd_device_has_compat_ioas(struct vfio_device *vdev,
 	return false;
 }
 
-static inline int vfio_iommufd_bind(struct vfio_device *device,
-				    struct iommufd_ctx *ictx)
+static inline int vfio_df_iommufd_bind(struct vfio_device_file *fd)
 {
 	return -EOPNOTSUPP;
 }
 
-static inline void vfio_iommufd_unbind(struct vfio_device *device)
+static inline void vfio_df_iommufd_unbind(struct vfio_device_file *df)
 {
 }
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index be5e4ddd5901..3a4b7eb128df 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -446,7 +446,7 @@ static int vfio_df_device_first_open(struct vfio_device_file *df)
 		return -ENODEV;
 
 	if (iommufd)
-		ret = vfio_iommufd_bind(device, iommufd);
+		ret = vfio_df_iommufd_bind(df);
 	else
 		ret = vfio_device_group_use_iommu(device);
 	if (ret)
@@ -461,7 +461,7 @@ static int vfio_df_device_first_open(struct vfio_device_file *df)
 
 err_unuse_iommu:
 	if (iommufd)
-		vfio_iommufd_unbind(device);
+		vfio_df_iommufd_unbind(df);
 	else
 		vfio_device_group_unuse_iommu(device);
 err_module_put:
@@ -479,7 +479,7 @@ static void vfio_df_device_last_close(struct vfio_device_file *df)
 	if (device->ops->close_device)
 		device->ops->close_device(device);
 	if (iommufd)
-		vfio_iommufd_unbind(device);
+		vfio_df_iommufd_unbind(df);
 	else
 		vfio_device_group_unuse_iommu(device);
 	module_put(device->dev->driver->owner);
-- 
2.34.1

