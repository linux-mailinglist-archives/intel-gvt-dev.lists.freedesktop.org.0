Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E9A2C9760
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 07:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079F56E4AD;
	Tue,  1 Dec 2020 06:03:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB6F6E483
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 06:03:33 +0000 (UTC)
IronPort-SDR: RTKxCWckOwzQ/BzMCjrpE6NFK5EuhoZ0Y8kAj71CaqGWOmJIn/b3dtr2muq4F15ZCeEqn6vxOc
 1eYimdSWrESQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169270519"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="169270519"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:03:32 -0800
IronPort-SDR: 7+pCjwz5C1JOd/s4zqJ+p47gk0SLHS02nZsIa/mcBDlMMCLmPILI8WO6mGTYPx/7KqzVHw2bUe
 25F5AYJ/+FMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="345345995"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.22])
 by orsmga002.jf.intel.com with ESMTP; 30 Nov 2020 22:03:31 -0800
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2] drm/i915/gvt: Fix vfio_edid issue for BXT/APL
Date: Tue,  1 Dec 2020 14:03:29 +0800
Message-Id: <20201201060329.142375-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.29.2
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

BXT/APL has different isr/irr/hpd regs compared with other GEN9. If not
setting these regs bits correctly according to the emulated monitor
(currently a DP on PORT_B), although gvt still triggers a virtual HPD
event, the guest driver won't detect a valid HPD pulse thus no full
display detection will be executed to read the updated EDID.

With this patch, the vfio_edid is enabled again on BXT/APL, which is
previously disabled:
Fixes: 642403e3599e (drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL)

V2:
Use Fixes tag.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 81 +++++++++++++++++++++---------
 drivers/gpu/drm/i915/gvt/vgpu.c    |  5 +-
 2 files changed, 59 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index a15f87539657..62a5b0dd2003 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -217,6 +217,15 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 				  DDI_BUF_CTL_ENABLE);
 			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) |= DDI_BUF_IS_IDLE;
 		}
+		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+			~(PORTA_HOTPLUG_ENABLE | PORTA_HOTPLUG_STATUS_MASK);
+		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+			~(PORTB_HOTPLUG_ENABLE | PORTB_HOTPLUG_STATUS_MASK);
+		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+			~(PORTC_HOTPLUG_ENABLE | PORTC_HOTPLUG_STATUS_MASK);
+		/* No hpd_invert set in vgpu vbt, need to clear invert mask */
+		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &= ~BXT_DDI_HPD_INVERT_MASK;
+		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &= ~BXT_DE_PORT_HOTPLUG_MASK;
 
 		vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &= ~(BIT(0) | BIT(1));
 		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) &=
@@ -273,6 +282,8 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=
 				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 				 TRANS_DDI_FUNC_ENABLE);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTA_HOTPLUG_ENABLE;
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
 		}
@@ -301,6 +312,8 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
 				 TRANS_DDI_FUNC_ENABLE);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTB_HOTPLUG_ENABLE;
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
 		}
@@ -329,6 +342,8 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
 				 TRANS_DDI_FUNC_ENABLE);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTC_HOTPLUG_ENABLE;
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
 		}
@@ -661,44 +676,62 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *vgpu, bool connected)
 				PORTD_HOTPLUG_STATUS_MASK;
 		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
 	} else if (IS_BROXTON(i915)) {
-		if (connected) {
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
+		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
+			if (connected) {
 				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 					GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
+			} else {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
 			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
-				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
-					SFUSE_STRAP_DDIB_DETECTED;
+			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
+				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+				~PORTA_HOTPLUG_STATUS_MASK;
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTA_HOTPLUG_LONG_DETECT;
+			intel_vgpu_trigger_virtual_event(vgpu, DP_A_HOTPLUG);
+		}
+		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+			if (connected) {
 				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 					GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
-			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
 				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
-					SFUSE_STRAP_DDIC_DETECTED;
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
-					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
-			}
-		} else {
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
+					SFUSE_STRAP_DDIB_DETECTED;
+			} else {
 				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
-					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
-			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
 				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
 					~SFUSE_STRAP_DDIB_DETECTED;
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
-					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
 			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
-				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
-					~SFUSE_STRAP_DDIC_DETECTED;
+			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
+				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+				~PORTB_HOTPLUG_STATUS_MASK;
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTB_HOTPLUG_LONG_DETECT;
+			intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
+		}
+		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+			if (connected) {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
+					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
+				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
+					SFUSE_STRAP_DDIC_DETECTED;
+			} else {
 				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
 					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
+				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
+					~SFUSE_STRAP_DDIC_DETECTED;
 			}
+			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
+				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+				~PORTC_HOTPLUG_STATUS_MASK;
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTC_HOTPLUG_LONG_DETECT;
+			intel_vgpu_trigger_virtual_event(vgpu, DP_C_HOTPLUG);
 		}
-		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
-			PORTB_HOTPLUG_STATUS_MASK;
-		intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index e49944fde333..cbe5931906e0 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -437,10 +437,9 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	if (ret)
 		goto out_clean_sched_policy;
 
-	if (IS_BROADWELL(dev_priv))
+	if (IS_BROADWELL(dev_priv) || IS_BROXTON(dev_priv))
 		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
-	/* FixMe: Re-enable APL/BXT once vfio_edid enabled */
-	else if (!IS_BROXTON(dev_priv))
+	else
 		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
 	if (ret)
 		goto out_clean_sched_policy;
-- 
2.29.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
