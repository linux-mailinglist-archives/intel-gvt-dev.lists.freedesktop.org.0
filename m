Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAA1E9BF4
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Jun 2020 05:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C57689E7B;
	Mon,  1 Jun 2020 03:06:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2435489E7B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Jun 2020 03:06:43 +0000 (UTC)
IronPort-SDR: x+DBwzRry5lqlgkh35cQpKv+yT4U+rMC15ZAp/p13dJv8txYw6D9fKnjBbD6b/ZzyNp6FqI1ZT
 H8vSSTmtVbLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 20:06:42 -0700
IronPort-SDR: G5ucKJ/obdLxvS+CsgrLfzUTAFmAazyU4KlJiTe7+itx+JP1T1xcbogbmxLcBAjrPpMvdhz/5W
 c92fxQZOXLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="444131408"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.113])
 by orsmga005.jf.intel.com with ESMTP; 31 May 2020 20:06:41 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V3] drm/i915/gvt: Fix two CFL MMIO handling caused by
 regression.
Date: Mon,  1 Jun 2020 11:06:38 +0800
Message-Id: <20200601030638.16002-1-colin.xu@intel.com>
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

Fixes: 43226e6fe798 (drm/i915/gvt: replaced register address with name)

D_CFL was incorrectly removed for:
GAMT_CHKN_BIT_REG
GEN9_CTX_PREEMPT_REG

V2: Update commit message.
V3: Rebase and split Fixes and mis-handled MMIO.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 3e88e3b5c43a..d2839cc036c1 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3131,8 +3131,8 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
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
