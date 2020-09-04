Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614925F147
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Sep 2020 02:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D425E6E0C4;
	Mon,  7 Sep 2020 00:55:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261B289F41;
 Mon,  7 Sep 2020 00:55:58 +0000 (UTC)
IronPort-SDR: OJjHx6+g/zvFbutzNEoaTmCDIxaS3P93qrPjfWJTtuFxIqJ1uNluaGVFr+hPhJeLb+ocTSsReP
 dxesvJTwL3hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157950657"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157950657"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 17:55:58 -0700
IronPort-SDR: +0KaqV7BlI3Ee2EXq5tPc53/VWfbVl4K2JVug/r1YQPDwyjbcpLMnGl2HJ2Cfgj78+4PNfVCJ/
 wTIn/Q4jBVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="479444008"
Received: from xzhan34-mobl2.bj.intel.com ([10.238.154.74])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2020 17:55:55 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 10/12] drm/i915/gvt: GVTg support ppgtt pv operations
Date: Sat,  5 Sep 2020 00:21:43 +0800
Message-Id: <1599236505-9086-11-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: kevin.tian@intel.com, Xiaolin Zhang <xiaolin.zhang@intel.com>,
 joonas.lahtinen@linux.intel.com, zhenyuw@linux.intel.com,
 chris@chris-wilson.co.uk, zhiyuan.lv@intel.com, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This patch is to handle ppgtt PV_CMD_BIND_PPGTT and PV_CMD_UNBIND_PPGTT

for ppgtt, it creates local ppgtt tables and set up the PTE's directly
from the PV command data from guest, which does not track the usage of
guest page table and remove the cost of write protection from the
original PPGTT shadow page mechansim.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c      | 172 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |   4 +
 drivers/gpu/drm/i915/gvt/gvt.h      |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c |  25 ++++++
 drivers/gpu/drm/i915/gvt/vgpu.c     |   2 +
 5 files changed, 204 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 04bf018..c13560a 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1777,6 +1777,25 @@ static int ppgtt_handle_guest_write_page_table_bytes(
 	return 0;
 }
 
