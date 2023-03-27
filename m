Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5276C9F9D
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2B210E374;
	Mon, 27 Mar 2023 09:34:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9744A10E338;
 Mon, 27 Mar 2023 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909636; x=1711445636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTACc5o6PvT3a4kfgxBGMGwr6hPdall8WJ4no3GxjqA=;
 b=eR9vGKenMces5fBK0qApaGU2XQOx3nn0yVvF6gUWOizh7tNV2Gl9XKmo
 nhRo6I5gXah0QA6MyfQDT7Sye7v9usRH+3/zhiCmxDwo2MyGyhUTImeBS
 //sevxSj3qmosL8CyrjcWU8CcquDXwaPvuZWZpYeSzNTrBzPak7HHpXPJ
 xPSow96j7xc08GNQjO491qPNFnYCNmQT9tWLPv/cSvYWF6BvZxD1p7MxO
 Zn869OsNGXgS1a4kP44RXV7VhfT78ib1kxjIitYdirBlNZz/+/0KT7UFt
 4b8eKBjXPXn4z5F23z9GRaZks1fepHH0XeDPTCctEFMNlho5WSnwMbNGM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402817924"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="402817924"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685908079"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="685908079"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 02:33:55 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 2/6] iommufd: Create access in vfio_iommufd_emulated_bind()
Date: Mon, 27 Mar 2023 02:33:47 -0700
Message-Id: <20230327093351.44505-3-yi.l.liu@intel.com>
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

From: Nicolin Chen <nicolinc@nvidia.com>

There are needs to created iommufd_access prior to have an IOAS and set
IOAS later. Like the vfio device cdev needs to have an iommufd object
to represent the bond (iommufd_access) and IOAS replacement.

Moves the iommufd_access_create() call into vfio_iommufd_emulated_bind(),
making it symmetric with the __vfio_iommufd_access_destroy() call in the
vfio_iommufd_emulated_unbind(). This means an access is created/destroyed
by the bind()/unbind(), and the vfio_iommufd_emulated_attach_ioas() only
updates the access->ioas pointer.

Since vfio_iommufd_emulated_bind() does not provide ioas_id, drop it from
the argument list of iommufd_access_create(). Instead, add a new access
API iommufd_access_attach() to set the access->ioas pointer. Also, set
vdev->iommufd_attached accordingly, similar to the physical pathway.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c   | 51 +++++++++++++++++++-------------
 drivers/iommu/iommufd/selftest.c |  5 +++-
 drivers/vfio/iommufd.c           | 24 ++++++++++-----
 include/linux/iommufd.h          |  3 +-
 4 files changed, 53 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index a0c66f47a65a..6999a10b5496 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -412,9 +412,12 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
 	struct iommufd_access *access =
 		container_of(obj, struct iommufd_access, obj);
 
-	iopt_remove_access(&access->ioas->iopt, access);
+	if (access->ioas) {
+		iopt_remove_access(&access->ioas->iopt, access);
+		refcount_dec(&access->ioas->obj.users);
+		access->ioas = NULL;
+	}
 	iommufd_ctx_put(access->ictx);
-	refcount_dec(&access->ioas->obj.users);
 }
 
 /**
@@ -431,12 +434,10 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
  * The provided ops are required to use iommufd_access_pin_pages().
  */
 struct iommufd_access *
