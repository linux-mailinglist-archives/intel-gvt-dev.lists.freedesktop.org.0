Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1B97AF30
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Sep 2024 12:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D765B10E15D;
	Tue, 17 Sep 2024 10:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIpie9N0";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192B10E15D;
 Tue, 17 Sep 2024 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726570363; x=1758106363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uxcpabo6UL6/RaP5XMxT4icJsClikrqFDo/T19eTPuQ=;
 b=fIpie9N0J3hY9GOdKZ9Bs3ra+z00gf+LriWpk9s3PJBfpkv8tfCk2Gwp
 +9RuX7vuDkG6RfyBB3DR+30sPWc+4QgO6d5aDn+8wYIj/7z8KKYc4Grme
 P7TZAG/6vJvvTES8gtBPAQxPqvvHEzf872iPoM9eMJTyccF5ZMyyfMxW7
 9qjtj3QWWCkcxZRKrnRTJuv8w0CX2kL9iWmCsSLqdbEiju0CgO2RXXg0U
 i6EIc8xZtBJvN1GnlakJq8gZr4CfIpfLByrL6E1opjgYlaTP2+SaIj1A0
 rybPeUWiV1IYiNUlwvt3PZkp6cZnqQeR0uoCId+BUKOkrBRimALs8CKPW w==;
X-CSE-ConnectionGUID: m+G1JDstTPWIJ83NKe2ucA==
X-CSE-MsgGUID: tcUMiFRcQyW+QV2/A0Ijng==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29317656"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29317656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 03:52:36 -0700
X-CSE-ConnectionGUID: RZQkZxLwRW67xUDRsO0lZA==
X-CSE-MsgGUID: YRk2d25SQjSLzmpSslaCEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="74146224"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 03:52:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH] drm/i915/gvt: use macros from drm_dp.h instead of duplication
Date: Tue, 17 Sep 2024 13:52:26 +0300
Message-Id: <20240917105226.768276-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Use the existing macros in drm_dp.h for DPCD and DP AUX instead of
duplicating. Remove unused macros, as well as the duplicate definition
of DPCD_SIZE.

AUX_NATIVE_REPLY_NAK is left unchanged, as it does not match
DP_AUX_NATIVE_REPLY_NACK, and I'm not sure what the right thing to do is
here.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c  |  4 ++-
 drivers/gpu/drm/i915/gvt/display.h  | 42 ----------------------------
 drivers/gpu/drm/i915/gvt/edid.c     | 12 ++++----
 drivers/gpu/drm/i915/gvt/edid.h     |  8 ------
 drivers/gpu/drm/i915/gvt/handlers.c | 43 +++++++++++++++++------------
 5 files changed, 36 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index c66d6d3177c8..17f74cb244bb 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -32,6 +32,8 @@
  *
  */
 
+#include <drm/display/drm_dp.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "gvt.h"
@@ -568,7 +570,7 @@ static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num,
 
 	memcpy(port->dpcd->data, dpcd_fix_data, DPCD_HEADER_SIZE);
 	port->dpcd->data_valid = true;
-	port->dpcd->data[DPCD_SINK_COUNT] = 0x1;
+	port->dpcd->data[DP_SINK_COUNT] = 0x1;
 	port->type = type;
 	port->id = resolution;
 	port->vrefresh_k = GVT_DEFAULT_REFRESH_RATE * MSEC_PER_SEC;
diff --git a/drivers/gpu/drm/i915/gvt/display.h b/drivers/gpu/drm/i915/gvt/display.h
index f5616f99ef2f..8090bc53c7e1 100644
--- a/drivers/gpu/drm/i915/gvt/display.h
+++ b/drivers/gpu/drm/i915/gvt/display.h
@@ -59,52 +59,10 @@ struct intel_vgpu;
 
 #define INTEL_GVT_MAX_UEVENT_VARS	3
 
-/* DPCD start */
-#define DPCD_SIZE	0x700
-
-/* DPCD */
-#define DP_SET_POWER            0x600
-#define DP_SET_POWER_D0         0x1
-#define AUX_NATIVE_WRITE        0x8
-#define AUX_NATIVE_READ         0x9
-
-#define AUX_NATIVE_REPLY_MASK   (0x3 << 4)
-#define AUX_NATIVE_REPLY_ACK    (0x0 << 4)
 #define AUX_NATIVE_REPLY_NAK    (0x1 << 4)
-#define AUX_NATIVE_REPLY_DEFER  (0x2 << 4)
 
 #define AUX_BURST_SIZE          20
 
