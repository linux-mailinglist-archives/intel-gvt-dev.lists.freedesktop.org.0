Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82E46CA031
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA76B10E3D9;
	Mon, 27 Mar 2023 09:41:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839210E338;
 Mon, 27 Mar 2023 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679910061; x=1711446061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LJpldiIubGjDRVUf81XFT+Wns0oOsqdi+ChKTr6x65o=;
 b=oHuUE8uWKlMni/biCA7QDs0itK90sLRdjFRQzZ+CQd3LA8lAcaD/WJJS
 bvhBQuJwk4MgDCXCPGFNQaI43cohfGC05pDqELATGwR1rVjpd8tpHM/Bv
 HH5ILGuELSXgp75De3nqV/kXXo+9JyboHhQzEIC5AZ8EbOPGeEsIASmK8
 L2UDUZTmTvOLpG/c50fe771HSjrqUA1+TRq4oD51q7gCtofEJ8c9+Hm2o
 ZcbuWLQ82pnSXEv+JxhIVJ/5ggnc0NzfBjCMkf6m1fjZM72Tb4nKUMptt
 d6Bt6f/OEXQpuRHnTWvq8wZVx0cNq5iBPZvbDiObtcncVXrIPY9UAVbl7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426485378"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="426485378"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660775798"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="660775798"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 02:41:00 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 13/24] vfio-iommufd: Split bind/attach into two steps
Date: Mon, 27 Mar 2023 02:40:36 -0700
Message-Id: <20230327094047.47215-14-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327094047.47215-1-yi.l.liu@intel.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
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

to align with the coming vfio device cdev support.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c   | 18 ++++++++++++++----
 drivers/vfio/iommufd.c | 33 ++++++++++++++-------------------
 drivers/vfio/vfio.h    |  9 +++++++++
 3 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index d7e4a7c2da95..8f09e4541c3a 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -203,9 +203,14 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 	}
 
 	ret = vfio_device_open(df);
-	if (ret) {
-		df->iommufd = NULL;
+	if (ret)
 		goto out_put_kvm;
+
+	if (df->iommufd) {
+		ret = vfio_iommufd_attach_compat_ioas(device,
+						      df->iommufd);
+		if (ret)
+			goto out_close_device;
 	}
 
 	/*
@@ -214,12 +219,17 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 	 */
 	smp_store_release(&df->access_granted, true);
 
+	mutex_unlock(&device->dev_set->lock);
+	mutex_unlock(&device->group->group_lock);
+	return 0;
+
+out_close_device:
+	vfio_device_close(df);
 out_put_kvm:
+	df->iommufd = NULL;
 	if (device->open_count == 0)
 		vfio_device_put_kvm(device);
-
 	mutex_unlock(&device->dev_set->lock);
-
 out_unlock:
 	mutex_unlock(&device->group->group_lock);
 	return ret;
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index d512fc057999..b32e757bdac5 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -30,33 +30,28 @@ int vfio_iommufd_enable_noiommu_compat(struct vfio_device *device,
 
 int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 {
-	u32 ioas_id;
 	u32 device_id;
-	int ret;
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
-	if (ret)
-		return ret;
+	/* The legacy path has no way to return the device id */
+	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+}
+
+int vfio_iommufd_attach_compat_ioas(struct vfio_device *vdev,
+				    struct iommufd_ctx *ictx)
+{
+	u32 ioas_id;
+	int ret;
+
+	lockdep_assert_held(&vdev->dev_set->lock);
 
 	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
 	if (ret)
-		goto err_unbind;
-	ret = vdev->ops->attach_ioas(vdev, &ioas_id);
-	if (ret)
-		goto err_unbind;
-
-	/*
-	 * The legacy path has no way to return the device id or the selected
-	 * pt_id
-	 */
-	return 0;
+		return ret;
 
-err_unbind:
-	if (vdev->ops->unbind_iommufd)
-		vdev->ops->unbind_iommufd(vdev);
-	return ret;
+	/* The legacy path has no way to return the selected pt_id */
+	return vdev->ops->attach_ioas(vdev, &ioas_id);
 }
 
 void vfio_iommufd_unbind(struct vfio_device *vdev)
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 136137b8618d..abfaf85cc266 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -238,6 +238,8 @@ static inline void vfio_container_cleanup(void)
 #if IS_ENABLED(CONFIG_IOMMUFD)
 int vfio_iommufd_enable_noiommu_compat(struct vfio_device *device,
 				       struct iommufd_ctx *ictx);
+int vfio_iommufd_attach_compat_ioas(struct vfio_device *device,
+				    struct iommufd_ctx *ictx);
 int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
 void vfio_iommufd_unbind(struct vfio_device *device);
 #else
@@ -248,6 +250,13 @@ vfio_iommufd_enable_noiommu_compat(struct vfio_device *device,
 	return -EOPNOTSUPP;
 }
 
+static inline int
+vfio_iommufd_attach_compat_ioas(struct vfio_device *device,
+				struct iommufd_ctx *ictx)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int vfio_iommufd_bind(struct vfio_device *device,
 				    struct iommufd_ctx *ictx)
 {
-- 
2.34.1

