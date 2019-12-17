Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D13122922
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Dec 2019 11:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EEF6E987;
	Tue, 17 Dec 2019 10:46:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF10C6E987
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Dec 2019 10:46:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 02:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="212521209"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.49])
 by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2019 02:46:08 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [RFC PATCH] drm/i915/gvt: split sched_policy for adding more policies
Date: Tue, 17 Dec 2019 18:32:43 +0800
Message-Id: <1576578763-12616-1-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: Hang Yuan <hang.yuan@linux.intel.com>

Leave common policy codes in sched_policy.c and move time based
scheduling to new file sched_policy_weight.c. Add module parameter
"gvt_scheduler_policy" to choose one policy.

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/Makefile              |   2 +-
 drivers/gpu/drm/i915/gvt/gvt.c                 |   2 +-
 drivers/gpu/drm/i915/gvt/gvt.h                 |   3 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c        | 361 +------------------------
 drivers/gpu/drm/i915/gvt/sched_policy.h        |   1 +
 drivers/gpu/drm/i915/gvt/sched_policy_weight.c | 351 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/sched_policy_weight.h |  32 +++
 drivers/gpu/drm/i915/gvt/vgpu.c                |   4 +-
 drivers/gpu/drm/i915/i915_params.c             |   2 +
 drivers/gpu/drm/i915/i915_params.h             |   3 +-
 10 files changed, 403 insertions(+), 358 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gvt/sched_policy_weight.c
 create mode 100644 drivers/gpu/drm/i915/gvt/sched_policy_weight.h

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324a..f180aae 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -3,7 +3,7 @@ GVT_DIR := gvt
 GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
 	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
