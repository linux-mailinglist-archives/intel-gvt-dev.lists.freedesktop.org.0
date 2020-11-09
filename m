Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3A2AB210
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Nov 2020 09:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE388935A;
	Mon,  9 Nov 2020 08:00:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903C893EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  9 Nov 2020 08:00:22 +0000 (UTC)
IronPort-SDR: Za8q3oCT4Em4ycbDZmvcei7gLrNcmkKbZ6nimUelFhGbmTLHfRVtRbG4gkL2Z+9s6QtM+1qeaD
 cX1J5atTB7nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="168980665"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="168980665"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 00:00:22 -0800
IronPort-SDR: /91Gt3fbzihRVxq3k8syr7pE3nlOAloN59Ge60PIah50zV326zD5+PnNZH2wTPcQapLstoQ2Iz
 Py7jPUuhBG6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="529209692"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.26])
 by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2020 00:00:21 -0800
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Get accurate vGPU virtual display refresh
 rate from vreg
Date: Mon,  9 Nov 2020 16:00:11 +0800
Message-Id: <20201109080011.813032-1-colin.xu@intel.com>
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

Guest OS builds up its timing mode list based on the virtual EDID as
simulated by GVT. However since there are several timings supported in
the virtual EDID, and each timing can also support several modes
(resolution and refresh rate), current emulated vblank peroid (16ms)
may not always be correct and could lead to miss-sync behavior in guest.

Guest driver will setup new resolution and program vregs accordingly and
it should always follows GEN PRM. Based on the simulated display regs by
GVT, it's safe to decode the actual refresh rate using by guest from
vreg only.

Current implementation only enables PIPE_A and PIPE_A is always tied to
TRANSCODER_A in HW. GVT may simulate DP monitor on PORT_B or PORT_D
based on the caller. So we can find out which DPLL is used by PROT_x
which connected to TRANSCODER_A and calculate the DP bit rate from the
DPLL frequency. Then DP stream clock (pixel clock) can be calculated
from DP link M/N and DP bit rate. Finally, get the refresh rate from
pixel clock, H total and V total.

Refer to PRM for GEN display and VESA timing standard for more details.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c  |   2 +
 drivers/gpu/drm/i915/gvt/display.h  |   2 +
 drivers/gpu/drm/i915/gvt/gvt.h      |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c | 107 +++++++++++++++++++++++++++-
 4 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 5b5c71a0b4af..bc208355662a 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -389,6 +389,8 @@ static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num,
 	port->dpcd->data[DPCD_SINK_COUNT] = 0x1;
 	port->type = type;
 	port->id = resolution;
+	port->vrefresh_k = 60 * MSEC_PER_SEC;
+	vgpu->display.port_num = port_num;
 
 	emulate_monitor_status_change(vgpu);
 
diff --git a/drivers/gpu/drm/i915/gvt/display.h b/drivers/gpu/drm/i915/gvt/display.h
index b59b34046e1e..17e83bf5826c 100644
--- a/drivers/gpu/drm/i915/gvt/display.h
+++ b/drivers/gpu/drm/i915/gvt/display.h
@@ -164,6 +164,8 @@ struct intel_vgpu_port {
 	struct intel_vgpu_dpcd_data *dpcd;
 	int type;
 	enum intel_vgpu_edid id;
+	/* x1000 to get accurate 59.94, 24.976, 29.94, etc. in timing std. */
+	u32 vrefresh_k;
 };
 
 static inline char *vgpu_edid_str(enum intel_vgpu_edid id)
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index a81cf0f01e78..2b75b3b3ea12 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -129,6 +129,7 @@ struct intel_vgpu_display {
 	struct intel_vgpu_i2c_edid i2c_edid;
 	struct intel_vgpu_port ports[I915_MAX_PORTS];
 	struct intel_vgpu_sbi sbi;
+	enum port port_num;
 };
 
 struct vgpu_sched_ctl {
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index ce93079cf933..ec88a6329329 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -443,6 +443,107 @@ static int dpy_reg_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 	return 0;
 }
 
