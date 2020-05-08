Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0761CA387
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 May 2020 08:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4216E03F;
	Fri,  8 May 2020 06:05:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6A96E03F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 May 2020 06:05:10 +0000 (UTC)
IronPort-SDR: aB+x8ze9+cO3PooUBGDT0filHVU3NJz+aGu1kaKCGsn4gKXJjWzKExUr4T40oGGdSgJ9zC6zFk
 7vZAxPQZ/Smw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 23:05:09 -0700
IronPort-SDR: qtw8pOq8zYp18QnV53n6sbYuZcZQnfxQLHPbuoiMSD8nanN74p42U2NJsOrtgkADf3bFjkTbRI
 7b25ku6Vsbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="462408960"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.118])
 by fmsmga006.fm.intel.com with ESMTP; 07 May 2020 23:05:08 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Init DPLL/DDI vreg for virtual display instead
 of inheritance.
Date: Fri,  8 May 2020 14:05:06 +0800
Message-Id: <20200508060506.216250-1-colin.xu@intel.com>
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

Init value of some display vregs rea inherited from host pregs. When
host display in different status, i.e. all monitors unpluged, different
display configurations, etc., GVT virtual display setup don't consistent
thus may lead to guest driver consider display goes malfunctional.

The added init vreg values are based on PRMs and fixed by calcuation
from current configuration (only PIPE_A) and the virtual EDID.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 49 +++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index a83df2f84eb9..a1696e9ce4b6 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -208,14 +208,41 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 				SKL_FUSE_PG_DIST_STATUS(SKL_PG0) |
 				SKL_FUSE_PG_DIST_STATUS(SKL_PG1) |
 				SKL_FUSE_PG_DIST_STATUS(SKL_PG2);
-		vgpu_vreg_t(vgpu, LCPLL1_CTL) |=
-				LCPLL_PLL_ENABLE |
-				LCPLL_PLL_LOCK;
-		vgpu_vreg_t(vgpu, LCPLL2_CTL) |= LCPLL_PLL_ENABLE;
-
+		/*
+		 * Only 1 PIPE enabled in current vGPU display and PIPE_A is
+		 *  tied to TRANSCODER_A in HW, so it's safe to assume PIPE_A,
+		 *   TRANSCODER_A can be enabled. PORT_x depends on the input of
+		 *   setup_virtual_dp_monitor, we can bind DPLL0 to any PORT_x
+		 *   so we fixed to DPLL0 here.
+		 * Setup DPLL0: DP link clk 1620 MHz, non SSC, DP Mode
+		 */
+		vgpu_vreg_t(vgpu, DPLL_CTRL1) =
+			DPLL_CTRL1_OVERRIDE(DPLL_ID_SKL_DPLL0);
+		vgpu_vreg_t(vgpu, DPLL_CTRL1) |=
+			DPLL_CTRL1_LINK_RATE(DPLL_CTRL1_LINK_RATE_1620, DPLL_ID_SKL_DPLL0);
+		vgpu_vreg_t(vgpu, LCPLL1_CTL) =
+			LCPLL_PLL_ENABLE | LCPLL_PLL_LOCK;
+		vgpu_vreg_t(vgpu, DPLL_STATUS) = DPLL_LOCK(DPLL_ID_SKL_DPLL0);
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
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
+			~DPLL_CTRL2_DDI_CLK_OFF(PORT_B);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_B);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_B);
 		vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIB_DETECTED;
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
@@ -236,6 +263,12 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
+			~DPLL_CTRL2_DDI_CLK_OFF(PORT_C);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_C);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_C);
 		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTC_HOTPLUG_CPT;
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
@@ -256,6 +289,12 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) {
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
+			~DPLL_CTRL2_DDI_CLK_OFF(PORT_D);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_D);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_D);
 		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTD_HOTPLUG_CPT;
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
