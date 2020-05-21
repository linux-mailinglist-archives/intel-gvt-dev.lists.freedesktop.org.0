Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AC1DC371
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 May 2020 02:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BC46E8BD;
	Thu, 21 May 2020 00:15:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3FD6E8BD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 May 2020 00:15:01 +0000 (UTC)
IronPort-SDR: d4W5NVIJzAivzCxBmoldBFrHCp0VyeKVLvDFM1WDq/ghHZlSBuax1Dxz7KP9pHicVpHuSreL23
 tmikDTP0cuNA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 17:15:01 -0700
IronPort-SDR: k3+i4sZ1/qPXe2myPLOkNeaFv1lhiaIrGoA5bY7UvwGvkX2c6VKm7cvBeWa0/GhK4V3lU6vAU1
 iY2JgYhKU3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,415,1583222400"; d="scan'208";a="412204649"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.120])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 17:15:00 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2] drm/gvt/i915: Fix two missed and add one MMIO handling for
 CFL
Date: Thu, 21 May 2020 08:14:58 +0800
Message-Id: <20200521001458.16895-1-colin.xu@intel.com>
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

D_CFL was incorrectly removed for:
GAMT_CHKN_BIT_REG
GEN9_CTX_PREEMPT_REG

Add _PLANE_SURF_3_B.

Fixes: 43226e6fe798 (drm/i915/gvt: replaced register address with name)

V2: Update commit message.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 3e88e3b5c43a..f39a6b20bbaf 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3055,6 +3055,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
 	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
 	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
 
 	MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
 	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
@@ -3131,8 +3132,8 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
 		 NULL, NULL);
 
-	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL);
-	MMIO_D(GEN9_CTX_PREEMPT_REG, D_KBL | D_SKL);
+	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
+	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
