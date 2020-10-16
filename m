Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8728FDA0
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 07:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06BA6E1F9;
	Fri, 16 Oct 2020 05:29:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F360A6E1F9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Oct 2020 05:29:24 +0000 (UTC)
IronPort-SDR: BNab247sXRucM5d3cR3u8TXgSuB+Xv8q9SPixWtEBet/+ucBzz2aoHRiJ7u622S9QESzCsuaUR
 x/Hd56WIYAiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="145837383"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="145837383"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 22:29:23 -0700
IronPort-SDR: sLeI7nDHCYTOOplAui8RNAs9hFKIAPj/+SORcBfsdwCCt+QhWwogCHwQ7ozhOLLqx3PJFIQJLr
 z+pmbzAy419Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="314782687"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.24])
 by orsmga003.jf.intel.com with ESMTP; 15 Oct 2020 22:29:22 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v3] drm/i915/gvt: Fix mmio handler break on BXT/APL.
Date: Fri, 16 Oct 2020 13:29:13 +0800
Message-Id: <20201016052913.209248-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.28.0
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

- Remove dup mmio handler for BXT/APL. Otherwise mmio handler will fail
  to init.
- Add engine GPR with F_CMD_ACCESS since BXT/APL will load them via
  LRI. Otherwise, guest will enter failsafe mode.

V2:
Use RCS/BCS GPR macros instead of offset.
Revise commit message.

V3:
Use GEN8_RING_CS_GPR macros on ring base.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 0031e7c43ea8..593cfc21b7b0 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3140,7 +3140,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 		 NULL, NULL);
 
 	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
+	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
 
 	return 0;
 }
@@ -3314,6 +3314,16 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
 	MMIO_D(GEN6_GFXPAUSE, D_BXT);
 	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT, NULL, NULL);
+	MMIO_F(GEN8_RING_CS_GPR(GEN6_BSD_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT, NULL, NULL);
+	MMIO_F(GEN8_RING_CS_GPR(BLT_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT, NULL, NULL);
+	MMIO_F(GEN8_RING_CS_GPR(VEBOX_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT, NULL, NULL);
 
 	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
