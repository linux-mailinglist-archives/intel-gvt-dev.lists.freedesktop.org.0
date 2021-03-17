Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A2233E73A
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Mar 2021 03:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638C96E0A0;
	Wed, 17 Mar 2021 02:55:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C856E0A0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Mar 2021 02:55:47 +0000 (UTC)
IronPort-SDR: wFkCnxPlCuTNvXAjHo0EBOUYc1ME3/uT+zz4+sL7qQVOhtNSCl28VF6Yu4DjkQykKnnEuAKKda
 yIhTUYwk5rZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="189469162"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="189469162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 19:55:46 -0700
IronPort-SDR: tnUxgGADLeZ7i7QCogzmXNsgxBurNT1KdUovRM9pJ2AoyUWJeIeTBr6cz1tk94zGLUGYVDDZzX
 +exFi+ErqWmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="590888323"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.25])
 by orsmga005.jf.intel.com with ESMTP; 16 Mar 2021 19:55:45 -0700
From: Colin Xu <colin.xu@intel.com>
To: stable@vger.kernel.org
Subject: [PATCH 2/5] drm/i915/gvt: Fix mmio handler break on BXT/APL.
Date: Wed, 17 Mar 2021 10:55:01 +0800
Message-Id: <71b10da4af9e8be3b38b99382e164dd4e83fdf27.1615946755.git.colin.xu@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1615946755.git.colin.xu@intel.com>
References: <cover.1615946755.git.colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, colin.xu@intel.com,
 zhenyuw@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

commit 92010a97098c4c9fd777408cc98064d26b32695b upstream

- Remove dup mmio handler for BXT/APL. Otherwise mmio handler will fail
  to init.
- Add engine GPR with F_CMD_ACCESS since BXT/APL will load them via
  LRI. Otherwise, guest will enter failsafe mode.

V2:
Use RCS/BCS GPR macros instead of offset.
Revise commit message.

V3:
Use GEN8_RING_CS_GPR macros on ring base.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20201016052913.209248-1-colin.xu@intel.com
(cherry picked from commit 92010a97098c4c9fd777408cc98064d26b32695b)
Signed-off-by: Colin Xu <colin.xu@intel.com>
Cc: <stable@vger.kernel.org> # 5.4.y
---
 drivers/gpu/drm/i915/gvt/handlers.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index f14aefcb5b7b..245c20d36f1b 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3132,7 +3132,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 		 NULL, NULL);
 
 	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
-	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
+	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
 
 	return 0;
 }
@@ -3306,6 +3306,12 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
 	MMIO_D(GEN6_GFXPAUSE, D_BXT);
 	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_F(HSW_CS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x12600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(BCS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x1a600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
 
 	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
