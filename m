Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34632D39F6
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Dec 2020 05:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926686E0EC;
	Wed,  9 Dec 2020 04:55:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558536E0EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Dec 2020 04:55:03 +0000 (UTC)
IronPort-SDR: LGLWMDBLaCzqecmw4eGjPrbdiV50s1GCevFv6WVGLLGOfxR+bz/0Uo7IPLTMC+f6U25H3k7Xmw
 5sWyKkeE7sUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="192318857"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="192318857"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:55:03 -0800
IronPort-SDR: 3Pdw8+wWYw9HFX0d6RlJP5V9a+WPYuwsm6glf2Wp8t0GpQthYLlG56yKERyEdoHKtAQABYEliQ
 wbvW1unV+G1w==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="542264170"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:55:01 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v3 11/11] drm/i915/gvt: unify lri cmd handler and mmio handlers
Date: Wed,  9 Dec 2020 12:42:21 +0800
Message-Id: <20201209044221.3054-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209043949.2454-1-yan.y.zhao@intel.com>
References: <20201209043949.2454-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

for common ctxs and commands in workload, call mmio handlers for value
checking and command patching for registers with command fix write flag
set.

after calling mmio handlers, resotre old vreg values so as to keep vreg
unchanged after command scanning.

Note:
for regs in below catigories,
a. in ctx and save-restore list, and is inhibit ctx
b. in mocs
after cmd scanning, do not restore old vreg values, but update vreg as
what has been implemented before this patch.

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 130 +++++++++++---------------
 1 file changed, 55 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index e716f9989cf5..ce6e2c48aafd 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -834,68 +834,12 @@ static inline int cmd_length(struct parser_exec_state *s)
 	*addr = val; \
 } while (0)
 
-static bool is_shadowed_mmio(unsigned int offset)
-{
-	bool ret = false;
-
-	if ((offset == 0x2168) || /*BB current head register UDW */
-	    (offset == 0x2140) || /*BB current header register */
-	    (offset == 0x211c) || /*second BB header register UDW */
-	    (offset == 0x2114)) { /*second BB header register UDW */
-		ret = true;
-	}
-	return ret;
-}
-
-static inline bool is_force_nonpriv_mmio(unsigned int offset)
-{
-	return (offset >= 0x24d0 && offset < 0x2500);
-}
-
-static int force_nonpriv_reg_handler(struct parser_exec_state *s,
-		unsigned int offset, unsigned int index, char *cmd)
-{
-	struct intel_gvt *gvt = s->vgpu->gvt;
-	unsigned int data;
-	u32 ring_base;
-	u32 nopid;
-
-	if (!strcmp(cmd, "lri"))
-		data = cmd_val(s, index + 1);
-	else {
-		gvt_err("Unexpected forcenonpriv 0x%x write from cmd %s\n",
-			offset, cmd);
-		return -EINVAL;
-	}
-
-	ring_base = s->engine->mmio_base;
-	nopid = i915_mmio_reg_offset(RING_NOPID(ring_base));
-
-	if (!intel_gvt_in_force_nonpriv_whitelist(gvt, data) &&
-			data != nopid) {
-		gvt_err("Unexpected forcenonpriv 0x%x LRI write, value=0x%x\n",
-			offset, data);
-		patch_value(s, cmd_ptr(s, index), nopid);
-		return 0;
-	}
-	return 0;
-}
-
 static inline bool is_mocs_mmio(unsigned int offset)
 {
 	return ((offset >= 0xc800) && (offset <= 0xcff8)) ||
 		((offset >= 0xb020) && (offset <= 0xb0a0));
 }
 
-static int mocs_cmd_reg_handler(struct parser_exec_state *s,
-				unsigned int offset, unsigned int index)
-{
-	if (!is_mocs_mmio(offset))
-		return -EINVAL;
-	vgpu_vreg(s->vgpu, offset) = cmd_val(s, index + 1);
-	return 0;
-}
-
 static int is_cmd_update_pdps(unsigned int offset,
 			      struct parser_exec_state *s)
 {
@@ -943,6 +887,7 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 	struct intel_vgpu *vgpu = s->vgpu;
 	struct intel_gvt *gvt = vgpu->gvt;
 	u32 ctx_sr_ctl;
+	u32 *vreg, vreg_old;
 
 	if (offset + 4 > gvt->device_info.mmio_size) {
 		gvt_vgpu_err("%s access to (%x) outside of MMIO range\n",
@@ -966,25 +911,6 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		return -EBADRQC;
 	}
 
-	if (is_shadowed_mmio(offset)) {
-		gvt_vgpu_err("found access of shadowed MMIO %x\n", offset);
-		return 0;
-	}
-
-	if (is_mocs_mmio(offset) &&
-	    mocs_cmd_reg_handler(s, offset, index))
-		return -EINVAL;
-
-	if (is_force_nonpriv_mmio(offset) &&
-		force_nonpriv_reg_handler(s, offset, index, cmd))
-		return -EPERM;
-
-	if (offset == i915_mmio_reg_offset(DERRMR) ||
-		offset == i915_mmio_reg_offset(FORCEWAKE_MT)) {
-		/* Writing to HW VGT_PVINFO_PAGE offset will be discarded */
-		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
-	}
-
 	if (!strncmp(cmd, "srm", 3) ||
 			!strncmp(cmd, "lrm", 3)) {
 		if (offset != i915_mmio_reg_offset(GEN8_L3SQCREG4) &&
@@ -1007,10 +933,64 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		return 0;
 	}
 
+	if (strncmp(cmd, "lri", 3))
+		return -EPERM;
+
+	/* below are all lri handlers */
+	vreg = &vgpu_vreg(s->vgpu, offset);
+	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
+		gvt_vgpu_err("%s access to non-render register (%x)\n",
+				cmd, offset);
+		return -EBADRQC;
+	}
+
 	if (is_cmd_update_pdps(offset, s) &&
 	    cmd_pdp_mmio_update_handler(s, offset, index))
 		return -EINVAL;
 
+	if (offset == i915_mmio_reg_offset(DERRMR) ||
+		offset == i915_mmio_reg_offset(FORCEWAKE_MT)) {
+		/* Writing to HW VGT_PVINFO_PAGE offset will be discarded */
+		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
+	}
+
+	if (is_mocs_mmio(offset))
+		*vreg = cmd_val(s, index + 1);
+
+	vreg_old = *vreg;
+
+	if (intel_gvt_mmio_is_cmd_write_patch(gvt, offset)) {
+		u32 cmdval_new, cmdval;
+		struct intel_gvt_mmio_info *mmio_info;
+
+		cmdval = cmd_val(s, index + 1);
+
+		mmio_info = intel_gvt_find_mmio_info(gvt, offset);
+		if (!mmio_info) {
+			cmdval_new = cmdval;
+		} else {
+			u64 ro_mask = mmio_info->ro_mask;
+			int ret;
+
+			if (likely(!ro_mask))
+				ret = mmio_info->write(s->vgpu, offset,
+						&cmdval, 4);
+			else {
+				gvt_vgpu_err("try to write RO reg %x\n",
+						offset);
+				ret = -EBADRQC;
+			}
+			if (ret)
+				return ret;
+			cmdval_new = *vreg;
+		}
+		if (cmdval_new != cmdval)
+			patch_value(s, cmd_ptr(s, index+1), cmdval_new);
+	}
+
+	/* only patch cmd. restore vreg value if changed in mmio write handler*/
+	*vreg = vreg_old;
+
 	/* TODO
 	 * In order to let workload with inhibit context to generate
 	 * correct image data into memory, vregs values will be loaded to
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
