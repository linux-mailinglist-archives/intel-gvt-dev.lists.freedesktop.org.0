Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCC34427B5
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29D46FAC0;
	Tue,  2 Nov 2021 07:08:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ABA6FAB9;
 Tue,  2 Nov 2021 07:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2a+RfFSwCiVGFwH1/R1/J/3eLHj2AvyXAiy+6QItl+4=; b=l6xJg/PxPimKhq5sTPa2aXjEDu
 gO7mFYhHDUijh2F6MIVr3ajuN8/x1wobDRjFPYX1bmw8yvXkbkZQ7DU1mfd4JT/4+1miYOrIr6MhX
 ZelBqII4CbIqeMG90RO5kosLXVUzZkeWSIPHHKXXRdEexbw0PpvOTaMJ17W0iJr6UkrBoeA+Kt9lh
 XyW/1/8QhTa+dJdQ/mRNY77xSBqY2CEEWrvkaaEUxrg8P78pS7AF6GjqgiV+8agv8MrS0LNtqBck3
 ygcCyQfl5dN/+MT5J6UI9Rj4xavoAr0QdCe8uMkHFq7cH7MnQ1+90GrK5aogjddTlRc29veMMrFU+
 0YcFDpiw==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhntx-000iKi-OI; Tue, 02 Nov 2021 07:08:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 21/29] drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
Date: Tue,  2 Nov 2021 08:05:53 +0100
Message-Id: <20211102070601.155501-22-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
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

Just call the functions directly.  Also remove a pointless wrapper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c    | 10 ++--------
 drivers/gpu/drm/i915/gvt/gtt.c       | 20 +++++++++----------
 drivers/gpu/drm/i915/gvt/gvt.h       |  4 ++++
 drivers/gpu/drm/i915/gvt/hypercall.h |  5 -----
 drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ++----
 drivers/gpu/drm/i915/gvt/mpt.h       | 29 ----------------------------
 6 files changed, 17 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index bc53a0c60b444..03d82f4f9aa2e 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -48,12 +48,6 @@ static int vgpu_pin_dma_address(struct intel_vgpu *vgpu,
 	return ret;
 }
 
