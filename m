Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4B249229
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 03:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F76E6E194;
	Wed, 19 Aug 2020 01:09:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FCF6E194
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 01:09:58 +0000 (UTC)
IronPort-SDR: Aofey2irojuMN1dbOum3DpBfUVfxkhizpl4D7psisy9QUFQrFJ6IUhkmXU0xMnTN7S7UIzxLeU
 nRHfEo2qBPXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="135096900"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="135096900"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 18:09:57 -0700
IronPort-SDR: VISakkPKDCVGvMR21xNoSRx1sUAWCGLyGwdXLWSCYpKURUp+QlyqiUtkKGwR0VQJyGH+ztyNld
 xV4Dg/CdMThw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="336801935"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga007.jf.intel.com with ESMTP; 18 Aug 2020 18:09:56 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Skip writing 0 to HWSP during D3 resume
Date: Wed, 19 Aug 2020 09:09:53 +0800
Message-Id: <20200819010953.55350-1-colin.xu@intel.com>
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

Guest driver may reset HWSP to 0 as init value during D3->D0:
The full sequence is:
- Boot ->D0
- Update HWSP
- D0->D3
- ...In D3 state...
- D3->D0
- DMLR reset.
- Set engine HWSP to 0.
- Set engine ring mode to 0.
- Set engine HWSP to correct value.
- Set engine ring mode to correct value.
Ring mode is masked register so set 0 won't take effect.
However HWPS addr 0 is considered as invalid GGTT address which will
report error like:
gvt: vgpu 1: write invalid HWSP address, reg:0x2080, value:0x0

During vGPU in D3, per-engine HWSP gpa remains valid so we can skip
update HWSP in this case.
Check both pv_notified and previous engine HWSP gpa, if pv already
notified and previous HWSP gpa is valid, we skip this HWSP init and
let later HWSP write update the correct value. We also need zero out
per-engine HWSP gpa on engine reset to make sure hws_pga is valid.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 30 ++++++++++++++++++++---------
 drivers/gpu/drm/i915/gvt/vgpu.c     |  7 +++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 840572add2d4..72860aaf1656 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1489,12 +1489,6 @@ static int hws_pga_write(struct intel_vgpu *vgpu, unsigned int offset,
 	const struct intel_engine_cs *engine =
 		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
 
-	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
-		gvt_vgpu_err("write invalid HWSP address, reg:0x%x, value:0x%x\n",
-			      offset, value);
-		return -EINVAL;
-	}
-
 	/*
 	 * Need to emulate all the HWSP register write to ensure host can
 	 * update the VM CSB status correctly. Here listed registers can
@@ -1505,9 +1499,27 @@ static int hws_pga_write(struct intel_vgpu *vgpu, unsigned int offset,
 			     offset);
 		return -EINVAL;
 	}
-	vgpu->hws_pga[engine->id] = value;
-	gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: 0x%x\n",
-		     vgpu->id, value, offset);
+
+	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
+		u32 old = vgpu->hws_pga[engine->id];
+
+		/* Skip zero out RING_HWS_PGA during D3 resume */
+		if (vgpu->pv_notified && value == 0 &&
+		    intel_gvt_ggtt_validate_range(vgpu, old,
+						  I915_GTT_PAGE_SIZE)) {
+			gvt_dbg_mmio("Skip zero out HWSP address, reg:0x%x, "
+				     "value:0x%x\n", offset, value);
+
+		} else {
+			gvt_vgpu_err("write invalid HWSP address, reg:0x%x, "
+				     "value:0x%x\n", offset, value);
+			return -EINVAL;
+		}
+	} else {
+		vgpu->hws_pga[engine->id] = value;
+		gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: 0x%x\n",
+			     vgpu->id, value, offset);
+	}
 
 	return intel_vgpu_default_mmio_write(vgpu, offset, &value, bytes);
 }
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 8fa9b31a2484..e0e073045d83 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -558,6 +558,9 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 	intel_vgpu_reset_submission(vgpu, resetting_eng);
 	/* full GPU reset or device model level reset */
 	if (engine_mask == ALL_ENGINES || dmlr) {
+		struct intel_engine_cs *engine;
+		intel_engine_mask_t tmp;
+
 		intel_vgpu_select_submission_ops(vgpu, ALL_ENGINES, 0);
 		if (engine_mask == ALL_ENGINES)
 			intel_vgpu_invalidate_ppgtt(vgpu);
@@ -588,6 +591,10 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 			else
 				vgpu->pv_notified = false;
 		}
+
+		for_each_engine_masked(engine, gvt->gt, engine_mask, tmp) {
+			vgpu->hws_pga[engine->id] = 0;
+		}
 	}
 
 	vgpu->resetting_eng = 0;
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
