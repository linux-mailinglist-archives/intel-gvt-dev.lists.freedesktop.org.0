Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F5F2417B6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 09:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530CC6E184;
	Tue, 11 Aug 2020 07:58:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1146E057
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Aug 2020 07:58:29 +0000 (UTC)
IronPort-SDR: oBJMUQduGsRuxTR2uppOn0Ji/CnX6qRz+xxS1ZYPPeXxQwlONIYImam//1HCgoVlCT1eMF6Gol
 CDV7HYbJHJnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="238520568"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="238520568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 00:58:28 -0700
IronPort-SDR: sC5oHiLRUe8DDQsNvS1k8wfM+h4r3JOUVKBQGS0BMQLhqOrbyBnoQnntV0Zq1bn7e3E1tEBiG7
 1Jg+6oI1sUdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="324692067"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 11 Aug 2020 00:58:26 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH 4/4] drm/i915/gvt: remove F_CMD_ACCESS flag for some registers
Date: Tue, 11 Aug 2020 15:27:20 +0800
Message-Id: <20200811072720.3525-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811055140.29123-1-yan.y.zhao@intel.com>
References: <20200811055140.29123-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, Wang Zhi <zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

some registers cannot be cmd accessible. remove them from the list

Signed-off-by: Wang Zhi <zhi.a.wang@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 78ba2857144e..4650844d87c5 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1892,7 +1892,7 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 	struct drm_i915_private *dev_priv = gvt->gt->i915;
 	int ret;
 
-	MMIO_RING_DFH(RING_IMR, D_ALL, F_CMD_ACCESS, NULL,
+	MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
 		intel_vgpu_reg_imr_handler);
 
 	MMIO_DFH(SDEIMR, D_ALL, 0, NULL, intel_vgpu_reg_imr_handler);
@@ -1900,7 +1900,8 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
 	MMIO_D(SDEISR, D_ALL);
 
-	MMIO_RING_DFH(RING_HWSTAM, D_ALL, F_CMD_ACCESS, NULL, NULL);
+	MMIO_RING_DFH(RING_HWSTAM, D_ALL, 0, NULL, NULL);
+
 
 	MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
 		gamw_echo_dev_rw_ia_write);
@@ -1927,11 +1928,11 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 	MMIO_GM_RDR(_MMIO(0x12198), D_ALL, NULL, NULL);
 	MMIO_D(GEN7_CXT_SIZE, D_ALL);
 
-	MMIO_RING_DFH(RING_TAIL, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_RING_DFH(RING_HEAD, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_RING_DFH(RING_CTL, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_RING_DFH(RING_ACTHD, D_ALL, F_CMD_ACCESS, mmio_read_from_hw, NULL);
-	MMIO_RING_GM_RDR(RING_START, D_ALL, NULL, NULL);
+	MMIO_RING_DFH(RING_TAIL, D_ALL, 0, NULL, NULL);
+	MMIO_RING_DFH(RING_HEAD, D_ALL, 0, NULL, NULL);
+	MMIO_RING_DFH(RING_CTL, D_ALL, 0, NULL, NULL);
+	MMIO_RING_DFH(RING_ACTHD, D_ALL, 0, mmio_read_from_hw, NULL);
+	MMIO_RING_GM(RING_START, D_ALL, NULL, NULL);
 
 	/* RING MODE */
 #define RING_REG(base) _MMIO((base) + 0x29c)
@@ -2686,7 +2687,7 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(_MMIO(0x4094), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
 
 	MMIO_DFH(ARB_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_RING_GM_RDR(RING_BBADDR, D_ALL, NULL, NULL);
+	MMIO_RING_GM(RING_BBADDR, D_ALL, NULL, NULL);
 	MMIO_DFH(_MMIO(0x2220), D_ALL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x12220), D_ALL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x22220), D_ALL, F_CMD_ACCESS, NULL, NULL);
@@ -2771,7 +2772,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 	MMIO_DH(GEN8_MASTER_IRQ, D_BDW_PLUS, NULL,
 		intel_vgpu_reg_master_irq_handler);
 
-	MMIO_RING_DFH(RING_ACTHD_UDW, D_BDW_PLUS, F_CMD_ACCESS,
+	MMIO_RING_DFH(RING_ACTHD_UDW, D_BDW_PLUS, 0,
 		mmio_read_from_hw, NULL);
 
 #define RING_REG(base) _MMIO((base) + 0xd0)
@@ -2785,7 +2786,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 #undef RING_REG
 
 #define RING_REG(base) _MMIO((base) + 0x234)
-	MMIO_RING_F(RING_REG, 8, F_RO | F_CMD_ACCESS, 0, ~0, D_BDW_PLUS,
+	MMIO_RING_F(RING_REG, 8, F_RO, 0, ~0, D_BDW_PLUS,
 		NULL, NULL);
 #undef RING_REG
 
@@ -2820,7 +2821,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
 #undef RING_REG
 
-	MMIO_RING_GM_RDR(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
+	MMIO_RING_GM(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
 
 	MMIO_DFH(HDC_CHICKEN0, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 
@@ -3357,7 +3358,10 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
 	gvt->mmio.mmio_attribute = NULL;
 }
 
-/* Special MMIO blocks. */
+/* Special MMIO blocks. registers in MMIO block ranges should not be command
+ * accessible (should have no F_CMD_ACCESS flag).
+ * otherwise, need to update cmd_reg_handler in cmd_parser.c
+ */
 static struct gvt_mmio_block mmio_blocks[] = {
 	{D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
 	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
