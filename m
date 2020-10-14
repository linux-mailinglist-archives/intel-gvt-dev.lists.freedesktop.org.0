Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB528D7EB
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 14 Oct 2020 03:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23626E027;
	Wed, 14 Oct 2020 01:18:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21E16E027
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 14 Oct 2020 01:18:20 +0000 (UTC)
IronPort-SDR: xCc5lW9wYw4oX87edj8w280j6fh0KQk3SmTiXCevk3vrn4BYS+4yPJQI4zCwyyST+NFBhcJiuc
 CyP0uM8x/uRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="152950713"
X-IronPort-AV: E=Sophos;i="5.77,372,1596524400"; d="scan'208";a="152950713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 18:18:19 -0700
IronPort-SDR: Wg1tRdnBB4TV6S8DcHgPMLnBKRJWiZjot+1Np0R4MzdUvrpT5cLMt00DJvoIsRUNiuBwQNNxpf
 w8ZekjEpIhyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,372,1596524400"; d="scan'208";a="299789452"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2020 18:18:19 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Fix mmio handler break on BXT/APL.
Date: Wed, 14 Oct 2020 09:18:16 +0800
Message-Id: <20201014011816.11926-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
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
Revise comment.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 0031e7c43ea8..2691ae841971 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3140,7 +3140,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 		 NULL, NULL);
 
 	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
+	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
 
 	return 0;
 }
@@ -3314,6 +3314,12 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
 	MMIO_D(GEN6_GFXPAUSE, D_BXT);
 	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_F(HSW_CS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x12600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(BCS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x2a600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
 
 	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
