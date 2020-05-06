Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7781C6DD9
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 May 2020 11:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A096E21F;
	Wed,  6 May 2020 09:59:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ECC6E21F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 May 2020 09:59:51 +0000 (UTC)
IronPort-SDR: eXL53Uy19ghHTg1v+d92LV1SkvbboO9bVR9xqnJbVZTL88GKLlxp7owrrEj6y9FJu0/U/TRDCS
 RHhdIqYL5t1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 02:59:50 -0700
IronPort-SDR: igGXPmlJ9t+skoNbTPhZvQN58chxxbdSa1bk3kqMzIq4Lw70nWE/QQbIC8TAz5KaNqBlE6da7p
 +b3oKJrucGIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="461377432"
Received: from xiaobo4x-mobl1.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.254.214.128])
 by fmsmga005.fm.intel.com with ESMTP; 06 May 2020 02:59:49 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: use context lrc_reg_state for shadow ppgtt
 override
Date: Wed,  6 May 2020 17:59:48 +0800
Message-Id: <20200506095948.124979-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

We can replace kmap by using context's lrc_reg_state directly
for shadow ppgtt table override.

Cc: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 6ab1d95c1fae..52a1ff3b4ac7 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -58,10 +58,8 @@ static void set_context_pdp_root_pointer(
 
 static void update_shadow_pdps(struct intel_vgpu_workload *workload)
 {
-	struct drm_i915_gem_object *ctx_obj =
-		workload->req->context->state->obj;
 	struct execlist_ring_context *shadow_ring_context;
-	struct page *page;
+	struct intel_context *ctx = workload->req->context;
 
 	if (WARN_ON(!workload->shadow_mm))
 		return;
@@ -69,11 +67,9 @@ static void update_shadow_pdps(struct intel_vgpu_workload *workload)
 	if (WARN_ON(!atomic_read(&workload->shadow_mm->pincount)))
 		return;
 
-	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
-	shadow_ring_context = kmap(page);
+	shadow_ring_context = (struct execlist_ring_context *)ctx->lrc_reg_state;
 	set_context_pdp_root_pointer(shadow_ring_context,
 			(void *)workload->shadow_mm->ppgtt_mm.shadow_pdps);
-	kunmap(page);
 }
 
 /*
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
