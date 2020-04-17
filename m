Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523E1AD9B7
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Apr 2020 11:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AB46E3DB;
	Fri, 17 Apr 2020 09:23:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAAA6E3DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Apr 2020 09:23:18 +0000 (UTC)
IronPort-SDR: 3fEy1xFBIXfiUvD006T9rajRJMNnOUqaIZV+DuPfgv0c62UDjEwXuovdHKyHS9Ges5ucymuL5e
 0Kk+E1P/gFPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 02:23:17 -0700
IronPort-SDR: dX5PZyMtWxmwlQ+JnvBL2yNGmMDmrSAVEBLiICaBO4BmYN+Y8XYWsdqlcxNcQ69/MtADpW3iVr
 zdjg+BNWuBNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="278319668"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 17 Apr 2020 02:23:16 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v7] drm/i915/gvt: skip populate shadow context if guest
 context not changed
Date: Fri, 17 Apr 2020 05:13:34 -0400
Message-Id: <20200417091334.32628-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Software is not expected to populate engine context except when using
restore inhibit bit or golden state to initialize it for the first time.

Therefore, if a newly submitted guest context is the same as the last
shadowed one, no need to populate its engine context from guest again.

Currently using lrca + ring_context_gpa to identify whether two guest
contexts are the same.

The reason of why context id is not included as an identifier is that
i915 recently changed the code and context id is only unique for a
context when OA is enabled. And when OA is on, context id is generated
based on lrca. Therefore, in that case, if two contexts are of the same
lrca, they have identical context ids as well.
(This patch also works with old guest kernel like 4.20.)

for guest context, if its ggtt entry is modified after last context
shadowing, it is also deemed as not the same context as last shadowed one.

v7:
-removed local variable "valid". use the one in s->last_ctx diretly

v6:
-change type of lrca of last ctx to be u32. as currently it's all
protected by vgpu lock (Kevin Tian)
-reset valid of last ctx to false once it needs to be repopulated before
population completes successfully (Kevin Tian)

v5:
-merge all 3 patches into one patch  (Zhenyu Wang)

v4:
- split the series into 3 patches.
- don't turn on optimization until last patch in this series (Kevin Tian)
- define lrca to be atomic in this patch rather than update its type in
the second patch (Kevin Tian)

v3: updated commit message to describe engine context and context id
clearly (Kevin Tian)
v2: rebased to 5.6.0-rc4+Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c       | 15 ++++++++++++
 drivers/gpu/drm/i915/gvt/gvt.h       |  5 ++++
 drivers/gpu/drm/i915/gvt/scheduler.c | 34 ++++++++++++++++++++++++----
 3 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 2a4b23f8aa74..d2b0d85b39bc 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2341,12 +2341,27 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
 {
 	const struct intel_gvt_device_info *info = &vgpu->gvt->device_info;
 	int ret;
+	struct intel_vgpu_submission *s = &vgpu->submission;
+	struct intel_engine_cs *engine;
+	int i;
 
 	if (bytes != 4 && bytes != 8)
 		return -EINVAL;
 
 	off -= info->gtt_start_offset;
 	ret = emulate_ggtt_mmio_write(vgpu, off, p_data, bytes);
+
+	/* if ggtt of last submitted context is written,
+	 * that context is probably got unpinned.
+	 * Set last shadowed ctx to invalid.
+	 */
+	for_each_engine(engine, vgpu->gvt->gt, i) {
+		if (!s->last_ctx[i].valid)
+			continue;
+
+		if (s->last_ctx[i].lrca == (off >> info->gtt_entry_size_shift))
+			s->last_ctx[i].valid = false;
+	}
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 58c2c7932e3f..a4a6db6b7f90 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -163,6 +163,11 @@ struct intel_vgpu_submission {
 	const struct intel_vgpu_submission_ops *ops;
 	int virtual_submission_interface;
 	bool active;
+	struct {
+		u32 lrca;
+		bool valid;
+		u64 ring_context_gpa;
+	} last_ctx[I915_NUM_ENGINES];
 };
 
 struct intel_vgpu {
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index f939ec3be39e..93326f0109a6 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -135,7 +135,10 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	unsigned long context_gpa, context_page_num;
 	unsigned long gpa_base; /* first gpa of consecutive GPAs */
 	unsigned long gpa_size; /* size of consecutive GPAs */
+	struct intel_vgpu_submission *s = &vgpu->submission;
 	int i;
+	bool skip = false;
+	int ring_id = workload->engine->id;
 
 	GEM_BUG_ON(!intel_context_is_pinned(ctx));
 
@@ -175,13 +178,31 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
 
-	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
-		return 0;
+	gvt_dbg_sched("ring %s workload lrca %x, ctx_id %x, ctx gpa %llx",
+			workload->engine->name, workload->ctx_desc.lrca,
+			workload->ctx_desc.context_id,
+			workload->ring_context_gpa);
 
-	gvt_dbg_sched("ring %s workload lrca %x",
-		      workload->engine->name,
-		      workload->ctx_desc.lrca);
+	/* only need to ensure this context is not pinned/unpinned during the
+	 * period from last submission to this this submission.
+	 * Upon reaching this function, the currently submitted context is not
+	 * supposed to get unpinned. If a misbehaving guest driver ever does
+	 * this, it would corrupt itself.
+	 */
+	if (s->last_ctx[ring_id].valid &&
+			(s->last_ctx[ring_id].lrca ==
+				workload->ctx_desc.lrca) &&
+			(s->last_ctx[ring_id].ring_context_gpa ==
+				workload->ring_context_gpa))
+		skip = true;
 
+	s->last_ctx[ring_id].lrca = workload->ctx_desc.lrca;
+	s->last_ctx[ring_id].ring_context_gpa = workload->ring_context_gpa;
+
+	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
+		return 0;
+
+	s->last_ctx[ring_id].valid = false;
 	context_page_num = workload->engine->context_size;
 	context_page_num = context_page_num >> PAGE_SHIFT;
 
@@ -220,6 +241,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		gpa_size = I915_GTT_PAGE_SIZE;
 		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
 	}
+	s->last_ctx[ring_id].valid = true;
 	return 0;
 }
 
@@ -1297,6 +1319,8 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 	atomic_set(&s->running_workload_num, 0);
 	bitmap_zero(s->tlb_handle_pending, I915_NUM_ENGINES);
 
+	memset(s->last_ctx, 0, sizeof(s->last_ctx));
+
 	i915_vm_put(&ppgtt->vm);
 	return 0;
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
