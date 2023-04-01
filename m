Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF66D3250
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 17:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D850210E10B;
	Sat,  1 Apr 2023 15:19:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C82610E122;
 Sat,  1 Apr 2023 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680362323; x=1711898323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PirptMYKJTaup2Gvl84lhjR2Vgw3w06sDHqdMR/RpfQ=;
 b=BAUOgqLDOGF631JAqoEE1qnGUPXOSONP+/OBcYUW5hN53OZiyO5FbXup
 0y7vghwjzVJZIaUaYik/j+HnEDdhTY7uVfVKhg6ElNCKES81br/d6onaV
 XSg1AZ/ioQTwRdUed5WIFpHwT33pZAQtsFRBxxAMM6HwfSQuFgzRORb+7
 YGCK4kwP1E3qDlmYJDcWoGDB5ABLvSRl6LbKGtbf6303dTgmafQYa3iIo
 tInZeNsRtP7xl2YK5UuEzpZUAptg2dozaS9GdHcuxdyjA2XqfRGIaxQZC
 4z5PIEocrHwHDJL0JP585A1RvYkXVFPH/rWWI72uh+E8yj9KMDd3rybjF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404411290"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="404411290"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 08:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="678937197"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="678937197"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 01 Apr 2023 08:18:42 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 12/25] vfio-iommufd: Move noiommu support out of
 vfio_iommufd_bind()
Date: Sat,  1 Apr 2023 08:18:20 -0700
Message-Id: <20230401151833.124749-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401151833.124749-1-yi.l.liu@intel.com>
References: <20230401151833.124749-1-yi.l.liu@intel.com>
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

into vfio_device_group_open(). This is also more consistent with what
will be done in vfio device cdev path.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c   |  9 +++++++++
 drivers/vfio/iommufd.c | 35 ++++++++++++++++++-----------------
 drivers/vfio/vfio.h    |  9 +++++++++
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 63a4bf06ab9f..6178ac5d0b10 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -192,6 +192,15 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 		vfio_device_group_get_kvm_safe(device);
 
 	df->iommufd = device->group->iommufd;
+	if (df->iommufd && vfio_device_is_noiommu(device)) {
+		if (device->open_count == 0) {
+			ret = vfio_iommufd_enable_noiommu_compat(device,
+								 df->iommufd);
+			if (ret)
+				goto out_put_kvm;
+		}
+		df->iommufd = NULL;
+	}
 
 	ret = vfio_device_open(df);
 	if (ret) {
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 809f2dd73b9e..11f5148b446e 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -10,6 +10,24 @@
 MODULE_IMPORT_NS(IOMMUFD);
 MODULE_IMPORT_NS(IOMMUFD_VFIO);
 
+int vfio_iommufd_enable_noiommu_compat(struct vfio_device *device,
+				       struct iommufd_ctx *ictx)
+{
+	u32 ioas_id;
+
+	if (!capable(CAP_SYS_RAWIO))
+		return -EPERM;
+
+	/*
+	 * Require no compat ioas to be assigned to proceed.  The basic
+	 * statement is that the user cannot have done something that
+	 * implies they expected translation to exist
+	 */
+	if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
+		return -EPERM;
+	return 0;
+}
+
 int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 {
 	u32 ioas_id;
@@ -18,20 +36,6 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev)) {
-		if (!capable(CAP_SYS_RAWIO))
-			return -EPERM;
-
-		/*
-		 * Require no compat ioas to be assigned to proceed. The basic
-		 * statement is that the user cannot have done something that
-		 * implies they expected translation to exist
-		 */
-		if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
-			return -EPERM;
-		return 0;
-	}
-
 	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
 	if (ret)
 		return ret;
@@ -59,9 +63,6 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev))
-		return;
-
 	if (vdev->ops->unbind_iommufd)
 		vdev->ops->unbind_iommufd(vdev);
 }
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 7d4108cbc185..136137b8618d 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -236,9 +236,18 @@ static inline void vfio_container_cleanup(void)
 #endif
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
+int vfio_iommufd_enable_noiommu_compat(struct vfio_device *device,
+				       struct iommufd_ctx *ictx);
 int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
 void vfio_iommufd_unbind(struct vfio_device *device);
 #else
+static inline int
+vfio_iommufd_enable_noiommu_compat(struct vfio_device *device,
+				   struct iommufd_ctx *ictx)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int vfio_iommufd_bind(struct vfio_device *device,
 				    struct iommufd_ctx *ictx)
 {
-- 
2.34.1

