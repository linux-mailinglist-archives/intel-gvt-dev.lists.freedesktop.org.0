Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E316CA029
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0F210E3A4;
	Mon, 27 Mar 2023 09:41:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A86810E36E;
 Mon, 27 Mar 2023 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679910064; x=1711446064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vm85x9AYt1FuNsV5sSux5SiZNXs8tl0bAWvFRpe1n0g=;
 b=g+CPss3vZwcG+IaNXGa2ML+lSWDf81K5TzeVPxcJxE4d9UfoZsZBzyqv
 hCLpKMAWWk6mMnIEkepVvEtNND8wsfiiLa0lTyosryd38eIYZ3FjLsiLQ
 n2F9ETN34+eZdRr/mrNV88I+MFXH5Fq6WnaWddtI2Y0Md7Ha0SKpKji4H
 Z4n3DkCyC/HVQ8740CNrYW15GrVRuIZxDHhUetouHumuZXn9ljZVk4arW
 19c1RIqDiWwy68pJthWr/EYTlLZIzkzHChsNPZN2ipET188ZD5V4/SMsa
 m1ueHTFYkTuhs+KuvRBqBleErVQM4irQcTsju3FCUKOsDsq4zjPiBzZku Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426485412"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="426485412"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660775817"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="660775817"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 02:41:03 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 16/24] iommufd/device: Add iommufd_access_detach() API
Date: Mon, 27 Mar 2023 02:40:39 -0700
Message-Id: <20230327094047.47215-17-yi.l.liu@intel.com>
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
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/device.c          | 75 +++++++++++++++++++++++--
 drivers/iommu/iommufd/iommufd_private.h |  2 +
 include/linux/iommufd.h                 |  1 +
 3 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 04a57aa1ae2c..f0522d80919d 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -493,26 +493,66 @@ void iommufd_access_destroy(struct iommufd_access *access)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
 
+static void __iommufd_access_detach(struct iommufd_access *access)
+{
+	struct iommufd_ioas *cur_ioas = access->ioas;
+
+	lockdep_assert_held(&access->ioas_lock);
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
+}
+
+void iommufd_access_detach(struct iommufd_access *access)
+{
+	mutex_lock(&access->ioas_lock);
+	if (WARN_ON(!access->ioas))
+		goto out;
+	__iommufd_access_detach(access);
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
 
-	if (access->ioas != NULL && access->ioas->obj.id != ioas_id)
+	mutex_lock(&access->ioas_lock);
+	if (access->ioas != NULL && access->ioas->obj.id != ioas_id) {
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
@@ -567,8 +607,8 @@ void iommufd_access_notify_unmap(struct io_pagetable *iopt, unsigned long iova,
 void iommufd_access_unpin_pages(struct iommufd_access *access,
 				unsigned long iova, unsigned long length)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	unsigned long last_iova;
 	struct iopt_area *area;
 
@@ -576,6 +616,13 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 	    WARN_ON(check_add_overflow(iova, length - 1, &last_iova)))
 		return;
 
+	mutex_lock(&access->ioas_lock);
+	if (!access->ioas_unpin) {
+		mutex_unlock(&access->ioas_lock);
+		return;
+	}
+	iopt = &access->ioas_unpin->iopt;
+
 	down_read(&iopt->iova_rwsem);
 	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova)
 		iopt_area_remove_access(
@@ -585,6 +632,7 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 				min(last_iova, iopt_area_last_iova(area))));
 	up_read(&iopt->iova_rwsem);
 	WARN_ON(!iopt_area_contig_done(&iter));
+	mutex_unlock(&access->ioas_lock);
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_unpin_pages, IOMMUFD);
 
@@ -630,8 +678,8 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 			     unsigned long length, struct page **out_pages,
 			     unsigned int flags)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	unsigned long last_iova;
 	struct iopt_area *area;
 	int rc;
@@ -646,6 +694,13 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
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
@@ -676,6 +731,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 	}
 
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return 0;
 
 err_remove:
@@ -690,6 +746,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 						  iopt_area_last_iova(area))));
 	}
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, IOMMUFD);
@@ -709,8 +766,8 @@ EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, IOMMUFD);
 int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 		      void *data, size_t length, unsigned int flags)
 {
-	struct io_pagetable *iopt = &access->ioas->iopt;
 	struct iopt_area_contig_iter iter;
+	struct io_pagetable *iopt;
 	struct iopt_area *area;
 	unsigned long last_iova;
 	int rc;
@@ -720,6 +777,13 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
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
@@ -746,6 +810,7 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 		rc = -ENOENT;
 err_out:
 	up_read(&iopt->iova_rwsem);
+	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_rw, IOMMUFD);
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 2e6e8e217cce..ec2ce3ef187d 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -263,6 +263,8 @@ struct iommufd_access {
 	struct iommufd_object obj;
 	struct iommufd_ctx *ictx;
 	struct iommufd_ioas *ioas;
+	struct iommufd_ioas *ioas_unpin;
+	struct mutex ioas_lock;
 	const struct iommufd_access_ops *ops;
 	void *data;
 	unsigned long iova_alignment;
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index ac96df406833..9e0e8894dacc 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -47,6 +47,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
 		      const struct iommufd_access_ops *ops, void *data, u32 *id);
 void iommufd_access_destroy(struct iommufd_access *access);
 int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id);
+void iommufd_access_detach(struct iommufd_access *access);
 
 void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
-- 
2.34.1

