Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB24900132
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 12:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E947910EBB3;
	Fri,  7 Jun 2024 10:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1deK7Ao";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30C510EBB3;
 Fri,  7 Jun 2024 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717757503; x=1749293503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WPvsmTHrQ0UdXU4f9xK5/B+rZsJfrPyjDRZ5pulh1Vw=;
 b=Z1deK7AoqINkQtwggSgcK9OwecWjxMuklw/KMbdRYFPV/TIU0Zhcxr0f
 AHuh/dELbl5hi8J2H51iS6flvEB1Ggn7b4Ipv24LmHUQlztm7EO1J0Zpx
 yFpwLU7c3IQTnjdfceKvllOjwSBHZLsqlag3gTXj99tqa4+T8b0eFIlGm
 9EpYEm3hqKb9lS7LNOYfccJmy6xvA/kMAlWvs89rGLs4jMeNa7IcHmhzD
 Ptph5cczfayXS9tmiGrnCC50iUj/EwZPt8qoACDqDSo8QOxJpBLMYXbZt
 8vIBeJ/Qn1ovnwl5TXG+h2wvoMUIx+LLR7Wb2CuQiyrOu2K3aZtnEyG9W Q==;
X-CSE-ConnectionGUID: 8tIUVW0YQ4mcy7kFS237Yg==
X-CSE-MsgGUID: 4tOcmC6kSYW1ARJrNTcWag==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39873256"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="39873256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:51:42 -0700
X-CSE-ConnectionGUID: Roxn6W9YSfqLgTniqhWPmw==
X-CSE-MsgGUID: Y6RetCGUR+awhDymz/6QXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38367207"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:51:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH 1/6] drm/i915/gvt: remove the unused end parameter from
 calc_index()
Date: Fri,  7 Jun 2024 13:51:24 +0300
Message-Id: <90b753e928bc9f4c8446bf45a199a43becd116a0.1717757337.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717757337.git.jani.nikula@intel.com>
References: <cover.1717757337.git.jani.nikula@intel.com>
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

All callers of calc_index() pass 0 for the end parameter. Remove it.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index b3b5fdbee64f..a2e9d24d646e 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -882,12 +882,11 @@ static int check_fdi_rx_train_status(struct intel_vgpu *vgpu,
 #define INVALID_INDEX (~0U)
 
 static unsigned int calc_index(unsigned int offset, unsigned int start,
-	unsigned int next, unsigned int end, i915_reg_t i915_end)
+			       unsigned int next, i915_reg_t _end)
 {
+	u32 end = i915_mmio_reg_offset(_end);
 	unsigned int range = next - start;
 
-	if (!end)
-		end = i915_mmio_reg_offset(i915_end);
 	if (offset < start || offset > end)
 		return INVALID_INDEX;
 	offset -= start;
@@ -895,13 +894,13 @@ static unsigned int calc_index(unsigned int offset, unsigned int start,
 }
 
 #define FDI_RX_CTL_TO_PIPE(offset) \
-	calc_index(offset, _FDI_RXA_CTL, _FDI_RXB_CTL, 0, FDI_RX_CTL(PIPE_C))
+	calc_index(offset, _FDI_RXA_CTL, _FDI_RXB_CTL, FDI_RX_CTL(PIPE_C))
 
 #define FDI_TX_CTL_TO_PIPE(offset) \
-	calc_index(offset, _FDI_TXA_CTL, _FDI_TXB_CTL, 0, FDI_TX_CTL(PIPE_C))
+	calc_index(offset, _FDI_TXA_CTL, _FDI_TXB_CTL, FDI_TX_CTL(PIPE_C))
 
 #define FDI_RX_IMR_TO_PIPE(offset) \
-	calc_index(offset, _FDI_RXA_IMR, _FDI_RXB_IMR, 0, FDI_RX_IMR(PIPE_C))
+	calc_index(offset, _FDI_RXA_IMR, _FDI_RXB_IMR, FDI_RX_IMR(PIPE_C))
 
 static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
@@ -945,7 +944,7 @@ static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
 }
 
 #define DP_TP_CTL_TO_PORT(offset) \
-	calc_index(offset, _DP_TP_CTL_A, _DP_TP_CTL_B, 0, DP_TP_CTL(PORT_E))
+	calc_index(offset, _DP_TP_CTL_A, _DP_TP_CTL_B, DP_TP_CTL(PORT_E))
 
 static int dp_tp_ctl_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
@@ -1009,7 +1008,7 @@ static int south_chicken2_mmio_write(struct intel_vgpu *vgpu,
 }
 
 #define DSPSURF_TO_PIPE(offset) \
-	calc_index(offset, _DSPASURF, _DSPBSURF, 0, DSPSURF(dev_priv, PIPE_C))
+	calc_index(offset, _DSPASURF, _DSPBSURF, DSPSURF(dev_priv, PIPE_C))
 
 static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
@@ -1032,7 +1031,7 @@ static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 #define SPRSURF_TO_PIPE(offset) \
-	calc_index(offset, _SPRA_SURF, _SPRB_SURF, 0, SPRSURF(PIPE_C))
+	calc_index(offset, _SPRA_SURF, _SPRB_SURF, SPRSURF(PIPE_C))
 
 static int spr_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
-- 
2.39.2

