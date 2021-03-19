Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972AD3418D0
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Mar 2021 10:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BDB6E9C4;
	Fri, 19 Mar 2021 09:52:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F2D6E9C3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Mar 2021 09:52:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBE5564E21;
 Fri, 19 Mar 2021 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616147565;
 bh=+o2xY6/mkrOGkf5T5K7mXhyLgNRtKInvBr4ruePI7B4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=rxsgA4lpXxIeS3X1YSXNjJbLmPMC71SHp0KG7LPNGPMxDnkTSuheXb1LpCYlnQB/C
 E7uWj8icOnlZ0qoI8yR7l2JbhZx7yohoZv1FintDzd59SZfi2YdtSQb32BY+jqDynS
 Qjr08XCmVkIyEHBL7w9YT/Qi0ykRZbuFo2bQmn2c=
Subject: Patch "drm/i915/gvt: Fix vfio_edid issue for BXT/APL" has been added
 to the 5.4-stable tree
To: colin.xu@intel.com, gregkh@linuxfoundation.org,
 intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 19 Mar 2021 10:52:35 +0100
In-Reply-To: <982acc6579f652db9ed67f042453c302055b0692.1615946755.git.colin.xu@intel.com>
Message-ID: <161614755578130@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/i915/gvt: Fix vfio_edid issue for BXT/APL

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-i915-gvt-fix-vfio_edid-issue-for-bxt-apl.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Mar 19 10:39:38 AM CET 2021
From: Colin Xu <colin.xu@intel.com>
Date: Wed, 17 Mar 2021 10:55:04 +0800
Subject: drm/i915/gvt: Fix vfio_edid issue for BXT/APL
To: stable@vger.kernel.org
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com, colin.xu@intel.com
Message-ID: <982acc6579f652db9ed67f042453c302055b0692.1615946755.git.colin.xu@intel.com>

From: Colin Xu <colin.xu@intel.com>

commit 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07 upstream

BXT/APL has different isr/irr/hpd regs compared with other GEN9. If not
setting these regs bits correctly according to the emulated monitor
(currently a DP on PORT_B), although gvt still triggers a virtual HPD
event, the guest driver won't detect a valid HPD pulse thus no full
display detection will be executed to read the updated EDID.

With this patch, the vfio_edid is enabled again on BXT/APL, which is
previously disabled.

Fixes: 642403e3599e ("drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL")
Signed-off-by: Colin Xu <colin.xu@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20201201060329.142375-1-colin.xu@intel.com
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
(cherry picked from commit 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07)
Signed-off-by: Colin Xu <colin.xu@intel.com>
Cc: <stable@vger.kernel.org> # 5.4.y
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gvt/display.c |   83 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/i915/gvt/vgpu.c    |    2 
 2 files changed, 62 insertions(+), 23 deletions(-)

--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -215,6 +215,15 @@ static void emulate_monitor_status_chang
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
@@ -271,6 +280,8 @@ static void emulate_monitor_status_chang
 			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=
 				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 				 TRANS_DDI_FUNC_ENABLE);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTA_HOTPLUG_ENABLE;
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				BXT_DE_PORT_HP_DDIA;
 		}
@@ -299,6 +310,8 @@ static void emulate_monitor_status_chang
 				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
 				 TRANS_DDI_FUNC_ENABLE);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTB_HOTPLUG_ENABLE;
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				BXT_DE_PORT_HP_DDIB;
 		}
@@ -327,6 +340,8 @@ static void emulate_monitor_status_chang
 				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
 				 TRANS_DDI_FUNC_ENABLE);
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTC_HOTPLUG_ENABLE;
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				BXT_DE_PORT_HP_DDIC;
 		}
@@ -652,38 +667,62 @@ void intel_vgpu_emulate_hotplug(struct i
 				PORTD_HOTPLUG_STATUS_MASK;
 		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
 	} else if (IS_BROXTON(dev_priv)) {
-		if (connected) {
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |= BXT_DE_PORT_HP_DDIA;
+		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
+			if (connected) {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
+					BXT_DE_PORT_HP_DDIA;
+			} else {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+					~BXT_DE_PORT_HP_DDIA;
 			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
+				BXT_DE_PORT_HP_DDIA;
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+				~PORTA_HOTPLUG_STATUS_MASK;
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTA_HOTPLUG_LONG_DETECT;
+			intel_vgpu_trigger_virtual_event(vgpu, DP_A_HOTPLUG);
+		}
+		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+			if (connected) {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
+					BXT_DE_PORT_HP_DDIB;
 				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
 					SFUSE_STRAP_DDIB_DETECTED;
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |= BXT_DE_PORT_HP_DDIB;
-			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
-				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
-					SFUSE_STRAP_DDIC_DETECTED;
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |= BXT_DE_PORT_HP_DDIC;
-			}
-		} else {
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &= ~BXT_DE_PORT_HP_DDIA;
-			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+			} else {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+					~BXT_DE_PORT_HP_DDIB;
 				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
 					~SFUSE_STRAP_DDIB_DETECTED;
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &= ~BXT_DE_PORT_HP_DDIB;
 			}
-			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
+				BXT_DE_PORT_HP_DDIB;
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
+				~PORTB_HOTPLUG_STATUS_MASK;
+			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+				PORTB_HOTPLUG_LONG_DETECT;
+			intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
+		}
+		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+			if (connected) {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
+					BXT_DE_PORT_HP_DDIC;
+				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
+					SFUSE_STRAP_DDIC_DETECTED;
+			} else {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+					~BXT_DE_PORT_HP_DDIC;
 				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
 					~SFUSE_STRAP_DDIC_DETECTED;
-				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &= ~BXT_DE_PORT_HP_DDIC;
 			}
+			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
+				BXT_DE_PORT_HP_DDIC;
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
 
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -432,7 +432,7 @@ static struct intel_vgpu *__intel_gvt_cr
 	if (ret)
 		goto out_clean_sched_policy;
 
-	if (IS_BROADWELL(gvt->dev_priv))
+	if (IS_BROADWELL(gvt->dev_priv) || IS_BROXTON(gvt->dev_priv))
 		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
 	else
 		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);


Patches currently in stable-queue which might be from colin.xu@intel.com are

queue-5.4/drm-i915-gvt-set-snoop-for-pat3-on-bxt-apl-to-workaround-gpu-bb-hang.patch
queue-5.4/drm-i915-gvt-fix-virtual-display-setup-for-bxt-apl.patch
queue-5.4/drm-i915-gvt-fix-vfio_edid-issue-for-bxt-apl.patch
queue-5.4/drm-i915-gvt-fix-port-number-for-bdw-on-edid-region-setup.patch
queue-5.4/drm-i915-gvt-fix-mmio-handler-break-on-bxt-apl.patch
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
