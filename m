Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F87028AD5E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 12 Oct 2020 06:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D199A6E41D;
	Mon, 12 Oct 2020 04:52:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF576E41D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Oct 2020 04:52:34 +0000 (UTC)
IronPort-SDR: Z+kpJXz8/RHAgMocXjThV0kZ3bpCFAVWHlWLG6rWcOKVmVoLR4SIS7eA9Qb0/QRM1zhXSXNdtn
 TxKV9+IhGYLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="250383954"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="250383954"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 21:52:34 -0700
IronPort-SDR: j0rOufZlH2hPBFaV/L6FpLxhk4AkeZ6B0iqzPzar6q1EvICYwZb9CrMGj0Qd8FiyFugM9Fw4m7
 dWr5ys5bBlpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="529806896"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga005.jf.intel.com with ESMTP; 11 Oct 2020 21:52:33 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU
 BB hang
Date: Mon, 12 Oct 2020 12:52:31 +0800
Message-Id: <20201012045231.226748-1-colin.xu@intel.com>
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

If guest fills non-priv bb on ApolloLake/Broxton as Mesa i965 does in:
717e7539124d (i965: Use a WC map and memcpy for the batch instead of pw-)
Due to the missing flush of bb filled by VM vCPU, host GPU hangs on
executing these MI_BATCH_BUFFER.

Temporarily workaround this by setting SNOOP bit for PAT3 used by PPGTT
PML4 PTE: PAT(0) PCD(1) PWT(1).

The performance is still expected to be low, will need further improvement.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 32 ++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 9891501da064..75cb0394c661 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1651,6 +1651,34 @@ static int edp_psr_imr_iir_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
+/**
+ * FixMe:
+ * If guest fills non-priv batch buffer on ApolloLake/Broxton as Mesa i965 did:
+ * 717e7539124d (i965: Use a WC map and memcpy for the batch instead of pwrite.)
+ * Due to the missing flush of bb filled by VM vCPU, host GPU hangs on executing
+ * these MI_BATCH_BUFFER.
+ * Temporarily workaround this by setting SNOOP bit for PAT3 used by PPGTT
+ * PML4 PTE: PAT(0) PCD(1) PWT(1).
+ * The performance is still expected to be low, will need further improvement.
+ */
+static int bxt_ppat_low_write(struct intel_vgpu *vgpu, unsigned int offset,
+			      void *p_data, unsigned int bytes)
+{
+	u64 pat =
+		GEN8_PPAT(0, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(1, 0) |
+		GEN8_PPAT(2, 0) |
+		GEN8_PPAT(3, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(4, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(5, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(6, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(7, CHV_PPAT_SNOOP);
+
+	vgpu_vreg(vgpu, offset) = lower_32_bits(pat);
+
+	return 0;
+}
+
 static int guc_status_read(struct intel_vgpu *vgpu,
 			   unsigned int offset, void *p_data,
 			   unsigned int bytes)
@@ -2813,7 +2841,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 
 	MMIO_DH(GEN6_PCODE_MAILBOX, D_BDW_PLUS, NULL, mailbox_write);
 
-	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS);
+	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS & ~D_BXT);
 	MMIO_D(GEN8_PRIVATE_PAT_HI, D_BDW_PLUS);
 
 	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
@@ -3323,6 +3351,8 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
 
 	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 
+	MMIO_DH(GEN8_PRIVATE_PAT_LO, D_BXT, NULL, bxt_ppat_low_write);
+
 	return 0;
 }
 
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
