Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB62A5E2C
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Nov 2020 07:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750CE6E94B;
	Wed,  4 Nov 2020 06:41:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CBE6E94B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Nov 2020 06:41:55 +0000 (UTC)
IronPort-SDR: ce7qv3t84NOdkhn8ZC6Psaqak3WoleGOO3K2oIbsLe/+B9Cj5iPodto7bnLHTdMmziy3GiSPKi
 Kw6VUCAxJC6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="233337422"
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="233337422"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 22:41:52 -0800
IronPort-SDR: 0rGHiaF05rmazRlb+TywtMciElnt9hHcrfPkDafFGAZGd4QP3s32WOXmtczkTwY0NrXhFEroOi
 RCqUAr7m+9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="471094431"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga004.jf.intel.com with ESMTP; 03 Nov 2020 22:41:50 -0800
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH V4] drm/i915/gvt: Fix virtual display setup for BXT/APL
Date: Wed,  4 Nov 2020 14:41:47 +0800
Message-Id: <20201104064147.398351-1-colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Program display related vregs to proper value at initialization, setup
virtual monitor and hotplug.

vGPU virtual display vregs inherit the value from pregs. The virtual DP
monitor is always setup on PORT_B for BXT/APL. However the host may
connect monitor on other PORT or without any monitor connected. Without
properly setup PIPE/DDI/PLL related vregs, guest driver may not setup
the virutal display as expected, and the guest desktop may not be
created.
Since only one virtual display is supported, enable PIPE_A only. And
enable transcoder/DDI/PLL based on which port is setup for BXT/APL.

V2:
Revise commit message.

V3:
set_edid should on PORT_B for BXT.
Inject hpd event for BXT.

V4:
Temporarily disable vfio edid on BXT/APL until issue fixed.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 186 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/mmio.c    |   5 +
 drivers/gpu/drm/i915/gvt/vgpu.c    |   3 +-
 3 files changed, 190 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 7ba16ddfe75f..e15b69bed189 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -173,21 +173,162 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 	int pipe;
 
 	if (IS_BROXTON(dev_priv)) {
-		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &= ~(BXT_DE_PORT_HP_DDIA |
-			BXT_DE_PORT_HP_DDIB |
-			BXT_DE_PORT_HP_DDIC);
+		enum transcoder trans;
+		enum port port;
+
+		/* Clear PIPE, DDI, PHY, HPD before setting new */
+		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+			~(BXT_DE_PORT_HP_DDIA |
+			  BXT_DE_PORT_HP_DDIB |
+			  BXT_DE_PORT_HP_DDIC);
+
+		for_each_pipe(dev_priv, pipe) {
+			vgpu_vreg_t(vgpu, PIPECONF(pipe)) &=
+				~(PIPECONF_ENABLE | I965_PIPECONF_ACTIVE);
+			vgpu_vreg_t(vgpu, DSPCNTR(pipe)) &= ~DISPLAY_PLANE_ENABLE;
+			vgpu_vreg_t(vgpu, SPRCTL(pipe)) &= ~SPRITE_ENABLE;
+			vgpu_vreg_t(vgpu, CURCNTR(pipe)) &= ~MCURSOR_MODE;
+			vgpu_vreg_t(vgpu, CURCNTR(pipe)) |= MCURSOR_MODE_DISABLE;
+		}
+
+		for (trans = TRANSCODER_A; trans <= TRANSCODER_EDP; trans++) {
+			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(trans)) &=
+				~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
+				  TRANS_DDI_PORT_MASK | TRANS_DDI_FUNC_ENABLE);
+		}
+		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
+			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
+			  TRANS_DDI_PORT_MASK);
+
+		for (port = PORT_A; port <= PORT_C; port++) {
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(port)) &=
+				~BXT_PHY_LANE_ENABLED;
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(port)) |=
+				(BXT_PHY_CMNLANE_POWERDOWN_ACK |
+				 BXT_PHY_LANE_POWERDOWN_ACK);
+
+			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(port)) &=
+				~(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
+				  PORT_PLL_REF_SEL | PORT_PLL_LOCK |
+				  PORT_PLL_ENABLE);
+
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) &=
+				~(DDI_INIT_DISPLAY_DETECTED |
+				  DDI_BUF_CTL_ENABLE);
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) |= DDI_BUF_IS_IDLE;
+		}
+
+		vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &= ~(BIT(0) | BIT(1));
+		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) &=
+			~PHY_POWER_GOOD;
+		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY1)) &=
+			~PHY_POWER_GOOD;
+		vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) &= ~BIT(30);
+		vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY1)) &= ~BIT(30);
+
+		vgpu_vreg_t(vgpu, SFUSE_STRAP) &= ~SFUSE_STRAP_DDIB_DETECTED;
+		vgpu_vreg_t(vgpu, SFUSE_STRAP) &= ~SFUSE_STRAP_DDIC_DETECTED;
+
+		/*
+		 * Only 1 PIPE enabled in current vGPU display and PIPE_A is
+		 *  tied to TRANSCODER_A in HW, so it's safe to assume PIPE_A,
+		 *   TRANSCODER_A can be enabled. PORT_x depends on the input of
+		 *   setup_virtual_dp_monitor.
+		 */
+		vgpu_vreg_t(vgpu, PIPECONF(PIPE_A)) |= PIPECONF_ENABLE;
+		vgpu_vreg_t(vgpu, PIPECONF(PIPE_A)) |= I965_PIPECONF_ACTIVE;
+
+		/*
+		 * Golden M/N are calculated based on:
+		 *   24 bpp, 4 lanes, 154000 pixel clk (from virtual EDID),
+		 *   DP link clk 1620 MHz and non-constant_n.
+		 * TODO: calculate DP link symbol clk and stream clk m/n.
+		 */
+		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) = 63 << TU_SIZE_SHIFT;
+		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) |= 0x5b425e;
+		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) = 0x800000;
+		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) = 0x3cd6e;
+		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) = 0x80000;
 
