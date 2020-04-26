Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F81B8B7B
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 26 Apr 2020 04:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0536E4AA;
	Sun, 26 Apr 2020 02:58:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08516E49B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 26 Apr 2020 02:58:05 +0000 (UTC)
IronPort-SDR: u8U30jqFMQG1z3r6V4PeLTGCcbNzU2CysTKZ65qCU/4LiSLsAHXMO6EsLIktL+yKu3UBoUEdAH
 LOXaCxjLnOWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 19:58:05 -0700
IronPort-SDR: owwKQbSin3cl4SXJ46bht15+ZB6FD1xEXQUxnev7KznQZKC6UUmsoHdYBVEppr+t0+Vg53U2OI
 6QiHFUnvhL6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,318,1583222400"; d="scan'208";a="256832213"
Received: from ywu11-mobl1.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.254.213.76])
 by orsmga003.jf.intel.com with ESMTP; 25 Apr 2020 19:58:04 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gvt: Support PPGTT table load command
Date: Sun, 26 Apr 2020 10:58:02 +0800
Message-Id: <20200426025802.2839-2-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200318135322.13788-1-tina.zhang@intel.com>
References: <20200318135322.13788-1-tina.zhang@intel.com>
MIME-Version: 1.0
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
Cc: Tina Zhang <tina.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: Tina Zhang <tina.zhang@intel.com>

The PPGTT in context image can be overridden by LRI cmd with another
PPGTT's pdps. In such case, the load mm is used instead of the one in
the context image. So we need to load its shadow mm in GVT and replace
ppgtt pointers in command.

This feature is used by guest IGD driver to share gfx VM between
different contexts. Verified by IGT "gem_ctx_clone" test.

