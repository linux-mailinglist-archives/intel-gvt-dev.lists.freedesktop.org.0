Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC2260557
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Sep 2020 22:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C54D6E546;
	Mon,  7 Sep 2020 20:02:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4256E4D0;
 Mon,  7 Sep 2020 20:02:07 +0000 (UTC)
IronPort-SDR: XoSUi6XZmgJZs83ijNpiIk8TBOLZ/dvKDcbQK4cbKC0Uw6WSsIrDG/EOrPxIQEeZAvfeLbonRR
 YdtXs4RAYWPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="242853609"
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; d="scan'208";a="242853609"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 13:02:06 -0700
IronPort-SDR: 8gk++lwj0IICjXsSa8g0KvKUMtQvqLyfLfh4R2ROXSfSIWWWTTYEwJO7AZDEpCN56gOQ5nMGS8
 NnkYuyEl/dgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; d="scan'208";a="504805395"
Received: from zhiwang1-mobl5.ger.corp.intel.com ([10.252.3.9])
 by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2020 13:02:05 -0700
From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Introduce per object locking in GVT scheduler.
Date: Mon,  7 Sep 2020 23:02:03 +0300
Message-Id: <20200907200203.535-1-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

To support ww locking and per-object implemented in i915, GVT scheduler needs
to be refined. Most of the changes are located in shadow batch buffer, shadow
wa context in GVT-g, where use quite a lot of i915 gem object APIs.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 68 ++++++++++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 1570eb8..fe7ee10 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -396,7 +396,9 @@ static void release_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 	if (!wa_ctx->indirect_ctx.obj)
 		return;
 
+	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, NULL);
 	i915_gem_object_unpin_map(wa_ctx->indirect_ctx.obj);
+	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
 	i915_gem_object_put(wa_ctx->indirect_ctx.obj);
 
 	wa_ctx->indirect_ctx.obj = NULL;
@@ -504,6 +506,7 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 	struct intel_gvt *gvt = workload->vgpu->gvt;
 	const int gmadr_bytes = gvt->device_info.gmadr_bytes_in_cmd;
 	struct intel_vgpu_shadow_bb *bb;
+	struct i915_gem_ww_ctx ww;
 	int ret;
 
 	list_for_each_entry(bb, &workload->shadow_bb, list) {
@@ -528,10 +531,19 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 		 * directly
 		 */
 		if (!bb->ppgtt) {
-			bb->vma = i915_gem_object_ggtt_pin(bb->obj,
-							   NULL, 0, 0, 0);
+			i915_gem_ww_ctx_init(&ww, false);
+retry:
+			i915_gem_object_lock(bb->obj, &ww);
+
+			bb->vma = i915_gem_object_ggtt_pin_ww(bb->obj, &ww,
+							      NULL, 0, 0, 0);
 			if (IS_ERR(bb->vma)) {
 				ret = PTR_ERR(bb->vma);
+				if (ret == -EDEADLK) {
+					ret = i915_gem_ww_ctx_backoff(&ww);
+					if (!ret)
+						goto retry;
+				}
 				goto err;
 			}
 
@@ -545,13 +557,18 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 						      0);
 			if (ret)
 				goto err;
+
+			/* No one is going to touch shadow bb from now on. */
+			i915_gem_object_flush_map(bb->obj);
+
+			i915_gem_object_unlock(bb->obj);
+			i915_gem_ww_ctx_fini(&ww);
 		}
 
-		/* No one is going to touch shadow bb from now on. */
-		i915_gem_object_flush_map(bb->obj);
 	}
 	return 0;
 err:
+	i915_gem_ww_ctx_fini(&ww);
 	release_shadow_batch_buffer(workload);
 	return ret;
 }
@@ -578,14 +595,30 @@ static int prepare_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 	unsigned char *per_ctx_va =
 		(unsigned char *)wa_ctx->indirect_ctx.shadow_va +
 		wa_ctx->indirect_ctx.size;
+	struct i915_gem_ww_ctx ww;
+	int ret;
 
 	if (wa_ctx->indirect_ctx.size == 0)
 		return 0;
 
-	vma = i915_gem_object_ggtt_pin(wa_ctx->indirect_ctx.obj, NULL,
-				       0, CACHELINE_BYTES, 0);
-	if (IS_ERR(vma))
-		return PTR_ERR(vma);
+	i915_gem_ww_ctx_init(&ww, false);
+retry:
+	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, &ww);
+
+	vma = i915_gem_object_ggtt_pin_ww(wa_ctx->indirect_ctx.obj, &ww, NULL,
+					  0, CACHELINE_BYTES, 0);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		if (ret == -EDEADLK) {
+			ret = i915_gem_ww_ctx_backoff(&ww);
+			if (!ret)
+				goto retry;
+		}
+		return ret;
+	}
+
+	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
+	i915_gem_ww_ctx_fini(&ww);
 
 	/* FIXME: we are not tracking our pinned VMA leaving it
 	 * up to the core to fix up the stray pin_count upon
@@ -619,12 +652,14 @@ static void release_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 
 	list_for_each_entry_safe(bb, pos, &workload->shadow_bb, list) {
 		if (bb->obj) {
+			i915_gem_object_lock(bb->obj, NULL);
 			if (bb->va && !IS_ERR(bb->va))
 				i915_gem_object_unpin_map(bb->obj);
 
 			if (bb->vma && !IS_ERR(bb->vma))
 				i915_vma_unpin(bb->vma);
 
+			i915_gem_object_unlock(bb->obj);
 			i915_gem_object_put(bb->obj);
 		}
 		list_del(&bb->list);
@@ -1337,6 +1372,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	struct intel_engine_cs *engine;
 	struct i915_ppgtt *ppgtt;
+	struct i915_gem_ww_ctx ww;
 	enum intel_engine_id i;
 	int ret;
 
@@ -1368,11 +1404,20 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 
 			ce->ring = __intel_context_ring_size(ring_size);
 		}
+		i915_gem_ww_ctx_init(&ww, false);
+retry:
+		ret = intel_context_pin_ww(ce, &ww);
+		if (ret) {
+			if (ret == -EDEADLK) {
+				ret = i915_gem_ww_ctx_backoff(&ww);
+				if (!ret)
+					goto retry;
+			}
+			goto out_shadow_ctx;
+		}
 
-		ret = intel_context_pin(ce);
 		intel_context_put(ce);
-		if (ret)
-			goto out_shadow_ctx;
+		i915_gem_ww_ctx_fini(&ww);
 
 		s->shadow[i] = ce;
 	}
@@ -1400,6 +1445,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 	return 0;
 
 out_shadow_ctx:
+	i915_gem_ww_ctx_fini(&ww);
 	i915_context_ppgtt_root_restore(s, ppgtt);
 	for_each_engine(engine, vgpu->gvt->gt, i) {
 		if (IS_ERR(s->shadow[i]))
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
