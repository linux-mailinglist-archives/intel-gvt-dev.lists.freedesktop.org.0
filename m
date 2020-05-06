Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37771C6DD8
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 May 2020 11:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5F86E21F;
	Wed,  6 May 2020 09:59:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A376E21F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 May 2020 09:59:21 +0000 (UTC)
IronPort-SDR: DGMNF5Uhp+oKfh/iMQBrQtQlGHDrhigDwmSfbYVRJ/Fc5wt9jHzWGMJQ4iNhtcI3gO+v/O/vX7
 B4Z6rL1q6FlQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 02:59:20 -0700
IronPort-SDR: szhK6B4kSyCjvNp0Iue72QEkDw7BwUZSeRhxIRNJGTh4D+uuzuguCRC+I+cbtHrqg7VkaoCqV3
 EW+54gXprXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="248860734"
Received: from xiaobo4x-mobl1.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.254.214.128])
 by orsmga007.jf.intel.com with ESMTP; 06 May 2020 02:59:19 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
Date: Wed,  6 May 2020 17:59:18 +0800
Message-Id: <20200506095918.124913-1-zhenyuw@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

As i915 won't allocate extra PDP for current default PML4 table,
so for 3-level ppgtt guest, we would hit kernel pointer access
failure on extra PDP pointers. So this trys to bypass that now.
It won't impact real shadow PPGTT setup, so guest context still
works.

This is verified on 4.15 guest kernel with i915.enable_ppgtt=1
to force on old aliasing ppgtt behavior.

Fixes: 4f15665ccbba ("drm/i915: Add ppgtt to GVT GEM context")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 9c3558489d17..6ab1d95c1fae 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -420,7 +420,11 @@ static void set_context_ppgtt_from_shadow(struct intel_vgpu_workload *workload,
 		for (i = 0; i < GVT_RING_CTX_NR_PDPS; i++) {
 			struct i915_page_directory * const pd =
 				i915_pd_entry(ppgtt->pd, i);
-
+			/* skip now as current i915 ppgtt alloc won't allocate
+			   top level pdp for non 4-level table, won't impact
+			   shadow ppgtt. */
+			if (!pd)
+				break;
 			px_dma(pd) = mm->ppgtt_mm.shadow_pdps[i];
 		}
 	}
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