-/* DPCD addresses */
-#define DPCD_REV			0x000
-#define DPCD_MAX_LINK_RATE		0x001
-#define DPCD_MAX_LANE_COUNT		0x002
-
-#define DPCD_TRAINING_PATTERN_SET	0x102
-#define	DPCD_SINK_COUNT			0x200
-#define DPCD_LANE0_1_STATUS		0x202
-#define DPCD_LANE2_3_STATUS		0x203
-#define DPCD_LANE_ALIGN_STATUS_UPDATED	0x204
-#define DPCD_SINK_STATUS		0x205
-
-/* link training */
-#define DPCD_TRAINING_PATTERN_SET_MASK	0x03
-#define DPCD_LINK_TRAINING_DISABLED	0x00
-#define DPCD_TRAINING_PATTERN_1		0x01
-#define DPCD_TRAINING_PATTERN_2		0x02
-
-#define DPCD_CP_READY_MASK		(1 << 6)
-
-/* lane status */
-#define DPCD_LANES_CR_DONE		0x11
-#define DPCD_LANES_EQ_DONE		0x22
-#define DPCD_SYMBOL_LOCKED		0x44
-
-#define DPCD_INTERLANE_ALIGN_DONE	0x01
-
-#define DPCD_SINK_IN_SYNC		0x03
-/* DPCD end */
-
 #define SBI_RESPONSE_MASK               0x3
 #define SBI_RESPONSE_SHIFT              0x1
 #define SBI_STAT_MASK                   0x1
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index c022dc736045..0a357ca42db1 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -32,6 +32,8 @@
  *
  */
 
+#include <drm/display/drm_dp.h>
+
 #include "display/intel_dp_aux_regs.h"
 #include "display/intel_gmbus_regs.h"
 #include "gvt.h"
@@ -504,13 +506,13 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 	}
 
 	/* Always set the wanted value for vms. */
