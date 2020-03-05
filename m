Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA325179E08
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Mar 2020 03:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C726E03E;
	Thu,  5 Mar 2020 02:57:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2986E03E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Mar 2020 02:57:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 18:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; d="scan'208";a="234259696"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 04 Mar 2020 18:57:09 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: optimization of context shadowing
Date: Wed,  4 Mar 2020 21:47:40 -0500
Message-Id: <20200305024740.23797-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

if the newly submitted guest context is the same as last shadowed one,
no need to copy them from guest again.

Currently using lrca + ring_context_gpa to identify whether two guest
contexts are the same.

The reason of why context id is not included is that it's recently
changed by i915 that it just increase the value indiscriminately if i915
perf is not on.
If i915 perf is on, I checked that the value is aligned with lrca.
so it's safe to omit context_id.

It also workes with old guest kernel like 4.20.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h       |  4 ++++
 drivers/gpu/drm/i915/gvt/scheduler.c | 23 +++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 8cf292a8d6bd..db2950b67a03 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -163,6 +163,10 @@ struct intel_vgpu_submission {
 	const struct intel_vgpu_submission_ops *ops;
 	int virtual_submission_interface;
 	bool active;
+	struct {
+		u32 lrca;
+		u64 ring_context_gpa;
+	} last_ctx[I915_NUM_ENGINES];
 };
 
 struct intel_vgpu {
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 68932b33c057..c9d81b7d717a 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -135,7 +135,9 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	struct page *page;
 	void *dst;
 	unsigned long context_gpa, context_page_num;
+	struct intel_vgpu_submission *s = &vgpu->submission;
 	int i;
+	bool skip = false;
 
 	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
 	shadow_ring_context = kmap(page);
@@ -172,11 +174,22 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
 	kunmap(page);
 
-	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
-		return 0;
+	gvt_dbg_sched("ring id %d workload lrca %x, ctx_id %x, ctx gpa %llx",
+			ring_id, workload->ctx_desc.lrca,
+			workload->ctx_desc.context_id,
+			workload->ring_context_gpa);
+
+	if ((s->last_ctx[ring_id].lrca ==
+				workload->ctx_desc.lrca) &&
+			(s->last_ctx[ring_id].ring_context_gpa ==
+				workload->ring_context_gpa))
+		skip = true;
 
-	gvt_dbg_sched("ring id %d workload lrca %x", ring_id,
-			workload->ctx_desc.lrca);
+	s->last_ctx[ring_id].lrca = workload->ctx_desc.lrca;
+	s->last_ctx[ring_id].ring_context_gpa = workload->ring_context_gpa;
+
+	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
+		return 0;
 
 	context_page_num = gvt->dev_priv->engine[ring_id]->context_size;
 
@@ -1278,6 +1291,8 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
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
