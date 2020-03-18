Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10CD1895D7
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Mar 2020 07:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62311898CE;
	Wed, 18 Mar 2020 06:31:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E20892CF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Mar 2020 06:31:10 +0000 (UTC)
IronPort-SDR: eJcjOR4TAv7xdE4Lg8+1V5n+dOcKdl+9NjMIg98rkyegdA9KHrHFrgMoDuPTC5mpR8KWtvAN4S
 IWx03an4tfvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 23:31:10 -0700
IronPort-SDR: 1upcG2gGlCrprXFP9CO9t/RzRq/ZOO+SOb2W5zdpzsMgWWuJU5k0vvCjXjYJLW8vkEl33/0yuM
 kggzCi7q9MJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="355604964"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2020 23:31:09 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Check engine id before using it
Date: Wed, 18 Mar 2020 14:26:35 +0800
Message-Id: <20200318062635.21689-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The number of engines is I915_NUM_ENGINES. Since the array starts from
zero, the last one's index in the array should be (I915_NUM_ENGINES - 1).
Directly using engined->id as the index of the array, may lead to out of
array's range issue.

Klocwork detected this issue and this patch solves it by checking
engine->id before using it.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/execlist.c  | 19 ++++++++++++++++---
 drivers/gpu/drm/i915/gvt/handlers.c  |  7 ++++---
 drivers/gpu/drm/i915/gvt/scheduler.c | 19 +++++++++++++++----
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index dd25c3024370..37f8fcac7b05 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -437,6 +437,9 @@ static int submit_context(struct intel_vgpu *vgpu,
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	struct intel_vgpu_workload *workload = NULL;
 
+	if (!engine || engine->id >= I915_NUM_ENGINES)
+		return -EINVAL;
+
 	workload = intel_vgpu_create_workload(vgpu, engine, desc);
 	if (IS_ERR(workload))
 		return PTR_ERR(workload);
@@ -459,10 +462,15 @@ int intel_vgpu_submit_execlist(struct intel_vgpu *vgpu,
 			       const struct intel_engine_cs *engine)
 {
 	struct intel_vgpu_submission *s = &vgpu->submission;
-	struct intel_vgpu_execlist *execlist = &s->execlist[engine->id];
+	struct intel_vgpu_execlist *execlist;
 	struct execlist_ctx_descriptor_format *desc[2];
 	int i, ret;
 
+	if (!engine || engine->id >= I915_NUM_ENGINES)
+		return -EINVAL;
+
+	execlist = &s->execlist[engine->id];
+
 	desc[0] = get_desc_from_elsp_dwords(&execlist->elsp_dwords, 0);
 	desc[1] = get_desc_from_elsp_dwords(&execlist->elsp_dwords, 1);
 
@@ -503,11 +511,16 @@ static void init_vgpu_execlist(struct intel_vgpu *vgpu,
 			       const struct intel_engine_cs *engine)
 {
 	struct intel_vgpu_submission *s = &vgpu->submission;
-	struct intel_vgpu_execlist *execlist = &s->execlist[engine->id];
+	struct intel_vgpu_execlist *execlist;
 	struct execlist_context_status_pointer_format ctx_status_ptr;
 	u32 ctx_status_ptr_reg;
 
-	memset(execlist, 0, sizeof(*execlist));
+	if (!engine || engine->id >= I915_NUM_ENGINES)
+		return;
+
+	execlist = &s->execlist[engine->id];
+
+	memset(execlist, 0, sizeof(struct intel_vgpu_execlist));
 
 	execlist->vgpu = vgpu;
 	execlist->engine = engine;
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 0182e2a5acff..f11908a28ce7 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1690,7 +1690,8 @@ static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	u32 data = *(u32 *)p_data;
 	int ret = 0;
 
-	if (drm_WARN_ON(&i915->drm, !engine))
+	if (drm_WARN_ON(&i915->drm, !engine) ||
+		engine->id >= I915_NUM_ENGINES)
 		return -EINVAL;
 
 	execlist = &vgpu->submission.execlist[engine->id];
@@ -1743,8 +1744,8 @@ static int ring_mode_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
 		return 0;
 	}
-	if ((data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE))
-			|| (data & _MASKED_BIT_DISABLE(GFX_RUN_LIST_ENABLE))) {
+	if (engine && ((data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE))
+		       || (data & _MASKED_BIT_DISABLE(GFX_RUN_LIST_ENABLE)))) {
 		enable_execlist = !!(data & GFX_RUN_LIST_ENABLE);
 
 		gvt_dbg_core("EXECLIST %s on ring %s\n",
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 1c95bf8cbed0..8436984cd1f6 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -232,13 +232,21 @@ static int shadow_context_status_change(struct notifier_block *nb,
 		unsigned long action, void *data)
 {
 	struct i915_request *rq = data;
-	struct intel_gvt *gvt = container_of(nb, struct intel_gvt,
-				shadow_ctx_notifier_block[rq->engine->id]);
-	struct intel_gvt_workload_scheduler *scheduler = &gvt->scheduler;
-	enum intel_engine_id ring_id = rq->engine->id;
+	struct intel_gvt *gvt;
+	struct intel_gvt_workload_scheduler *scheduler;
+	enum intel_engine_id ring_id;
 	struct intel_vgpu_workload *workload;
 	unsigned long flags;
 
+	if (!rq || !rq->engine || rq->engine->id >= I915_NUM_ENGINES)
+		return NOTIFY_OK;
+
+	ring_id = rq->engine->id;
+
+	gvt = container_of(nb, struct intel_gvt,
+				shadow_ctx_notifier_block[rq->engine->id]);
+	scheduler = &gvt->scheduler;
+
 	if (!is_gvt_request(rq)) {
 		spin_lock_irqsave(&scheduler->mmio_context_lock, flags);
 		if (action == INTEL_CONTEXT_SCHEDULE_IN &&
@@ -1586,6 +1594,9 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
  */
 void intel_vgpu_queue_workload(struct intel_vgpu_workload *workload)
 {
+	if (workload->engine->id >= I915_NUM_ENGINES)
+		return;
+
 	list_add_tail(&workload->list,
 		      workload_q_head(workload->vgpu, workload->engine));
 	intel_gvt_kick_schedule(workload->vgpu->gvt);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