-	ret_msg_size = (((op & 0x1) == GVT_AUX_I2C_READ) ? 2 : 1);
+	ret_msg_size = (((op & 0x1) == DP_AUX_I2C_READ) ? 2 : 1);
 	vgpu_vreg(vgpu, offset) =
 		DP_AUX_CH_CTL_DONE |
 		DP_AUX_CH_CTL_MESSAGE_SIZE(ret_msg_size);
 
 	if (msg_length == 3) {
-		if (!(op & GVT_AUX_I2C_MOT)) {
+		if (!(op & DP_AUX_I2C_MOT)) {
 			/* stop */
 			intel_vgpu_init_i2c_edid(vgpu);
 		} else {
@@ -530,7 +532,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 					i2c_edid->edid_available = true;
 			}
 		}
-	} else if ((op & 0x1) == GVT_AUX_I2C_WRITE) {
+	} else if ((op & 0x1) == DP_AUX_I2C_WRITE) {
 		/* TODO
 		 * We only support EDID reading from I2C_over_AUX. And
 		 * we do not expect the index mode to be used. Right now
@@ -538,7 +540,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 		 * support the gfx driver to do EDID access.
 		 */
 	} else {
-		if (drm_WARN_ON(&i915->drm, (op & 0x1) != GVT_AUX_I2C_READ))
+		if (drm_WARN_ON(&i915->drm, (op & 0x1) != DP_AUX_I2C_READ))
 			return;
 		if (drm_WARN_ON(&i915->drm, msg_length != 4))
 			return;
@@ -553,7 +555,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 	 * ACK of I2C_WRITE
 	 * returned byte if it is READ
 	 */
-	aux_data_for_write |= GVT_AUX_I2C_REPLY_ACK << 24;
+	aux_data_for_write |= DP_AUX_I2C_REPLY_ACK << 24;
 	vgpu_vreg(vgpu, offset + 4) = aux_data_for_write;
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/edid.h b/drivers/gpu/drm/i915/gvt/edid.h
index c3b5a55aecb3..13fd06590929 100644
--- a/drivers/gpu/drm/i915/gvt/edid.h
+++ b/drivers/gpu/drm/i915/gvt/edid.h
@@ -42,14 +42,6 @@ struct intel_vgpu;
 #define EDID_SIZE		128
 #define EDID_ADDR		0x50 /* Linux hvm EDID addr */
 
-#define GVT_AUX_NATIVE_WRITE			0x8
-#define GVT_AUX_NATIVE_READ			0x9
-#define GVT_AUX_I2C_WRITE			0x0
-#define GVT_AUX_I2C_READ			0x1
-#define GVT_AUX_I2C_STATUS			0x2
-#define GVT_AUX_I2C_MOT				0x4
-#define GVT_AUX_I2C_REPLY_ACK			0x0
-
 struct intel_vgpu_edid_data {
 	bool data_valid;
 	unsigned char edid_block[EDID_SIZE];
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 0f09344d3c20..9494d812c00a 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -36,6 +36,8 @@
 
  */
 
+#include <drm/display/drm_dp.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "gvt.h"
@@ -1129,29 +1131,36 @@ static int dp_aux_ch_ctl_trans_done(struct intel_vgpu *vgpu, u32 value,
 static void dp_aux_ch_ctl_link_training(struct intel_vgpu_dpcd_data *dpcd,
 		u8 t)
 {
-	if ((t & DPCD_TRAINING_PATTERN_SET_MASK) == DPCD_TRAINING_PATTERN_1) {
+	if ((t & DP_TRAINING_PATTERN_MASK) == DP_TRAINING_PATTERN_1) {
 		/* training pattern 1 for CR */
 		/* set LANE0_CR_DONE, LANE1_CR_DONE */
-		dpcd->data[DPCD_LANE0_1_STATUS] |= DPCD_LANES_CR_DONE;
+		dpcd->data[DP_LANE0_1_STATUS] |= DP_LANE_CR_DONE |
+			DP_LANE_CR_DONE << 4;
 		/* set LANE2_CR_DONE, LANE3_CR_DONE */
-		dpcd->data[DPCD_LANE2_3_STATUS] |= DPCD_LANES_CR_DONE;
-	} else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) ==
-			DPCD_TRAINING_PATTERN_2) {
+		dpcd->data[DP_LANE2_3_STATUS] |= DP_LANE_CR_DONE |
+			DP_LANE_CR_DONE << 4;
+	} else if ((t & DP_TRAINING_PATTERN_MASK) ==
+			DP_TRAINING_PATTERN_2) {
 		/* training pattern 2 for EQ */
 		/* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for Lane0_1 */
-		dpcd->data[DPCD_LANE0_1_STATUS] |= DPCD_LANES_EQ_DONE;
-		dpcd->data[DPCD_LANE0_1_STATUS] |= DPCD_SYMBOL_LOCKED;
+		dpcd->data[DP_LANE0_1_STATUS] |= DP_LANE_CHANNEL_EQ_DONE |
+			DP_LANE_CHANNEL_EQ_DONE << 4;
+		dpcd->data[DP_LANE0_1_STATUS] |= DP_LANE_SYMBOL_LOCKED |
+			DP_LANE_SYMBOL_LOCKED << 4;
 		/* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for Lane2_3 */
-		dpcd->data[DPCD_LANE2_3_STATUS] |= DPCD_LANES_EQ_DONE;
-		dpcd->data[DPCD_LANE2_3_STATUS] |= DPCD_SYMBOL_LOCKED;
+		dpcd->data[DP_LANE2_3_STATUS] |= DP_LANE_CHANNEL_EQ_DONE |
+			DP_LANE_CHANNEL_EQ_DONE << 4;
+		dpcd->data[DP_LANE2_3_STATUS] |= DP_LANE_SYMBOL_LOCKED |
+			DP_LANE_SYMBOL_LOCKED << 4;
 		/* set INTERLANE_ALIGN_DONE */
-		dpcd->data[DPCD_LANE_ALIGN_STATUS_UPDATED] |=
-			DPCD_INTERLANE_ALIGN_DONE;
-	} else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) ==
-			DPCD_LINK_TRAINING_DISABLED) {
+		dpcd->data[DP_LANE_ALIGN_STATUS_UPDATED] |=
+			DP_INTERLANE_ALIGN_DONE;
+	} else if ((t & DP_TRAINING_PATTERN_MASK) ==
+			DP_TRAINING_PATTERN_DISABLE) {
 		/* finish link training */
 		/* set sink status as synchronized */
-		dpcd->data[DPCD_SINK_STATUS] = DPCD_SINK_IN_SYNC;
+		dpcd->data[DP_SINK_STATUS] = DP_RECEIVE_PORT_0_STATUS |
+			DP_RECEIVE_PORT_1_STATUS;
 	}
 }
 
@@ -1206,7 +1215,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vgpu *vgpu,
 	len = msg & 0xff;
 	op = ctrl >> 4;
 
-	if (op == GVT_AUX_NATIVE_WRITE) {
+	if (op == DP_AUX_NATIVE_WRITE) {
 		int t;
 		u8 buf[16];
 
@@ -1252,7 +1261,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vgpu *vgpu,
 
 				dpcd->data[p] = buf[t];
 				/* check for link training */
-				if (p == DPCD_TRAINING_PATTERN_SET)
+				if (p == DP_TRAINING_PATTERN_SET)
 					dp_aux_ch_ctl_link_training(dpcd,
 							buf[t]);
 			}
@@ -1265,7 +1274,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vgpu *vgpu,
 		return 0;
 	}
 
-	if (op == GVT_AUX_NATIVE_READ) {
+	if (op == DP_AUX_NATIVE_READ) {
 		int idx, i, ret = 0;
 
 		if ((addr + len + 1) >= DPCD_SIZE) {
-- 
2.39.2

