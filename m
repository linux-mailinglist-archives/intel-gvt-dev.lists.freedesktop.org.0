Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266672018F
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED6310E67A;
	Fri,  2 Jun 2023 12:17:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA12310E691;
 Fri,  2 Jun 2023 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708229; x=1717244229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hDZLhtnV9UJ+FjlQgpeFYmEqQ98VEz5OJgVKll16uFA=;
 b=M60irGQB9HSNvdVMxzHhNcKtX6oW5VuokWBfAxVk6SKyxkD7Mh0ha9MY
 sQk5BDUTuHoQj9V+eXyDeTmpO0vfNIc3O0LPjEWVu2s4/pCDO4GJXWwAK
 fUoMsfaDF4M1wGOqmXnzH5nmmIBxTo4sl4+kp2Utt5G9IGQMwGyHgoMHa
 +Pnph9rdekE30Skvrzx3ioXLwOQ2UFwYkOqtJlTsoyXL1W17hmntls8Pf
 82eDevxJBkwaojc2zjC+EBPZGBGgvNY/yaB23zHnONuvj10Diecu2OFTr
 d67phB0HSI6OWhQg/h6+Lnv73ZhYY0O5Wg5N0lNGxcon9I9yJtEZTqt2S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384136603"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="384136603"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037947332"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="1037947332"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2023 05:17:08 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v12 11/24] vfio-iommufd: Split bind/attach into two steps
Date: Fri,  2 Jun 2023 05:16:40 -0700
Message-Id: <20230602121653.80017-12-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602121653.80017-1-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
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

This aligns the bind/attach logic with the coming vfio device cdev support.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c   | 17 +++++++++++++----
 drivers/vfio/iommufd.c | 35 +++++++++++++++++------------------
 drivers/vfio/vfio.h    |  9 +++++++++
 3 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index b8b77daf7aa6..41a09a2df690 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -207,9 +207,13 @@ static int vfio_df_group_open(struct vfio_device_file *df)
 	}
 
 	ret = vfio_df_open(df);
-	if (ret) {
-		df->iommufd = NULL;
+	if (ret)
 		goto out_put_kvm;
+
+	if (df->iommufd && device->open_count == 1) {
+		ret = vfio_iommufd_compat_attach_ioas(device, df->iommufd);
+		if (ret)
+			goto out_close_device;
 	}
 
 	/*
@@ -218,12 +222,17 @@ static int vfio_df_group_open(struct vfio_device_file *df)
 	 */
 	smp_store_release(&df->access_granted, true);
 
+	mutex_unlock(&device->dev_set->lock);
+	mutex_unlock(&device->group->group_lock);
+	return 0;
+
+out_close_device:
+	vfio_df_close(df);
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
index 21237f5d0ffc..b30f9aaae6e7 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -20,33 +20,32 @@ bool vfio_iommufd_device_has_compat_ioas(struct vfio_device *vdev,
 
 int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 {
-	u32 ioas_id;
 	u32 device_id;
+
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	/* The legacy path has no way to return the device id */
+	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+}
+
+int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
+				    struct iommufd_ctx *ictx)
+{
+	u32 ioas_id;
 	int ret;
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
-	if (ret)
-		return ret;
+	/* compat noiommu does not need to do ioas attach */
+	if (vfio_device_is_noiommu(vdev))
+		return 0;
 
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
index 76181d208bc1..bb7a375315bb 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -238,6 +238,8 @@ bool vfio_iommufd_device_has_compat_ioas(struct vfio_device *vdev,
 					 struct iommufd_ctx *ictx);
 int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
 void vfio_iommufd_unbind(struct vfio_device *device);
+int vfio_iommufd_compat_attach_ioas(struct vfio_device *device,
+				    struct iommufd_ctx *ictx);
 #else
 static inline bool
 vfio_iommufd_device_has_compat_ioas(struct vfio_device *vdev,
@@ -255,6 +257,13 @@ static inline int vfio_iommufd_bind(struct vfio_device *device,
 static inline void vfio_iommufd_unbind(struct vfio_device *device)
 {
 }
+
+static inline int
+vfio_iommufd_compat_attach_ioas(struct vfio_device *device,
+				struct iommufd_ctx *ictx)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_VFIO_VIRQFD)
-- 
2.34.1

