Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E1757E75
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 15:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB710E366;
	Tue, 18 Jul 2023 13:56:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79C410E36D;
 Tue, 18 Jul 2023 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689688565; x=1721224565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OCfSOnkUB8+3ZJ+7CRvQgAInJWCkh3Z8L/K/ny42OEk=;
 b=K382ppegjhdTHYl/VpC+sr4/XQBCOmTAnlSlhCyztRhLxQR9NZW+5sU6
 qRgK93YcrSWYgtOaWd5w+td1ao5MnXJa6h92vZKju4Mjkkj3OnCwMy5iR
 p2r+nEncnquasY8OSl43MLv2iPX0p26OtRgXsWGp+nzRuEVUHWRlje3si
 5XbZsi09DUKQ5AaSMaTSTj0hxMcTmk9w9nm9i04tvuZLR82LU/KRXZJM0
 woN5piN8zNO9pVxsihVnK9IlY2aVjPrCPbuMz2nOL+lRljoPinCmHPbrE
 X6HkRT3mNKHyCQBvLj2HwRuT8N5JVPAb52TIpopQWQBAbq2klZdvKk9TE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452590712"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452590712"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970251044"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="970251044"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 06:56:04 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v15 14/26] iommufd/device: Add iommufd_access_detach() API
Date: Tue, 18 Jul 2023 06:55:39 -0700
Message-Id: <20230718135551.6592-15-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718135551.6592-1-yi.l.liu@intel.com>
References: <20230718135551.6592-1-yi.l.liu@intel.com>
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

From: Nicolin Chen <nicolinc@nvidia.com>

Previously, the detach routine is only done by the destroy(). And it was
called by vfio_iommufd_emulated_unbind() when the device runs close(), so
all the mappings in iopt were cleaned in that setup, when the call trace
reaches this detach() routine.

Now, there's a need of a detach uAPI, meaning that it does not only need
a new iommufd_access_detach() API, but also requires access->ops->unmap()
call as a cleanup. So add one.

However, leaving that unprotected can introduce some potential of a race
condition during the pin_/unpin_pages() call, where access->ioas->iopt is
getting referenced. So, add an ioas_lock to protect the context of iopt
referencings.

Also, to allow the iommufd_access_unpin_pages() callback to happen via
this unmap() call, add an ioas_unpin pointer, so the unpin routine won't
be affected by the "access->ioas = NULL" trick.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Tested-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c          | 74 +++++++++++++++++++++++--
 drivers/iommu/iommufd/iommufd_private.h |  2 +
 include/linux/iommufd.h                 |  1 +
 3 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index cd5d8ab907f9..59fec5783eb9 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -486,6 +486,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
 	iommufd_ctx_get(ictx);
 	iommufd_object_finalize(ictx, &access->obj);
 	*id = access->obj.id;
+	mutex_init(&access->ioas_lock);
 	return access;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_create, IOMMUFD);
@@ -505,26 +506,60 @@ void iommufd_access_destroy(struct iommufd_access *access)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
 