-	fb_decoder.o dmabuf.o page_track.o
+	fb_decoder.o dmabuf.o page_track.o sched_policy_weight.o
 
 ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index cb5fa30..0aeb692 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -228,7 +228,7 @@ static int gvt_service_thread(void *data)
 				(void *)&gvt->service_request) ||
 			test_bit(INTEL_GVT_REQUEST_EVENT_SCHED,
 					(void *)&gvt->service_request)) {
-			intel_gvt_schedule(gvt);
+			gvt->scheduler.sched_ops->schedule(gvt);
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 0081b05..eb66901 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -44,6 +44,7 @@
 #include "execlist.h"
 #include "scheduler.h"
 #include "sched_policy.h"
+#include "sched_policy_weight.h"
 #include "mmio_context.h"
 #include "cmd_parser.h"
 #include "fb_decoder.h"
@@ -131,7 +132,7 @@ struct intel_vgpu_display {
 };
 
 struct vgpu_sched_ctl {
-	int weight;
+	int value;
 };
 
 enum {
diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.c b/drivers/gpu/drm/i915/gvt/sched_policy.c
index 2369d4a..530931a 100644
--- a/drivers/gpu/drm/i915/gvt/sched_policy.c
+++ b/drivers/gpu/drm/i915/gvt/sched_policy.c
@@ -34,355 +34,18 @@
 #include "i915_drv.h"
 #include "gvt.h"
 
-static bool vgpu_has_pending_workload(struct intel_vgpu *vgpu)
-{
-	enum intel_engine_id i;
-	struct intel_engine_cs *engine;
-
-	for_each_engine(engine, vgpu->gvt->dev_priv, i) {
-		if (!list_empty(workload_q_head(vgpu, i)))
-			return true;
-	}
-
-	return false;
-}
-
-/* We give 2 seconds higher prio for vGPU during start */
-#define GVT_SCHED_VGPU_PRI_TIME  2
-
-struct vgpu_sched_data {
-	struct list_head lru_list;
-	struct intel_vgpu *vgpu;
-	bool active;
-	bool pri_sched;
-	ktime_t pri_time;
-	ktime_t sched_in_time;
-	ktime_t sched_time;
-	ktime_t left_ts;
-	ktime_t allocated_ts;
-
-	struct vgpu_sched_ctl sched_ctl;
-};
-
-struct gvt_sched_data {
-	struct intel_gvt *gvt;
-	struct hrtimer timer;
-	unsigned long period;
-	struct list_head lru_runq_head;
-	ktime_t expire_time;
-};
-
-static void vgpu_update_timeslice(struct intel_vgpu *vgpu, ktime_t cur_time)
-{
-	ktime_t delta_ts;
-	struct vgpu_sched_data *vgpu_data;
-
-	if (!vgpu || vgpu == vgpu->gvt->idle_vgpu)
-		return;
-
-	vgpu_data = vgpu->sched_data;
-	delta_ts = ktime_sub(cur_time, vgpu_data->sched_in_time);
-	vgpu_data->sched_time = ktime_add(vgpu_data->sched_time, delta_ts);
-	vgpu_data->left_ts = ktime_sub(vgpu_data->left_ts, delta_ts);
-	vgpu_data->sched_in_time = cur_time;
-}
-
-#define GVT_TS_BALANCE_PERIOD_MS 100
-#define GVT_TS_BALANCE_STAGE_NUM 10
-
-static void gvt_balance_timeslice(struct gvt_sched_data *sched_data)
-{
-	struct vgpu_sched_data *vgpu_data;
-	struct list_head *pos;
-	static u64 stage_check;
-	int stage = stage_check++ % GVT_TS_BALANCE_STAGE_NUM;
-
-	/* The timeslice accumulation reset at stage 0, which is
-	 * allocated again without adding previous debt.
-	 */
-	if (stage == 0) {
-		int total_weight = 0;
-		ktime_t fair_timeslice;
-
-		list_for_each(pos, &sched_data->lru_runq_head) {
-			vgpu_data = container_of(pos, struct vgpu_sched_data, lru_list);
-			total_weight += vgpu_data->sched_ctl.weight;
-		}
-
-		list_for_each(pos, &sched_data->lru_runq_head) {
-			vgpu_data = container_of(pos, struct vgpu_sched_data, lru_list);
-			fair_timeslice = ktime_divns(ms_to_ktime(GVT_TS_BALANCE_PERIOD_MS),
-						     total_weight) * vgpu_data->sched_ctl.weight;
-
-			vgpu_data->allocated_ts = fair_timeslice;
-			vgpu_data->left_ts = vgpu_data->allocated_ts;
-		}
-	} else {
-		list_for_each(pos, &sched_data->lru_runq_head) {
-			vgpu_data = container_of(pos, struct vgpu_sched_data, lru_list);
-
-			/* timeslice for next 100ms should add the left/debt
-			 * slice of previous stages.
-			 */
-			vgpu_data->left_ts += vgpu_data->allocated_ts;
-		}
-	}
-}
-
-static void try_to_schedule_next_vgpu(struct intel_gvt *gvt)
-{
-	struct intel_gvt_workload_scheduler *scheduler = &gvt->scheduler;
-	enum intel_engine_id i;
-	struct intel_engine_cs *engine;
-	struct vgpu_sched_data *vgpu_data;
-	ktime_t cur_time;
-
-	/* no need to schedule if next_vgpu is the same with current_vgpu,
-	 * let scheduler chose next_vgpu again by setting it to NULL.
-	 */
-	if (scheduler->next_vgpu == scheduler->current_vgpu) {
-		scheduler->next_vgpu = NULL;
-		return;
-	}
-
-	/*
-	 * after the flag is set, workload dispatch thread will
-	 * stop dispatching workload for current vgpu
-	 */
-	scheduler->need_reschedule = true;
-
-	/* still have uncompleted workload? */
-	for_each_engine(engine, gvt->dev_priv, i) {
-		if (scheduler->current_workload[i])
-			return;
-	}
-
-	cur_time = ktime_get();
-	vgpu_update_timeslice(scheduler->current_vgpu, cur_time);
-	vgpu_data = scheduler->next_vgpu->sched_data;
-	vgpu_data->sched_in_time = cur_time;
-
-	/* switch current vgpu */
-	scheduler->current_vgpu = scheduler->next_vgpu;
-	scheduler->next_vgpu = NULL;
-
-	scheduler->need_reschedule = false;
-
-	/* wake up workload dispatch thread */
-	for_each_engine(engine, gvt->dev_priv, i)
-		wake_up(&scheduler->waitq[i]);
-}
-
-static struct intel_vgpu *find_busy_vgpu(struct gvt_sched_data *sched_data)
-{
-	struct vgpu_sched_data *vgpu_data;
-	struct intel_vgpu *vgpu = NULL;
-	struct list_head *head = &sched_data->lru_runq_head;
-	struct list_head *pos;
-
-	/* search a vgpu with pending workload */
-	list_for_each(pos, head) {
-
-		vgpu_data = container_of(pos, struct vgpu_sched_data, lru_list);
-		if (!vgpu_has_pending_workload(vgpu_data->vgpu))
-			continue;
-
-		if (vgpu_data->pri_sched) {
-			if (ktime_before(ktime_get(), vgpu_data->pri_time)) {
-				vgpu = vgpu_data->vgpu;
-				break;
-			} else
-				vgpu_data->pri_sched = false;
-		}
-
-		/* Return the vGPU only if it has time slice left */
-		if (vgpu_data->left_ts > 0) {
-			vgpu = vgpu_data->vgpu;
-			break;
-		}
-	}
-
-	return vgpu;
-}
-
-/* in nanosecond */
-#define GVT_DEFAULT_TIME_SLICE 1000000
-
-static void tbs_sched_func(struct gvt_sched_data *sched_data)
+int intel_gvt_init_sched_policy(struct intel_gvt *gvt)
 {
-	struct intel_gvt *gvt = sched_data->gvt;
-	struct intel_gvt_workload_scheduler *scheduler = &gvt->scheduler;
-	struct vgpu_sched_data *vgpu_data;
-	struct intel_vgpu *vgpu = NULL;
-
-	/* no active vgpu or has already had a target */
-	if (list_empty(&sched_data->lru_runq_head) || scheduler->next_vgpu)
-		goto out;
+	int ret;
 
-	vgpu = find_busy_vgpu(sched_data);
-	if (vgpu) {
-		scheduler->next_vgpu = vgpu;
-		vgpu_data = vgpu->sched_data;
-		if (!vgpu_data->pri_sched) {
-			/* Move the last used vGPU to the tail of lru_list */
-			list_del_init(&vgpu_data->lru_list);
-			list_add_tail(&vgpu_data->lru_list,
-				      &sched_data->lru_runq_head);
-		}
+	if (!strcmp(i915_modparams.gvt_scheduler_policy, "weight")) {
+		gvt->scheduler.sched_ops = &tbs_schedule_ops;
 	} else {
-		scheduler->next_vgpu = gvt->idle_vgpu;
+		gvt_err("unknown gvt scheduler policy %s\n",
+			i915_modparams.gvt_scheduler_policy);
 	}
-out:
-	if (scheduler->next_vgpu)
-		try_to_schedule_next_vgpu(gvt);
-}
-
-void intel_gvt_schedule(struct intel_gvt *gvt)
-{
-	struct gvt_sched_data *sched_data = gvt->scheduler.sched_data;
-	ktime_t cur_time;
 
 	mutex_lock(&gvt->sched_lock);
-	cur_time = ktime_get();
-
-	if (test_and_clear_bit(INTEL_GVT_REQUEST_SCHED,
-				(void *)&gvt->service_request)) {
-		if (cur_time >= sched_data->expire_time) {
-			gvt_balance_timeslice(sched_data);
-			sched_data->expire_time = ktime_add_ms(
-				cur_time, GVT_TS_BALANCE_PERIOD_MS);
-		}
-	}
-	clear_bit(INTEL_GVT_REQUEST_EVENT_SCHED, (void *)&gvt->service_request);
-
-	vgpu_update_timeslice(gvt->scheduler.current_vgpu, cur_time);
-	tbs_sched_func(sched_data);
-
-	mutex_unlock(&gvt->sched_lock);
-}
-
-static enum hrtimer_restart tbs_timer_fn(struct hrtimer *timer_data)
-{
-	struct gvt_sched_data *data;
-
-	data = container_of(timer_data, struct gvt_sched_data, timer);
-
-	intel_gvt_request_service(data->gvt, INTEL_GVT_REQUEST_SCHED);
-
-	hrtimer_add_expires_ns(&data->timer, data->period);
-
-	return HRTIMER_RESTART;
-}
-
-static int tbs_sched_init(struct intel_gvt *gvt)
-{
-	struct intel_gvt_workload_scheduler *scheduler =
-		&gvt->scheduler;
-
-	struct gvt_sched_data *data;
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&data->lru_runq_head);
-	hrtimer_init(&data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	data->timer.function = tbs_timer_fn;
-	data->period = GVT_DEFAULT_TIME_SLICE;
-	data->gvt = gvt;
-
-	scheduler->sched_data = data;
-
-	return 0;
-}
-
-static void tbs_sched_clean(struct intel_gvt *gvt)
-{
-	struct intel_gvt_workload_scheduler *scheduler =
-		&gvt->scheduler;
-	struct gvt_sched_data *data = scheduler->sched_data;
-
-	hrtimer_cancel(&data->timer);
-
-	kfree(data);
-	scheduler->sched_data = NULL;
-}
-
-static int tbs_sched_init_vgpu(struct intel_vgpu *vgpu)
-{
-	struct vgpu_sched_data *data;
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->sched_ctl.weight = vgpu->sched_ctl.weight;
-	data->vgpu = vgpu;
-	INIT_LIST_HEAD(&data->lru_list);
-
-	vgpu->sched_data = data;
-
-	return 0;
-}
-
-static void tbs_sched_clean_vgpu(struct intel_vgpu *vgpu)
-{
-	struct intel_gvt *gvt = vgpu->gvt;
-	struct gvt_sched_data *sched_data = gvt->scheduler.sched_data;
-
-	kfree(vgpu->sched_data);
-	vgpu->sched_data = NULL;
-
-	/* this vgpu id has been removed */
-	if (idr_is_empty(&gvt->vgpu_idr))
-		hrtimer_cancel(&sched_data->timer);
-}
-
-static void tbs_sched_start_schedule(struct intel_vgpu *vgpu)
-{
-	struct gvt_sched_data *sched_data = vgpu->gvt->scheduler.sched_data;
-	struct vgpu_sched_data *vgpu_data = vgpu->sched_data;
-	ktime_t now;
-
-	if (!list_empty(&vgpu_data->lru_list))
-		return;
-
-	now = ktime_get();
-	vgpu_data->pri_time = ktime_add(now,
-					ktime_set(GVT_SCHED_VGPU_PRI_TIME, 0));
-	vgpu_data->pri_sched = true;
-
-	list_add(&vgpu_data->lru_list, &sched_data->lru_runq_head);
-
-	if (!hrtimer_active(&sched_data->timer))
-		hrtimer_start(&sched_data->timer, ktime_add_ns(ktime_get(),
-			sched_data->period), HRTIMER_MODE_ABS);
-	vgpu_data->active = true;
-}
-
-static void tbs_sched_stop_schedule(struct intel_vgpu *vgpu)
-{
-	struct vgpu_sched_data *vgpu_data = vgpu->sched_data;
-
-	list_del_init(&vgpu_data->lru_list);
-	vgpu_data->active = false;
-}
-
-static struct intel_gvt_sched_policy_ops tbs_schedule_ops = {
-	.init = tbs_sched_init,
-	.clean = tbs_sched_clean,
-	.init_vgpu = tbs_sched_init_vgpu,
-	.clean_vgpu = tbs_sched_clean_vgpu,
-	.start_schedule = tbs_sched_start_schedule,
-	.stop_schedule = tbs_sched_stop_schedule,
-};
-
-int intel_gvt_init_sched_policy(struct intel_gvt *gvt)
-{
-	int ret;
-
-	mutex_lock(&gvt->sched_lock);
-	gvt->scheduler.sched_ops = &tbs_schedule_ops;
 	ret = gvt->scheduler.sched_ops->init(gvt);
 	mutex_unlock(&gvt->sched_lock);
 
@@ -423,13 +86,9 @@ void intel_vgpu_clean_sched_policy(struct intel_vgpu *vgpu)
 
 void intel_vgpu_start_schedule(struct intel_vgpu *vgpu)
 {
-	struct vgpu_sched_data *vgpu_data = vgpu->sched_data;
-
 	mutex_lock(&vgpu->gvt->sched_lock);
-	if (!vgpu_data->active) {
-		gvt_dbg_core("vgpu%d: start schedule\n", vgpu->id);
-		vgpu->gvt->scheduler.sched_ops->start_schedule(vgpu);
-	}
+	gvt_dbg_core("vgpu%d: start schedule\n", vgpu->id);
+	vgpu->gvt->scheduler.sched_ops->start_schedule(vgpu);
 	mutex_unlock(&vgpu->gvt->sched_lock);
 }
 
@@ -445,12 +104,8 @@ void intel_vgpu_stop_schedule(struct intel_vgpu *vgpu)
 	struct intel_gvt_workload_scheduler *scheduler =
 		&vgpu->gvt->scheduler;
 	int ring_id;
-	struct vgpu_sched_data *vgpu_data = vgpu->sched_data;
 	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
 
-	if (!vgpu_data->active)
-		return;
-
 	gvt_dbg_core("vgpu%d: stop schedule\n", vgpu->id);
 
 	mutex_lock(&vgpu->gvt->sched_lock);
diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.h b/drivers/gpu/drm/i915/gvt/sched_policy.h
index 3dacdad..a4953c2 100644
--- a/drivers/gpu/drm/i915/gvt/sched_policy.h
+++ b/drivers/gpu/drm/i915/gvt/sched_policy.h
@@ -44,6 +44,7 @@ struct intel_gvt_sched_policy_ops {
 	void (*clean_vgpu)(struct intel_vgpu *vgpu);
 	void (*start_schedule)(struct intel_vgpu *vgpu);
 	void (*stop_schedule)(struct intel_vgpu *vgpu);
+	void (*schedule)(struct intel_gvt *gvt);
 };
 
 void intel_gvt_schedule(struct intel_gvt *gvt);
diff --git a/drivers/gpu/drm/i915/gvt/sched_policy_weight.c b/drivers/gpu/drm/i915/gvt/sched_policy_weight.c
new file mode 100644
index 0000000..8aa15f0
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/sched_policy_weight.c
@@ -0,0 +1,351 @@
+/*
+ * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ * Authors:
+ *    Anhua Xu
+ *    Kevin Tian <kevin.tian@intel.com>
+ *
+ * Contributors:
+ *    Min He <min.he@intel.com>
+ *    Bing Niu <bing.niu@intel.com>
+ *    Zhi Wang <zhi.a.wang@intel.com>
+ *
+ */
+
+#include "i915_drv.h"
+#include "gvt.h"
+
+static bool vgpu_has_pending_workload(struct intel_vgpu *vgpu)
+{
+	enum intel_engine_id i;
+	struct intel_engine_cs *engine;
+
+	for_each_engine(engine, vgpu->gvt->dev_priv, i) {
+		if (!list_empty(workload_q_head(vgpu, i)))
+			return true;
+	}
+
+	return false;
+}
+
+static void vgpu_update_timeslice(struct intel_vgpu *vgpu, ktime_t cur_time)
+{
+	ktime_t delta_ts;
+	struct vgpu_tbs_sched_data *vgpu_data;
+
+	if (!vgpu || vgpu == vgpu->gvt->idle_vgpu)
+		return;
+
+	vgpu_data = vgpu->sched_data;
+	delta_ts = ktime_sub(cur_time, vgpu_data->sched_in_time);
+	vgpu_data->sched_time = ktime_add(vgpu_data->sched_time, delta_ts);
+	vgpu_data->left_ts = ktime_sub(vgpu_data->left_ts, delta_ts);
+	vgpu_data->sched_in_time = cur_time;
+}
+
+static void gvt_balance_timeslice(struct gvt_tbs_sched_data *sched_data)
+{
+	struct vgpu_tbs_sched_data *vgpu_data;
+	struct list_head *pos;
+	static u64 stage_check;
+	int stage = stage_check++ % GVT_TS_BALANCE_STAGE_NUM;
+
+	/* The timeslice accumulation reset at stage 0, which is
+	 * allocated again without adding previous debt.
+	 */
+	if (stage == 0) {
+		int total_weight = 0;
+		ktime_t fair_timeslice;
+
+		list_for_each(pos, &sched_data->lru_runq_head) {
+			vgpu_data = container_of(pos, struct vgpu_tbs_sched_data, lru_list);
+			total_weight += vgpu_data->weight;
+		}
+
+		list_for_each(pos, &sched_data->lru_runq_head) {
+			vgpu_data = container_of(pos, struct vgpu_tbs_sched_data, lru_list);
+			fair_timeslice = ktime_divns(ms_to_ktime(GVT_TS_BALANCE_PERIOD_MS),
+						     total_weight) * vgpu_data->weight;
+
+			vgpu_data->allocated_ts = fair_timeslice;
+			vgpu_data->left_ts = vgpu_data->allocated_ts;
+		}
+	} else {
+		list_for_each(pos, &sched_data->lru_runq_head) {
+			vgpu_data = container_of(pos, struct vgpu_tbs_sched_data, lru_list);
+
+			/* timeslice for next 100ms should add the left/debt
+			 * slice of previous stages.
+			 */
+			vgpu_data->left_ts += vgpu_data->allocated_ts;
+		}
+	}
+}
+
+static void try_to_schedule_next_vgpu(struct intel_gvt *gvt)
+{
+	struct intel_gvt_workload_scheduler *scheduler = &gvt->scheduler;
+	enum intel_engine_id i;
+	struct intel_engine_cs *engine;
+	struct vgpu_tbs_sched_data *vgpu_data;
+	ktime_t cur_time;
+
+	/* no need to schedule if next_vgpu is the same with current_vgpu,
+	 * let scheduler chose next_vgpu again by setting it to NULL.
+	 */
+	if (scheduler->next_vgpu == scheduler->current_vgpu) {
+		scheduler->next_vgpu = NULL;
+		return;
+	}
+
+	/*
+	 * after the flag is set, workload dispatch thread will
+	 * stop dispatching workload for current vgpu
+	 */
+	scheduler->need_reschedule = true;
+
+	/* still have uncompleted workload? */
+	for_each_engine(engine, gvt->dev_priv, i) {
+		if (scheduler->current_workload[i])
+			return;
+	}
+
+	cur_time = ktime_get();
+	vgpu_update_timeslice(scheduler->current_vgpu, cur_time);
+	vgpu_data = scheduler->next_vgpu->sched_data;
+	vgpu_data->sched_in_time = cur_time;
+
+	/* switch current vgpu */
+	scheduler->current_vgpu = scheduler->next_vgpu;
+	scheduler->next_vgpu = NULL;
+
+	scheduler->need_reschedule = false;
+
+	/* wake up workload dispatch thread */
+	for_each_engine(engine, gvt->dev_priv, i)
+		wake_up(&scheduler->waitq[i]);
+}
+
+static struct intel_vgpu *find_busy_vgpu(struct gvt_tbs_sched_data *sched_data)
+{
+	struct vgpu_tbs_sched_data *vgpu_data;
+	struct intel_vgpu *vgpu = NULL;
+	struct list_head *head = &sched_data->lru_runq_head;
+	struct list_head *pos;
+
+	/* search a vgpu with pending workload */
+	list_for_each(pos, head) {
+
+		vgpu_data = container_of(pos, struct vgpu_tbs_sched_data, lru_list);
+		if (!vgpu_has_pending_workload(vgpu_data->vgpu))
+			continue;
+
+		if (vgpu_data->pri_sched) {
+			if (ktime_before(ktime_get(), vgpu_data->pri_time)) {
+				vgpu = vgpu_data->vgpu;
+				break;
+			} else
+				vgpu_data->pri_sched = false;
+		}
+
+		/* Return the vGPU only if it has time slice left */
+		if (vgpu_data->left_ts > 0) {
+			vgpu = vgpu_data->vgpu;
+			break;
+		}
+	}
+
+	return vgpu;
+}
+
+static void tbs_sched_func(struct gvt_tbs_sched_data *sched_data)
+{
+	struct intel_gvt *gvt = sched_data->gvt;
+	struct intel_gvt_workload_scheduler *scheduler = &gvt->scheduler;
+	struct vgpu_tbs_sched_data *vgpu_data;
+	struct intel_vgpu *vgpu = NULL;
+
+	/* no active vgpu or has already had a target */
+	if (list_empty(&sched_data->lru_runq_head) || scheduler->next_vgpu)
+		goto out;
+
+	vgpu = find_busy_vgpu(sched_data);
+	if (vgpu) {
+		scheduler->next_vgpu = vgpu;
+		vgpu_data = vgpu->sched_data;
+		if (!vgpu_data->pri_sched) {
+			/* Move the last used vGPU to the tail of lru_list */
+			list_del_init(&vgpu_data->lru_list);
+			list_add_tail(&vgpu_data->lru_list,
+				      &sched_data->lru_runq_head);
+		}
+	} else {
+		scheduler->next_vgpu = gvt->idle_vgpu;
+	}
+out:
+	if (scheduler->next_vgpu)
+		try_to_schedule_next_vgpu(gvt);
+}
+
+static void tbs_sched_do_schedule(struct intel_gvt *gvt)
+{
+	struct gvt_tbs_sched_data *sched_data = gvt->scheduler.sched_data;
+	ktime_t cur_time;
+
+	mutex_lock(&gvt->sched_lock);
+	cur_time = ktime_get();
+
+	if (test_and_clear_bit(INTEL_GVT_REQUEST_SCHED,
+				(void *)&gvt->service_request)) {
+		if (cur_time >= sched_data->expire_time) {
+			gvt_balance_timeslice(sched_data);
+			sched_data->expire_time = ktime_add_ms(
+				cur_time, GVT_TS_BALANCE_PERIOD_MS);
+		}
+	}
+	clear_bit(INTEL_GVT_REQUEST_EVENT_SCHED, (void *)&gvt->service_request);
+
+	vgpu_update_timeslice(gvt->scheduler.current_vgpu, cur_time);
+	tbs_sched_func(sched_data);
+
+	mutex_unlock(&gvt->sched_lock);
+}
+
+static enum hrtimer_restart tbs_timer_fn(struct hrtimer *timer_data)
+{
+	struct gvt_tbs_sched_data *data;
+
+	data = container_of(timer_data, struct gvt_tbs_sched_data, timer);
+
+	intel_gvt_request_service(data->gvt, INTEL_GVT_REQUEST_SCHED);
+
+	hrtimer_add_expires_ns(&data->timer, data->period);
+
+	return HRTIMER_RESTART;
+}
+
+static int tbs_sched_init(struct intel_gvt *gvt)
+{
+	struct intel_gvt_workload_scheduler *scheduler =
+		&gvt->scheduler;
+
+	struct gvt_tbs_sched_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&data->lru_runq_head);
+	hrtimer_init(&data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
+	data->timer.function = tbs_timer_fn;
+	data->period = GVT_DEFAULT_TIME_SLICE;
+	data->gvt = gvt;
+
+	scheduler->sched_data = data;
+
+	return 0;
+}
+
+static void tbs_sched_clean(struct intel_gvt *gvt)
+{
+	struct intel_gvt_workload_scheduler *scheduler =
+		&gvt->scheduler;
+	struct gvt_tbs_sched_data *data = scheduler->sched_data;
+
+	hrtimer_cancel(&data->timer);
+
+	kfree(data);
+	scheduler->sched_data = NULL;
+}
+
+static int tbs_sched_init_vgpu(struct intel_vgpu *vgpu)
+{
+	struct vgpu_tbs_sched_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->weight = vgpu->sched_ctl.value;
+	data->vgpu = vgpu;
+	INIT_LIST_HEAD(&data->lru_list);
+
+	vgpu->sched_data = data;
+
+	return 0;
+}
+
+static void tbs_sched_clean_vgpu(struct intel_vgpu *vgpu)
+{
+	struct intel_gvt *gvt = vgpu->gvt;
+	struct gvt_tbs_sched_data *sched_data = gvt->scheduler.sched_data;
+
+	kfree(vgpu->sched_data);
+	vgpu->sched_data = NULL;
+
+	/* this vgpu id has been removed */
+	if (idr_is_empty(&gvt->vgpu_idr))
+		hrtimer_cancel(&sched_data->timer);
+}
+
+static void tbs_sched_start_schedule(struct intel_vgpu *vgpu)
+{
+	struct gvt_tbs_sched_data *sched_data = vgpu->gvt->scheduler.sched_data;
+	struct vgpu_tbs_sched_data *vgpu_data = vgpu->sched_data;
+	ktime_t now;
+
+	if (!list_empty(&vgpu_data->lru_list) || vgpu_data->active)
+		return;
+
+	now = ktime_get();
+	vgpu_data->pri_time = ktime_add(now,
+					ktime_set(GVT_SCHED_VGPU_PRI_TIME, 0));
+	vgpu_data->pri_sched = true;
+
+	list_add(&vgpu_data->lru_list, &sched_data->lru_runq_head);
+
+	if (!hrtimer_active(&sched_data->timer))
+		hrtimer_start(&sched_data->timer, ktime_add_ns(ktime_get(),
+			sched_data->period), HRTIMER_MODE_ABS);
+	vgpu_data->active = true;
+}
+
+static void tbs_sched_stop_schedule(struct intel_vgpu *vgpu)
+{
+	struct vgpu_tbs_sched_data *vgpu_data = vgpu->sched_data;
+
+	if (!vgpu_data->active)
+		return;
+
+	list_del_init(&vgpu_data->lru_list);
+	vgpu_data->active = false;
+}
+
+struct intel_gvt_sched_policy_ops tbs_schedule_ops = {
+	.init = tbs_sched_init,
+	.clean = tbs_sched_clean,
+	.init_vgpu = tbs_sched_init_vgpu,
+	.clean_vgpu = tbs_sched_clean_vgpu,
+	.start_schedule = tbs_sched_start_schedule,
+	.stop_schedule = tbs_sched_stop_schedule,
+	.schedule = tbs_sched_do_schedule,
+};
diff --git a/drivers/gpu/drm/i915/gvt/sched_policy_weight.h b/drivers/gpu/drm/i915/gvt/sched_policy_weight.h
new file mode 100644
index 0000000..b32a71f
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/sched_policy_weight.h
@@ -0,0 +1,32 @@
+/* We give 2 seconds higher prio for vGPU during start */
+#define GVT_SCHED_VGPU_PRI_TIME  2
+
+#define GVT_TS_BALANCE_PERIOD_MS 100
+#define GVT_TS_BALANCE_STAGE_NUM 10
+
+/* in nanosecond */
+#define GVT_DEFAULT_TIME_SLICE 1000000
+
+struct vgpu_tbs_sched_data {
+	struct list_head lru_list;
+	struct intel_vgpu *vgpu;
+	bool active;
+	bool pri_sched;
+	ktime_t pri_time;
+	ktime_t sched_in_time;
+	ktime_t sched_time;
+	ktime_t left_ts;
+	ktime_t allocated_ts;
+
+	int weight;
+};
+
+struct gvt_tbs_sched_data {
+	struct intel_gvt *gvt;
+	struct hrtimer timer;
+	unsigned long period;
+	struct list_head lru_runq_head;
+	ktime_t expire_time;
+};
+
+extern struct intel_gvt_sched_policy_ops tbs_schedule_ops;
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 85bd9bf..b1b2deb 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -378,7 +378,9 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	vgpu->id = ret;
 	vgpu->handle = param->handle;
 	vgpu->gvt = gvt;
-	vgpu->sched_ctl.weight = param->weight;
+	if (!strcmp(i915_modparams.gvt_scheduler_policy, "weight")) {
+		vgpu->sched_ctl.value = param->weight;
+	}
 	mutex_init(&vgpu->vgpu_lock);
 	mutex_init(&vgpu->dmabuf_lock);
 	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 1dd1f36..bb90bf8 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -177,6 +177,8 @@ i915_param_named(enable_dpcd_backlight, int, 0600,
 #if IS_ENABLED(CONFIG_DRM_I915_GVT)
 i915_param_named(enable_gvt, bool, 0400,
 	"Enable support for Intel GVT-g graphics virtualization host support(default:false)");
+i915_param_named(gvt_scheduler_policy, charp, 0400,
+	"Select GVT-g scheduler policy, weight (default: weight)");
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 31b88f2..8c63c49 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -78,7 +78,8 @@ struct drm_printer;
 	param(bool, verbose_state_checks, true) \
 	param(bool, nuclear_pageflip, false) \
 	param(bool, enable_dp_mst, true) \
-	param(bool, enable_gvt, false)
+	param(bool, enable_gvt, false) \
+	param(char *, gvt_scheduler_policy, "weight")
 
 #define MEMBER(T, member, ...) T member;
 struct i915_params {
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
