Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9502E17E4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 04:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F286E8C2;
	Wed, 23 Dec 2020 03:57:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0404B6E8C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 03:57:16 +0000 (UTC)
IronPort-SDR: FckhLaw7+LMBQ2ZayxY27041pZZydJErRCQoxUqvopshNN8YcDVzwn5zQex+7YcDlepXENiu5W
 wBn87az2UQuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="237519752"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="237519752"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:57:15 -0800
IronPort-SDR: irlZnVSpMtlk7Bw0zI8w7nXr45fmF0eVP6UjaJ/HfbyyiwMlcT9wA0t4NwuYmjEX6g5Wn60J8A
 LXCOX+B8MmnQ==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="564929625"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:57:13 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v5 01/11] drm/i915/gvt: parse init context to update cmd
 accessible reg whitelist
Date: Wed, 23 Dec 2020 11:44:30 +0800
Message-Id: <20201223034430.16934-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223034353.16882-1-yan.y.zhao@intel.com>
References: <20201223034353.16882-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Wang Zhi <zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Logical Context is actually a big batch buffer consisting of multiple
LRI commands + saved registers. It comprises Ring Context (the first
0x50 dwords) and Engine Context. The registers defined in Engine Context
are command accessible, and safe to execute in VM Context.
However, not all of them are currently tracked in existing register
whitelist. Here we kick hardware to generate a dummy Engine Context and
then scan the dummy Engine context to update whitelist dynamically. Based
on updated list, later patches will audit future VM Engine Contexts to
disallow undesired LRIs (if out of what hardware generates).

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Wang Zhi <zhi.a.wang@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 142 +++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/cmd_parser.h |   2 +
 drivers/gpu/drm/i915/gvt/gvt.h        |   4 +
 drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
 4 files changed, 148 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 3fea967ee817..2e6d46246f76 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -38,11 +38,17 @@
 
 #include "i915_drv.h"
 #include "gt/intel_gpu_commands.h"
+#include "gt/intel_lrc.h"
 #include "gt/intel_ring.h"
+#include "gt/intel_gt_requests.h"
 #include "gvt.h"
 #include "i915_pvinfo.h"
 #include "trace.h"
 
+#include "gem/i915_gem_context.h"
+#include "gem/i915_gem_pm.h"
+#include "gt/intel_context.h"
+
 #define INVALID_OP    (~0U)
 
 #define OP_LEN_MI           9
