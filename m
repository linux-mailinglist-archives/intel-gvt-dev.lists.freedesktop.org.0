Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A89361B52
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Apr 2021 10:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2298D6E077;
	Fri, 16 Apr 2021 08:34:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449956E077
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Apr 2021 08:34:04 +0000 (UTC)
IronPort-SDR: 7yq4KCNAbt91e6OEt6P3BKNII9aTFgIx1CyOskyYRVy90GCdwPEriFagtvGOD+6fVsEY/nZK+2
 vjmD8U/chVlA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="280327589"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="280327589"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 01:34:03 -0700
IronPort-SDR: fSCvB1qOa0v+wTpVokqc5acxgfOHUGGpnjEjApeopvOhW69B7yIe+IHaaUYIOwwQ4fFgLIOWWd
 7Hhc4w9cr6ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="425514471"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.26])
 by orsmga008.jf.intel.com with ESMTP; 16 Apr 2021 01:34:02 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com,
	intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Prevent divided by zero when calculating
 refresh rate
Date: Fri, 16 Apr 2021 16:33:55 +0800
Message-Id: <20210416083355.159305-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.31.1
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

To get refresh rate as vblank timer period and keep the precision, the
calculation of rate is multiplied by 1000. However old logic was using:
rate = pixel clock / (h * v / 1000). When the h/v total is invalid, like
all 0, h * v / 1000 will be rounded to 0, which leads to a divided by 0
fault.

0 H/V are already checked above. Instead of divide after divide, refine
the calculation to divide after multiply: "pixel clock * 1000 / (h * v)"
Guest driver should guarantee the correctness of the timing regs' value.

Fixes: 6a4500c7b83f ("drm/i915/gvt: Get accurate vGPU virtual display
refresh rate from vreg")

Reported-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 477badfcb258..dda320749c65 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -669,8 +669,8 @@ static void vgpu_update_refresh_rate(struct intel_vgpu *vgpu)
 	link_n = vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A));
 
 	/* Get H/V total from transcoder timing */
-	htotal = (vgpu_vreg_t(vgpu, HTOTAL(TRANSCODER_A)) >> TRANS_HTOTAL_SHIFT) + 1;
-	vtotal = (vgpu_vreg_t(vgpu, VTOTAL(TRANSCODER_A)) >> TRANS_VTOTAL_SHIFT) + 1;
+	htotal = (vgpu_vreg_t(vgpu, HTOTAL(TRANSCODER_A)) >> TRANS_HTOTAL_SHIFT);
+	vtotal = (vgpu_vreg_t(vgpu, VTOTAL(TRANSCODER_A)) >> TRANS_VTOTAL_SHIFT);
 
 	if (dp_br && link_n && htotal && vtotal) {
 		u64 pixel_clk = 0;
@@ -682,7 +682,7 @@ static void vgpu_update_refresh_rate(struct intel_vgpu *vgpu)
 		pixel_clk *= MSEC_PER_SEC;
 
 		/* Calcuate refresh rate by (pixel_clk / (h_total * v_total)) */
-		new_rate = DIV64_U64_ROUND_CLOSEST(pixel_clk, div64_u64(mul_u32_u32(htotal, vtotal), MSEC_PER_SEC));
+		new_rate = DIV64_U64_ROUND_CLOSEST(mul_u64_u32_shr(pixel_clk, MSEC_PER_SEC, 0), mul_u32_u32(htotal + 1, vtotal + 1));
 
 		if (*old_rate != new_rate)
 			*old_rate = new_rate;
-- 
2.31.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
