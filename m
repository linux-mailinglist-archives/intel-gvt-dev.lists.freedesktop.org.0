Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E611FF69
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Dec 2019 09:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9D6E130;
	Mon, 16 Dec 2019 08:09:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C041A6E130
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 16 Dec 2019 08:09:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 00:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="416358695"
Received: from cfl-host.sh.intel.com ([10.239.13.96])
 by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2019 00:09:06 -0800
From: Gao Fred <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/gvt: Fix guest boot warning
Date: Tue, 17 Dec 2019 00:02:55 +0800
Message-Id: <20191216160255.29499-1-fred.gao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Gao Fred <fred.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

    Simulate MIA core in reset status once GUC engine is reset.

    v2: 1. use vgpu_vreg_t() function,
        2. clear MIA_IN_RESET after reading. (Zhenyu)
    v3: add comments. (Zhenyu)

Signed-off-by: Gao Fred <fred.gao@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index bb9fe6bf5275..c5e870a83d68 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -341,6 +341,10 @@ static int gdrst_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 			gvt_dbg_mmio("vgpu%d: request VCS2 Reset\n", vgpu->id);
 			engine_mask |= BIT(VCS1);
 		}
+		if (data & GEN9_GRDOM_GUC) {
+			gvt_dbg_mmio("vgpu%d: request GUC Reset\n", vgpu->id);
+			vgpu_vreg_t(vgpu, GUC_STATUS) |= GS_MIA_IN_RESET;
+		}
 		engine_mask &= INTEL_INFO(vgpu->gvt->dev_priv)->engine_mask;
 	}
 
@@ -1636,6 +1640,15 @@ static int edp_psr_imr_iir_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
+static int guc_status_read(struct intel_vgpu *vgpu,
+		unsigned int offset, void *p_data, unsigned int bytes)
+{
+	/* keep MIA_IN_RESET before clearing */
+	read_vreg(vgpu, offset, p_data, bytes);
+	vgpu_vreg(vgpu, offset) &= ~GS_MIA_IN_RESET;
+	return 0;
+}
+
 static int mmio_read_from_hw(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
 {
@@ -2672,6 +2685,8 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 
 	MMIO_DH(EDP_PSR_IMR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
 	MMIO_DH(EDP_PSR_IIR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
+	MMIO_DH(GUC_STATUS, D_ALL, guc_status_read, NULL);
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
