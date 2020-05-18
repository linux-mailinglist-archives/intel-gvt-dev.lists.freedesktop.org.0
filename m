Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3381D707F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 07:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722256E1A4;
	Mon, 18 May 2020 05:49:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6908B6E1A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 05:49:43 +0000 (UTC)
IronPort-SDR: VQRu8C/hIu5fdBUX4B4GHkyqUxjb8sVgylrxGga9quKPm0T3cKvErWFyqw4uENAe5psYsd/VSk
 CKR+6kRU4Itw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 22:49:43 -0700
IronPort-SDR: +KaAgTKVvInaDhSw50tTm5ofbVNnapbSrutSEUmQkJxeb8Q+zIj20NZrFd/mKLSnOw+X0OObhy
 rg0q8/9t82hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="281867773"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.118])
 by orsmga002.jf.intel.com with ESMTP; 17 May 2020 22:49:41 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix incorrect check of enabled bits in mask
 registers
Date: Mon, 18 May 2020 13:49:38 +0800
Message-Id: <20200518054938.136336-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Using _MASKED_BIT_ENABLE macro to set mask register bits is straight
forward and not likely to go wrong. However when checking which bit(s)
is(are) enabled, simply bitwise AND value and _MASKED_BIT_ENABLE() won't
output expected result. Suppose the register write is disabling bit 1
by setting 0xFFFF0000, however "& _MASKED_BIT_ENABLE(1)" outputs
0x00010000, and the non-zero check will pass which cause the old code
consider the new value set as an enabling operation.

We found guest set 0x80008000 on boot, and set 0xffff8000 during resume.
Both are legal settings but old code will block latter and force vgpu
enter fail-safe mode.

Introduce two new macro and make proper masked bit check in mmio handler:
IS_MASKED_BITS_ENABLED()
IS_MASKED_BITS_DISABLED()

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c     | 19 ++++++++++---------
 drivers/gpu/drm/i915/gvt/mmio_context.h |  6 +++---
 drivers/gpu/drm/i915/gvt/reg.h          |  5 +++++
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 3e88e3b5c43a..cf3354f24607 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1726,13 +1726,13 @@ static int ring_mode_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		(*(u32 *)p_data) &= ~_MASKED_BIT_ENABLE(2);
 	write_vreg(vgpu, offset, p_data, bytes);
 
-	if (data & _MASKED_BIT_ENABLE(1)) {
+	if (IS_MASKED_BITS_ENABLED(data, 1)) {
 		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
 		return 0;
 	}
 
 	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) &&
-	    data & _MASKED_BIT_ENABLE(2)) {
+	    IS_MASKED_BITS_ENABLED(data, 2)) {
 		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
 		return 0;
 	}
@@ -1741,14 +1741,14 @@ static int ring_mode_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	 * pvinfo, if not, we will treat this guest as non-gvtg-aware
 	 * guest, and stop emulating its cfg space, mmio, gtt, etc.
 	 */
-	if (((data & _MASKED_BIT_ENABLE(GFX_PPGTT_ENABLE)) ||
-			(data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE)))
-			&& !vgpu->pv_notified) {
+	if ((IS_MASKED_BITS_ENABLED(data, GFX_PPGTT_ENABLE) ||
+	    IS_MASKED_BITS_ENABLED(data, GFX_RUN_LIST_ENABLE)) &&
+	    !vgpu->pv_notified) {
 		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
 		return 0;
 	}
-	if ((data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE))
-			|| (data & _MASKED_BIT_DISABLE(GFX_RUN_LIST_ENABLE))) {
+	if (IS_MASKED_BITS_ENABLED(data, GFX_RUN_LIST_ENABLE) ||
+	    IS_MASKED_BITS_DISABLED(data, GFX_RUN_LIST_ENABLE)) {
 		enable_execlist = !!(data & GFX_RUN_LIST_ENABLE);
 
 		gvt_dbg_core("EXECLIST %s on ring %s\n",
@@ -1809,7 +1809,7 @@ static int ring_reset_ctl_write(struct intel_vgpu *vgpu,
 	write_vreg(vgpu, offset, p_data, bytes);
 	data = vgpu_vreg(vgpu, offset);
 
-	if (data & _MASKED_BIT_ENABLE(RESET_CTL_REQUEST_RESET))
+	if (IS_MASKED_BITS_ENABLED(data, RESET_CTL_REQUEST_RESET))
 		data |= RESET_CTL_READY_TO_RESET;
 	else if (data & _MASKED_BIT_DISABLE(RESET_CTL_REQUEST_RESET))
 		data &= ~RESET_CTL_READY_TO_RESET;
@@ -1827,7 +1827,8 @@ static int csfe_chicken1_mmio_write(struct intel_vgpu *vgpu,
 	(*(u32 *)p_data) &= ~_MASKED_BIT_ENABLE(0x18);
 	write_vreg(vgpu, offset, p_data, bytes);
 
-	if (data & _MASKED_BIT_ENABLE(0x10) || data & _MASKED_BIT_ENABLE(0x8))
+	if (IS_MASKED_BITS_ENABLED(data, 0x10) ||
+	    IS_MASKED_BITS_ENABLED(data, 0x8))
 		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.h b/drivers/gpu/drm/i915/gvt/mmio_context.h
index 970704b18f23..3b25e7fe32f6 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.h
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.h
@@ -54,8 +54,8 @@ bool is_inhibit_context(struct intel_context *ce);
 
 int intel_vgpu_restore_inhibit_context(struct intel_vgpu *vgpu,
 				       struct i915_request *req);
-#define IS_RESTORE_INHIBIT(a)	\
-	(_MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) == \
-	((a) & _MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT)))
+
+#define IS_RESTORE_INHIBIT(a) \
+	IS_MASKED_BITS_ENABLED(a, CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT)
 
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/reg.h b/drivers/gpu/drm/i915/gvt/reg.h
index 5b66e14c5b7b..b88e033cbed4 100644
--- a/drivers/gpu/drm/i915/gvt/reg.h
+++ b/drivers/gpu/drm/i915/gvt/reg.h
@@ -94,6 +94,11 @@
 #define GFX_MODE_BIT_SET_IN_MASK(val, bit) \
 		((((bit) & 0xffff0000) == 0) && !!((val) & (((bit) << 16))))
 
+#define IS_MASKED_BITS_ENABLED(_val, _b) \
+		(((_val) & _MASKED_BIT_ENABLE(_b)) == _MASKED_BIT_ENABLE(_b))
+#define IS_MASKED_BITS_DISABLED(_val, _b) \
+		((_val) & _MASKED_BIT_DISABLE(_b))
+
 #define FORCEWAKE_RENDER_GEN9_REG 0xa278
 #define FORCEWAKE_ACK_RENDER_GEN9_REG 0x0D84
 #define FORCEWAKE_BLITTER_GEN9_REG 0xa188
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