+static void invalidate_mm_pv(struct intel_vgpu_mm *mm)
+{
+	struct intel_vgpu *vgpu = mm->vgpu;
+	struct intel_gvt *gvt = vgpu->gvt;
+	struct intel_gvt_gtt *gtt = &gvt->gtt;
+	struct intel_gvt_gtt_pte_ops *ops = gtt->pte_ops;
+	struct intel_gvt_gtt_entry se;
+
+	i915_vm_put(&mm->ppgtt->vm);
+
+	ppgtt_get_shadow_root_entry(mm, &se, 0);
+	if (!ops->test_present(&se))
+		return;
+	se.val64 = 0;
+	ppgtt_set_shadow_root_entry(mm, &se, 0);
+
+	mm->ppgtt_mm.shadowed  = false;
+}
+
 static void invalidate_ppgtt_mm(struct intel_vgpu_mm *mm)
 {
 	struct intel_vgpu *vgpu = mm->vgpu;
@@ -1789,6 +1808,11 @@ static void invalidate_ppgtt_mm(struct intel_vgpu_mm *mm)
 	if (!mm->ppgtt_mm.shadowed)
 		return;
 
+	if (intel_vgpu_enabled_pv_cap(vgpu, PV_PPGTT)) {
+		invalidate_mm_pv(mm);
+		return;
+	}
+
 	for (index = 0; index < ARRAY_SIZE(mm->ppgtt_mm.shadow_pdps); index++) {
 		ppgtt_get_shadow_root_entry(mm, &se, index);
 
@@ -1806,6 +1830,26 @@ static void invalidate_ppgtt_mm(struct intel_vgpu_mm *mm)
 	mm->ppgtt_mm.shadowed = false;
 }
 
+static int shadow_mm_pv(struct intel_vgpu_mm *mm)
+{
+	struct intel_vgpu *vgpu = mm->vgpu;
+	struct intel_gvt *gvt = vgpu->gvt;
+	struct intel_gvt_gtt_entry se;
+
+	mm->ppgtt = i915_ppgtt_create(gvt->gt);
+	if (IS_ERR(mm->ppgtt)) {
+		gvt_vgpu_err("fail to create ppgtt for pdp 0x%llx\n",
+				px_dma(mm->ppgtt->pd));
+		return PTR_ERR(mm->ppgtt);
+	}
+
+	se.type = GTT_TYPE_PPGTT_ROOT_L4_ENTRY;
+	se.val64 = px_dma(mm->ppgtt->pd);
+	ppgtt_set_shadow_root_entry(mm, &se, 0);
+	mm->ppgtt_mm.shadowed  = true;
+
+	return 0;
+}
 
 static int shadow_ppgtt_mm(struct intel_vgpu_mm *mm)
 {
@@ -1820,6 +1864,9 @@ static int shadow_ppgtt_mm(struct intel_vgpu_mm *mm)
 	if (mm->ppgtt_mm.shadowed)
 		return 0;
 
+	if (intel_vgpu_enabled_pv_cap(vgpu, PV_PPGTT))
+		return shadow_mm_pv(mm);
+
 	mm->ppgtt_mm.shadowed = true;
 
 	for (index = 0; index < ARRAY_SIZE(mm->ppgtt_mm.guest_pdps); index++) {
@@ -2606,6 +2653,131 @@ static int setup_spt_oos(struct intel_gvt *gvt)
 	return ret;
 }
 
+static int intel_vgpu_pv_ppgtt_insert_4lvl(struct intel_vgpu *vgpu,
+		struct intel_vgpu_mm *mm, struct pv_vma *pvvma, u64 *gfns)
+{
+	u32 size = pvvma->size;
+	int ret = 0;
+	u32 cache_level;
+	struct sg_table st;
+	struct scatterlist *sg = NULL;
+	struct i915_vma vma;
+	unsigned long gfn;
+	dma_addr_t dma_addr;
+	int i;
+	u64 pte_flag;
+
+	cache_level = pvvma->flags & 0xffff;
+
+	if (sg_alloc_table(&st, size, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	pte_flag = gfns[0] & 0xFFF;
+	for_each_sg(st.sgl, sg, size, i) {
+		sg->offset = 0;
+		sg->length = PAGE_SIZE;
+
+		gfn = gfns[i] >> PAGE_SHIFT;
+		ret = intel_gvt_hypervisor_dma_map_guest_page(vgpu,
+				gfn, PAGE_SIZE, &dma_addr);
+		if (ret) {
+			gvt_vgpu_err("fail to translate gfn: 0x%lx\n", gfn);
+			return -ENXIO;
+		}
+		sg_dma_address(sg) = dma_addr | pte_flag;
+		sg_dma_len(sg) = PAGE_SIZE;
+	}
+
+	memset(&vma, 0, sizeof(vma));
+	vma.node.start = pvvma->start;
+	vma.pages = &st;
+	mm->ppgtt->vm.insert_entries(&mm->ppgtt->vm, &vma, 0, 0);
+	sg_free_table(&st);
+
+fail:
+	return ret;
+}
+
+static void intel_vgpu_pv_ppgtt_bind(struct intel_vgpu *vgpu,
+		struct intel_vgpu_mm *mm, struct pv_vma *vma, u64 *gfns)
+{
+	struct i915_vm_pt_stash stash = {};
+
+	if (vma->flags & BIT(I915_VMA_ALLOC_BIT)) {
+		i915_vm_alloc_pt_stash(&mm->ppgtt->vm, &stash, vma->size << PAGE_SHIFT);
+		i915_vm_pin_pt_stash(&mm->ppgtt->vm, &stash);
+		mm->ppgtt->vm.allocate_va_range(&mm->ppgtt->vm,
+				&stash, vma->start, vma->size << PAGE_SHIFT);
+	}
+
+	intel_vgpu_pv_ppgtt_insert_4lvl(vgpu, mm, vma, gfns);
+}
+
+static void intel_vgpu_pv_ppgtt_unbind(struct intel_vgpu *vgpu,
+		struct intel_vgpu_mm *mm, struct pv_vma *vma, u64 *gfns)
+{
+	u32 size = vma->size;
+	int i;
+	u64 dma_addr;
+
+	mm->ppgtt->vm.clear_range(&mm->ppgtt->vm,
+			vma->start, size << PAGE_SHIFT);
+
+	for (i = 0; i < size; i++) {
+		dma_addr = gfns[i];
+		intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, dma_addr);
+	}
+
+}
+
+int intel_vgpu_handle_pv_vma(struct intel_vgpu *vgpu,
+	struct intel_vgpu_mm *mm, u32 cmd, u32 data[])
+{
+	struct pv_vma *vma = (struct pv_vma *)data;
+	int ret = 0;
+
+	u32 num_pages;
+	u64 dma_addr_array[32];
+	u64 *dma_addr_mem;
+	u64 *dma_addrs = dma_addr_array;
+
+	num_pages = vma->size;
+	if (num_pages == 1) {
+		dma_addrs[0] =  vma->dma_addrs;
+		goto out;
+	}
+
+	if (num_pages > ARRAY_SIZE(dma_addr_array)) {
+		dma_addr_mem = kmalloc_array(num_pages,
+				sizeof(u64), GFP_KERNEL);
+		dma_addrs = dma_addr_mem;
+	}
+
+	ret = intel_gvt_hypervisor_read_gpa(vgpu, vma->dma_addrs,
+			dma_addrs, num_pages * sizeof(u64));
+	if (ret)
+		return ret;
+
+out:
+	switch (cmd) {
+	case PV_CMD_UNBIND_PPGTT:
+		intel_vgpu_pv_ppgtt_unbind(vgpu, mm, vma, dma_addrs);
+		break;
+	case PV_CMD_BIND_PPGTT:
+		intel_vgpu_pv_ppgtt_bind(vgpu, mm, vma, dma_addrs);
+		break;
+	default:
+		break;
+	}
+
+	if (num_pages > ARRAY_SIZE(dma_addr_array))
+		kfree(dma_addr_mem);
+
+	return ret;
+}
+
 /**
  * intel_vgpu_find_ppgtt_mm - find a PPGTT mm object
  * @vgpu: a vGPU
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index b76a262..afc7c21 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -141,6 +141,7 @@ struct intel_gvt_partial_pte {
 
 struct intel_vgpu_mm {
 	enum intel_gvt_mm_type type;
+	struct i915_ppgtt *ppgtt;
 	struct intel_vgpu *vgpu;
 
 	struct kref ref;
@@ -280,4 +281,7 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
 
 void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
 
+int intel_vgpu_handle_pv_vma(struct intel_vgpu *vgpu,
+	struct intel_vgpu_mm *mm, u32 action, u32 data[]);
+
 #endif /* _GVT_GTT_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index d635313..05c2f13 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -50,6 +50,7 @@
 #include "dmabuf.h"
 #include "page_track.h"
 #include "i915_vgpu.h"
+#include "i915_pvinfo.h"
 
 #define GVT_MAX_VGPU 8
 
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index b9c9f62..a3637d86 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1323,11 +1323,36 @@ static int pv_command_buffer_read(struct intel_vgpu *vgpu,
 
 static int handle_pv_commands(struct intel_vgpu *vgpu)
 {
+	struct intel_vgpu_mm *mm;
+	struct pv_vma *vma;
+	u64 pdp;
 	u32 cmd;
 	u32 data[32];
 	int ret;
 
 	ret = pv_command_buffer_read(vgpu, &cmd, data);
+
+	if (ret)
+		return ret;
+
+	switch (cmd) {
+	case PV_CMD_BIND_PPGTT:
+	case PV_CMD_UNBIND_PPGTT:
+		vma = (struct pv_vma *)data;
+		pdp = vma->pml4;
+		mm = intel_vgpu_find_ppgtt_mm(vgpu, &pdp);
+		if (!mm) {
+			gvt_vgpu_err("failed to find pdp 0x%llx\n", pdp);
+			ret = -EINVAL;
+			enter_failsafe_mode(vgpu, GVT_FAILSAFE_GUEST_ERR);
+			return ret;
+		}
+		ret = intel_vgpu_handle_pv_vma(vgpu, mm, cmd, data);
+		break;
+	default:
+		break;
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index e9bc683..c898e0d 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -50,6 +50,8 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_HUGE_GTT;
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_PV;
 
+	vgpu_vreg_t(vgpu, vgtif_reg(pv_caps)) = PV_PPGTT;
+
 	vgpu_vreg_t(vgpu, vgtif_reg(avail_rs.mappable_gmadr.base)) =
 		vgpu_aperture_gmadr_base(vgpu);
 	vgpu_vreg_t(vgpu, vgtif_reg(avail_rs.mappable_gmadr.size)) =
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
