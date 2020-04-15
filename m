Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BF1A9585
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 10:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE816E901;
	Wed, 15 Apr 2020 08:04:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEF86E901
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 08:04:54 +0000 (UTC)
IronPort-SDR: KOiW5iS0W4AHmlX4FMAOQx6kxLdTLItDh590vXuwBSKflNOv2GN0b3D340NwOF16Y6Z8Cx53Pt
 zOWMmcIAussw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:04:54 -0700
IronPort-SDR: l5exfVtfhk8r1CnHMIkg6H6kZN7h36uip3l0gqyNkOlCiLL9NCU4pFM6I0/djkPZDbau3r6eyJ
 ecDiKYky8Ctw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="277538794"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 01:04:52 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/i915/gvt: skip populate shadow context if guest
 context not changed
Date: Wed, 15 Apr 2020 03:55:10 -0400
Message-Id: <20200415075510.23360-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415075355.23308-1-yan.y.zhao@intel.com>
References: <20200415075355.23308-1-yan.y.zhao@intel.com>
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

This patch needs to cowork with the second patch for ggtt part. so the
skipping of population is intentionally turned off for now.
will turn on it in the last patch.

v4:
- don't turn on optimization until last patch in this series (Kevin Tian)
- define lrca to be atomic in this patch rather than update its type in
the second patch (Kevin Tian)

v3: updated commit message to describe engine context and context id
clearly (Kevin Tian)
v2: rebased to 5.6.0-rc4+Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h       |  5 ++++
 drivers/gpu/drm/i915/gvt/scheduler.c | 38 ++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 58c2c7932e3f..b342d7be741f 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -163,6 +163,11 @@ struct intel_vgpu_submission {
 	const struct intel_vgpu_submission_ops *ops;
 	int virtual_submission_interface;
 	bool active;
+	struct {
+		atomic_t lrca;
+		bool valid;
+		u64 ring_context_gpa;
+	} last_ctx[I915_NUM_ENGINES];
 };
 
 struct intel_vgpu {
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index f939ec3be39e..717d2a110a40 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -135,7 +135,11 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	unsigned long context_gpa, context_page_num;
 	unsigned long gpa_base; /* first gpa of consecutive GPAs */
 	unsigned long gpa_size; /* size of consecutive GPAs */
+	struct intel_vgpu_submission *s = &vgpu->submission;
 	int i;
+	bool skip = false;
+	int ring_id = workload->engine->id;
+	bool valid;
 
 	GEM_BUG_ON(!intel_context_is_pinned(ctx));
 
@@ -175,12 +179,32 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 
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
+	valid = s->last_ctx[ring_id].valid;
+	if (valid && (atomic_read(&s->last_ctx[ring_id].lrca) ==
+				workload->ctx_desc.lrca) &&
+			(s->last_ctx[ring_id].ring_context_gpa ==
+				workload->ring_context_gpa))
+		skip = true;
+
+	atomic_set(&s->last_ctx[ring_id].lrca, workload->ctx_desc.lrca);
+	s->last_ctx[ring_id].ring_context_gpa = workload->ring_context_gpa;
+
+	/* intentionally set it to false now. will turn it on in later patch */
+	skip = false;
+
+	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
+		return 0;
 
 	context_page_num = workload->engine->context_size;
 	context_page_num = context_page_num >> PAGE_SHIFT;
@@ -220,6 +244,8 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		gpa_size = I915_GTT_PAGE_SIZE;
 		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
 	}
+	if (!valid)
+		s->last_ctx[ring_id].valid = true;
 	return 0;
 }
 
@@ -1297,6 +1323,8 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
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
