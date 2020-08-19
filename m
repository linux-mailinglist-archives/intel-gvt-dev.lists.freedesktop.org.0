Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8FE249220
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 03:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1EC6E194;
	Wed, 19 Aug 2020 01:08:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AF56E194
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 01:08:07 +0000 (UTC)
IronPort-SDR: A+4QzLEUi0tb+iMnKMtzZp8Id4bucBaEJBtBCZi/EmJVQNU1CXmQO2Blavne3n4NrQWbNOnGhd
 pWJGu0eBOMJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152649624"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="152649624"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 18:08:06 -0700
IronPort-SDR: R6mT6HWCls0EZOG9sc6LSnSlj/jnzj7FF1bZ279tIJ0PnTHTp0ED5yPNBd+weyZ3Aa7CWN1zVo
 q1e3WiLK+APw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="441425212"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga004.jf.intel.com with ESMTP; 18 Aug 2020 18:08:05 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO
 access
Date: Wed, 19 Aug 2020 09:08:01 +0800
Message-Id: <20200819010801.53411-1-colin.xu@intel.com>
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

Without F_CMD_ACCESS, guest LRI cmd will fail due to "access to
non-render register" when init below WAs:
WaDisableDynamicCreditSharing: GAMT_CHKN_BIT_REG
WaCompressedResourceSamplerPbeMediaNewHashMode: MMCD_MISC_CTRL

So add F_CMD_ACCESS to the two MMIO.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index d55cb43c9bd4..840572add2d4 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2922,7 +2922,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
 	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
 	MMIO_DFH(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DH(MMCD_MISC_CTRL, D_SKL_PLUS, NULL, NULL);
+	MMIO_DFH(MMCD_MISC_CTRL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DH(CHICKEN_PAR1_1, D_SKL_PLUS, NULL, NULL);
 	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
 	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
@@ -3138,7 +3138,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
 		 NULL, NULL);
 
-	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
+	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
 
 	return 0;
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