+void iommufd_access_detach(struct iommufd_access *access)
+{
+	struct iommufd_ioas *cur_ioas = access->ioas;
+
+	mutex_lock(&access->ioas_lock);
+	if (WARN_ON(!access->ioas))
+		goto out;
+	/*
+	 * Set ioas to NULL to block any further iommufd_access_pin_pages().
+	 * iommufd_access_unpin_pages() can continue using access->ioas_unpin.
+	 */
+	access->ioas = NULL;
+
+	if (access->ops->unmap) {
+		mutex_unlock(&access->ioas_lock);
+		access->ops->unmap(access->data, 0, ULONG_MAX);
+		mutex_lock(&access->ioas_lock);
+	}
+	iopt_remove_access(&cur_ioas->iopt, access);
+	refcount_dec(&cur_ioas->obj.users);
+out:
+	access->ioas_unpin = NULL;
+	mutex_unlock(&access->ioas_lock);
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_access_detach, IOMMUFD);
+
 int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
 {
 	struct iommufd_ioas *new_ioas;
 	int rc = 0;
 
-	if (access->ioas)
+	mutex_lock(&access->ioas_lock);
+	if (WARN_ON(access->ioas || access->ioas_unpin)) {
+		mutex_unlock(&access->ioas_lock);
 		return -EINVAL;
+	}
 
 	new_ioas = iommufd_get_ioas(access->ictx, ioas_id);
-	if (IS_ERR(new_ioas))
+	if (IS_ERR(new_ioas)) {
+		mutex_unlock(&access->ioas_lock);
 		return PTR_ERR(new_ioas);
+	}
 
 	rc = iopt_add_access(&new_ioas->iopt, access);
 	if (rc) {
+		mutex_unlock(&access->ioas_lock);
 		iommufd_put_object(&new_ioas->obj);
 		return rc;
 	}
 	iommufd_ref_to_users(&new_ioas->obj);
 
 	access->ioas = new_ioas;
+	access->ioas_unpin = new_ioas;
+	mutex_unlock(&access->ioas_lock);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_attach, IOMMUFD);
@@ -579,8 +614,8 @@ void iommufd_access_notify_unmap(struct io_pagetable *iopt, unsigned long iova,
 void iommufd_access_unpin_pages(struct iommufd_access *access,
 				unsigned long iova, unsigned long length)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	unsigned long last_iova;
 	struct iopt_area *area;
 
@@ -588,6 +623,17 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 	    WARN_ON(check_add_overflow(iova, length - 1, &last_iova)))
 		return;
 
+	mutex_lock(&access->ioas_lock);
+	/*
+	 * The driver must be doing something wrong if it calls this before an
+	 * iommufd_access_attach() or after an iommufd_access_detach().
+	 */
+	if (WARN_ON(!access->ioas_unpin)) {
+		mutex_unlock(&access->ioas_lock);
+		return;
+	}
+	iopt = &access->ioas_unpin->iopt;
+
 	down_read(&iopt->iova_rwsem);
 	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova)
 		iopt_area_remove_access(
@@ -597,6 +643,7 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 				min(last_iova, iopt_area_last_iova(area))));
 	WARN_ON(!iopt_area_contig_done(&iter));
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_unpin_pages, IOMMUFD);
 
@@ -642,8 +689,8 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 			     unsigned long length, struct page **out_pages,
 			     unsigned int flags)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	unsigned long last_iova;
 	struct iopt_area *area;
 	int rc;
@@ -658,6 +705,13 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
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
@@ -688,6 +742,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 	}
 
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return 0;
 
 err_remove:
@@ -702,6 +757,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 						  iopt_area_last_iova(area))));
 	}
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, IOMMUFD);
@@ -721,8 +777,8 @@ EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, IOMMUFD);
 int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 		      void *data, size_t length, unsigned int flags)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	struct iopt_area *area;
 	unsigned long last_iova;
 	int rc;
@@ -732,6 +788,13 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
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
@@ -758,6 +821,7 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 		rc = -ENOENT;
 err_out:
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_rw, IOMMUFD);
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index b38e67d1988b..3dcaf86aab97 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -285,6 +285,8 @@ struct iommufd_access {
 	struct iommufd_object obj;
 	struct iommufd_ctx *ictx;
 	struct iommufd_ioas *ioas;
+	struct iommufd_ioas *ioas_unpin;
+	struct mutex ioas_lock;
 	const struct iommufd_access_ops *ops;
 	void *data;
 	unsigned long iova_alignment;
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 68defed9ea48..3a3216cb9482 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -48,6 +48,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
 		      const struct iommufd_access_ops *ops, void *data, u32 *id);
 void iommufd_access_destroy(struct iommufd_access *access);
 int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id);
+void iommufd_access_detach(struct iommufd_access *access);
 
 void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
-- 
2.34.1

