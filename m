Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D6811DFA2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Dec 2019 09:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967766E28A;
	Fri, 13 Dec 2019 08:46:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBF56E28A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Dec 2019 08:46:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 00:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="239231039"
Received: from cfl-host.sh.intel.com ([10.239.13.96])
 by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2019 00:46:05 -0800
From: Gao Fred <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Fix guest boot warning
Date: Sat, 14 Dec 2019 00:45:08 +0800
Message-Id: <20191213164508.7090-1-fred.gao@intel.com>
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

Signed-off-by: Gao Fred <fred.gao@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index bb9fe6bf5275..8e84850197e0 100644
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
 
@@ -1636,6 +1640,14 @@ static int edp_psr_imr_iir_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
+static int guc_status_read(struct intel_vgpu *vgpu,
+		unsigned int offset, void *p_data, unsigned int bytes)
+{
+	read_vreg(vgpu, offset, p_data, bytes);
+	vgpu_vreg(vgpu, offset) &= ~GS_MIA_IN_RESET;
+	return 0;
+}
+
 static int mmio_read_from_hw(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
 {
@@ -2672,6 +2684,8 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 
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
