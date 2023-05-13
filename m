Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81170172B
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5510E0E4;
	Sat, 13 May 2023 13:28:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DADA10E0BF;
 Sat, 13 May 2023 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984525; x=1715520525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgsiHxp3ch5RhsjSPv6RMxR4l5RlTu18tOocI9MBQOA=;
 b=m1e6OiA4WWgBcLmdMpxz6xc0VFde48J0+FCfGKzB0zCbfnmGbvKhB+8q
 AaKmcbI9M2QZDFVv+Xv5QEKP8VdgA1jfaxv3z4WJ9HMlXjTkUofy/jspV
 4JBIAejCNBydLd7jG7w4fsXkQU3uqLI1CnlmqRM8D5EdCiUN6MZsc3pH5
 RzeZrzkdeIw7PzFUZoNzYrW/vyeK70v3kFSus9BagfEzLl2T6xKh8Nob3
 2eWZ4MUqHZjhMe9tT5x8r9Zy4YI5Rgim0Rma8tpuAc5fRnlIpDl+RQex0
 9edrvpMf5gVb6UvtaJN8HDOtrHepFd/V4OdWjYQ3sQfS/ahSyuSj98bxF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354100727"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="354100727"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703459489"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="703459489"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 06:28:44 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v11 10/23] vfio-iommufd: Move noiommu compat probe out of
 vfio_iommufd_bind()
Date: Sat, 13 May 2023 06:28:14 -0700
Message-Id: <20230513132827.39066-11-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513132827.39066-1-yi.l.liu@intel.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
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

into vfio_device_group_open(). This is more consistent with what will
be done in vfio device cdev path.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c   |  6 ++++++
 drivers/vfio/iommufd.c | 32 +++++++++++++++++++-------------
 drivers/vfio/vfio.h    |  9 +++++++++
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index a17584e8be15..cfd0b9254bbc 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -192,6 +192,12 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 		vfio_device_group_get_kvm_safe(device);
 
 	df->iommufd = device->group->iommufd;
+	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
+		ret = vfio_iommufd_compat_probe_noiommu(device,
+							df->iommufd);
+		if (ret)
+			goto out_put_kvm;
+	}
 
 	ret = vfio_device_open(df);
 	if (ret) {
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index a18e920be164..7a654a1437f0 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -46,6 +46,24 @@ static void vfio_iommufd_noiommu_unbind(struct vfio_device *vdev)
 	}
 }
 
+int vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
+				      struct iommufd_ctx *ictx)
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
@@ -54,20 +72,8 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 
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
-
+	if (vfio_device_is_noiommu(vdev))
 		return vfio_iommufd_noiommu_bind(vdev, ictx, &device_id);
-	}
 
 	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
 	if (ret)
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 785afc40ece8..8884b557fb26 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -234,9 +234,18 @@ static inline void vfio_container_cleanup(void)
 #endif
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
+int vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
+				      struct iommufd_ctx *ictx);
 int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
 void vfio_iommufd_unbind(struct vfio_device *device);
 #else
+static inline int
+vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
+				  struct iommufd_ctx *ictx)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int vfio_iommufd_bind(struct vfio_device *device,
 				    struct iommufd_ctx *ictx)
 {
-- 
2.34.1

