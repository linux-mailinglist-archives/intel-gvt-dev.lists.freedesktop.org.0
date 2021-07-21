Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4853D1309
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C896D6E97A;
	Wed, 21 Jul 2021 15:58:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0B46E97A;
 Wed, 21 Jul 2021 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9xPJ9naRUANFy9h2cY5xf8zUvqKXHA0ZHCo06BG9JQA=; b=e6Vkg9EjjAAItqK48NGxyE3I7H
 gOG8JD4xWd5FgUh30mNGkrb44pdK9iHH1NlgYDgA0tsvtYy3JWwfjh/OPSEhi/uHQENLe4+Fhuv1e
 VDNaMmw6RAEn+2CCVKPj3OFrNb6CZe+Y//GwPsfSKk8VpdpOi2mnI+Eh6So35syz0y2WOZxvk6IQ7
 4xJq1ekzw3QOuLREr5Rq/KLY2o5XkrQ2s0YlWErb+kxA20X4It5ZrQkfjSFwPurU8AAHg/mVxt4lH
 jxvNaB9g6evLbvthoDBprjvUvPAN2C4I50+HjI7Gzqqz0bMNyMd6T1RpIYAALHcGI5KpSwwRNkC4J
 6378cuQg==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ebo-009MXU-3t; Wed, 21 Jul 2021 15:58:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 12/21] drm/i915/gvt: devirtualize ->{get,put}_vfio_device
Date: Wed, 21 Jul 2021 17:53:46 +0200
Message-Id: <20210721155355.173183-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210721155355.173183-1-hch@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Just open code the calls to the VFIO APIs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c    | 12 ++++++-----
 drivers/gpu/drm/i915/gvt/hypercall.h |  2 --
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 22 --------------------
 drivers/gpu/drm/i915/gvt/mpt.h       | 30 ----------------------------
 4 files changed, 7 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 8e65cd8258b9..bc53a0c60b44 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -29,7 +29,7 @@
  */
 
 #include <linux/dma-buf.h>
-#include <linux/vfio.h>
+#include <linux/mdev.h>
 
 #include "i915_drv.h"
 #include "gvt.h"
@@ -152,7 +152,7 @@ static void dmabuf_gem_object_free(struct kref *kref)
 					struct intel_vgpu_dmabuf_obj, list);
 			if (dmabuf_obj == obj) {
 				list_del(pos);
-				intel_gvt_hypervisor_put_vfio_device(vgpu);
+				vfio_device_put(vgpu->vfio_device);
 				idr_remove(&vgpu->object_idr,
 					   dmabuf_obj->dmabuf_id);
 				kfree(dmabuf_obj->info);
@@ -493,9 +493,11 @@ int intel_vgpu_query_plane(struct intel_vgpu *vgpu, void *args)
 	kref_init(&dmabuf_obj->kref);
 
 	mutex_lock(&vgpu->dmabuf_lock);
-	if (intel_gvt_hypervisor_get_vfio_device(vgpu)) {
-		gvt_vgpu_err("get vfio device failed\n");
+	vgpu->vfio_device = vfio_device_get_from_dev(mdev_dev(vgpu->mdev));
+	if (!vgpu->vfio_device) {
+		gvt_vgpu_err("failed to get vfio device\n");
 		mutex_unlock(&vgpu->dmabuf_lock);
+		ret = -ENODEV;
 		goto out_free_info;
 	}
 	mutex_unlock(&vgpu->dmabuf_lock);
@@ -605,7 +607,7 @@ void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
 		dmabuf_obj->vgpu = NULL;
 
 		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
-		intel_gvt_hypervisor_put_vfio_device(vgpu);
+		vfio_device_put(vgpu->vfio_device);
 		list_del(pos);
 
 		/* dmabuf_obj might be freed in dmabuf_obj_put */
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 61e493e2de85..fd903d52f431 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -60,8 +60,6 @@ struct intel_gvt_mpt {
 
 	int (*set_opregion)(struct intel_vgpu *vgpu);
 	int (*set_edid)(struct intel_vgpu *vgpu, int port_num);
-	int (*get_vfio_device)(struct intel_vgpu *vgpu);
-	void (*put_vfio_device)(struct intel_vgpu *vgpu);
 	bool (*is_valid_gfn)(struct intel_vgpu *vgpu, unsigned long gfn);
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7b588a371adb..a74fd4c78f35 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -643,18 +643,6 @@ static int intel_vgpu_register_reg(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-static int kvmgt_get_vfio_device(struct intel_vgpu *vgpu)
-{
-	vgpu->vfio_device = vfio_device_get_from_dev(
-		mdev_dev(vgpu->mdev));
-	if (!vgpu->vfio_device) {
-		gvt_vgpu_err("failed to get vfio device\n");
-		return -ENODEV;
-	}
-	return 0;
-}
-
-
 static int kvmgt_set_opregion(struct intel_vgpu *vgpu)
 {
 	void *base;
@@ -711,14 +699,6 @@ static int kvmgt_set_edid(struct intel_vgpu *vgpu, int port_num)
 	return ret;
 }
 
-static void kvmgt_put_vfio_device(struct intel_vgpu *vgpu)
-{
-	if (WARN_ON(!vgpu->vfio_device))
-		return;
-
-	vfio_device_put(vgpu->vfio_device);
-}
-
 static int intel_vgpu_create(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = NULL;
@@ -2033,8 +2013,6 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
 	.set_opregion = kvmgt_set_opregion,
 	.set_edid = kvmgt_set_edid,
-	.get_vfio_device = kvmgt_get_vfio_device,
-	.put_vfio_device = kvmgt_put_vfio_device,
 	.is_valid_gfn = kvmgt_is_valid_gfn,
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 72388ceec596..2196187203af 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -242,36 +242,6 @@ static inline int intel_gvt_hypervisor_set_edid(struct intel_vgpu *vgpu,
 	return intel_gvt_host.mpt->set_edid(vgpu, port_num);
 }
 
-/**
- * intel_gvt_hypervisor_get_vfio_device - increase vfio device ref count
- * @vgpu: a vGPU
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_get_vfio_device(struct intel_vgpu *vgpu)
-{
-	if (!intel_gvt_host.mpt->get_vfio_device)
-		return 0;
-
-	return intel_gvt_host.mpt->get_vfio_device(vgpu);
-}
-
-/**
- * intel_gvt_hypervisor_put_vfio_device - decrease vfio device ref count
- * @vgpu: a vGPU
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline void intel_gvt_hypervisor_put_vfio_device(struct intel_vgpu *vgpu)
-{
-	if (!intel_gvt_host.mpt->put_vfio_device)
-		return;
-
-	intel_gvt_host.mpt->put_vfio_device(vgpu);
-}
-
 /**
  * intel_gvt_hypervisor_is_valid_gfn - check if a visible gfn
  * @vgpu: a vGPU
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