-iommufd_access_create(struct iommufd_ctx *ictx, u32 ioas_id,
+iommufd_access_create(struct iommufd_ctx *ictx,
 		      const struct iommufd_access_ops *ops, void *data)
 {
 	struct iommufd_access *access;
-	struct iommufd_object *obj;
-	int rc;
 
 	/*
 	 * There is no uAPI for the access object, but to keep things symmetric
@@ -449,21 +450,10 @@ iommufd_access_create(struct iommufd_ctx *ictx, u32 ioas_id,
 	access->data = data;
 	access->ops = ops;
 
-	obj = iommufd_get_object(ictx, ioas_id, IOMMUFD_OBJ_IOAS);
-	if (IS_ERR(obj)) {
-		rc = PTR_ERR(obj);
-		goto out_abort;
-	}
-	access->ioas = container_of(obj, struct iommufd_ioas, obj);
-	iommufd_ref_to_users(obj);
-
 	if (ops->needs_pin_pages)
 		access->iova_alignment = PAGE_SIZE;
 	else
 		access->iova_alignment = 1;
-	rc = iopt_add_access(&access->ioas->iopt, access);
-	if (rc)
-		goto out_put_ioas;
 
 	/* The calling driver is a user until iommufd_access_destroy() */
 	refcount_inc(&access->obj.users);
@@ -471,11 +461,6 @@ iommufd_access_create(struct iommufd_ctx *ictx, u32 ioas_id,
 	iommufd_ctx_get(ictx);
 	iommufd_object_finalize(ictx, &access->obj);
 	return access;
-out_put_ioas:
-	refcount_dec(&access->ioas->obj.users);
-out_abort:
-	iommufd_object_abort(ictx, &access->obj);
-	return ERR_PTR(rc);
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_create, IOMMUFD);
 
@@ -494,6 +479,30 @@ void iommufd_access_destroy(struct iommufd_access *access)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
 
+int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
+{
+	struct iommufd_ioas *new_ioas;
+	int rc = 0;
+
+	if (access->ioas != NULL && access->ioas->obj.id != ioas_id)
+		return -EINVAL;
+
+	new_ioas = iommufd_get_ioas(access->ictx, ioas_id);
+	if (IS_ERR(new_ioas))
+		return PTR_ERR(new_ioas);
+
+	rc = iopt_add_access(&new_ioas->iopt, access);
+	if (rc) {
+		iommufd_put_object(&new_ioas->obj);
+		return rc;
+	}
+	iommufd_ref_to_users(&new_ioas->obj);
+
+	access->ioas = new_ioas;
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_access_attach, IOMMUFD);
+
 /**
  * iommufd_access_notify_unmap - Notify users of an iopt to stop using it
  * @iopt: iopt to work on
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 8667eb222cf1..1e89e1a8c5f0 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -571,7 +571,7 @@ static int iommufd_test_create_access(struct iommufd_ucmd *ucmd,
 	}
 
 	access = iommufd_access_create(
-		ucmd->ictx, ioas_id,
+		ucmd->ictx,
 		(flags & MOCK_FLAGS_ACCESS_CREATE_NEEDS_PIN_PAGES) ?
 			&selftest_access_ops_pin :
 			&selftest_access_ops,
@@ -580,6 +580,9 @@ static int iommufd_test_create_access(struct iommufd_ucmd *ucmd,
 		rc = PTR_ERR(access);
 		goto out_put_fdno;
 	}
+	rc = iommufd_access_attach(access, ioas_id);
+	if (rc)
+		goto out_destroy;
 	cmd->create_access.out_access_fd = fdno;
 	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
 	if (rc)
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index db4efbd56042..0695a06db30d 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -138,10 +138,18 @@ static const struct iommufd_access_ops vfio_user_ops = {
 int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
 			       struct iommufd_ctx *ictx, u32 *out_device_id)
 {
+	struct iommufd_access *user;
+
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	vdev->iommufd_ictx = ictx;
 	iommufd_ctx_get(ictx);
+	user = iommufd_access_create(ictx, &vfio_user_ops, vdev);
+	if (IS_ERR(user)) {
+		iommufd_ctx_put(ictx);
+		return PTR_ERR(user);
+	}
+	vdev->iommufd_access = user;
+	vdev->iommufd_ictx = ictx;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_bind);
@@ -152,6 +160,7 @@ void vfio_iommufd_emulated_unbind(struct vfio_device *vdev)
 
 	if (vdev->iommufd_access) {
 		iommufd_access_destroy(vdev->iommufd_access);
+		vdev->iommufd_attached = false;
 		vdev->iommufd_access = NULL;
 	}
 	iommufd_ctx_put(vdev->iommufd_ictx);
@@ -161,15 +170,16 @@ EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_unbind);
 
 int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 {
-	struct iommufd_access *user;
+	int rc;
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	user = iommufd_access_create(vdev->iommufd_ictx, *pt_id, &vfio_user_ops,
-				     vdev);
-	if (IS_ERR(user))
-		return PTR_ERR(user);
-	vdev->iommufd_access = user;
+	if (vdev->iommufd_attached)
+		return -EBUSY;
+	rc = iommufd_access_attach(vdev->iommufd_access, *pt_id);
+	if (rc)
+		return rc;
+	vdev->iommufd_attached = true;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_attach_ioas);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index c0b5b3ac34f1..155d3630aedc 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -40,9 +40,10 @@ enum {
 };
 
 struct iommufd_access *
-iommufd_access_create(struct iommufd_ctx *ictx, u32 ioas_id,
+iommufd_access_create(struct iommufd_ctx *ictx,
 		      const struct iommufd_access_ops *ops, void *data);
 void iommufd_access_destroy(struct iommufd_access *access);
+int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id);
 
 void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
-- 
2.34.1

