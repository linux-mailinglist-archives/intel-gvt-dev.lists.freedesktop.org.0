Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7519C9008C5
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505D610ECB8;
	Fri,  7 Jun 2024 15:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnsH8xaE";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FE210ECB8;
 Fri,  7 Jun 2024 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773970; x=1749309970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DNgc7F4WzCL2tRkf25GFqCdHb22+anV34UcNBsCVl7o=;
 b=bnsH8xaEnpNWIAyqKdNWxMRG45Y4Syr0pw1kp/QokOI8OHl5vrqx38WW
 NvM2wEwIkJBinhyIkA7cFu1QxsZlt3s+TxgRDFV71LbD8PoWg8VAdmtRf
 EbO9UeDdAEzEDT9gi2USevz05EbhMzY8PG5VODZOsBelMOEB6WN908Lhh
 xU0Ys7qJGlx9eJBoKcag3nIRoIvGsfaRHb7Ftc8yibi6ANJA+eLhrBotO
 nDI2PN9o0hlbEGh+koXHGooWVo6dbOoWwbPPCoZIb21vzpXloPH/FbJt6
 M7H3mLzPueYc3F2JPM1XSRP+ucHoO8fU9DG6VliS0fChsU/xkfMfT3K+j Q==;
X-CSE-ConnectionGUID: wl3IWdcsT0+6Ff1L/Y/DNA==
X-CSE-MsgGUID: NsqwyordTjmuYRk3AYNluQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14633400"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14633400"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:10 -0700
X-CSE-ConnectionGUID: CaBGRPAnSG+ixlDKvH41+Q==
X-CSE-MsgGUID: U58IP7rZToG3GP3IV9us+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43491251"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH v2 4/6] drm/i915/gvt: do not use implict dev_priv in
 DSPSURF_TO_PIPE()
Date: Fri,  7 Jun 2024 18:25:38 +0300
Message-Id: <2ff78ebd0dc84178f5feacee7ef2a6cb4132b9ae.1717773890.git.jani.nikula@intel.com>
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

Do not rely on having dev_priv local variable, pass it to the macro.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index f79dd6cfc75b..0f09344d3c20 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1009,14 +1009,14 @@ static int south_chicken2_mmio_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-#define DSPSURF_TO_PIPE(offset) \
+#define DSPSURF_TO_PIPE(dev_priv, offset) \
 	calc_index(offset, DSPSURF(dev_priv, PIPE_A), DSPSURF(dev_priv, PIPE_B), DSPSURF(dev_priv, PIPE_C))
 
 static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
-	u32 pipe = DSPSURF_TO_PIPE(offset);
+	u32 pipe = DSPSURF_TO_PIPE(dev_priv, offset);
 	int event = SKL_FLIP_EVENT(pipe, PLANE_PRIMARY);
 
 	write_vreg(vgpu, offset, p_data, bytes);
-- 
2.39.2

