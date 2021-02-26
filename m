Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C8325CAB
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 26 Feb 2021 05:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082B36E8E4;
	Fri, 26 Feb 2021 04:46:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE436E8E4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 26 Feb 2021 04:46:03 +0000 (UTC)
IronPort-SDR: TCW0Hx3C1S2n2sGpRL3ISoZ0Qtq26WvnmsCCub3jkUbXrVaNikq62Xh+LbplnG04c4G3AwP+2Q
 5gFlW8HpZA1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="270748901"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="270748901"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 20:46:03 -0800
IronPort-SDR: hXIxPBc4BosTCM0/D2hOqbBgIz36qpkEnek6LIrJTniKqFqC005kPv1dXzoN3UAJOTXCncqaFk
 wC3fy7GTOkHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="442911166"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.51])
 by orsmga001.jf.intel.com with ESMTP; 25 Feb 2021 20:46:01 -0800
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v2 1/2] drm/i915/gvt: Get accurate vGPU virtual display
 refresh rate from vreg
Date: Fri, 26 Feb 2021 12:45:59 +0800
Message-Id: <20210226044559.283622-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.30.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Guest OS builds up its timing mode list based on the virtual EDID as
simulated by GVT. However since there are several timings supported in
the virtual EDID, and each timing can also support several modes
(resolution and refresh rate), current emulated vblank period (16ms)
may not always be correct and could lead to miss-sync behavior in guest.

Guest driver will setup new resolution and program vregs accordingly and
it should always follows GEN PRM. Based on the simulated display regs by
GVT, it's safe to decode the actual refresh rate using by guest from
vreg only.

Current implementation only enables PIPE_A and PIPE_A is always tied to
TRANSCODER_A in HW. GVT may simulate DP monitor on PORT_B or PORT_D
based on the caller. So we can find out which DPLL is used by PORT_x
which connected to TRANSCODER_A and calculate the DP bit rate from the
DPLL frequency. Then DP stream clock (pixel clock) can be calculated
from DP link M/N and DP bit rate. Finally, get the refresh rate from
pixel clock, H total and V total.

The per-vGPU accurate refresh rate is not used yet but only stored,
until per-vGPU vblank timer is enabled. Then each vGPU can have
different and accurate refresh rate per-guest driver configuration.

Refer to PRM for GEN display and VESA timing standard for more details.

V2:
Rebase to 5.11.
Correctly calculate DP link rate for BDW and BXT.
Use GVT_DEFAULT_REFRESH_RATE instead of hardcoded to 60 as init refresh.
Typo fix. (zhenyu)

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c  |   2 +
 drivers/gpu/drm/i915/gvt/display.h  |   3 +
 drivers/gpu/drm/i915/gvt/gvt.h      |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c | 256 +++++++++++++++++++++++++++-
 4 files changed, 260 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 62a5b0dd2003..1cae92e3752c 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -544,6 +544,8 @@ static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num,
 	port->dpcd->data[DPCD_SINK_COUNT] = 0x1;
 	port->type = type;
 	port->id = resolution;
+	port->vrefresh_k = GVT_DEFAULT_REFRESH_RATE * MSEC_PER_SEC;
+	vgpu->display.port_num = port_num;
 
 	emulate_monitor_status_change(vgpu);
 
diff --git a/drivers/gpu/drm/i915/gvt/display.h b/drivers/gpu/drm/i915/gvt/display.h
index b59b34046e1e..2481a2ae1f68 100644
--- a/drivers/gpu/drm/i915/gvt/display.h
+++ b/drivers/gpu/drm/i915/gvt/display.h
@@ -157,6 +157,7 @@ enum intel_vgpu_edid {
 	GVT_EDID_NUM,
 };
 