+/*
+* Only PIPE_A is enabled in current vGPU display and PIPE_A is tied to
+*   TRANSCODER_A in HW. DDI/PORT could be PORT_x depends on
+*   setup_virtual_dp_monitor().
+* emulate_monitor_status_change() set up DPLL0 for PORT_x as the initial enabled
+*   DPLL. Later guest driver may setup a different DPLLx when setting mode.
+* So the correct sequence to find DP stream clock is:
+*   Check TRANS_DDI_FUNC_CTL on TRANSCODER_A to get PORT_x.
+*   Check DPLL_CTRL2 at PORT_x to find out the selected ON DPLLx.
+*   Check DPLLx to get PLL frequency and DP bitrate.
+*     DP bitrate = DPLL output frequency * 2.
+* Then Refresh rate can be calcuated by:
+*   Pixel clock = h_total * v_total * refresh_rate
+*   stream clock = Pixel clock
+*   Link M/N = strm_clk / ls_clk
+*/
+static void vgpu_update_refresh_rate(struct intel_vgpu *vgpu)
+{
+	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
+	enum port port;
+	enum intel_dpll_id dpll_id = DPLL_ID_SKL_DPLL0;
+	u32 dp_br, link_m, link_n, htotal, vtotal, vrefresh_k;
+	u64 pixel_clk;
+
+	/* Find DDI/PORT assigned to TRANSCODER_A, expect B or D */
+	port = (vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &
+		TRANS_DDI_PORT_MASK) >> TRANS_DDI_PORT_SHIFT;
+	if (port != PORT_B && port != PORT_D) {
+		gvt_dbg_dpy("vgpu-%d unsupported PORT_%c\n",
+			    vgpu->id, port_name(port));
+		return;
+	}
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
+		return;
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
+			dp_br = 108000 *2;
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
+			gvt_dbg_dpy("vgpu-%d fail to get DPLL-%d freq\n",
+				    vgpu->id, dpll_id);
+			return;
+	}
+
+	/* Get DP link symbol clock M/N */
+	link_m = vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A));
+	link_n = vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A));
+
+	/* Get H/V total from transcoder timing */
+	htotal = (vgpu_vreg_t(vgpu, HTOTAL(TRANSCODER_A)) >> TRANS_HTOTAL_SHIFT) + 1;
+	vtotal = (vgpu_vreg_t(vgpu, VTOTAL(TRANSCODER_A)) >> TRANS_VTOTAL_SHIFT) + 1;
+
+	if (link_n && htotal && vtotal) {
+		u32 *old = &(intel_vgpu_port(vgpu, vgpu->display.port_num)->vrefresh_k);
+
+		/* Calcuate pixel clock by (ls_clk * M / N) */
+		pixel_clk = div_u64(mul_u32_u32(link_m, dp_br), link_n);
+		pixel_clk *= MSEC_PER_SEC;
+
+		/* Calcuate refresh rate by (pixel_clk / (h_total * v_total)) */
+		vrefresh_k = DIV64_U64_ROUND_CLOSEST(pixel_clk,
+			div64_u64(mul_u32_u32(htotal, vtotal), MSEC_PER_SEC));
+
+		if (*old != vrefresh_k)
+			*old = vrefresh_k;
+
+		gvt_dbg_dpy("vgpu-%d PIPE_%c refresh rate updated to %d\n",
+			    vgpu->id, pipe_name(PIPE_A), vrefresh_k);
+	}
+}
+
 static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
@@ -451,9 +552,11 @@ static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	write_vreg(vgpu, offset, p_data, bytes);
 	data = vgpu_vreg(vgpu, offset);
 
-	if (data & PIPECONF_ENABLE)
+	if (data & PIPECONF_ENABLE) {
 		vgpu_vreg(vgpu, offset) |= I965_PIPECONF_ACTIVE;
-	else
+		vgpu_update_refresh_rate(vgpu);
+
+	} else
 		vgpu_vreg(vgpu, offset) &= ~I965_PIPECONF_ACTIVE;
 	/* vgpu_lock already hold by emulate mmio r/w */
 	mutex_unlock(&vgpu->vgpu_lock);
-- 
2.29.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
