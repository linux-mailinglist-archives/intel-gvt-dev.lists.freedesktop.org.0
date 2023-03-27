Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD7F6C9FA0
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9644F10E388;
	Mon, 27 Mar 2023 09:34:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2E10E36E;
 Mon, 27 Mar 2023 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909638; x=1711445638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qedyzAr3ZT/2tq4uIb2AV1+jHBg7xabozASdmKvcQSU=;
 b=bg/cb3dlvGkMoBROiewQsJJJiOjt+1/QLea4568wKzb/aLRSteQKclsP
 kSuvcsJPDG3WsZxmFmHKwP5zSZNGp5hMaxSDhdTEzee3TgxXjsQWw6j4t
 rOspEjaKqNPGebSCR1ox8ENPw9CjVkPOguwyRgBSD4chj5fdwtJE/E1wC
 wPlfJY70dSlVQYlgCO8yh24vs1G1+y2rHX9Mi7WPn2Ej3hA7QKNiIhbHg
 xPNIklpEL/adaAfhF5g5C8gZwcux1MnOEKZ0DCProJLENgrsjejyzLDMc
 E40BZ84JL4XsU4YmjYmZZd+r9o/tWMbuTVHuohuzE1DO3rgj33/nS6ubx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402817945"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="402817945"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685908086"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="685908086"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 02:33:57 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 4/6] vfio-iommufd: Make vfio_iommufd_emulated_bind() return
 iommufd_access ID
Date: Mon, 27 Mar 2023 02:33:49 -0700
Message-Id: <20230327093351.44505-5-yi.l.liu@intel.com>
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

vfio device cdev needs to return iommufd_access ID to userspace if
bind_iommufd succeeds.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c   | 4 +++-
 drivers/iommu/iommufd/selftest.c | 3 ++-
 drivers/vfio/iommufd.c           | 2 +-
 include/linux/iommufd.h          | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 6999a10b5496..25115d401d8f 100644
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
index 1e89e1a8c5f0..e6e04dceffe3 100644
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
index 78e2486586d7..1ee558c0be25 100644
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

