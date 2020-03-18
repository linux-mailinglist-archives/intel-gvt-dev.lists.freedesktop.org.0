Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17C189D75
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Mar 2020 14:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CDE6E8B8;
	Wed, 18 Mar 2020 13:57:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584266E8B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Mar 2020 13:57:59 +0000 (UTC)
IronPort-SDR: TCi9UKGHu6Ibq3ej7rHlr8TZBvqsuNlJQsKUXRpEhGrIttNfaHQExpLJh6vwy72achm62frqXf
 XIn5/Qldy7AA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 06:57:59 -0700
IronPort-SDR: yT/w+97N8V/ySggv+ZkJGckeFArs1LjDVZndGWIZx2uzeXXn/gJUuAyOeWJfQA0Muh5rx7EVd/
 JqHXCE6ZWxKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,567,1574150400"; d="scan'208";a="291325670"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2020 06:57:56 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Support guest sharing vm
Date: Wed, 18 Mar 2020 21:53:22 +0800
Message-Id: <20200318135322.13788-1-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The vm in context image can be overridden by lri cmd with a shared vm
pdps. In such case, the shared vm is used instead of the one in the
context image. This feature is used by guest IGD driver to share vm
between different contexts.

This patch enables the feature support on vGPU.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 84 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/execlist.c   |  2 +
 drivers/gpu/drm/i915/gvt/handlers.c   |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c  | 26 +++++++++
 drivers/gpu/drm/i915/gvt/scheduler.h  |  1 +
 5 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 9e065ad0658f..4c702b604884 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -881,6 +881,86 @@ static int mocs_cmd_reg_handler(struct parser_exec_state *s,
 	return 0;
 }
 
+#define IS_PDP_UDW_MMIO(offset, base, num)	\
+	((offset) == ((base) + 0x274 + (num) * 8))
+
+static int is_cmd_update_pdps(unsigned int offset,
+			      struct parser_exec_state *s)
+{
+	return IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, 0) ||
+		IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, 3);
+}
+static int cmd_pdp_mmio_update_handler(struct parser_exec_state *s,
+				       unsigned int offset, unsigned int index)
+{
+	struct intel_vgpu *vgpu = s->vgpu;
+	struct intel_vgpu_mm *shadow_mm = s->workload->shadow_mm;
+	struct intel_vgpu_mm *shared_shadow_mm = s->workload->shared_shadow_mm;
+	struct intel_vgpu_mm *mm;
+	u64 pdps[GEN8_3LVL_PDPES];
+
+	if (shadow_mm->ppgtt_mm.root_entry_type ==
+	    GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
+		pdps[0] = (u64)cmd_val(s, 2) << 32;
+		pdps[0] |= cmd_val(s, 4);
+
+		mm = intel_vgpu_find_ppgtt_mm(vgpu, pdps);
+		if (!mm) {
+			gvt_vgpu_err("failed to get the shadow vm\n");
+			return -EINVAL;
+		}
+
+		if (mm != shadow_mm) {
+			if (mm != shared_shadow_mm) {
+				if (shared_shadow_mm)
+					intel_vgpu_mm_put(shared_shadow_mm);
+				intel_vgpu_mm_get(mm);
+				s->workload->shared_shadow_mm = mm;
+			}
+			*cmd_ptr(s, 2) =
+				upper_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
+			*cmd_ptr(s, 4) =
+				lower_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
+		}
+	} else if (shadow_mm->ppgtt_mm.root_entry_type ==
+		   GTT_TYPE_PPGTT_ROOT_L3_ENTRY) {
+		int i, j;
+
+		for (i = GEN8_3LVL_PDPES, j = 2; i--; ) {
+			pdps[i] = (u64)cmd_val(s, j) << 32;
+			pdps[i] |= cmd_val(s, j+2);
+			j += 4;
+		}
+
+		mm = intel_vgpu_find_ppgtt_mm(vgpu, pdps);
+		if (!mm) {
+			gvt_vgpu_err("failed to get the shadow vm\n");
+			return -EINVAL;
+		}
+
+		if (mm != shadow_mm) {
+			if (mm != shared_shadow_mm) {
+				if (shared_shadow_mm)
+					intel_vgpu_mm_put(shared_shadow_mm);
+				intel_vgpu_mm_get(mm);
+				s->workload->shared_shadow_mm = mm;
+			}
+			for (i = GEN8_3LVL_PDPES, j = 2; i--; ) {
+				*cmd_ptr(s, j) =
+					upper_32_bits(
+						mm->ppgtt_mm.shadow_pdps[i]);
+				*cmd_ptr(s, j + 2) =
+					lower_32_bits(
+						mm->ppgtt_mm.shadow_pdps[i]);
+				j += 4;
+			}
+		}
+	} else {
+		gvt_vgpu_err("invalid shared shadow vm type\n");
+	}
+	return 0;
+}
+
 static int cmd_reg_handler(struct parser_exec_state *s,
 	unsigned int offset, unsigned int index, char *cmd)
 {
@@ -919,6 +999,10 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
 	}
 
