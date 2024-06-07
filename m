Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726F9008BF
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2326610ECB8;
	Fri,  7 Jun 2024 15:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5v5HfQ7";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C3010ECBD;
 Fri,  7 Jun 2024 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773958; x=1749309958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=niekHMyAL2ANmn/H79qgdkPmrgdJxKjdhLv4Ifs4cqQ=;
 b=n5v5HfQ731AUMXA2sSiTFBfhbawjEGDU9HHpw5xMe0395gxFU1UpamOM
 DbspmcdlJWhfWc81FbAyqAWih8AnJ1rnH4W10NpYTVnsd18wzRIzZ7ji2
 ZVQ5jSwkJyJy4AXQU6GZ2BhMgWBySZ0nW1QEwgfP/htA1bpjWVFlegw6K
 AK3JYVVjhGmoyYDhm9PDyhuC+kAeMlXZKHDHYQ+19216oU4UkhUBSYv/j
 cDt7lc7sF+X7vkvfTvWSzwTt5TbQ+c2Ds1bZFRTdZ89J01CqrDF4pltzC
 fTT45b38hV+R7RVJdBbYxB5BpWbTXpfOQLsWrRUv1PrdNtB4C0NaRY3p6 Q==;
X-CSE-ConnectionGUID: d1u/24gGSlGQsTCU47w4dg==
X-CSE-MsgGUID: zirButx/Q0W70MRrCJe9qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14633374"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14633374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:25:58 -0700
X-CSE-ConnectionGUID: CMuJbm5HSx2tOMVmjXRqTQ==
X-CSE-MsgGUID: fetgixjsSIinkRSbYnN08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43491192"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:25:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH v2 2/6] drm/i915/gvt: use proper i915_reg_t for calc_index()
 parameters
Date: Fri,  7 Jun 2024 18:25:36 +0300
Message-Id: <282b19c44d83c96b52c261cfc7218e7e54076cba.1717773890.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717773890.git.jani.nikula@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
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

In order to be able to use the proper register macros instead of the
underscore prefixed ones, pass i915_reg_t for the calc_index()
parameters.

Side note: DSPSURF is really about planes, not pipes. Fixed stride
doesn't work for plane C for CHV (but that's okay for gvt). This doesn't
support planes beyond C either. But all that is unrelated to the change
at hand.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index a2e9d24d646e..b005ab0104ee 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -881,9 +881,11 @@ static int check_fdi_rx_train_status(struct intel_vgpu *vgpu,
 
 #define INVALID_INDEX (~0U)
 
-static unsigned int calc_index(unsigned int offset, unsigned int start,
-			       unsigned int next, i915_reg_t _end)
+static unsigned int calc_index(unsigned int offset, i915_reg_t _start,
+			       i915_reg_t _next, i915_reg_t _end)
 {
+	u32 start = i915_mmio_reg_offset(_start);
+	u32 next = i915_mmio_reg_offset(_next);
 	u32 end = i915_mmio_reg_offset(_end);
 	unsigned int range = next - start;
 
@@ -894,13 +896,13 @@ static unsigned int calc_index(unsigned int offset, unsigned int start,
 }
 
 #define FDI_RX_CTL_TO_PIPE(offset) \
-	calc_index(offset, _FDI_RXA_CTL, _FDI_RXB_CTL, FDI_RX_CTL(PIPE_C))
+	calc_index(offset, FDI_RX_CTL(PIPE_A), FDI_RX_CTL(PIPE_B), FDI_RX_CTL(PIPE_C))
 
 #define FDI_TX_CTL_TO_PIPE(offset) \
-	calc_index(offset, _FDI_TXA_CTL, _FDI_TXB_CTL, FDI_TX_CTL(PIPE_C))
+	calc_index(offset, FDI_TX_CTL(PIPE_A), FDI_TX_CTL(PIPE_B), FDI_TX_CTL(PIPE_C))
 
 #define FDI_RX_IMR_TO_PIPE(offset) \
-	calc_index(offset, _FDI_RXA_IMR, _FDI_RXB_IMR, FDI_RX_IMR(PIPE_C))
+	calc_index(offset, FDI_RX_IMR(PIPE_A), FDI_RX_IMR(PIPE_B), FDI_RX_IMR(PIPE_C))
 
 static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
@@ -944,7 +946,7 @@ static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
 }
 
 #define DP_TP_CTL_TO_PORT(offset) \
-	calc_index(offset, _DP_TP_CTL_A, _DP_TP_CTL_B, DP_TP_CTL(PORT_E))
+	calc_index(offset, DP_TP_CTL(PORT_A), DP_TP_CTL(PORT_B), DP_TP_CTL(PORT_E))
 
 static int dp_tp_ctl_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
@@ -1008,7 +1010,7 @@ static int south_chicken2_mmio_write(struct intel_vgpu *vgpu,
 }
 
 #define DSPSURF_TO_PIPE(offset) \
-	calc_index(offset, _DSPASURF, _DSPBSURF, DSPSURF(dev_priv, PIPE_C))
+	calc_index(offset, DSPSURF(dev_priv, PIPE_A), DSPSURF(dev_priv, PIPE_B), DSPSURF(dev_priv, PIPE_C))
 
 static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
@@ -1031,7 +1033,7 @@ static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 #define SPRSURF_TO_PIPE(offset) \
-	calc_index(offset, _SPRA_SURF, _SPRB_SURF, SPRSURF(PIPE_C))
+	calc_index(offset, SPRSURF(PIPE_A), SPRSURF(PIPE_B), SPRSURF(PIPE_C))
 
 static int spr_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
-- 
2.39.2

