Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD496B0827
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B003510E679;
	Wed,  8 Mar 2023 13:13:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADA410E5D8;
 Wed,  8 Mar 2023 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678281232; x=1709817232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7uHDLMJQYCvcCQ6zBOH4f4vyYcLAIgagJQ2fPM8N2Y=;
 b=bwj0SczW3nN/qDtTw0/qO/MzYiLAqdnJJLP0w338dbN7p8iLZo2HSEVX
 7ePs9OF1LKw4sG4062EQ6//RORnZfk+kKmRtE+5P/miCh5wRtKo2BD7wx
 e0aEagGWA/5K+Rxg7U1mQ+f+84sloeM5Kr3jL+9Eyzw8hsclZZ8viOvmi
 BdFF3fR3c3NBmFgxk23+OT/50VKtDZ6qVwyQviUa+XL/PCzuaYdg8kqJ3
 aa25xbZniZI8MbP3lilko6sEzWnHAuuOQtYAdWNuVmB5sXp0ioulFRF/p
 c8tnc6xX0FPcv8faZ+t1snUQbmzWXGP7VBylII8seIJFCR+5vH55eCZ8S Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338474809"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="338474809"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670330907"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="670330907"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 05:13:42 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v1 1/5] iommufd: Create access in vfio_iommufd_emulated_bind()
Date: Wed,  8 Mar 2023 05:13:36 -0800
Message-Id: <20230308131340.459224-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308131340.459224-1-yi.l.liu@intel.com>
References: <20230308131340.459224-1-yi.l.liu@intel.com>
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

From: Nicolin Chen <nicolinc@nvidia.com>

There are needs to created iommufd_access prior to have an IOAS and set
IOAS later. Like the vfio device cdev needs to have an iommufd object
to represent the bond (iommufd_access) and IOAS replacement.

This moves iommufd_access_create() call into vfio_iommufd_emulated_bind(),
making it symmetric with the __vfio_iommufd_access_destroy() call in
vfio_iommufd_emulated_unbind(). This means an access is created/destroyed
by the bind()/unbind(), and the vfio_iommufd_emulated_attach_ioas() only
updates the access->ioas pointer.

Since there's no longer an ioas_id input for iommufd_access_create(), add
a new helper iommufd_access_set_ioas() to set access->ioas. We can later
add a "replace" feature simply to the new iommufd_access_set_ioas() too.

Leaving the access->ioas in vfio_iommufd_emulated_attach_ioas(), however,
can introduce some potential of a race condition during pin_/unpin_pages()
call where access->ioas->iopt is getting referenced. So, add an ioas_lock
to protect it.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c          | 103 ++++++++++++++++++------
 drivers/iommu/iommufd/iommufd_private.h |   1 +
 drivers/iommu/iommufd/selftest.c        |   5 +-
 drivers/vfio/iommufd.c                  |  23 +++---
 include/linux/iommufd.h                 |   3 +-
 5 files changed, 100 insertions(+), 35 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index a0c66f47a65a..71c4d38994b3 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -412,9 +412,12 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
 	struct iommufd_access *access =
 		container_of(obj, struct iommufd_access, obj);
 
-	iopt_remove_access(&access->ioas->iopt, access);
+	if (access->ioas) {
+		iopt_remove_access(&access->ioas->iopt, access);
+		refcount_dec(&access->ioas->obj.users);
+	}
 	iommufd_ctx_put(access->ictx);
