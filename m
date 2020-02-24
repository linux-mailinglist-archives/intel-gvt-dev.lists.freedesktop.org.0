Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DBA16A0D1
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Feb 2020 09:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECD06E1D6;
	Mon, 24 Feb 2020 08:57:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18176E1D6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Feb 2020 08:57:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 00:57:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; d="scan'208";a="231068941"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 00:57:47 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v3 7/7] drm/i915/gvt: rw more pages a time for shadow context
Date: Mon, 24 Feb 2020 03:48:24 -0500
Message-Id: <20200224084824.31992-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224084350.31574-1-yan.y.zhao@intel.com>
References: <20200224084350.31574-1-yan.y.zhao@intel.com>
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
Cc: kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, intel-gvt-dev@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

1. as shadow context is pinned in intel_vgpu_setup_submission() and
unpinned in intel_vgpu_clean_submission(), its base virtual address of
is safely obtained from lrc_reg_state. no need to call kmap()/kunmap()
repeatedly.

2. IOVA(GPA)s of context pages are checked in this patch and if they are
continuous, read/write them together in one intel_gvt_hypervisor_read_gpa()
/intel_gvt_hypervisor_write_gpa().

after the two changes in this patch,
average cycles for populate_shadow_context() and update_guest_context()
are reduced by ~10000-20000 cycles, depending on the average continuous
pages in each read/write.

(1) comparison of cycles of
populate_shadow_context() + update_guest_context() when executing
different benchmarks
 -------------------------------------------------------------
|       cycles      | glmark2     | lightsmark  | openarena   |
|-------------------------------------------------------------|
| before this patch | 65968       | 97852       | 61373       |
|  after this patch | 56017 (85%) | 73862 (75%) | 47463 (77%) |
 -------------------------------------------------------------

(2) average count of pages read/written a time in
populate_shadow_context() and update_guest_context()
for each benchmark

 -----------------------------------------------------------
|     page cnt      | glmark2     | lightsmark  | openarena |
|-----------------------------------------------------------|
| before this patch |    1        |      1      |    1      |
|  after this patch |    5.25     |     19.99   |   20      |
 ------------------------------------------------------------

(3) comparison of benchmarks scores
 ---------------------------------------------------------------------
|      score        | glmark2       | lightsmark     | openarena      |
|---------------------------------------------------------------------|
| before this patch | 1244          | 222.18         | 114.4          |
|  after this patch | 1248 (100.3%) | 225.8 (101.6%) | 115.0 (100.9%) |
 ---------------------------------------------------------------------

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 101 +++++++++++++++++++--------
 1 file changed, 73 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 5b2a7d072ec9..c2b521b099bc 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -129,16 +129,22 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	struct intel_vgpu *vgpu = workload->vgpu;
 	struct intel_gvt *gvt = vgpu->gvt;
 	int ring_id = workload->ring_id;
-	struct drm_i915_gem_object *ctx_obj =
-		workload->req->hw_context->state->obj;
+	struct intel_context *ctx_ce = workload->req->hw_context;
 	struct execlist_ring_context *shadow_ring_context;
-	struct page *page;
 	void *dst;
+	void *context_base;
 	unsigned long context_gpa, context_page_num;
+	unsigned long seq_gpa_base; /* first gpa of successive GPAs */
+	int seq_page_cnt; /* cnt of GPAs that are successive */
 	int i;
 
-	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
-	shadow_ring_context = kmap(page);
+	GEM_BUG_ON(!intel_context_is_pinned(ctx_ce));
+
+	context_base = (void *) ctx_ce->lrc_reg_state -
+				(LRC_STATE_PN << I915_GTT_PAGE_SHIFT);
+
+	shadow_ring_context = context_base +
+				(LRC_STATE_PN << I915_GTT_PAGE_SHIFT);
 
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, true);
 #define COPY_REG(name) \
@@ -170,7 +176,6 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			I915_GTT_PAGE_SIZE - sizeof(*shadow_ring_context));
 
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
-	kunmap(page);
 
 	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
 		return 0;
@@ -185,8 +190,12 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	if (IS_BROADWELL(gvt->dev_priv) && ring_id == RCS0)
 		context_page_num = 19;
 
-	i = 2;
-	while (i < context_page_num) {
+
+	/* find continuous GPAs from gma until the first discontinuous GPA
+	 * read continuous GPAs into dst virtual address
+	 */
+	seq_page_cnt = 0;
+	for (i = 2; i < context_page_num; i++) {
 		context_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
 				(u32)((workload->ctx_desc.lrca + i) <<
 				I915_GTT_PAGE_SHIFT));
@@ -195,12 +204,26 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			return -EFAULT;
 		}
 
