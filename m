Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF5E179E0C
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Mar 2020 03:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDD16E03E;
	Thu,  5 Mar 2020 02:59:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95B16E03E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Mar 2020 02:59:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 18:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; d="scan'208";a="274920708"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2020 18:59:00 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: check ggtt entry modification status for
 guest ctxs
Date: Wed,  4 Mar 2020 21:49:30 -0500
Message-Id: <20200305024930.23898-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200305024740.23797-1-yan.y.zhao@intel.com>
References: <20200305024740.23797-1-yan.y.zhao@intel.com>
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

Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c       | 17 +++++++++++++++++
 drivers/gpu/drm/i915/gvt/gvt.h       |  3 ++-
 drivers/gpu/drm/i915/gvt/scheduler.c | 14 ++++++++++++--
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 25bd5c052909..8539e2c5ac3a 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2342,12 +2342,29 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
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
+	for_each_engine(engine, &vgpu->gvt->dev_priv->gt, i) {
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
index db2950b67a03..78d42b883072 100644
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
index c9d81b7d717a..68976d2ef53a 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -138,6 +138,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	int i;
 	bool skip = false;
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
@@ -215,6 +223,8 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
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