-static void vgpu_unpin_dma_address(struct intel_vgpu *vgpu,
-				   dma_addr_t dma_addr)
-{
-	intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, dma_addr);
-}
-
 static int vgpu_gem_get_pages(
 		struct drm_i915_gem_object *obj)
 {
@@ -108,7 +102,7 @@ static int vgpu_gem_get_pages(
 		for_each_sg(st->sgl, sg, i, j) {
 			dma_addr = sg_dma_address(sg);
 			if (dma_addr)
-				vgpu_unpin_dma_address(vgpu, dma_addr);
+				intel_gvt_dma_unmap_guest_page(vgpu, dma_addr);
 		}
 		sg_free_table(st);
 		kfree(st);
@@ -130,7 +124,7 @@ static void vgpu_gem_put_pages(struct drm_i915_gem_object *obj,
 		int i;
 
 		for_each_sg(pages->sgl, sg, fb_info->size, i)
-			vgpu_unpin_dma_address(vgpu,
+			intel_gvt_dma_unmap_guest_page(vgpu,
 					       sg_dma_address(sg));
 	}
 
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 3a7822bbf4570..ae65bd0ba480e 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1011,7 +1011,7 @@ static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
 	if (!pfn || pfn == vgpu->gtt.scratch_pt[type].page_mfn)
 		return;
 
-	intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
+	intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
 }
 
 static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
@@ -1210,8 +1210,8 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 		return PTR_ERR(sub_spt);
 
 	for_each_shadow_entry(sub_spt, &sub_se, sub_index) {
-		ret = intel_gvt_hypervisor_dma_map_guest_page(vgpu,
-				start_gfn + sub_index, PAGE_SIZE, &dma_addr);
+		ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
+						   PAGE_SIZE, &dma_addr);
 		if (ret) {
 			ppgtt_invalidate_spt(spt);
 			return ret;
@@ -1256,8 +1256,8 @@ static int split_64KB_gtt_entry(struct intel_vgpu *vgpu,
 	ops->set_64k_splited(&entry);
 
 	for (i = 0; i < GTT_64K_PTE_STRIDE; i++) {
-		ret = intel_gvt_hypervisor_dma_map_guest_page(vgpu,
-					start_gfn + i, PAGE_SIZE, &dma_addr);
+		ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + i,
+						   PAGE_SIZE, &dma_addr);
 		if (ret)
 			return ret;
 
@@ -1311,8 +1311,7 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 	}
 
 	/* direct shadow */
-	ret = intel_gvt_hypervisor_dma_map_guest_page(vgpu, gfn, page_size,
-						      &dma_addr);
+	ret = intel_gvt_dma_map_guest_page(vgpu, gfn, page_size, &dma_addr);
 	if (ret)
 		return -ENXIO;
 
@@ -2243,8 +2242,7 @@ static void ggtt_invalidate_pte(struct intel_vgpu *vgpu,
 
 	pfn = pte_ops->get_pfn(entry);
 	if (pfn != vgpu->gvt->gtt.scratch_mfn)
-		intel_gvt_hypervisor_dma_unmap_guest_page(vgpu,
-						pfn << PAGE_SHIFT);
+		intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
 }
 
 static int emulate_ggtt_mmio_write(struct intel_vgpu *vgpu, unsigned int off,
@@ -2335,8 +2333,8 @@ static int emulate_ggtt_mmio_write(struct intel_vgpu *vgpu, unsigned int off,
 			goto out;
 		}
 
-		ret = intel_gvt_hypervisor_dma_map_guest_page(vgpu, gfn,
-							PAGE_SIZE, &dma_addr);
+		ret = intel_gvt_dma_map_guest_page(vgpu, gfn, PAGE_SIZE,
+						   &dma_addr);
 		if (ret) {
 			gvt_vgpu_err("fail to populate guest ggtt entry\n");
 			/* guest driver may read/write the entry when partial
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 28e405e00fecd..727b276a29a21 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -766,6 +766,10 @@ void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
 int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn);
 int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn);
+int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
+		unsigned long size, dma_addr_t *dma_addr);
+void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
+		dma_addr_t dma_addr);
 
 #include "trace.h"
 #include "mpt.h"
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index ded13a63ab663..ba03b3368a955 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -46,11 +46,6 @@ struct intel_gvt_mpt {
 	int (*host_init)(struct device *dev, void *gvt);
 	void (*host_exit)(struct device *dev, void *gvt);
 
-	int (*dma_map_guest_page)(struct intel_vgpu *vgpu, unsigned long gfn,
-				  unsigned long size, dma_addr_t *dma_addr);
-	void (*dma_unmap_guest_page)(struct intel_vgpu *vgpu,
-				dma_addr_t dma_addr);
-
 	int (*dma_pin_guest_page)(struct intel_vgpu *vgpu, dma_addr_t dma_addr);
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 4795d7c223ad7..5a35d40f6afee 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1856,7 +1856,7 @@ void intel_vgpu_detach_regions(struct intel_vgpu *vgpu)
 	vgpu->region = NULL;
 }
 
-static int kvmgt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
+int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, dma_addr_t *dma_addr)
 {
 	struct gvt_dma *entry;
@@ -1932,7 +1932,7 @@ static void __gvt_dma_release(struct kref *ref)
 	__gvt_cache_remove_entry(entry->vgpu, entry);
 }
 
-static void kvmgt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
+void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 		dma_addr_t dma_addr)
 {
 	struct gvt_dma *entry;
@@ -1950,8 +1950,6 @@ static void kvmgt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
-	.dma_map_guest_page = kvmgt_dma_map_guest_page,
-	.dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
 	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index d2723ac8bb044..26c1ee690f7e9 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -71,35 +71,6 @@ static inline void intel_gvt_hypervisor_host_exit(struct device *dev, void *gvt)
 	intel_gvt_host.mpt->host_exit(dev, gvt);
 }
 
-/**
- * intel_gvt_hypervisor_dma_map_guest_page - setup dma map for guest page
- * @vgpu: a vGPU
- * @gfn: guest pfn
- * @size: page size
- * @dma_addr: retrieve allocated dma addr
- *
- * Returns:
- * 0 on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_dma_map_guest_page(
-		struct intel_vgpu *vgpu, unsigned long gfn, unsigned long size,
-		dma_addr_t *dma_addr)
-{
-	return intel_gvt_host.mpt->dma_map_guest_page(vgpu, gfn, size,
-						      dma_addr);
-}
-
-/**
- * intel_gvt_hypervisor_dma_unmap_guest_page - cancel dma map for guest page
- * @vgpu: a vGPU
- * @dma_addr: the mapped dma addr
- */
-static inline void intel_gvt_hypervisor_dma_unmap_guest_page(
-		struct intel_vgpu *vgpu, dma_addr_t dma_addr)
-{
-	intel_gvt_host.mpt->dma_unmap_guest_page(vgpu, dma_addr);
-}
-
 /**
  * intel_gvt_hypervisor_dma_pin_guest_page - pin guest dma buf
  * @vgpu: a vGPU
-- 
2.30.2