+		/* Enable per-DDI/PORT vreg */
 		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
+			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |= BIT(1);
+			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY1)) |=
+				PHY_POWER_GOOD;
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY1)) |=
+				BIT(30);
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_A)) |=
+				BXT_PHY_LANE_ENABLED;
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_A)) &=
+				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
+				  BXT_PHY_LANE_POWERDOWN_ACK);
+			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_A)) |=
+				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
+				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
+				 PORT_PLL_ENABLE);
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_A)) |=
+				(DDI_BUF_CTL_ENABLE | DDI_INIT_DISPLAY_DETECTED);
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_A)) &=
+				~DDI_BUF_IS_IDLE;
+			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=
+				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
+				 TRANS_DDI_FUNC_ENABLE);
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				BXT_DE_PORT_HP_DDIA;
 		}
 
 		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+			vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIB_DETECTED;
+			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |= BIT(0);
+			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) |=
+				PHY_POWER_GOOD;
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) |=
+				BIT(30);
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_B)) |=
+				BXT_PHY_LANE_ENABLED;
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_B)) &=
+				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
+				  BXT_PHY_LANE_POWERDOWN_ACK);
+			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_B)) |=
+				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
+				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
+				 PORT_PLL_ENABLE);
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |=
+				DDI_BUF_CTL_ENABLE;
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &=
+				~DDI_BUF_IS_IDLE;
+			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
+				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
+				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
+				 TRANS_DDI_FUNC_ENABLE);
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				BXT_DE_PORT_HP_DDIB;
 		}
 
 		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+			vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIC_DETECTED;
+			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |= BIT(0);
+			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) |=
+				PHY_POWER_GOOD;
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) |=
+				BIT(30);
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) |=
+				BXT_PHY_LANE_ENABLED;
+			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) &=
+				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
+				  BXT_PHY_LANE_POWERDOWN_ACK);
+			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_C)) |=
+				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
+				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
+				 PORT_PLL_ENABLE);
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |=
+				DDI_BUF_CTL_ENABLE;
+			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &=
+				~DDI_BUF_IS_IDLE;
+			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
+				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
+				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
+				 TRANS_DDI_FUNC_ENABLE);
 			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
 				BXT_DE_PORT_HP_DDIC;
 		}
@@ -519,6 +660,45 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *vgpu, bool connected)
 		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
 				PORTD_HOTPLUG_STATUS_MASK;
 		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
+	} else if (IS_BROXTON(i915)) {
+		if (connected) {
+			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
+					BXT_DE_PORT_HP_DDIA;
+			}
+			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
+					SFUSE_STRAP_DDIB_DETECTED;
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
+					BXT_DE_PORT_HP_DDIB;
+			}
+			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
+					SFUSE_STRAP_DDIC_DETECTED;
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
+					BXT_DE_PORT_HP_DDIC;
+			}
+		} else {
+			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+					~BXT_DE_PORT_HP_DDIA;
+			}
+			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
+					~SFUSE_STRAP_DDIB_DETECTED;
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+					~BXT_DE_PORT_HP_DDIB;
+			}
+			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
+					~SFUSE_STRAP_DDIC_DETECTED;
+				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
+					~BXT_DE_PORT_HP_DDIC;
+			}
+		}
+		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
+			PORTB_HOTPLUG_STATUS_MASK;
+		intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index b6811f6a230d..24210b1eaec5 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -280,6 +280,11 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu, bool dmlr)
 			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) |=
 				    BXT_PHY_CMNLANE_POWERDOWN_ACK |
 				    BXT_PHY_LANE_POWERDOWN_ACK;
+			vgpu_vreg_t(vgpu, SKL_FUSE_STATUS) |=
+				SKL_FUSE_DOWNLOAD_STATUS |
+				SKL_FUSE_PG_DIST_STATUS(SKL_PG0) |
+				SKL_FUSE_PG_DIST_STATUS(SKL_PG1) |
+				SKL_FUSE_PG_DIST_STATUS(SKL_PG2);
 		}
 	} else {
 #define GVT_GEN8_MMIO_RESET_OFFSET		(0x44200)
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index f6d7e33c7099..399582aeeefb 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -439,7 +439,8 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 
 	if (IS_BROADWELL(dev_priv))
 		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
-	else
+	/* FixMe: Re-enable APL/BXT once vfio_edid enabled */
+	else if (!IS_BROXTON(dev_priv))
 		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
 	if (ret)
 		goto out_clean_sched_policy;
-- 
2.29.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
