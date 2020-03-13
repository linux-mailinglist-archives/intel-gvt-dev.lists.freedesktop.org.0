Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA21184398
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Mar 2020 10:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2606E287;
	Fri, 13 Mar 2020 09:24:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46316EBA1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Mar 2020 09:24:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 02:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,548,1574150400"; d="scan'208";a="278152989"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2020 02:24:32 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/gvt: check ggtt entry modification status for
 guest ctxs
Date: Fri, 13 Mar 2020 05:15:02 -0400
Message-Id: <20200313091502.32386-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313091104.32323-1-yan.y.zhao@intel.com>
References: <20200313091104.32323-1-yan.y.zhao@intel.com>
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

for guest context, if its ggtt entry is modified after last context
shadowing, it is deemed as not the same context as last shadowed one.

v3: no change
v2: rebased to 5.6.0-rc4+

Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c       | 17 +++++++++++++++++
 drivers/gpu/drm/i915/gvt/gvt.h       |  3 ++-
 drivers/gpu/drm/i915/gvt/scheduler.c | 14 ++++++++++++--
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 2a4b23f8aa74..b1b6a51c006a 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2341,12 +2341,29 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
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
+	for_each_engine(engine, vgpu->gvt->gt->i915, i) {
+		if (!s->last_ctx[i].valid)
+			continue;
+
+		if (atomic_read(&s->last_ctx[i].lrca) ==
+				off >> info->gtt_entry_size_shift) {
+			s->last_ctx[i].valid = false;
+		}
+	}
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index e2d7ffd84457..b342d7be741f 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -164,7 +164,8 @@ struct intel_vgpu_submission {
 	int virtual_submission_interface;
 	bool active;
 	struct {
-		u32 lrca;
+		atomic_t lrca;
+		bool valid;
 		u64 ring_context_gpa;
 	} last_ctx[I915_NUM_ENGINES];
 };
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index a66050a3d65a..7e0d4183b07b 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -138,6 +138,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	int i;
 	bool skip = false;
 	int ring_id = workload->engine->id;
+	bool valid;
 
 	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
 	shadow_ring_context = kmap(page);
@@ -179,13 +180,20 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			workload->ctx_desc.context_id,
 			workload->ring_context_gpa);
 
-	if ((s->last_ctx[ring_id].lrca ==
+	/* only need to ensure this context is not pinned/unpinned during the
+	 * period from last submission to this this submission.
+	 * Upon reaching this function, the currently submitted context is not
+	 * supposed to get unpinned. If a misbehaving guest driver ever does
+	 * this, it would corrupt itself.
+	 */
+	valid = s->last_ctx[ring_id].valid;
+	if (valid && (atomic_read(&s->last_ctx[ring_id].lrca) ==
 				workload->ctx_desc.lrca) &&
 			(s->last_ctx[ring_id].ring_context_gpa ==
 				workload->ring_context_gpa))
 		skip = true;
 
-	s->last_ctx[ring_id].lrca = workload->ctx_desc.lrca;
+	atomic_set(&s->last_ctx[ring_id].lrca, workload->ctx_desc.lrca);
 	s->last_ctx[ring_id].ring_context_gpa = workload->ring_context_gpa;
 
 	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
@@ -214,6 +222,8 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		kunmap(page);
 		i++;
 	}
+	if (!valid)
+		s->last_ctx[ring_id].valid = true;
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
