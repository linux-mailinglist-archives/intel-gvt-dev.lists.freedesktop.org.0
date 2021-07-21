Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4153D132C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 18:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8F96E9B1;
	Wed, 21 Jul 2021 16:01:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F9D6E97A;
 Wed, 21 Jul 2021 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9Y4lS7mCaUEzdmYEd6LFOAeu1tjQbyqGxckRRA3PXtQ=; b=gZ1vnmT3R6Wgh5A7Q6q8wfTgRU
 G57BEX2Z9hEJ9FsOViYedPH84g3k6pxbXkFeIub9JvjXIKLDju4hh8TQ1cLxkUZ0XBAxlwkp3KhGX
 YDjkVpkkyBXb8dbWqQVDmni+xRAF85dGdzNZP9g55Ls46R84Nnl6b5st6+/v2mnTeWRsb1hMGQbtT
 Ecsrzbcz1PziSwje63UXIfuPUIhsmsE58pneneXnLMYw3sEj8t8F8A9RMw5VkL/xExzGgYA6idc9R
 lijfF5IGxdIgfmVxzAHD+rqBkVaNhxht44ZvD3rE8Wxan7zd+laDedhVQwpLPWFys3F9HW34sRItu
 vx9yU0Pw==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ees-009MjY-N5; Wed, 21 Jul 2021 16:01:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 19/21] drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
Date: Wed, 21 Jul 2021 17:53:53 +0200
Message-Id: <20210721155355.173183-20-hch@lst.de>
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
index bc53a0c60b44..03d82f4f9aa2 100644
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
index 75782f59df8e..0ae28b7f5c07 100644
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
index e186ded7ec68..9d5a286e1269 100644
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
index ded13a63ab66..ba03b3368a95 100644
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
index 72e33332c412..8101c1485f12 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1855,7 +1855,7 @@ void intel_vgpu_detach_regions(struct intel_vgpu *vgpu)
 	vgpu->region = NULL;
 }
 
-static int kvmgt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
+int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, dma_addr_t *dma_addr)
 {
 	struct gvt_dma *entry;
@@ -1931,7 +1931,7 @@ static void __gvt_dma_release(struct kref *ref)
 	__gvt_cache_remove_entry(entry->vgpu, entry);
 }
 
-static void kvmgt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
+void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 		dma_addr_t dma_addr)
 {
 	struct gvt_dma *entry;
@@ -1949,8 +1949,6 @@ static void kvmgt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
-	.dma_map_guest_page = kvmgt_dma_map_guest_page,
-	.dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
 	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index d2723ac8bb04..26c1ee690f7e 100644
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

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
