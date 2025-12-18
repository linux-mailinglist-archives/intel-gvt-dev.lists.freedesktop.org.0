Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F20CCAEB3
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 09:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3022610E69D;
	Thu, 18 Dec 2025 08:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZPxl/CO";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A607510E7ED;
 Thu, 18 Dec 2025 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766046935; x=1797582935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iA09AiTHIUjHtfDNDGUDzwoJAH93B8X+MbFrMyTO/h0=;
 b=mZPxl/COVuV1rUea58ROCjgezbsQaJoqHQMXjTNWkHG9ht1R3D2Uf4iD
 ebnJSt2p2GmGqbwQM+yXbirZ3TOwRMikvxuHgIPhV39ryQg7yktoUcN9W
 M6WOAOWGYS6rQaP2xc1ME7R9LNEgN41OiUzFE7nnABuKGbz1tzZGBRWv+
 EaOr09OyM3cKCVdi229jjAC/FPAu1uwS5GI6mFk5yla41HqPKKF4KmIg+
 Qux5VXjt5Hsd9vYhe56ASfnN3zw8L18Mh3duMhYej2X92XzpPPL2SG/EH
 pame7ccOgIK6BrFmzUgkuPDURYjJQ32Y4Z7PRnVIHUkoxJEVKy/DHZbJL A==;
X-CSE-ConnectionGUID: LQA2eS3vSN6FJvEvYLb8Kw==
X-CSE-MsgGUID: 1KK8BlbNTISf5Jm1eJCtaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79365815"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79365815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:34 -0800
X-CSE-ConnectionGUID: DxIj/jXIQCiETsmI2dqS1w==
X-CSE-MsgGUID: sMfjtoRgTgSMpox6shWjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203597795"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:32 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 6/7] drm/i915/gvt: Use the appropriate header for the DPLL
 macro
Date: Thu, 18 Dec 2025 13:52:59 +0530
Message-ID: <20251218082302.2327243-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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

The macro `DPLL_ID_SKL_DPLL0` is defined in
display/intel_dpll_mgr.h. Previously, GVT included the header
display/intel_display_core.h` because other macros also depended on it.
After porting those macros to use the new APIs, the only remaining
dependency was for the DPLL macro.

Replace the indirect include with the correct header and drop
intel_display_core.h to reduce unnecessary dependencies.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 11855c71e05e..6e034ab15d44 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -45,9 +45,9 @@
 #include "display/intel_crt_regs.h"
 #include "display/intel_cursor_regs.h"
 #include "display/intel_display.h"
-#include "display/intel_display_core.h"
 #include "display_helpers.h"
 #include "display/intel_dpio_phy.h"
+#include "display/intel_dpll_mgr.h"
 #include "display/intel_sprite_regs.h"
 
 static int get_edp_pipe(struct intel_vgpu *vgpu)
-- 
2.45.2