+	if (is_cmd_update_pdps(offset, s) &&
+	    cmd_pdp_mmio_update_handler(s, offset, index))
+		return -EINVAL;
+
 	/* TODO
 	 * In order to let workload with inhibit context to generate
 	 * correct image data into memory, vregs values will be loaded to
diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index dd25c3024370..7f7087258d8b 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -424,6 +424,8 @@ static int complete_execlist_workload(struct intel_vgpu_workload *workload)
 
 	ret = emulate_execlist_ctx_schedule_out(execlist, &workload->ctx_desc);
 out:
+	if (workload->shared_shadow_mm)
+		intel_vgpu_unpin_mm(workload->shared_shadow_mm);
 	intel_vgpu_unpin_mm(workload->shadow_mm);
 	intel_vgpu_destroy_workload(workload);
 	return ret;
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 0182e2a5acff..23a3193a6654 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2808,7 +2808,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
 
 #define RING_REG(base) _MMIO((base) + 0x270)
-	MMIO_RING_F(RING_REG, 32, 0, 0, 0, D_BDW_PLUS, NULL, NULL);
+	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
 #undef RING_REG
 
 	MMIO_RING_GM_RDR(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 1c95bf8cbed0..16a9af130d10 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -612,6 +612,9 @@ static int prepare_workload(struct intel_vgpu_workload *workload)
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	int ret = 0;
 
+	if (workload->shared_shadow_mm)
+		intel_vgpu_pin_mm(workload->shared_shadow_mm);
+
 	ret = intel_vgpu_pin_mm(workload->shadow_mm);
 	if (ret) {
 		gvt_vgpu_err("fail to vgpu pin mm\n");
@@ -671,6 +674,8 @@ static int prepare_workload(struct intel_vgpu_workload *workload)
 	release_shadow_batch_buffer(workload);
 err_unpin_mm:
 	intel_vgpu_unpin_mm(workload->shadow_mm);
+	if (workload->shared_shadow_mm)
+		intel_vgpu_unpin_mm(workload->shared_shadow_mm);
 	return ret;
 }
 
@@ -780,12 +785,27 @@ pick_next_workload(struct intel_gvt *gvt, struct intel_engine_cs *engine)
 	return workload;
 }
 
+static void update_guest_pdps(struct intel_vgpu *vgpu,
+		u64 ring_context_gpa, u32 pdp[8])
+{
+	u64 gpa;
+	int i;
+
+	gpa = ring_context_gpa + RING_CTX_OFF(pdps[0].val);
+
+	for (i = 0; i < 8; i++)
+		intel_gvt_hypervisor_write_gpa(vgpu,
+				gpa + i * 8, &pdp[7 - i], 4);
+}
+
+
 static void update_guest_context(struct intel_vgpu_workload *workload)
 {
 	struct i915_request *rq = workload->req;
 	struct intel_vgpu *vgpu = workload->vgpu;
 	struct drm_i915_gem_object *ctx_obj = rq->context->state->obj;
 	struct execlist_ring_context *shadow_ring_context;
+	struct intel_vgpu_mm *shared_mm = workload->shared_shadow_mm;
 	struct page *page;
 	void *src;
 	unsigned long context_gpa, context_page_num;
@@ -842,6 +862,10 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
 		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
 
+	if (shared_mm)
+		update_guest_pdps(vgpu, workload->ring_context_gpa,
+				  (void *)shared_mm->ppgtt_mm.guest_pdps);
+
 	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
 	shadow_ring_context = kmap(page);
 
@@ -1346,6 +1370,8 @@ void intel_vgpu_destroy_workload(struct intel_vgpu_workload *workload)
 	release_shadow_batch_buffer(workload);
 	release_shadow_wa_ctx(&workload->wa_ctx);
 
+	if (workload->shared_shadow_mm)
+		intel_vgpu_mm_put(workload->shared_shadow_mm);
 	if (workload->shadow_mm)
 		intel_vgpu_mm_put(workload->shadow_mm);
 
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/drm/i915/gvt/scheduler.h
index bf7fc0ca4cb1..6a7d5a7e1c0e 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.h
+++ b/drivers/gpu/drm/i915/gvt/scheduler.h
@@ -87,6 +87,7 @@ struct intel_vgpu_workload {
 	int status;
 
 	struct intel_vgpu_mm *shadow_mm;
+	struct intel_vgpu_mm *shared_shadow_mm;
 
 	/* different submission model may need different handler */
 	int (*prepare)(struct intel_vgpu_workload *);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