-	refcount_dec(&access->ioas->obj.users);
+	mutex_destroy(&access->ioas_lock);
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
@@ -449,33 +450,18 @@ iommufd_access_create(struct iommufd_ctx *ictx, u32 ioas_id,
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
+	mutex_init(&access->ioas_lock);
 	access->ictx = ictx;
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
 
@@ -494,6 +480,50 @@ void iommufd_access_destroy(struct iommufd_access *access)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
 
+int iommufd_access_set_ioas(struct iommufd_access *access, u32 ioas_id)
+{
+	struct iommufd_ioas *new_ioas = NULL, *cur_ioas;
+	struct iommufd_ctx *ictx = access->ictx;
+	struct iommufd_object *obj;
+	int rc = 0;
+
+	if (ioas_id) {
+		obj = iommufd_get_object(ictx, ioas_id, IOMMUFD_OBJ_IOAS);
+		if (IS_ERR(obj))
+			return PTR_ERR(obj);
+		new_ioas = container_of(obj, struct iommufd_ioas, obj);
+	}
+
+	mutex_lock(&access->ioas_lock);
+	cur_ioas = access->ioas;
+	if (cur_ioas == new_ioas)
+		goto out_unlock;
+
+	if (new_ioas) {
+		rc = iopt_add_access(&new_ioas->iopt, access);
+		if (rc)
+			goto out_unlock;
+		iommufd_ref_to_users(obj);
+	}
+
+	if (cur_ioas) {
+		iopt_remove_access(&cur_ioas->iopt, access);
+		refcount_dec(&cur_ioas->obj.users);
+	}
+
+	access->ioas = new_ioas;
+	mutex_unlock(&access->ioas_lock);
+
+	return 0;
+
+out_unlock:
+	mutex_unlock(&access->ioas_lock);
+	if (new_ioas)
+		iommufd_put_object(obj);
+	return rc;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_access_set_ioas, IOMMUFD);
+
 /**
  * iommufd_access_notify_unmap - Notify users of an iopt to stop using it
  * @iopt: iopt to work on
@@ -544,8 +574,8 @@ void iommufd_access_notify_unmap(struct io_pagetable *iopt, unsigned long iova,
 void iommufd_access_unpin_pages(struct iommufd_access *access,
 				unsigned long iova, unsigned long length)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	unsigned long last_iova;
 	struct iopt_area *area;
 
@@ -553,6 +583,13 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 	    WARN_ON(check_add_overflow(iova, length - 1, &last_iova)))
 		return;
 
+	mutex_lock(&access->ioas_lock);
+	if (!access->ioas) {
+		mutex_unlock(&access->ioas_lock);
+		return;
+	}
+	iopt = &access->ioas->iopt;
+
 	down_read(&iopt->iova_rwsem);
 	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova)
 		iopt_area_remove_access(
@@ -562,6 +599,7 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 				min(last_iova, iopt_area_last_iova(area))));
 	up_read(&iopt->iova_rwsem);
 	WARN_ON(!iopt_area_contig_done(&iter));
+	mutex_unlock(&access->ioas_lock);
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_unpin_pages, IOMMUFD);
 
@@ -607,8 +645,8 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 			     unsigned long length, struct page **out_pages,
 			     unsigned int flags)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	unsigned long last_iova;
 	struct iopt_area *area;
 	int rc;
@@ -623,6 +661,13 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 	if (check_add_overflow(iova, length - 1, &last_iova))
 		return -EOVERFLOW;
 
+	mutex_lock(&access->ioas_lock);
+	if (!access->ioas) {
+		mutex_unlock(&access->ioas_lock);
+		return -ENOENT;
+	}
+	iopt = &access->ioas->iopt;
+
 	down_read(&iopt->iova_rwsem);
 	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
 		unsigned long last = min(last_iova, iopt_area_last_iova(area));
@@ -653,6 +698,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 	}
 
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return 0;
 
 err_remove:
@@ -667,6 +713,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 						  iopt_area_last_iova(area))));
 	}
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, IOMMUFD);
@@ -686,8 +733,8 @@ EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, IOMMUFD);
 int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 		      void *data, size_t length, unsigned int flags)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	struct iopt_area *area;
 	unsigned long last_iova;
 	int rc;
@@ -697,6 +744,13 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 	if (check_add_overflow(iova, length - 1, &last_iova))
 		return -EOVERFLOW;
 
+	mutex_lock(&access->ioas_lock);
+	if (!access->ioas) {
+		mutex_unlock(&access->ioas_lock);
+		return -ENOENT;
+	}
+	iopt = &access->ioas->iopt;
+
 	down_read(&iopt->iova_rwsem);
 	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
 		unsigned long last = min(last_iova, iopt_area_last_iova(area));
@@ -723,6 +777,7 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 		rc = -ENOENT;
 err_out:
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_rw, IOMMUFD);
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 9d7f71510ca1..820251b83ae4 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -263,6 +263,7 @@ struct iommufd_access {
 	struct iommufd_object obj;
 	struct iommufd_ctx *ictx;
 	struct iommufd_ioas *ioas;
+	struct mutex ioas_lock;
 	const struct iommufd_access_ops *ops;
 	void *data;
 	unsigned long iova_alignment;
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index cfb5fe9a5e0e..db4011bdc8a9 100644
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
+	rc = iommufd_access_set_ioas(access, ioas_id);
+	if (rc)
+		goto out_destroy;
 	cmd->create_access.out_access_fd = fdno;
 	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
 	if (rc)
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index db4efbd56042..1f87294c1931 100644
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
@@ -161,15 +169,12 @@ EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_unbind);
 
 int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 {
-	struct iommufd_access *user;
-
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	user = iommufd_access_create(vdev->iommufd_ictx, *pt_id, &vfio_user_ops,
-				     vdev);
-	if (IS_ERR(user))
-		return PTR_ERR(user);
-	vdev->iommufd_access = user;
-	return 0;
+	if (!vdev->iommufd_ictx)
+		return -EINVAL;
+	if (!vdev->iommufd_access)
+		return -ENOENT;
+	return iommufd_access_set_ioas(vdev->iommufd_access, *pt_id);
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_attach_ioas);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index c0b5b3ac34f1..247b11609c79 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -40,9 +40,10 @@ enum {
 };
 
 struct iommufd_access *
-iommufd_access_create(struct iommufd_ctx *ictx, u32 ioas_id,
+iommufd_access_create(struct iommufd_ctx *ictx,
 		      const struct iommufd_access_ops *ops, void *data);
 void iommufd_access_destroy(struct iommufd_access *access);
+int iommufd_access_set_ioas(struct iommufd_access *access, u32 ioas_id);
 
 void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
-- 
2.34.1

