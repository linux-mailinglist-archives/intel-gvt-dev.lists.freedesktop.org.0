Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF42D2397
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 07:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675E6E94A;
	Tue,  8 Dec 2020 06:29:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6215F6E94A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Dec 2020 06:29:12 +0000 (UTC)
IronPort-SDR: 1iIJKqMcAtjcgQ58d7eoJzh8hcC6FzE5BwT2aHvF7AV1a6RIFtf9VXxauEg+saBEOQsQ/v8Blh
 5Nf/Mda50GrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173952030"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="173952030"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:29:11 -0800
IronPort-SDR: zWNkWmFS11aVDohaV/rdCoIfbTkVa0WhZDku8xGvRZGMRHW0AHCrZhPGj36yb/DEl6k/Xs0Rft
 e6i/FkkXpM1w==
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="541904791"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:29:09 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v2 01/11] drm/i915/gvt: parse init context to update cmd
 accessible reg whitelist
Date: Tue,  8 Dec 2020 14:16:32 +0800
Message-Id: <20201208061632.4021-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208061211.3942-1-yan.y.zhao@intel.com>
References: <20201208061211.3942-1-yan.y.zhao@intel.com>
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
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 143 +++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/cmd_parser.h |   2 +
 drivers/gpu/drm/i915/gvt/gvt.h        |   4 +
 drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
 4 files changed, 149 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 16b582cb97ed..9d2fdaca92bd 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -38,10 +38,15 @@
 
 #include "i915_drv.h"
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
@@ -454,6 +459,7 @@ enum {
 	RING_BUFFER_INSTRUCTION,
 	BATCH_BUFFER_INSTRUCTION,
 	BATCH_BUFFER_2ND_LEVEL,
+	RING_BUFFER_CTX,
 };
 
 enum {
@@ -495,6 +501,7 @@ struct parser_exec_state {
 	 */
 	int saved_buf_addr_type;
 	bool is_ctx_wa;
+	bool is_init_ctx;
 
 	const struct cmd_info *info;
 
@@ -708,6 +715,11 @@ static inline u32 cmd_val(struct parser_exec_state *s, int index)
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
@@ -721,7 +733,8 @@ static void parser_exec_state_dump(struct parser_exec_state *s)
 
 	gvt_dbg_cmd("  %s %s ip_gma(%08lx) ",
 			s->buf_type == RING_BUFFER_INSTRUCTION ?
-			"RING_BUFFER" : "BATCH_BUFFER",
+			"RING_BUFFER" : ((s->buf_type == RING_BUFFER_CTX) ?
+				"CTX_BUFFER" : "BATCH_BUFFER"),
 			s->buf_addr_type == GTT_BUFFER ?
 			"GTT" : "PPGTT", s->ip_gma);
 
@@ -756,7 +769,8 @@ static inline void update_ip_va(struct parser_exec_state *s)
 	if (WARN_ON(s->ring_head == s->ring_tail))
 		return;
 
-	if (s->buf_type == RING_BUFFER_INSTRUCTION) {
+	if (s->buf_type == RING_BUFFER_INSTRUCTION ||
+			s->buf_type == RING_BUFFER_CTX) {
 		unsigned long ring_top = s->ring_start + s->ring_size;
 
 		if (s->ring_head > s->ring_tail) {
@@ -936,6 +950,11 @@ static int cmd_reg_handler(struct parser_exec_state *s,
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
@@ -1215,6 +1234,8 @@ static int cmd_handler_mi_batch_buffer_end(struct parser_exec_state *s)
 		s->buf_type = BATCH_BUFFER_INSTRUCTION;
 		ret = ip_gma_set(s, s->ret_ip_gma_bb);
 		s->buf_addr_type = s->saved_buf_addr_type;
+	} else if (s->buf_type == RING_BUFFER_CTX) {
+		ret = ip_gma_set(s, s->ring_tail);
 	} else {
 		s->buf_type = RING_BUFFER_INSTRUCTION;
 		s->buf_addr_type = GTT_BUFFER;
@@ -2763,7 +2784,8 @@ static int command_scan(struct parser_exec_state *s,
 	gma_bottom = rb_start +  rb_len;
 
 	while (s->ip_gma != gma_tail) {
-		if (s->buf_type == RING_BUFFER_INSTRUCTION) {
+		if (s->buf_type == RING_BUFFER_INSTRUCTION ||
+				s->buf_type == RING_BUFFER_CTX) {
 			if (!(s->ip_gma >= rb_start) ||
 				!(s->ip_gma < gma_bottom)) {
 				gvt_vgpu_err("ip_gma %lx out of ring scope."
@@ -3056,6 +3078,121 @@ int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
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
+		if (!requests[id])
+			continue;
+		i915_request_put(requests[id]);
+
+		if (!is_ctx_pinned[id])
+			continue;
+		intel_context_unpin(s->shadow[id]);
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
index cf3578e3f4dd..fad412d19f9c 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -329,6 +329,7 @@ struct intel_gvt {
 		u32 *mocs_mmio_offset_list;
 		u32 mocs_mmio_offset_list_cnt;
 	} engine_mmio_list;
+	bool is_reg_whitelist_updated;
 
 	struct dentry *debugfs_root;
 };
@@ -412,6 +413,9 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
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
