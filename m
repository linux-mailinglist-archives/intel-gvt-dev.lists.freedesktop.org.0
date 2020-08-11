Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2324166E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 08:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32FA6E0FB;
	Tue, 11 Aug 2020 06:45:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2376E0FB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Aug 2020 06:44:59 +0000 (UTC)
IronPort-SDR: ip2k9bJeJeeKSKUHE9R92u8An3vI/4b5LAh+tjeYiYvNwKAKbX46Da/UAW4bBWbRGZTz75I/Z3
 euE+M0e20HTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="154798216"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="154798216"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 23:44:58 -0700
IronPort-SDR: 5IGXbSDGamRk4Jmzu0PJCOUEYXoDCT2QYZ3077+bjsybLEQOUIMBsh230XGrKYP6uGa/2RBscB
 PVJXtqvymq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="324676172"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2020 23:44:57 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH 1/4] drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
Date: Tue, 11 Aug 2020 14:09:44 +0800
Message-Id: <20200811060944.3039-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811055140.29123-1-yan.y.zhao@intel.com>
References: <20200811055140.29123-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

F_IN_CTX is an inaccurate flag name, because people may falsly think all
mmios in context image are of this flag. But actually, this flag is only
for mmios both in GVT's save-restore list and in hardare logical
context's image.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
 drivers/gpu/drm/i915/gvt/gvt.h          | 23 ++++++++++++++---------
 drivers/gpu/drm/i915/gvt/mmio_context.c |  2 +-
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index f1940939260a..018509eeb0fe 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -976,7 +976,7 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 	 * inhibit context will restore with correct values
 	 */
 	if (IS_GEN(s->engine->i915, 9) &&
-	    intel_gvt_mmio_is_in_ctx(gvt, offset) &&
+	    intel_gvt_mmio_is_sr_in_ctx(gvt, offset) &&
 	    !strncmp(cmd, "lri", 3)) {
 		intel_gvt_hypervisor_read_gpa(s->vgpu,
 			s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index a4a6db6b7f90..899945b91cc6 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -256,8 +256,10 @@ struct intel_gvt_mmio {
 #define F_CMD_ACCESSED	(1 << 5)
 /* This reg could be accessed by unaligned address */
 #define F_UNALIGN	(1 << 6)
-/* This reg is saved/restored in context */
-#define F_IN_CTX	(1 << 7)
+/* This reg is in GVT's mmio save-restor list and in hardware
+ * logical context image
+ */
+#define F_SR_IN_CTX	(1 << 7)
 
 	struct gvt_mmio_block *mmio_block;
 	unsigned int num_mmio_block;
@@ -645,30 +647,33 @@ static inline bool intel_gvt_mmio_has_mode_mask(
 }
 
 /**
- * intel_gvt_mmio_is_in_ctx - check if a MMIO has in-ctx mask
+ * intel_gvt_mmio_is_sr_in_ctx -
+ *		check if an MMIO has F_SR_IN_CTX mask
  * @gvt: a GVT device
  * @offset: register offset
  *
  * Returns:
- * True if a MMIO has a in-context mask, false if it isn't.
+ * True if an MMIO has an F_SR_IN_CTX  mask, false if it isn't.
  *
  */
-static inline bool intel_gvt_mmio_is_in_ctx(
+static inline bool intel_gvt_mmio_is_sr_in_ctx(
 			struct intel_gvt *gvt, unsigned int offset)
 {
-	return gvt->mmio.mmio_attribute[offset >> 2] & F_IN_CTX;
+	return gvt->mmio.mmio_attribute[offset >> 2] & F_SR_IN_CTX;
 }
 
 /**
- * intel_gvt_mmio_set_in_ctx - mask a MMIO in logical context
+ * intel_gvt_mmio_set_sr_in_ctx -
+ *		mask an MMIO in GVT's mmio save-restore list and also
+ *		in hardware logical context image
  * @gvt: a GVT device
  * @offset: register offset
  *
  */
-static inline void intel_gvt_mmio_set_in_ctx(
+static inline void intel_gvt_mmio_set_sr_in_ctx(
 			struct intel_gvt *gvt, unsigned int offset)
 {
-	gvt->mmio.mmio_attribute[offset >> 2] |= F_IN_CTX;
+	gvt->mmio.mmio_attribute[offset >> 2] |= F_SR_IN_CTX;
 }
 
 void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 2ccaf78f96e8..83471535681e 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -595,7 +595,7 @@ void intel_gvt_init_engine_mmio_context(struct intel_gvt *gvt)
 	     i915_mmio_reg_valid(mmio->reg); mmio++) {
 		if (mmio->in_context) {
 			gvt->engine_mmio_list.ctx_mmio_count[mmio->id]++;
-			intel_gvt_mmio_set_in_ctx(gvt, mmio->reg.reg);
+			intel_gvt_mmio_set_sr_in_ctx(gvt, mmio->reg.reg);
 		}
 	}
 }
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