v2: (Zhenyu Wang)
- Change to list for handling possible multiple ppgtt table loads
  in one submission. Make sure shadow mm is to replace for each one.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 79 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.c        |  1 +
 drivers/gpu/drm/i915/gvt/gtt.h        |  1 +
 drivers/gpu/drm/i915/gvt/handlers.c   |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c  | 70 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/scheduler.h  |  1 +
 6 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index a3cc080a46c6..3dc36299f989 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -882,6 +882,81 @@ static int mocs_cmd_reg_handler(struct parser_exec_state *s,
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
+
+static int cmd_pdp_mmio_update_handler(struct parser_exec_state *s,
+				       unsigned int offset, unsigned int index)
+{
+	struct intel_vgpu *vgpu = s->vgpu;
+	struct intel_vgpu_mm *shadow_mm = s->workload->shadow_mm;
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
+			intel_vgpu_mm_get(mm);
+			list_add_tail(&mm->ppgtt_mm.link,
+				      &s->workload->lri_shadow_mm);
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
+			intel_vgpu_mm_get(mm);
+			list_add_tail(&mm->ppgtt_mm.link,
+				      &s->workload->lri_shadow_mm);
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
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int cmd_reg_handler(struct parser_exec_state *s,
 	unsigned int offset, unsigned int index, char *cmd)
 {
@@ -920,6 +995,10 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
 	}
 
+	if (is_cmd_update_pdps(offset, s) &&
+	    cmd_pdp_mmio_update_handler(s, offset, index))
+		return -EINVAL;
+
 	/* TODO
 	 * In order to let workload with inhibit context to generate
 	 * correct image data into memory, vregs values will be loaded to
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index d2b0d85b39bc..210016192ce7 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1900,6 +1900,7 @@ struct intel_vgpu_mm *intel_vgpu_create_ppgtt_mm(struct intel_vgpu *vgpu,
 
 	INIT_LIST_HEAD(&mm->ppgtt_mm.list);
 	INIT_LIST_HEAD(&mm->ppgtt_mm.lru_list);
+	INIT_LIST_HEAD(&mm->ppgtt_mm.link);
 
 	if (root_entry_type == GTT_TYPE_PPGTT_ROOT_L4_ENTRY)
 		mm->ppgtt_mm.guest_pdps[0] = pdps[0];
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index 88789316807d..320b8d6ad92f 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -160,6 +160,7 @@ struct intel_vgpu_mm {
 
 			struct list_head list;
 			struct list_head lru_list;
+			struct list_head link; /* possible LRI shadow mm list */
 		} ppgtt_mm;
 		struct {
 			void *virtual_ggtt;
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 2faf50e1b051..3e88e3b5c43a 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2812,7 +2812,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
 
 #define RING_REG(base) _MMIO((base) + 0x270)
-	MMIO_RING_F(RING_REG, 32, 0, 0, 0, D_BDW_PLUS, NULL, NULL);
+	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
 #undef RING_REG
 
 	MMIO_RING_GM_RDR(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index c1c8f3f9bec4..ed91d021d9f0 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -647,12 +647,48 @@ static void release_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 	}
 }
 
+static int
+cmd_shadow_mm_pin(struct intel_vgpu_workload *workload)
+{
+	int ret = 0;
+	struct intel_vgpu_mm *m;
+
+	if (!list_empty(&workload->lri_shadow_mm)) {
+		list_for_each_entry(m, &workload->lri_shadow_mm,
+				    ppgtt_mm.link) {
+			ret = intel_vgpu_pin_mm(m);
+			if (ret)
+				break;
+		}
+	}
+
+	return ret;
+}
+
+static void
+cmd_shadow_mm_unpin(struct intel_vgpu_workload *workload)
+{
+	struct intel_vgpu_mm *m;
+
+	if (!list_empty(&workload->lri_shadow_mm)) {
+		list_for_each_entry(m, &workload->lri_shadow_mm,
+				    ppgtt_mm.link)
+			intel_vgpu_unpin_mm(m);
+	}
+}
+
 static int prepare_workload(struct intel_vgpu_workload *workload)
 {
 	struct intel_vgpu *vgpu = workload->vgpu;
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	int ret = 0;
 
+	ret = cmd_shadow_mm_pin(workload);
+	if (ret) {
+		gvt_vgpu_err("fail to vgpu pin cmd mm\n");
+		return ret;
+	}
+
 	ret = intel_vgpu_pin_mm(workload->shadow_mm);
 	if (ret) {
 		gvt_vgpu_err("fail to vgpu pin mm\n");
@@ -712,6 +748,7 @@ static int prepare_workload(struct intel_vgpu_workload *workload)
 	release_shadow_batch_buffer(workload);
 err_unpin_mm:
 	intel_vgpu_unpin_mm(workload->shadow_mm);
+	cmd_shadow_mm_unpin(workload);
 	return ret;
 }
 
@@ -821,6 +858,19 @@ pick_next_workload(struct intel_gvt *gvt, struct intel_engine_cs *engine)
 	return workload;
 }
 
+static void update_guest_pdps(struct intel_vgpu *vgpu,
+			      u64 ring_context_gpa, u32 pdp[8])
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
 static void update_guest_context(struct intel_vgpu_workload *workload)
 {
 	struct i915_request *rq = workload->req;
@@ -904,6 +954,14 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
 		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
 
+	if (!list_empty(&workload->lri_shadow_mm)) {
+		struct intel_vgpu_mm *m = list_last_entry(&workload->lri_shadow_mm,
+							  struct intel_vgpu_mm,
+							  ppgtt_mm.link);
+		update_guest_pdps(vgpu, workload->ring_context_gpa,
+				  (void *)m->ppgtt_mm.guest_pdps);
+	}
+
 	shadow_ring_context = (void *) ctx->lrc_reg_state;
 
 #define COPY_REG(name) \
@@ -1014,6 +1072,7 @@ static void complete_current_workload(struct intel_gvt *gvt, int ring_id)
 
 	workload->complete(workload);
 
+	cmd_shadow_mm_unpin(workload);
 	intel_vgpu_unpin_mm(workload->shadow_mm);
 	intel_vgpu_destroy_workload(workload);
 
@@ -1410,6 +1469,16 @@ void intel_vgpu_destroy_workload(struct intel_vgpu_workload *workload)
 	release_shadow_batch_buffer(workload);
 	release_shadow_wa_ctx(&workload->wa_ctx);
 
+	if (!list_empty(&workload->lri_shadow_mm)) {
+		struct intel_vgpu_mm *m, *mm;
+		list_for_each_entry_safe(m, mm, &workload->lri_shadow_mm,
+					 ppgtt_mm.link) {
+			list_del(&m->ppgtt_mm.link);
+			intel_vgpu_mm_put(m);
+		}
+	}
+
+	GEM_BUG_ON(!list_empty(&workload->lri_shadow_mm));
 	if (workload->shadow_mm)
 		intel_vgpu_mm_put(workload->shadow_mm);
 
@@ -1428,6 +1497,7 @@ alloc_workload(struct intel_vgpu *vgpu)
 
 	INIT_LIST_HEAD(&workload->list);
 	INIT_LIST_HEAD(&workload->shadow_bb);
+	INIT_LIST_HEAD(&workload->lri_shadow_mm);
 
 	init_waitqueue_head(&workload->shadow_ctx_status_wq);
 	atomic_set(&workload->shadow_ctx_active, 0);
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/drm/i915/gvt/scheduler.h
index bf7fc0ca4cb1..15d317f2a4a4 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.h
+++ b/drivers/gpu/drm/i915/gvt/scheduler.h
@@ -87,6 +87,7 @@ struct intel_vgpu_workload {
 	int status;
 
 	struct intel_vgpu_mm *shadow_mm;
+	struct list_head lri_shadow_mm; /* For PPGTT load cmd */
 
 	/* different submission model may need different handler */
 	int (*prepare)(struct intel_vgpu_workload *);
-- 
2.26.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
