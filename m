Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F74FBE94
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9610ECDF;
	Mon, 11 Apr 2022 14:14:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72ACC10ECDF;
 Mon, 11 Apr 2022 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=35IBAUnex6kXDSHlwi8o9RppFKkvZlsNITZ27ystrBo=; b=yJlEP5IoESb36TsLC4Q/y56fR5
 gbeSQg5PoKCwM5ZTfRgV+m79Q1sfhBuq8kzuHGU0sq5SF5H32t+yH8xtK2/ZkjT9wrDOn7dVQ0MLM
 1IrHgvxyrIvnDj0kFW3BVMQShleQ4DhBF5ge0pQEttyhFNqwbL1qgQHO29Oz7i5VyNDRwgiABUQ5Z
 Upt2uFDI3B4/RPBJgkdQlePvHFT9WO787xIAaN2Q4eerakSBb+sgjwSeU1RhmzVe9XJQzhvyGjRX8
 g/24lMI+dezQonFZhIIFHtE+o+oys8u6tU3q+dbwGUvSD8tP3ICxA2dKGe9Nobn3jCxEl6QYF9SmM
 EPWv0K4w==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduoc-009KZn-I9; Mon, 11 Apr 2022 14:14:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 14/34] drm/i915/gvt: devirtualize ->{get,put}_vfio_device
Date: Mon, 11 Apr 2022 16:13:43 +0200
Message-Id: <20220411141403.86980-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411141403.86980-1-hch@lst.de>
References: <20220411141403.86980-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
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
index c95c25d2addbc..cc1a9ac0d2720 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -29,7 +29,7 @@
  */
 
 #include <linux/dma-buf.h>
-#include <linux/vfio.h>
+#include <linux/mdev.h>
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
@@ -157,7 +157,7 @@ static void dmabuf_gem_object_free(struct kref *kref)
 			dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 			if (dmabuf_obj == obj) {
 				list_del(pos);
-				intel_gvt_hypervisor_put_vfio_device(vgpu);
+				vfio_device_put(vgpu->vfio_device);
 				idr_remove(&vgpu->object_idr,
 					   dmabuf_obj->dmabuf_id);
 				kfree(dmabuf_obj->info);
@@ -492,9 +492,11 @@ int intel_vgpu_query_plane(struct intel_vgpu *vgpu, void *args)
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
@@ -603,7 +605,7 @@ void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
 		dmabuf_obj->vgpu = NULL;
 
 		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
-		intel_gvt_hypervisor_put_vfio_device(vgpu);
+		vfio_device_put(vgpu->vfio_device);
 		list_del(pos);
 
 		/* dmabuf_obj might be freed in dmabuf_obj_put */
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 61e493e2de852..fd903d52f4314 100644
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
index e4e3d0cc66fc8..1f70cbd51a3fa 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -662,18 +662,6 @@ static int intel_vgpu_register_reg(struct intel_vgpu *vgpu,
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
@@ -730,14 +718,6 @@ static int kvmgt_set_edid(struct intel_vgpu *vgpu, int port_num)
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
@@ -2052,8 +2032,6 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
 	.set_opregion = kvmgt_set_opregion,
 	.set_edid = kvmgt_set_edid,
-	.get_vfio_device = kvmgt_get_vfio_device,
-	.put_vfio_device = kvmgt_put_vfio_device,
 	.is_valid_gfn = kvmgt_is_valid_gfn,
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 72388ceec5966..2196187203af1 100644
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

