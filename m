Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A61A91B9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 06:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512E76E834;
	Wed, 15 Apr 2020 04:07:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10876E834
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 04:07:09 +0000 (UTC)
IronPort-SDR: w4iaCwhJHKmqIfRChRaPLBhzhNNZqGMmx1xzobdFPbrMFxsZkuahjF7LOeCsIRpXuygnAUH3JJ
 TjVsru6kBeNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 21:07:09 -0700
IronPort-SDR: I+2FvQsBNyEfkbTI/K8fK3WK8tTxINP8dwBd5nNC1NxOQ3t7Y3FDQkoW1miCcb8dC1Cfh+qNXY
 G6EnrEwMQJTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="277487933"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2020 21:07:08 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: access shadow ctx via its virtual address
 directly
Date: Tue, 14 Apr 2020 23:57:28 -0400
Message-Id: <20200415035728.26424-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415035633.26373-1-yan.y.zhao@intel.com>
References: <20200415035633.26373-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

as shadow context is pinned in intel_vgpu_setup_submission() and
unpinned in intel_vgpu_clean_submission(), its base virtual address of
is safely obtained from lrc_reg_state. no need to call kmap()/kunmap()
repeatedly.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 35 ++++++++++++++--------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index cb11c3184085..81a06f69835e 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -128,16 +128,19 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 {
 	struct intel_vgpu *vgpu = workload->vgpu;
 	struct intel_gvt *gvt = vgpu->gvt;
-	struct drm_i915_gem_object *ctx_obj =
-		workload->req->context->state->obj;
+	struct intel_context *ctx = workload->req->context;
 	struct execlist_ring_context *shadow_ring_context;
-	struct page *page;
 	void *dst;
+	void *context_base;
 	unsigned long context_gpa, context_page_num;
 	int i;
 
-	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
-	shadow_ring_context = kmap(page);
+	GEM_BUG_ON(!intel_context_is_pinned(ctx));
+
+	context_base = (void *) ctx->lrc_reg_state -
+				(LRC_STATE_PN << I915_GTT_PAGE_SHIFT);
+
+	shadow_ring_context = (void *) ctx->lrc_reg_state;
 
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, true);
 #define COPY_REG(name) \
@@ -169,7 +172,6 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			I915_GTT_PAGE_SIZE - sizeof(*shadow_ring_context));
 
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
-	kunmap(page);
 
 	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
 		return 0;
@@ -194,11 +196,9 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			return -EFAULT;
 		}
 
-		page = i915_gem_object_get_page(ctx_obj, i);
-		dst = kmap(page);
+		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
 		intel_gvt_hypervisor_read_gpa(vgpu, context_gpa, dst,
 				I915_GTT_PAGE_SIZE);
-		kunmap(page);
 		i++;
 	}
 	return 0;
@@ -784,9 +784,9 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 {
 	struct i915_request *rq = workload->req;
 	struct intel_vgpu *vgpu = workload->vgpu;
-	struct drm_i915_gem_object *ctx_obj = rq->context->state->obj;
 	struct execlist_ring_context *shadow_ring_context;
-	struct page *page;
+	struct intel_context *ctx = workload->req->context;
+	void *context_base;
 	void *src;
 	unsigned long context_gpa, context_page_num;
 	int i;
@@ -797,6 +797,8 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	gvt_dbg_sched("ring id %d workload lrca %x\n", rq->engine->id,
 		      workload->ctx_desc.lrca);
 
+	GEM_BUG_ON(!intel_context_is_pinned(ctx));
+
 	head = workload->rb_head;
 	tail = workload->rb_tail;
 	wrap_count = workload->guest_rb_head >> RB_HEAD_WRAP_CNT_OFF;
@@ -821,6 +823,8 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 		context_page_num = 19;
 
 	i = 2;
+	context_base = (void *) ctx->lrc_reg_state -
+			(LRC_STATE_PN << I915_GTT_PAGE_SHIFT);
 
 	while (i < context_page_num) {
 		context_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
@@ -831,19 +835,16 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 			return;
 		}
 
-		page = i915_gem_object_get_page(ctx_obj, i);
-		src = kmap(page);
+		src = context_base + (i << I915_GTT_PAGE_SHIFT);
 		intel_gvt_hypervisor_write_gpa(vgpu, context_gpa, src,
 				I915_GTT_PAGE_SIZE);
-		kunmap(page);
 		i++;
 	}
 
 	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
 		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
 
-	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
-	shadow_ring_context = kmap(page);
+	shadow_ring_context = (void *) ctx->lrc_reg_state;
 
 #define COPY_REG(name) \
 	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa + \
@@ -860,8 +861,6 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 			(void *)shadow_ring_context +
 			sizeof(*shadow_ring_context),
 			I915_GTT_PAGE_SIZE - sizeof(*shadow_ring_context));
-
-	kunmap(page);
 }
 
 void intel_vgpu_clean_workloads(struct intel_vgpu *vgpu,
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
