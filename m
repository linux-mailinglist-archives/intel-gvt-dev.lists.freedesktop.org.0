Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079ABCCE9F8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Dec 2025 07:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D6610EE02;
	Fri, 19 Dec 2025 06:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FL/UmqPk";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2A010EE02;
 Fri, 19 Dec 2025 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766124929; x=1797660929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NDUoJFiUVbsZ4uD6MaNxUATjd7raCpkjlevjHzotCBU=;
 b=FL/UmqPkiPDhD9BIOMdnMqf0/m7dWaNCSS+N7SELBD6no7XV+zyAJ0gJ
 j/sgOVwXVpYyg6MWKrRgzU57/SPKk9Ya6lARwDYUsmYYLND2ZABvOdV+L
 R73B9Rk9wmQLQiPfnQ9PuQzmjR40pAfATyQeV6ReMTsnG7wmyhVQ3QR/Q
 5DzhggBOTGvyt86puuHLBSSeMvk3ZnryXQJLDER3MKDqCNq7FTA1OUXlN
 9oSqNz3/N91ggA8kWi4/JGmJ3wCb6ppqOEkoBjvXFyl6uWq3aK4YlWu9H
 N0j+fQs+ENA/YOpIEkXlRiadoEb/0X4adaUbZUBwDgQnPJs5uf7Nv4EVR A==;
X-CSE-ConnectionGUID: FHkZO+79QBiXsOxbCKfQyw==
X-CSE-MsgGUID: lah/9t6bRIWC5IgPfUG53A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68058621"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68058621"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:29 -0800
X-CSE-ConnectionGUID: g7hTa6myTtyWmGGbJF/jbQ==
X-CSE-MsgGUID: voC9RS9wSZe7M6eutvcdJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229464689"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:27 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 3/6] drm/i915/gvt: Add header to use display offset functions
 in macros
Date: Fri, 19 Dec 2025 11:32:56 +0530
Message-ID: <20251219060302.2365123-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
References: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
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

Note:
TRANSCONF() expects a pipe index but some GVT callers pass a transcoder,
causing -Werror=enum-conversion.
Fix: cast to enum pipe in the GVT-side macro override.
This works for all cases as TRANSCODER_{A,B,C,D} all have 1:1 mapping to
PIPE_{A,B,C,D} except for TRANSCODER_EDP which is used in one place.
In any case, the cast preserves the previous behaviour.

v2:
 - Remove prefix `gvt/` while including the header file. (Jani)
 - Explain the rationale behind temporary ifdef/undefs and plan to drop
   them. (Jani).
v3:
 - Meld the patch to cast argument to enum pipe for the pipe-offset
   macro. (Jani)
 - Add a FIXME to highlight the cast. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c      |  1 +
 drivers/gpu/drm/i915/gvt/display.c         |  1 +
 drivers/gpu/drm/i915/gvt/display_helpers.h | 45 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/fb_decoder.c      |  1 +
 drivers/gpu/drm/i915/gvt/handlers.c        |  1 +
 5 files changed, 49 insertions(+)
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
index 000000000000..46c5192a79a7
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -0,0 +1,45 @@
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
+/*
+ * #FIXME:
+ * TRANSCONF() uses pipe-based addressing via _MMIO_PIPE2().
+ * Some GVT call sites pass enum transcoder instead of enum pipe.
+ * Cast the argument to enum pipe for now since TRANSCODER_A..D map
+ * 1:1 to PIPE_A..D.
+ * TRANSCODER_EDP is an exception, the cast preserves the existing
+ * behaviour but this needs to be handled later either by using the
+ * correct pipe or by switching TRANSCONF() to use _MMIO_TRANS2().
+ */
+#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, idx) \
+	intel_display_device_pipe_offset((display), (enum pipe)(idx))
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

