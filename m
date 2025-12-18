Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1967CCAEA2
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 09:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B002210E77D;
	Thu, 18 Dec 2025 08:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1r8Urq7";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5906510E780;
 Thu, 18 Dec 2025 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766046928; x=1797582928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vsXbgCR9L3lSrqF1NV0+gTsyOd4fsyBCy6fX1kE7IvA=;
 b=T1r8Urq7gvk6k3jbs/74ptX/sVUuNxkjQZq2pXZHLHH4fuhfgoLWZAFO
 SHArrfVsJ2UEJZvTw5fF8emvg08X22RceTHC8llBoOEeHE7FdwijV4Y/B
 uXhXZu/xlvpjFu7ZTHbdKPsxC5FcZHerUIn2cAHmWVDPje3pt3CMYwyUM
 liWAfevlbbH2bS0u5C9QthfKF9l5cdHfHr1RlJBbqqi1y/hUYbfdUxqkh
 EsqgCIGFgfidwqoMa9f8laOcHc+D8vojshx9UO8fjg7fFnj7ch8IWQm/S
 O3/LNPxsSlUQI0cxxwdDI7v6WoR9sZykM77FcudzPgIPXc2ko6Xu5c6y5 Q==;
X-CSE-ConnectionGUID: DxVuzY77QgKuW+lkU8Qblw==
X-CSE-MsgGUID: 1aCXfYszSo+cX95qYZU1Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79365788"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79365788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:28 -0800
X-CSE-ConnectionGUID: zEKqsaQBTM+dLhKjrniL9g==
X-CSE-MsgGUID: GawoNHrySoS2g2NVMenmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203597744"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:26 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/7] drm/i915/gvt: Add header to use display offset functions
 in macros
Date: Thu, 18 Dec 2025 13:52:56 +0530
Message-ID: <20251218082302.2327243-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce gvt/display_helpers.h to make DISPLAY_MMIO_BASE and
INTEL_DISPLAY_DEVICE_*_OFFSET macros call exported display functions.
This lets GVT keep using existing register macros (e.g.,
TRANSCONF(display, pipe)) while ensuring offset calculations happen
through functions instead of accessing display internals.

Ideally, we would remove the display headers that define these macros,
but some macros in GVT still depend on them and have not yet been
ported. Keeping those headers leads to build conflicts, so as a
stopgap, we use temporary ifdef/undef blocks to override the macros
with API-backed versions. These will be removed once all dependent
macros are ported and the conflicting headers can be safely dropped.

v2:
 - Remove prefix `gvt/` while including the header file. (Jani)
 - Explain the rationale behind temporary ifdef/undefs and plan to drop
   them. (Jani).

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c      |  1 +
 drivers/gpu/drm/i915/gvt/display.c         |  1 +
 drivers/gpu/drm/i915/gvt/display_helpers.h | 35 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/fb_decoder.c      |  1 +
 drivers/gpu/drm/i915/gvt/handlers.c        |  1 +
 5 files changed, 39 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index df04e4ead8ea..fbc8a5e28576 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -58,6 +58,7 @@
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_context.h"
+#include "display_helpers.h"
 
 #define INVALID_OP    (~0U)
 
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 06517d1f07a2..9d6b22b2e4d0 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -46,6 +46,7 @@
 #include "display/intel_cursor_regs.h"
 #include "display/intel_display.h"
 #include "display/intel_display_core.h"
+#include "display_helpers.h"
 #include "display/intel_dpio_phy.h"
 #include "display/intel_sprite_regs.h"
 
diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
new file mode 100644
index 000000000000..97ebc92768fc
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __DISPLAY_HELPERS_H__
+#define __DISPLAY_HELPERS_H__
+
+#include "display/intel_gvt_api.h"
+
+#ifdef DISPLAY_MMIO_BASE
+#undef DISPLAY_MMIO_BASE
+#endif
+#define DISPLAY_MMIO_BASE(display) \
+	intel_display_device_mmio_base((display))
+
+#ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
+#undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
+#endif
+#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
+	intel_display_device_pipe_offset((display), (pipe))
+
+#ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
+#undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
+#endif
+#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
+	intel_display_device_trans_offset((display), (trans))
+
+#ifdef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
+#undef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
+#endif
+#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
+	intel_display_device_cursor_offset((display), (pipe))
+
+#endif /* __DISPLAY_HELPERS_H__ */
diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
index a8079cfa8e1d..c402f3b5a0ab 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -46,6 +46,7 @@
 #include "display/intel_display_core.h"
 #include "display/intel_sprite_regs.h"
 #include "display/skl_universal_plane_regs.h"
+#include "display_helpers.h"
 
 #define PRIMARY_FORMAT_NUM	16
 struct pixel_format {
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 36ea12ade849..9ada97d01b6c 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -66,6 +66,7 @@
 #include "display/vlv_dsi_pll_regs.h"
 #include "gt/intel_gt_regs.h"
 #include <linux/vmalloc.h>
+#include "display_helpers.h"
 
 /* XXX FIXME i915 has changed PP_XXX definition */
 #define PCH_PP_STATUS  _MMIO(0xc7200)
-- 
2.45.2

