Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA46BCF31
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F286810ECC4;
	Thu, 16 Mar 2023 12:15:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B310E19F;
 Thu, 16 Mar 2023 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678968930; x=1710504930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LylctBNPn6Ia5HGzTinxDoCCLNEoFcLFW6Mz/3oYHs0=;
 b=i/OdIchYl4q+O8dc0Vuszv/hY9s/NnTCcjeWRB+XoRyc8Y9IkgkeNkhM
 8rfsuB/veowJskyerJE8g14bhKQFqTheJcWxgAynJiQVMt0soBsULH7tk
 wxPGge0i+/OICgFhYxbXC8qE1qzlaSzb+lyF4Hquv5aHfVE7ENndcMQD1
 3PabkA1P23sp1b2oC11MYRacrVVIPnoAIjUdrDSq2t5s8rjbNwOX/V5fx
 vxLxCAjWUjzE9y0lcLN2zPU8NmqjDzDgQ661rLp5RuAP1ig3/lyBY3eYl
 mqjB4Ety4jIeznU2zC+P6PqzQnsD0T61riVU8LqkdfSNRmPONFZxcOocn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336661394"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336661394"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="679874215"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="679874215"
Received: from unknown (HELO 984fee00a4c6.jf.intel.com) ([10.165.58.231])
 by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 05:15:29 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 3/5] vfio-iommufd: Make vfio_iommufd_emulated_bind() return
 iommufd_access ID
Date: Thu, 16 Mar 2023 05:15:24 -0700
Message-Id: <20230316121526.5644-4-yi.l.liu@intel.com>
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

vfio device cdev needs to return iommufd_access ID to userspace if
bind_iommufd succeeds.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c   | 4 +++-
 drivers/iommu/iommufd/selftest.c | 3 ++-
 drivers/vfio/iommufd.c           | 2 +-
 include/linux/iommufd.h          | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 99d34c81d786..0295140dd384 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -426,6 +426,7 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
  * @ioas_id: ID for a IOMMUFD_OBJ_IOAS
  * @ops: Driver's ops to associate with the access
  * @data: Opaque data to pass into ops functions
+ * @id: Output ID number to return to userspace for this access
  *
  * An iommufd_access allows a driver to read/write to the IOAS without using
  * DMA. The underlying CPU memory can be accessed using the
@@ -435,7 +436,7 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
  */
 struct iommufd_access *
 iommufd_access_create(struct iommufd_ctx *ictx,
-		      const struct iommufd_access_ops *ops, void *data)
+		      const struct iommufd_access_ops *ops, void *data, u32 *id)
 {
 	struct iommufd_access *access;
 
@@ -460,6 +461,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
 	access->ictx = ictx;
 	iommufd_ctx_get(ictx);
 	iommufd_object_finalize(ictx, &access->obj);
+	*id = access->obj.id;
 	return access;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_create, IOMMUFD);
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 0eabda430c9f..65e3bdaadd67 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -554,6 +554,7 @@ static int iommufd_test_create_access(struct iommufd_ucmd *ucmd,
 	struct iommu_test_cmd *cmd = ucmd->cmd;
 	struct selftest_access *staccess;
 	struct iommufd_access *access;
+	u32 id;
 	int fdno;
 	int rc;
 
@@ -575,7 +576,7 @@ static int iommufd_test_create_access(struct iommufd_ucmd *ucmd,
 		(flags & MOCK_FLAGS_ACCESS_CREATE_NEEDS_PIN_PAGES) ?
 			&selftest_access_ops_pin :
 			&selftest_access_ops,
-		staccess);
+		staccess, &id);
 	if (IS_ERR(access)) {
 		rc = PTR_ERR(access);
 		goto out_put_fdno;
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index b576d4c7b79b..e40c0e9fea30 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -142,7 +142,7 @@ int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	user = iommufd_access_create(ictx, &vfio_user_ops, vdev);
+	user = iommufd_access_create(ictx, &vfio_user_ops, vdev, out_device_id);
 	if (IS_ERR(user))
 		return PTR_ERR(user);
 	vdev->iommufd_access = user;
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 155d3630aedc..1129a36a74c4 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -41,7 +41,7 @@ enum {
 
 struct iommufd_access *
 iommufd_access_create(struct iommufd_ctx *ictx,
-		      const struct iommufd_access_ops *ops, void *data);
+		      const struct iommufd_access_ops *ops, void *data, u32 *id);
 void iommufd_access_destroy(struct iommufd_access *access);
 int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id);
 
-- 
2.34.1

