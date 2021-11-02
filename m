Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BA444279F
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5748A6FABB;
	Tue,  2 Nov 2021 07:07:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F776FAB5;
 Tue,  2 Nov 2021 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OAgWg4I4MPC9vp+37hZGe+fN9gmHZF7Ej0/ePYW2Dec=; b=Wv3vmsnKzOxoO2dpWLG1MqrMM+
 MKaKjBZ3TFKBO+Wz7s1liSNHPdfrl/ZvzscHN7oZlV9g2CjP7/O2r2rJzczCouUfFQ2+Q0Df/+sIc
 8OGoG3162pyDD/Gw3P6V56Mkh7BRWABrseq/bTPG5tYazGW2/a7CLVCKpUaGFzdFLTOKKB7ChuI87
 DRU2PrgBiCFXzqlv9o+CsNkaGgF3CwgzafmnOM0Hmv605jNHzh8HZaOpeD9JJVZtyNZp7fsU0u3Af
 4nTNelZELMUZHFUT9LKzphGz7SwdH5RTYvr6PyGlUGUPHVm/W5zK/rAdff8tKNJeQfBPdXLoJ1BMm
 mTtHLWAA==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhntF-000iCh-Vl; Tue, 02 Nov 2021 07:07:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 13/29] drm/i915/gvt: devirtualize ->{read,write}_gpa
Date: Tue,  2 Nov 2021 08:05:45 +0100
Message-Id: <20211102070601.155501-14-hch@lst.de>
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