-		page = i915_gem_object_get_page(ctx_obj, i);
-		dst = kmap(page);
-		intel_gvt_hypervisor_read_gpa(vgpu, context_gpa, dst,
-				I915_GTT_PAGE_SIZE);
-		kunmap(page);
-		i++;
+		if (seq_page_cnt == 0) {
+			seq_gpa_base = context_gpa;
+			dst = context_base + (i << I915_GTT_PAGE_SHIFT);
+		} else if (context_gpa != seq_gpa_base +
+					(seq_page_cnt << I915_GTT_PAGE_SHIFT))
+			goto read;
+
+		seq_page_cnt++;
+
+		if (i == context_page_num - 1)
+			goto read;
+
+		continue;
+
+read:
+		intel_gvt_hypervisor_read_gpa(vgpu, seq_gpa_base, dst,
+					seq_page_cnt << I915_GTT_PAGE_SHIFT);
+		seq_page_cnt = 1;
+		seq_gpa_base = context_gpa;
+		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
 	}
 	return 0;
 }
@@ -787,20 +810,24 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	struct i915_request *rq = workload->req;
 	struct intel_vgpu *vgpu = workload->vgpu;
 	struct intel_gvt *gvt = vgpu->gvt;
-	struct drm_i915_gem_object *ctx_obj = rq->hw_context->state->obj;
+	struct intel_context *ctx_ce = workload->req->hw_context;
 	struct execlist_ring_context *shadow_ring_context;
-	struct page *page;
-	void *src;
 	unsigned long context_gpa, context_page_num;
+	unsigned long seq_gpa_base; /* first gpa of successive GPAs */
+	int seq_page_cnt; /* cnt of GPAs that are successive */
 	int i;
 	struct drm_i915_private *dev_priv = gvt->dev_priv;
 	u32 ring_base;
 	u32 head, tail;
 	u16 wrap_count;
+	void *src;
+	void *context_base;
 
 	gvt_dbg_sched("ring id %d workload lrca %x\n", rq->engine->id,
 		      workload->ctx_desc.lrca);
 
+	GEM_BUG_ON(!intel_context_is_pinned(ctx_ce));
+
 	head = workload->rb_head;
 	tail = workload->rb_tail;
 	wrap_count = workload->guest_rb_head >> RB_HEAD_WRAP_CNT_OFF;
@@ -824,9 +851,14 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	if (IS_BROADWELL(gvt->dev_priv) && rq->engine->id == RCS0)
 		context_page_num = 19;
 
-	i = 2;
+	context_base = (void *) ctx_ce->lrc_reg_state -
+		 LRC_STATE_PN * PAGE_SIZE;
 
-	while (i < context_page_num) {
+	/* find continuous GPAs from gma until the first discontinuous GPA
+	 * write continuous GPAs from src virtual address
+	 */
+	seq_page_cnt = 0;
+	for (i = 2; i < context_page_num; i++) {
 		context_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
 				(u32)((workload->ctx_desc.lrca + i) <<
 					I915_GTT_PAGE_SHIFT));
@@ -835,19 +867,33 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 			return;
 		}
 
-		page = i915_gem_object_get_page(ctx_obj, i);
-		src = kmap(page);
-		intel_gvt_hypervisor_write_gpa(vgpu, context_gpa, src,
-				I915_GTT_PAGE_SIZE);
-		kunmap(page);
-		i++;
+		if (seq_page_cnt == 0) {
+			seq_gpa_base = context_gpa;
+			src = context_base + (i << I915_GTT_PAGE_SHIFT);
+		} else if (context_gpa != seq_gpa_base +
+					(seq_page_cnt << I915_GTT_PAGE_SHIFT))
+			goto write;
+
+		seq_page_cnt++;
+
+		if (i == context_page_num - 1)
+			goto write;
+
+		continue;
+
+write:
+		intel_gvt_hypervisor_write_gpa(vgpu, seq_gpa_base, src,
+					seq_page_cnt << I915_GTT_PAGE_SHIFT);
+		seq_page_cnt = 1;
+		seq_gpa_base = context_gpa;
+		src = context_base + (i << I915_GTT_PAGE_SHIFT);
 	}
 
 	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
 		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
 
-	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
-	shadow_ring_context = kmap(page);
+	shadow_ring_context = context_base +
+				(LRC_STATE_PN << I915_GTT_PAGE_SHIFT);
 
 #define COPY_REG(name) \
 	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa + \
@@ -865,7 +911,6 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 			sizeof(*shadow_ring_context),
 			I915_GTT_PAGE_SIZE - sizeof(*shadow_ring_context));
 
-	kunmap(page);
 }
 
 void intel_vgpu_clean_workloads(struct intel_vgpu *vgpu,
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
