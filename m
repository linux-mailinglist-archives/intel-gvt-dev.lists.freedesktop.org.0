Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78538CCAEB4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 09:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424A010E7B3;
	Thu, 18 Dec 2025 08:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABSPgjXS";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3D410E7B7;
 Thu, 18 Dec 2025 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766046936; x=1797582936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ktV+BMoVe41o+QKxHAidEE5uD+n4Lxqgw+um+27JFQ=;
 b=ABSPgjXSXtu7lQUOGXvgD+3f/vlM19V2nYLekHlpVFsak+dHW0DSWACh
 AgJDaApOfcd+rtQ0asmngIkLqdrCx5CxPu70iWk9av11MiK3XNyseNeJg
 J29WZ4VCKpJJHhRo1JRC3oPe25UA1uGHhnlSRMIjwqOyetZAKbARhDCIu
 qYfC6tqzEedcS7gLuvWkpBM72x2TK8+EB8FgIC9YX3czg7xMECbeCxNF2
 QVK30dwNekWPDzwnnfzgfDnce8MT7EJqz2pqJILA5RoeIZyoUO9pkU1uC
 UtggIFi3/BGcKMk67xUXfEytGMKZfGj0Zmoo1XbsyTQt2hQp/zbjF1F5s A==;
X-CSE-ConnectionGUID: f+YWxSpsSzSjiBUVi1XU0w==
X-CSE-MsgGUID: llY2tIzmTnmzR9f95AK+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79365817"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79365817"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:36 -0800
X-CSE-ConnectionGUID: 2jpVuy58Tb+8YoRLfwcN3Q==
X-CSE-MsgGUID: QI8GlmkPRmq9xDUfH9U0Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203597801"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:34 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 7/7] drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
Date: Thu, 18 Dec 2025 13:53:00 +0530
Message-ID: <20251218082302.2327243-8-ankit.k.nautiyal@intel.com>
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

Now that i915/display macros have been substituted with wrappers that call
the new display-device helpers, we can drop the conflicting includes from
GVT and remove the temporary #ifdef/#undef macro overrides.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c      |  1 -
 drivers/gpu/drm/i915/gvt/display_helpers.h | 12 ------------
 drivers/gpu/drm/i915/gvt/fb_decoder.c      |  1 -
 drivers/gpu/drm/i915/gvt/handlers.c        |  1 -
 4 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index fbc8a5e28576..e5301733f4e4 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -53,7 +53,6 @@
 #include "trace.h"
 
 #include "display/i9xx_plane_regs.h"
-#include "display/intel_display_core.h"
 #include "display/intel_sprite_regs.h"
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_pm.h"
diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
index a910f8b8833d..f365e02a71fb 100644
--- a/drivers/gpu/drm/i915/gvt/display_helpers.h
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -8,27 +8,15 @@
 
 #include "display/intel_gvt_api.h"
 
-#ifdef DISPLAY_MMIO_BASE
-#undef DISPLAY_MMIO_BASE
-#endif
 #define DISPLAY_MMIO_BASE(display) \
 	intel_display_device_mmio_base((display))
 
-#ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
-#undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
-#endif
 #define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, idx) \
 	intel_display_device_pipe_offset((display), (enum pipe)(idx))
 
-#ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
-#undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
-#endif
 #define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
 	intel_display_device_trans_offset((display), (trans))
 
-#ifdef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
-#undef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
-#endif
 #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
 	intel_display_device_cursor_offset((display), (pipe))
 
diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
index c402f3b5a0ab..3d1a7e5c8cd3 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -43,7 +43,6 @@
 
 #include "display/i9xx_plane_regs.h"
 #include "display/intel_cursor_regs.h"
-#include "display/intel_display_core.h"
 #include "display/intel_sprite_regs.h"
 #include "display/skl_universal_plane_regs.h"
 #include "display_helpers.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 9ada97d01b6c..7063d3c77562 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -49,7 +49,6 @@
 #include "display/i9xx_plane_regs.h"
 #include "display/intel_crt_regs.h"
 #include "display/intel_cursor_regs.h"
-#include "display/intel_display_core.h"
 #include "display/intel_display_types.h"
 #include "display/intel_dmc_regs.h"
 #include "display/intel_dp_aux_regs.h"
-- 
2.45.2