+#define GVT_DEFAULT_REFRESH_RATE 60
 struct intel_vgpu_port {
 	/* per display EDID information */
 	struct intel_vgpu_edid_data *edid;
@@ -164,6 +165,8 @@ struct intel_vgpu_port {
 	struct intel_vgpu_dpcd_data *dpcd;
 	int type;
 	enum intel_vgpu_edid id;
+	/* x1000 to get accurate 59.94, 24.976, 29.94, etc. in timing std. */
+	u32 vrefresh_k;
 };
 
 static inline char *vgpu_edid_str(enum intel_vgpu_edid id)
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 03c993d68f10..da8bda7f7bd2 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -133,6 +133,7 @@ struct intel_vgpu_display {
 	struct intel_vgpu_i2c_edid i2c_edid;
 	struct intel_vgpu_port ports[I915_MAX_PORTS];
 	struct intel_vgpu_sbi sbi;
+	enum port port_num;
 };
 
 struct vgpu_sched_ctl {
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 6eeaeecb7f85..321480209b89 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -39,6 +39,7 @@
 #include "i915_drv.h"
 #include "gvt.h"
 #include "i915_pvinfo.h"
+#include "display/intel_display_types.h"
 
 /* XXX FIXME i915 has changed PP_XXX definition */
 #define PCH_PP_STATUS  _MMIO(0xc7200)
@@ -443,6 +444,254 @@ static int dpy_reg_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 	return 0;
 }
 
+/*
+ * Only PIPE_A is enabled in current vGPU display and PIPE_A is tied to
+ *   TRANSCODER_A in HW. DDI/PORT could be PORT_x depends on
+ *   setup_virtual_dp_monitor().
+ * emulate_monitor_status_change() set up PLL for PORT_x as the initial enabled
+ *   DPLL. Later guest driver may setup a different DPLLx when setting mode.
+ * So the correct sequence to find DP stream clock is:
+ *   Check TRANS_DDI_FUNC_CTL on TRANSCODER_A to get PORT_x.
+ *   Check correct PLLx for PORT_x to get PLL frequency and DP bitrate.
+ * Then Refresh rate then can be calculated based on follow equations:
+ *   Pixel clock = h_total * v_total * refresh_rate
+ *   stream clock = Pixel clock
+ *   ls_clk = DP bitrate
+ *   Link M/N = strm_clk / ls_clk
+ */
+
+static u32 bdw_vgpu_get_dp_bitrate(struct intel_vgpu *vgpu, enum port port)
+{
+	u32 dp_br = 0;
+	u32 ddi_pll_sel = vgpu_vreg_t(vgpu, PORT_CLK_SEL(port));
+
+	switch (ddi_pll_sel) {
+	case PORT_CLK_SEL_LCPLL_2700:
+		dp_br = 270000 * 2;
+		break;
+	case PORT_CLK_SEL_LCPLL_1350:
+		dp_br = 135000 * 2;
+		break;
+	case PORT_CLK_SEL_LCPLL_810:
+		dp_br = 81000 * 2;
+		break;
+	case PORT_CLK_SEL_SPLL:
+	{
+		switch (vgpu_vreg_t(vgpu, SPLL_CTL) & SPLL_FREQ_MASK) {
+		case SPLL_FREQ_810MHz:
+			dp_br = 81000 * 2;
+			break;
+		case SPLL_FREQ_1350MHz:
+			dp_br = 135000 * 2;
+			break;
+		case SPLL_FREQ_2700MHz:
+			dp_br = 270000 * 2;
+			break;
+		default:
+			gvt_dbg_dpy("vgpu-%d PORT_%c can't get freq from SPLL 0x%08x\n",
+				    vgpu->id, port_name(port), vgpu_vreg_t(vgpu, SPLL_CTL));
+			break;
+		}
+		break;
+	}
+	case PORT_CLK_SEL_WRPLL1:
+	case PORT_CLK_SEL_WRPLL2:
+	{
+		u32 wrpll_ctl;
+		int refclk, n, p, r;
+
+		if (ddi_pll_sel == PORT_CLK_SEL_WRPLL1)
+			wrpll_ctl = vgpu_vreg_t(vgpu, WRPLL_CTL(DPLL_ID_WRPLL1));
+		else
+			wrpll_ctl = vgpu_vreg_t(vgpu, WRPLL_CTL(DPLL_ID_WRPLL2));
+
+		switch (wrpll_ctl & WRPLL_REF_MASK) {
+		case WRPLL_REF_PCH_SSC:
+			refclk = vgpu->gvt->gt->i915->dpll.ref_clks.ssc;
+			break;
+		case WRPLL_REF_LCPLL:
+			refclk = 2700000;
+			break;
+		default:
+			gvt_dbg_dpy("vgpu-%d PORT_%c WRPLL can't get refclk 0x%08x\n",
+				    vgpu->id, port_name(port), wrpll_ctl);
+			goto out;
+		}
+
+		r = wrpll_ctl & WRPLL_DIVIDER_REF_MASK;
+		p = (wrpll_ctl & WRPLL_DIVIDER_POST_MASK) >> WRPLL_DIVIDER_POST_SHIFT;
+		n = (wrpll_ctl & WRPLL_DIVIDER_FB_MASK) >> WRPLL_DIVIDER_FB_SHIFT;
+
+		dp_br = (refclk * n / 10) / (p * r) * 2;
+		break;
+	}
+	default:
+		gvt_dbg_dpy("vgpu-%d PORT_%c has invalid clock select 0x%08x\n",
+			    vgpu->id, port_name(port), vgpu_vreg_t(vgpu, PORT_CLK_SEL(port)));
+		break;
+	}
+
+out:
+	return dp_br;
+}
+
+static u32 bxt_vgpu_get_dp_bitrate(struct intel_vgpu *vgpu, enum port port)
+{
+	u32 dp_br = 0;
+	int refclk = vgpu->gvt->gt->i915->dpll.ref_clks.nssc;
+	enum dpio_phy phy = DPIO_PHY0;
+	enum dpio_channel ch = DPIO_CH0;
+	struct dpll clock = {0};
+	u32 temp;
+
+	/* Port to PHY mapping is fixed, see bxt_ddi_phy_info{} */
+	switch (port) {
+	case PORT_A:
+		phy = DPIO_PHY1;
+		ch = DPIO_CH0;
+		break;
+	case PORT_B:
+		phy = DPIO_PHY0;
+		ch = DPIO_CH0;
+		break;
+	case PORT_C:
+		phy = DPIO_PHY0;
+		ch = DPIO_CH1;
+		break;
+	default:
+		gvt_dbg_dpy("vgpu-%d no PHY for PORT_%c\n", vgpu->id, port_name(port));
+		goto out;
+	}
+
+	temp = vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(port));
+	if (!(temp & PORT_PLL_ENABLE) || !(temp & PORT_PLL_LOCK)) {
+		gvt_dbg_dpy("vgpu-%d PORT_%c PLL_ENABLE 0x%08x isn't enabled or locked\n",
+			    vgpu->id, port_name(port), temp);
+		goto out;
+	}
+
+	clock.m1 = 2;
+	clock.m2 = (vgpu_vreg_t(vgpu, BXT_PORT_PLL(phy, ch, 0)) & PORT_PLL_M2_MASK) << 22;
+	if (vgpu_vreg_t(vgpu, BXT_PORT_PLL(phy, ch, 3)) & PORT_PLL_M2_FRAC_ENABLE)
+		clock.m2 |= vgpu_vreg_t(vgpu, BXT_PORT_PLL(phy, ch, 2)) & PORT_PLL_M2_FRAC_MASK;
+	clock.n = (vgpu_vreg_t(vgpu, BXT_PORT_PLL(phy, ch, 1)) & PORT_PLL_N_MASK) >> PORT_PLL_N_SHIFT;
+	clock.p1 = (vgpu_vreg_t(vgpu, BXT_PORT_PLL_EBB_0(phy, ch)) & PORT_PLL_P1_MASK) >> PORT_PLL_P1_SHIFT;
+	clock.p2 = (vgpu_vreg_t(vgpu, BXT_PORT_PLL_EBB_0(phy, ch)) & PORT_PLL_P2_MASK) >> PORT_PLL_P2_SHIFT;
+	clock.m = clock.m1 * clock.m2;
+	clock.p = clock.p1 * clock.p2;
+
+	if (clock.n == 0 || clock.p == 0) {
+		gvt_dbg_dpy("vgpu-%d PORT_%c PLL has invalid divider\n", vgpu->id, port_name(port));
+		goto out;
+	}
+
+	clock.vco = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(refclk, clock.m), clock.n << 22);
+	clock.dot = DIV_ROUND_CLOSEST(clock.vco, clock.p);
+
+	dp_br = clock.dot / 5;
+
+out:
+	return dp_br;
+}
+
+static u32 skl_vgpu_get_dp_bitrate(struct intel_vgpu *vgpu, enum port port)
+{
+	u32 dp_br = 0;
+	enum intel_dpll_id dpll_id = DPLL_ID_SKL_DPLL0;
+
+	/* Find the enabled DPLL for the DDI/PORT */
+	if (!(vgpu_vreg_t(vgpu, DPLL_CTRL2) & DPLL_CTRL2_DDI_CLK_OFF(port)) &&
+	    (vgpu_vreg_t(vgpu, DPLL_CTRL2) & DPLL_CTRL2_DDI_SEL_OVERRIDE(port))) {
+		dpll_id += (vgpu_vreg_t(vgpu, DPLL_CTRL2) &
+			DPLL_CTRL2_DDI_CLK_SEL_MASK(port)) >>
+			DPLL_CTRL2_DDI_CLK_SEL_SHIFT(port);
+	} else {
+		gvt_dbg_dpy("vgpu-%d DPLL for PORT_%c isn't turned on\n",
+			    vgpu->id, port_name(port));
+		return dp_br;
+	}
+
+	/* Find PLL output frequency from correct DPLL, and get bir rate */
+	switch ((vgpu_vreg_t(vgpu, DPLL_CTRL1) &
+		DPLL_CTRL1_LINK_RATE_MASK(dpll_id)) >>
+		DPLL_CTRL1_LINK_RATE_SHIFT(dpll_id)) {
+		case DPLL_CTRL1_LINK_RATE_810:
+			dp_br = 81000 * 2;
+			break;
+		case DPLL_CTRL1_LINK_RATE_1080:
+			dp_br = 108000 * 2;
+			break;
+		case DPLL_CTRL1_LINK_RATE_1350:
+			dp_br = 135000 * 2;
+			break;
+		case DPLL_CTRL1_LINK_RATE_1620:
+			dp_br = 162000 * 2;
+			break;
+		case DPLL_CTRL1_LINK_RATE_2160:
+			dp_br = 216000 * 2;
+			break;
+		case DPLL_CTRL1_LINK_RATE_2700:
+			dp_br = 270000 * 2;
+			break;
+		default:
+			dp_br = 0;
+			gvt_dbg_dpy("vgpu-%d PORT_%c fail to get DPLL-%d freq\n",
+				    vgpu->id, port_name(port), dpll_id);
+	}
+
+	return dp_br;
+}
+
+static void vgpu_update_refresh_rate(struct intel_vgpu *vgpu)
+{
+	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
+	enum port port;
+	u32 dp_br, link_m, link_n, htotal, vtotal;
+
+	/* Find DDI/PORT assigned to TRANSCODER_A, expect B or D */
+	port = (vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &
+		TRANS_DDI_PORT_MASK) >> TRANS_DDI_PORT_SHIFT;
+	if (port != PORT_B && port != PORT_D) {
+		gvt_dbg_dpy("vgpu-%d unsupported PORT_%c\n", vgpu->id, port_name(port));
+		return;
+	}
+
+	/* Calculate DP bitrate from PLL */
+	if (IS_BROADWELL(dev_priv))
+		dp_br = bdw_vgpu_get_dp_bitrate(vgpu, port);
+	else if (IS_BROXTON(dev_priv))
+		dp_br = bxt_vgpu_get_dp_bitrate(vgpu, port);
+	else
+		dp_br = skl_vgpu_get_dp_bitrate(vgpu, port);
+
+	/* Get DP link symbol clock M/N */
+	link_m = vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A));
+	link_n = vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A));
+
+	/* Get H/V total from transcoder timing */
+	htotal = (vgpu_vreg_t(vgpu, HTOTAL(TRANSCODER_A)) >> TRANS_HTOTAL_SHIFT) + 1;
+	vtotal = (vgpu_vreg_t(vgpu, VTOTAL(TRANSCODER_A)) >> TRANS_VTOTAL_SHIFT) + 1;
+
+	if (dp_br && link_n && htotal && vtotal) {
+		u64 pixel_clk = 0;
+		u32 new_rate = 0;
+		u32 *old_rate = &(intel_vgpu_port(vgpu, vgpu->display.port_num)->vrefresh_k);
+
+		/* Calcuate pixel clock by (ls_clk * M / N) */
+		pixel_clk = div_u64(mul_u32_u32(link_m, dp_br), link_n);
+		pixel_clk *= MSEC_PER_SEC;
+
+		/* Calcuate refresh rate by (pixel_clk / (h_total * v_total)) */
+		new_rate = DIV64_U64_ROUND_CLOSEST(pixel_clk, div64_u64(mul_u32_u32(htotal, vtotal), MSEC_PER_SEC));
+
+		if (*old_rate != new_rate)
+			*old_rate = new_rate;
+
+		gvt_dbg_dpy("vgpu-%d PIPE_%c refresh rate updated to %d\n",
+			    vgpu->id, pipe_name(PIPE_A), new_rate);
+	}
+}
+
 static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
@@ -451,10 +700,13 @@ static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	write_vreg(vgpu, offset, p_data, bytes);
 	data = vgpu_vreg(vgpu, offset);
 
-	if (data & PIPECONF_ENABLE)
+	if (data & PIPECONF_ENABLE) {
 		vgpu_vreg(vgpu, offset) |= I965_PIPECONF_ACTIVE;
-	else
+		vgpu_update_refresh_rate(vgpu);
+
+	} else {
 		vgpu_vreg(vgpu, offset) &= ~I965_PIPECONF_ACTIVE;
+	}
 	/* vgpu_lock already hold by emulate mmio r/w */
 	mutex_unlock(&vgpu->vgpu_lock);
 	intel_gvt_check_vblank_emulation(vgpu->gvt);
-- 
2.30.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