Just call the VFIO functions directly instead of through the method
table.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c |  4 +--
 drivers/gpu/drm/i915/gvt/execlist.c   | 12 ++++-----
 drivers/gpu/drm/i915/gvt/gtt.c        |  6 ++---
 drivers/gpu/drm/i915/gvt/gvt.h        | 37 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/hypercall.h  |  4 ---
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 23 -----------------
 drivers/gpu/drm/i915/gvt/mmio.c       |  4 +--
 drivers/gpu/drm/i915/gvt/mpt.h        | 32 -----------------------
 drivers/gpu/drm/i915/gvt/opregion.c   | 10 +++-----
 drivers/gpu/drm/i915/gvt/scheduler.c  | 37 +++++++++++++--------------
 10 files changed, 72 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index c4118b8082682..c694d2c5efdd5 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1009,7 +1009,7 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 	if (GRAPHICS_VER(s->engine->i915) == 9 &&
 	    intel_gvt_mmio_is_sr_in_ctx(gvt, offset) &&
 	    !strncmp(cmd, "lri", 3)) {
-		intel_gvt_hypervisor_read_gpa(s->vgpu,
+		intel_gvt_read_gpa(s->vgpu,
 			s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);
 		/* check inhibit context */
 		if (ctx_sr_ctl & 1) {
@@ -1773,7 +1773,7 @@ static int copy_gma_to_hva(struct intel_vgpu *vgpu, struct intel_vgpu_mm *mm,
 		copy_len = (end_gma - gma) >= (I915_GTT_PAGE_SIZE - offset) ?
 			I915_GTT_PAGE_SIZE - offset : end_gma - gma;
 
-		intel_gvt_hypervisor_read_gpa(vgpu, gpa, va + len, copy_len);
+		intel_gvt_read_gpa(vgpu, gpa, va + len, copy_len);
 
 		len += copy_len;
 		gma += copy_len;
diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index c8dcda6d4f0d2..a3e15e7a83758 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -159,12 +159,12 @@ static void emulate_csb_update(struct intel_vgpu_execlist *execlist,
 	hwsp_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
 					 vgpu->hws_pga[execlist->engine->id]);
 	if (hwsp_gpa != INTEL_GVT_INVALID_ADDR) {
-		intel_gvt_hypervisor_write_gpa(vgpu,
-					       hwsp_gpa + I915_HWS_CSB_BUF0_INDEX * 4 + write_pointer * 8,
-					       status, 8);
-		intel_gvt_hypervisor_write_gpa(vgpu,
-					       hwsp_gpa + intel_hws_csb_write_index(execlist->engine->i915) * 4,
-					       &write_pointer, 4);
+		intel_gvt_write_gpa(vgpu,
+			hwsp_gpa + I915_HWS_CSB_BUF0_INDEX * 4 + write_pointer * 8,
+			status, 8);
+		intel_gvt_write_gpa(vgpu,
+			hwsp_gpa + intel_hws_csb_write_index(execlist->engine->i915) * 4,
+			&write_pointer, 4);
 	}
 
 	gvt_dbg_el("vgpu%d: w pointer %u reg %x csb l %x csb h %x\n",
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index e5c2fdfc20e33..1a9b9b8a5d937 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -312,7 +312,7 @@ static inline int gtt_get_entry64(void *pt,
 		return -EINVAL;
 
 	if (hypervisor_access) {
-		ret = intel_gvt_hypervisor_read_gpa(vgpu, gpa +
+		ret = intel_gvt_read_gpa(vgpu, gpa +
 				(index << info->gtt_entry_size_shift),
 				&e->val64, 8);
 		if (WARN_ON(ret))
@@ -337,7 +337,7 @@ static inline int gtt_set_entry64(void *pt,
 		return -EINVAL;
 
 	if (hypervisor_access) {
-		ret = intel_gvt_hypervisor_write_gpa(vgpu, gpa +
+		ret = intel_gvt_write_gpa(vgpu, gpa +
 				(index << info->gtt_entry_size_shift),
 				&e->val64, 8);
 		if (WARN_ON(ret))
@@ -1495,7 +1495,7 @@ static int attach_oos_page(struct intel_vgpu_oos_page *oos_page,
 	struct intel_gvt *gvt = spt->vgpu->gvt;
 	int ret;
 
-	ret = intel_gvt_hypervisor_read_gpa(spt->vgpu,
+	ret = intel_gvt_read_gpa(spt->vgpu,
 			spt->guest_page.gfn << I915_GTT_PAGE_SHIFT,
 			oos_page->mem, I915_GTT_PAGE_SIZE);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index d86f54f7c59d0..73931601a573f 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -35,6 +35,7 @@
 
 #include <uapi/linux/pci_regs.h>
 #include <linux/kvm_host.h>
+#include <linux/vfio.h>
 
 #include "i915_drv.h"
 
@@ -719,6 +720,42 @@ static inline bool intel_gvt_mmio_is_cmd_write_patch(
 	return gvt->mmio.mmio_attribute[offset >> 2] & F_CMD_WRITE_PATCH;
 }
 
+/**
+ * intel_gvt_read_gpa - copy data from GPA to host data buffer
+ * @vgpu: a vGPU
+ * @gpa: guest physical address
+ * @buf: host data buffer
+ * @len: data length
+ *
+ * Returns:
+ * Zero on success, negative error code if failed.
+ */
+static inline int intel_gvt_read_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
+		void *buf, unsigned long len)
+{
+	if (!vgpu->attached)
+		return -ESRCH;
+	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, false);
+}
+
+/**
+ * intel_gvt_write_gpa - copy data from host data buffer to GPA
+ * @vgpu: a vGPU
+ * @gpa: guest physical address
+ * @buf: host data buffer
+ * @len: data length
+ *
+ * Returns:
+ * Zero on success, negative error code if failed.
+ */
+static inline int intel_gvt_write_gpa(struct intel_vgpu *vgpu,
+		unsigned long gpa, void *buf, unsigned long len)
+{
+	if (!vgpu->attached)
+		return -ESRCH;
+	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, true);
+}
+
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 9f04757598251..61e493e2de852 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -49,10 +49,6 @@ struct intel_gvt_mpt {
 	int (*inject_msi)(struct intel_vgpu *vgpu, u32 addr, u16 data);
 	int (*enable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
 	int (*disable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
-	int (*read_gpa)(struct intel_vgpu *vgpu, unsigned long gpa, void *buf,
-			unsigned long len);
-	int (*write_gpa)(struct intel_vgpu *vgpu, unsigned long gpa, void *buf,
-			 unsigned long len);
 	unsigned long (*gfn_to_mfn)(struct intel_vgpu *vgpu, unsigned long gfn);
 
 	int (*dma_map_guest_page)(struct intel_vgpu *vgpu, unsigned long gfn,
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7f1a455584408..002d43b02adde 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -39,7 +39,6 @@
 #include <linux/spinlock.h>
 #include <linux/eventfd.h>
 #include <linux/uuid.h>
-#include <linux/vfio.h>
 #include <linux/mdev.h>
 #include <linux/debugfs.h>
 
@@ -2006,26 +2005,6 @@ static void kvmgt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 	mutex_unlock(&vgpu->cache_lock);
 }
 
-static int kvmgt_rw_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
-			void *buf, unsigned long len, bool write)
-{
-	if (!vgpu->attached)
-		return -ESRCH;
-	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, write);
-}
-
-static int kvmgt_read_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
-			void *buf, unsigned long len)
-{
-	return kvmgt_rw_gpa(vgpu, gpa, buf, len, false);
-}
-
-static int kvmgt_write_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
-			void *buf, unsigned long len)
-{
-	return kvmgt_rw_gpa(vgpu, gpa, buf, len, true);
-}
-
 static bool kvmgt_is_valid_gfn(struct intel_vgpu *vgpu, unsigned long gfn)
 {
 	struct kvm *kvm = vgpu->kvm;
@@ -2049,8 +2028,6 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.inject_msi = kvmgt_inject_msi,
 	.enable_page_track = kvmgt_page_track_add,
 	.disable_page_track = kvmgt_page_track_remove,
-	.read_gpa = kvmgt_read_gpa,
-	.write_gpa = kvmgt_write_gpa,
 	.gfn_to_mfn = kvmgt_gfn_to_pfn,
 	.dma_map_guest_page = kvmgt_dma_map_guest_page,
 	.dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index 24210b1eaec58..464a2ae1a83c8 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -136,7 +136,7 @@ int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
 	}
 
 	if (drm_WARN_ON_ONCE(&i915->drm, !reg_is_mmio(gvt, offset))) {
-		ret = intel_gvt_hypervisor_read_gpa(vgpu, pa, p_data, bytes);
+		ret = intel_gvt_read_gpa(vgpu, pa, p_data, bytes);
 		goto out;
 	}
 
@@ -212,7 +212,7 @@ int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, u64 pa,
 	}
 
 	if (drm_WARN_ON_ONCE(&i915->drm, !reg_is_mmio(gvt, offset))) {
-		ret = intel_gvt_hypervisor_write_gpa(vgpu, pa, p_data, bytes);
+		ret = intel_gvt_write_gpa(vgpu, pa, p_data, bytes);
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index ba0c31c4a705c..72388ceec5966 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -152,38 +152,6 @@ static inline int intel_gvt_hypervisor_disable_page_track(
 	return intel_gvt_host.mpt->disable_page_track(vgpu, gfn);
 }
 
-/**
- * intel_gvt_hypervisor_read_gpa - copy data from GPA to host data buffer
- * @vgpu: a vGPU
- * @gpa: guest physical address
- * @buf: host data buffer
- * @len: data length
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_read_gpa(struct intel_vgpu *vgpu,
-		unsigned long gpa, void *buf, unsigned long len)
-{
-	return intel_gvt_host.mpt->read_gpa(vgpu, gpa, buf, len);
-}
-
-/**
- * intel_gvt_hypervisor_write_gpa - copy data from host data buffer to GPA
- * @vgpu: a vGPU
- * @gpa: guest physical address
- * @buf: host data buffer
- * @len: data length
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_write_gpa(struct intel_vgpu *vgpu,
-		unsigned long gpa, void *buf, unsigned long len)
-{
-	return intel_gvt_host.mpt->write_gpa(vgpu, gpa, buf, len);
-}
-
 /**
  * intel_gvt_hypervisor_gfn_to_mfn - translate a GFN to MFN
  * @vgpu: a vGPU
diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 286ac6d7c6ced..d2bed466540ab 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -421,14 +421,14 @@ int intel_vgpu_emulate_opregion_request(struct intel_vgpu *vgpu, u32 swsci)
 				INTEL_GVT_OPREGION_SCIC;
 	parm_pa = (vgpu_opregion(vgpu)->gfn[0] << PAGE_SHIFT) +
 				INTEL_GVT_OPREGION_PARM;
-	ret = intel_gvt_hypervisor_read_gpa(vgpu, scic_pa, &scic, sizeof(scic));
+	ret = intel_gvt_read_gpa(vgpu, scic_pa, &scic, sizeof(scic));
 	if (ret) {
 		gvt_vgpu_err("guest opregion read error %d, gpa 0x%llx, len %lu\n",
 			ret, scic_pa, sizeof(scic));
 		return ret;
 	}
 
-	ret = intel_gvt_hypervisor_read_gpa(vgpu, parm_pa, &parm, sizeof(parm));
+	ret = intel_gvt_read_gpa(vgpu, parm_pa, &parm, sizeof(parm));
 	if (ret) {
 		gvt_vgpu_err("guest opregion read error %d, gpa 0x%llx, len %lu\n",
 			ret, scic_pa, sizeof(scic));
@@ -465,16 +465,14 @@ int intel_vgpu_emulate_opregion_request(struct intel_vgpu *vgpu, u32 swsci)
 	parm = 0;
 
 out:
-	ret = intel_gvt_hypervisor_write_gpa(vgpu, scic_pa, &scic,
-					     sizeof(scic));
+	ret = intel_gvt_write_gpa(vgpu, scic_pa, &scic, sizeof(scic));
 	if (ret) {
 		gvt_vgpu_err("guest opregion write error %d, gpa 0x%llx, len %lu\n",
 			ret, scic_pa, sizeof(scic));
 		return ret;
 	}
 
-	ret = intel_gvt_hypervisor_write_gpa(vgpu, parm_pa, &parm,
-					     sizeof(parm));
+	ret = intel_gvt_write_gpa(vgpu, parm_pa, &parm, sizeof(parm));
 	if (ret) {
 		gvt_vgpu_err("guest opregion write error %d, gpa 0x%llx, len %lu\n",
 			ret, scic_pa, sizeof(scic));
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 1bb1be5c48c84..43fedfe9639ac 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -148,10 +148,10 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, true);
 #define COPY_REG(name) \
-	intel_gvt_hypervisor_read_gpa(vgpu, workload->ring_context_gpa \
+	intel_gvt_read_gpa(vgpu, workload->ring_context_gpa \
 		+ RING_CTX_OFF(name.val), &shadow_ring_context->name.val, 4)
 #define COPY_REG_MASKED(name) {\
-		intel_gvt_hypervisor_read_gpa(vgpu, workload->ring_context_gpa \
+		intel_gvt_read_gpa(vgpu, workload->ring_context_gpa \
 					      + RING_CTX_OFF(name.val),\
 					      &shadow_ring_context->name.val, 4);\
 		shadow_ring_context->name.val |= 0xffff << 16;\
@@ -165,7 +165,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		COPY_REG(rcs_indirect_ctx);
 		COPY_REG(rcs_indirect_ctx_offset);
 	} else if (workload->engine->id == BCS0)
-		intel_gvt_hypervisor_read_gpa(vgpu,
+		intel_gvt_read_gpa(vgpu,
 				workload->ring_context_gpa +
 				BCS_TILE_REGISTER_VAL_OFFSET,
 				(void *)shadow_ring_context +
@@ -176,7 +176,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	/* don't copy Ring Context (the first 0x50 dwords),
 	 * only copy the Engine Context part from guest
 	 */
-	intel_gvt_hypervisor_read_gpa(vgpu,
+	intel_gvt_read_gpa(vgpu,
 			workload->ring_context_gpa +
 			RING_CTX_SIZE,
 			(void *)shadow_ring_context +
@@ -243,7 +243,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		continue;
 
 read:
-		intel_gvt_hypervisor_read_gpa(vgpu, gpa_base, dst, gpa_size);
+		intel_gvt_read_gpa(vgpu, gpa_base, dst, gpa_size);
 		gpa_base = context_gpa;
 		gpa_size = I915_GTT_PAGE_SIZE;
 		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
@@ -909,8 +909,7 @@ static void update_guest_pdps(struct intel_vgpu *vgpu,
 	gpa = ring_context_gpa + RING_CTX_OFF(pdps[0].val);
 
 	for (i = 0; i < 8; i++)
-		intel_gvt_hypervisor_write_gpa(vgpu,
-				gpa + i * 8, &pdp[7 - i], 4);
+		intel_gvt_write_gpa(vgpu, gpa + i * 8, &pdp[7 - i], 4);
 }
 
 static __maybe_unused bool
@@ -1005,13 +1004,13 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 		continue;
 
 write:
-		intel_gvt_hypervisor_write_gpa(vgpu, gpa_base, src, gpa_size);
+		intel_gvt_write_gpa(vgpu, gpa_base, src, gpa_size);
 		gpa_base = context_gpa;
 		gpa_size = I915_GTT_PAGE_SIZE;
 		src = context_base + (i << I915_GTT_PAGE_SHIFT);
 	}
 
-	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
+	intel_gvt_write_gpa(vgpu, workload->ring_context_gpa +
 		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
 
 	shadow_ring_context = (void *) ctx->lrc_reg_state;
@@ -1026,7 +1025,7 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	}
 
 #define COPY_REG(name) \
-	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa + \
+	intel_gvt_write_gpa(vgpu, workload->ring_context_gpa + \
 		RING_CTX_OFF(name.val), &shadow_ring_context->name.val, 4)
 
 	COPY_REG(ctx_ctrl);
@@ -1034,7 +1033,7 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 
 #undef COPY_REG
 
-	intel_gvt_hypervisor_write_gpa(vgpu,
+	intel_gvt_write_gpa(vgpu,
 			workload->ring_context_gpa +
 			sizeof(*shadow_ring_context),
 			(void *)shadow_ring_context +
@@ -1571,7 +1570,7 @@ static void read_guest_pdps(struct intel_vgpu *vgpu,
 	gpa = ring_context_gpa + RING_CTX_OFF(pdps[0].val);
 
 	for (i = 0; i < 8; i++)
-		intel_gvt_hypervisor_read_gpa(vgpu,
+		intel_gvt_read_gpa(vgpu,
 				gpa + i * 8, &pdp[7 - i], 4);
 }
 
@@ -1642,10 +1641,10 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
 		return ERR_PTR(-EINVAL);
 	}
 
-	intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
+	intel_gvt_read_gpa(vgpu, ring_context_gpa +
 			RING_CTX_OFF(ring_header.val), &head, 4);
 
-	intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
+	intel_gvt_read_gpa(vgpu, ring_context_gpa +
 			RING_CTX_OFF(ring_tail.val), &tail, 4);
 
 	guest_head = head;
@@ -1672,11 +1671,11 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
 	gvt_dbg_el("ring %s begin a new workload\n", engine->name);
 
 	/* record some ring buffer register values for scan and shadow */
-	intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
+	intel_gvt_read_gpa(vgpu, ring_context_gpa +
 			RING_CTX_OFF(rb_start.val), &start, 4);
-	intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
+	intel_gvt_read_gpa(vgpu, ring_context_gpa +
 			RING_CTX_OFF(rb_ctrl.val), &ctl, 4);
-	intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
+	intel_gvt_read_gpa(vgpu, ring_context_gpa +
 			RING_CTX_OFF(ctx_ctrl.val), &ctx_ctl, 4);
 
 	if (!intel_gvt_ggtt_validate_range(vgpu, start,
@@ -1699,9 +1698,9 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
 	workload->rb_ctl = ctl;
 
 	if (engine->id == RCS0) {
-		intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
+		intel_gvt_read_gpa(vgpu, ring_context_gpa +
 			RING_CTX_OFF(bb_per_ctx_ptr.val), &per_ctx, 4);
-		intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
+		intel_gvt_read_gpa(vgpu, ring_context_gpa +
 			RING_CTX_OFF(rcs_indirect_ctx.val), &indirect_ctx, 4);
 
 		workload->wa_ctx.indirect_ctx.guest_gma =
-- 
2.30.2

