Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B81E9BF5
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Jun 2020 05:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2610189E7B;
	Mon,  1 Jun 2020 03:07:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC99289E7B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Jun 2020 03:07:26 +0000 (UTC)
IronPort-SDR: pQwGf4mE0tsB1zlL7NnuznallJ5ADEs2xw7P0U+p27JAqIKRJRFBj5KxGm9yg6EbGRKytC2+nB
 Dn6R+bZ3Cfyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 20:07:26 -0700
IronPort-SDR: tzktW7y0pSC9WK0PBh05HEAvsEVbEGjH/hWBq6nGt5rh13gTdTspPiWDolwHb6Dklx8T6039h0
 rRx82/cOlL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="415654760"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.113])
 by orsmga004.jf.intel.com with ESMTP; 31 May 2020 20:07:25 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2] drm/i915/gvt: Fix incorrect check of enabled bits in mask
 registers
Date: Mon,  1 Jun 2020 11:07:21 +0800
Message-Id: <20200601030721.17129-1-colin.xu@intel.com>
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

V2: Rebase.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c     | 19 ++++++++++---------
 drivers/gpu/drm/i915/gvt/mmio_context.h |  6 +++---
 drivers/gpu/drm/i915/gvt/reg.h          |  5 +++++
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index f39a6b20bbaf..fadd2adb8030 100644
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