@@ -455,6 +461,7 @@ enum {
 	RING_BUFFER_INSTRUCTION,
 	BATCH_BUFFER_INSTRUCTION,
 	BATCH_BUFFER_2ND_LEVEL,
+	RING_BUFFER_CTX,
 };
 
 enum {
@@ -496,6 +503,7 @@ struct parser_exec_state {
 	 */
 	int saved_buf_addr_type;
 	bool is_ctx_wa;
+	bool is_init_ctx;
 
 	const struct cmd_info *info;
 
@@ -709,6 +717,11 @@ static inline u32 cmd_val(struct parser_exec_state *s, int index)
 	return *cmd_ptr(s, index);
 }
 
+static inline bool is_init_ctx(struct parser_exec_state *s)
+{
+	return (s->buf_type == RING_BUFFER_CTX && s->is_init_ctx);
+}
+
 static void parser_exec_state_dump(struct parser_exec_state *s)
 {
 	int cnt = 0;
@@ -722,7 +735,8 @@ static void parser_exec_state_dump(struct parser_exec_state *s)
 
 	gvt_dbg_cmd("  %s %s ip_gma(%08lx) ",
 			s->buf_type == RING_BUFFER_INSTRUCTION ?
-			"RING_BUFFER" : "BATCH_BUFFER",
+			"RING_BUFFER" : ((s->buf_type == RING_BUFFER_CTX) ?
+				"CTX_BUFFER" : "BATCH_BUFFER"),
 			s->buf_addr_type == GTT_BUFFER ?
 			"GTT" : "PPGTT", s->ip_gma);
 
@@ -757,7 +771,8 @@ static inline void update_ip_va(struct parser_exec_state *s)
 	if (WARN_ON(s->ring_head == s->ring_tail))
 		return;
 
-	if (s->buf_type == RING_BUFFER_INSTRUCTION) {
+	if (s->buf_type == RING_BUFFER_INSTRUCTION ||
+			s->buf_type == RING_BUFFER_CTX) {
 		unsigned long ring_top = s->ring_start + s->ring_size;
 
 		if (s->ring_head > s->ring_tail) {
@@ -937,6 +952,11 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		return -EFAULT;
 	}
 
+	if (is_init_ctx(s)) {
+		intel_gvt_mmio_set_cmd_accessible(gvt, offset);
+		return 0;
+	}
+
 	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
 		gvt_vgpu_err("%s access to non-render register (%x)\n",
 				cmd, offset);
@@ -1216,6 +1236,8 @@ static int cmd_handler_mi_batch_buffer_end(struct parser_exec_state *s)
 		s->buf_type = BATCH_BUFFER_INSTRUCTION;
 		ret = ip_gma_set(s, s->ret_ip_gma_bb);
 		s->buf_addr_type = s->saved_buf_addr_type;
+	} else if (s->buf_type == RING_BUFFER_CTX) {
+		ret = ip_gma_set(s, s->ring_tail);
 	} else {
 		s->buf_type = RING_BUFFER_INSTRUCTION;
 		s->buf_addr_type = GTT_BUFFER;
@@ -2764,7 +2786,8 @@ static int command_scan(struct parser_exec_state *s,
 	gma_bottom = rb_start +  rb_len;
 
 	while (s->ip_gma != gma_tail) {
-		if (s->buf_type == RING_BUFFER_INSTRUCTION) {
+		if (s->buf_type == RING_BUFFER_INSTRUCTION ||
+				s->buf_type == RING_BUFFER_CTX) {
 			if (!(s->ip_gma >= rb_start) ||
 				!(s->ip_gma < gma_bottom)) {
 				gvt_vgpu_err("ip_gma %lx out of ring scope."
@@ -3057,6 +3080,119 @@ int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 	return 0;
 }
 
+/* generate dummy contexts by sending empty requests to HW, and let
+ * the HW to fill Engine Contexts. This dummy contexts are used for
+ * initialization purpose (update reg whitelist), so referred to as
+ * init context here
+ */
+void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
+{
+	struct intel_gvt *gvt = vgpu->gvt;
+	struct drm_i915_private *dev_priv = gvt->gt->i915;
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	const unsigned long start = LRC_STATE_PN * PAGE_SIZE;
+	struct i915_request *rq;
+	struct intel_vgpu_submission *s = &vgpu->submission;
+	struct i915_request *requests[I915_NUM_ENGINES] = {};
+	bool is_ctx_pinned[I915_NUM_ENGINES] = {};
+	int ret;
+
+	if (gvt->is_reg_whitelist_updated)
+		return;
+
+	for_each_engine(engine, &dev_priv->gt, id) {
+		ret = intel_context_pin(s->shadow[id]);
+		if (ret) {
+			gvt_vgpu_err("fail to pin shadow ctx\n");
+			goto out;
+		}
+		is_ctx_pinned[id] = true;
+
+		rq = i915_request_create(s->shadow[id]);
+		if (IS_ERR(rq)) {
+			gvt_vgpu_err("fail to alloc default request\n");
+			ret = -EIO;
+			goto out;
+		}
+		requests[id] = i915_request_get(rq);
+		i915_request_add(rq);
+	}
+
+	if (intel_gt_wait_for_idle(&dev_priv->gt,
+				I915_GEM_IDLE_TIMEOUT) == -ETIME) {
+		ret = -EIO;
+		goto out;
+	}
+
+	/* scan init ctx to update cmd accessible list */
+	for_each_engine(engine, &dev_priv->gt, id) {
+		int size = engine->context_size - PAGE_SIZE;
+		void *vaddr;
+		struct parser_exec_state s;
+		struct drm_i915_gem_object *obj;
+		struct i915_request *rq;
+
+		rq = requests[id];
+		GEM_BUG_ON(!i915_request_completed(rq));
+		GEM_BUG_ON(!intel_context_is_pinned(rq->context));
+		obj = rq->context->state->obj;
+
+		if (!obj) {
+			ret = -EIO;
+			goto out;
+		}
+
+		i915_gem_object_set_cache_coherency(obj,
+						    I915_CACHE_LLC);
+
+		vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+		if (IS_ERR(vaddr)) {
+			gvt_err("failed to pin init ctx obj, ring=%d, err=%lx\n",
+				id, PTR_ERR(vaddr));
+			goto out;
+		}
+
+		s.buf_type = RING_BUFFER_CTX;
+		s.buf_addr_type = GTT_BUFFER;
+		s.vgpu = vgpu;
+		s.engine = engine;
+		s.ring_start = 0;
+		s.ring_size = size;
+		s.ring_head = 0;
+		s.ring_tail = size;
+		s.rb_va = vaddr + start;
+		s.workload = NULL;
+		s.is_ctx_wa = false;
+		s.is_init_ctx = true;
+
+		/* skipping the first RING_CTX_SIZE(0x50) dwords */
+		ret = ip_gma_set(&s, RING_CTX_SIZE);
+		if (ret) {
+			i915_gem_object_unpin_map(obj);
+			goto out;
+		}
+
+		ret = command_scan(&s, 0, size, 0, size);
+		if (ret)
+			gvt_err("Scan init ctx error\n");
+
+		i915_gem_object_unpin_map(obj);
+	}
+
+out:
+	if (!ret)
+		gvt->is_reg_whitelist_updated = true;
+
+	for (id = 0; id < I915_NUM_ENGINES ; id++) {
+		if (requests[id])
+			i915_request_put(requests[id]);
+
+		if (is_ctx_pinned[id])
+			intel_context_unpin(s->shadow[id]);
+	}
+}
+
 static int init_cmd_table(struct intel_gvt *gvt)
 {
 	unsigned int gen_type = intel_gvt_get_device_type(gvt);
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.h b/drivers/gpu/drm/i915/gvt/cmd_parser.h
index ab25d151932a..09ca2b8a63c8 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.h
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.h
@@ -50,4 +50,6 @@ int intel_gvt_scan_and_shadow_ringbuffer(struct intel_vgpu_workload *workload);
 
 int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx);
 
+void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu);
+
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 62a4807424bb..25b72dfebe23 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -333,6 +333,7 @@ struct intel_gvt {
 		u32 *mocs_mmio_offset_list;
 		u32 mocs_mmio_offset_list_cnt;
 	} engine_mmio_list;
+	bool is_reg_whitelist_updated;
 
 	struct dentry *debugfs_root;
 };
@@ -416,6 +417,9 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
 #define vgpu_fence_base(vgpu) (vgpu->fence.base)
 #define vgpu_fence_sz(vgpu) (vgpu->fence.size)
 
+/* ring context size i.e. the first 0x50 dwords*/
+#define RING_CTX_SIZE 320
+
 struct intel_vgpu_creation_params {
 	__u64 handle;
 	__u64 low_gm_sz;  /* in MB */
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index e49944fde333..5a7226339cf4 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -500,9 +500,11 @@ struct intel_vgpu *intel_gvt_create_vgpu(struct intel_gvt *gvt,
 
 	mutex_lock(&gvt->lock);
 	vgpu = __intel_gvt_create_vgpu(gvt, &param);
-	if (!IS_ERR(vgpu))
+	if (!IS_ERR(vgpu)) {
 		/* calculate left instance change for types */
 		intel_gvt_update_vgpu_types(gvt);
+		intel_gvt_update_reg_whitelist(vgpu);
+	}
 	mutex_unlock(&gvt->lock);
 
 	return vgpu;
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
