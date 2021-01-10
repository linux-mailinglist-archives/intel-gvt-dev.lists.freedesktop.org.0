Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF102F09EC
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 10 Jan 2021 22:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EAA89C53;
	Sun, 10 Jan 2021 21:43:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD1C89C53
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 10 Jan 2021 21:43:14 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h205so35067230lfd.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 10 Jan 2021 13:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=y9Umm8Sw0zpmCzPd22KLYyxaGidgo9mgdk7HmbOHt24=;
 b=hMk7baP3I3KiP+Pm6P5QQofvrFOruZf6o9Ri0r+HErQgZqkfsSRj00SAlz8u8uVLuv
 S4mI7sHaJsbNHopduIaHvZhbSUN58442G9quJ0MZgWgNZpZ6+6UgzMEZ/uIn5S+ry8sh
 LsOST6LQI05YpqcizGEiTFvQsXxOZgj127L//tzBOQgdfZ+D6x9AGSGUj84UHQ5onA7g
 Q5YOYKhpj7go5Ts26xjhE/b7Za5DxcNlTY7EaJVMOMTwnWk/8IfoWmwZ9ccQDHUhLM4b
 52myX0lg0aZGxlgPEsPRHcoHWrwMbJjhvYBfnb1JE4ucLAvCArl/ZUFigWu8DPfD+IXm
 CF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y9Umm8Sw0zpmCzPd22KLYyxaGidgo9mgdk7HmbOHt24=;
 b=X74AnUOAtSBMK/SOEX0BzuWgcjK5I+guRZZ0rbAzwXqHkIJgHv3uMK5uLR69uKEC1L
 WqTXo4bEPIiuCS7A8Oey312wyGqK0bUAC3Cu2ueBu6MX5Pc8zy390pNgdvDFl1DVISps
 yJ9rOQ8cAndZkn0YaH0EkP4+l2gkrwp9mx3p3Iko0MDFuUfnxNDHphLAkOJXQheWs3gC
 MIaYnnR87lZhXgiNqTPGTMxBahiPis3gBkd1lStuHwpZY54eRfSibhGQfh8bCRCHjEt4
 SVWbgDOwVMyDmgeEIWMr5TDFCVbds4oCk8vxGB9BEikq2islMfpPfyPzSKhvXRnIkmpc
 IB+A==
X-Gm-Message-State: AOAM530Zodm31X1iDy7aDesGdpZHHRfssvTx8RKC1Xjn+UtEXIpMXxFv
 Q+fN2pB4JUkls5LG+kqGdyF3Vm6m0SM=
X-Google-Smtp-Source: ABdhPJy8GbiuOFbIdA/7yo3CdqbZp9xYbdCZUYfXj5hwhNC+qtb00UEghS71au4vUNyIgLEXScDF7w==
X-Received: by 2002:a19:48c3:: with SMTP id v186mr5478047lfa.3.1610314992545; 
 Sun, 10 Jan 2021 13:43:12 -0800 (PST)
Received: from inno-pc.lan (88-115-160-253.elisa-laajakaista.fi.
 [88.115.160.253])
 by smtp.gmail.com with ESMTPSA id m11sm3174162ljp.12.2021.01.10.13.43.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Jan 2021 13:43:12 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Introduce per object locking in GVT scheduler.
Date: Sun, 10 Jan 2021 23:43:05 +0200
Message-Id: <1610314985-26065-1-git-send-email-zhi.wang.linux@gmail.com>
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
Cc: Zhi Wang <zhi.a.wang@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

To support ww locking and per-object implemented in i915, GVT scheduler needs
to be refined. Most of the changes are located in shadow batch buffer, shadow
wa context in GVT-g, where use quite a lot of i915 gem object APIs.

v2:

- Adjust the usage of ww lock on context pin/unpin. (maarten)
- Rebase the patch on the newest staging branch.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 49 +++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 43f31c2..4dfa418 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -412,7 +412,9 @@ static void release_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 	if (!wa_ctx->indirect_ctx.obj)
 		return;
 
+	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, NULL);
 	i915_gem_object_unpin_map(wa_ctx->indirect_ctx.obj);
+	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
 	i915_gem_object_put(wa_ctx->indirect_ctx.obj);
 
 	wa_ctx->indirect_ctx.obj = NULL;
@@ -520,6 +522,7 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 	struct intel_gvt *gvt = workload->vgpu->gvt;
 	const int gmadr_bytes = gvt->device_info.gmadr_bytes_in_cmd;
 	struct intel_vgpu_shadow_bb *bb;
+	struct i915_gem_ww_ctx ww;
 	int ret;
 
 	list_for_each_entry(bb, &workload->shadow_bb, list) {
@@ -544,10 +547,19 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
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
 
@@ -561,13 +573,15 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 						      0);
 			if (ret)
 				goto err;
-		}
 
-		/* No one is going to touch shadow bb from now on. */
-		i915_gem_object_flush_map(bb->obj);
+			/* No one is going to touch shadow bb from now on. */
+			i915_gem_object_flush_map(bb->obj);
+			i915_gem_object_unlock(bb->obj);
+		}
 	}
 	return 0;
 err:
+	i915_gem_ww_ctx_fini(&ww);
 	release_shadow_batch_buffer(workload);
 	return ret;
 }
@@ -594,14 +608,29 @@ static int prepare_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
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
 
 	/* FIXME: we are not tracking our pinned VMA leaving it
 	 * up to the core to fix up the stray pin_count upon
@@ -635,12 +664,14 @@ static void release_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 
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
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
