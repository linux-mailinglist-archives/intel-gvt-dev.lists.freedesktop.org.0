Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F5CBD80B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0DA10E42A;
	Mon, 15 Dec 2025 11:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gccieck0";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94710E437;
 Mon, 15 Dec 2025 11:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765798271; x=1797334271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nR90zbl/6JvncfjDuz/GagEZqFJBgF2cpFoQs6n60wA=;
 b=gccieck0DcbxcI95gr6X3pt+kWYI7D0Cwouxf5YdEW4Z/uGPeHV1QAoa
 mFQcABXcPTDsKCXOdbzc21zOwOQ6T/h1BUgeL+YMLRiKOR78Mytg6j3x6
 Wuy05nfqdjho7CN9Mehte25ymH/xbKPwHMuGOXOP724TXCICjSlbb3ZN1
 vzvz3gxcXKGB3V9su8NWmizx9XrvPR+sIIO2ONaL15lNXunrvYwf1Up9D
 jxFaqutwc46PIME/QC0vktvGk2LhQ09tXg6uzUFTWQFbkFVfc0ZdbbuGF
 2JF+xUS88BM1CePMdu/ECG3hNA84CMkqd8LJYxACi1snrMuixs+E4bmSc A==;
X-CSE-ConnectionGUID: Of2Ycsh5SKexhw8+gtIOSg==
X-CSE-MsgGUID: DuFmp6cYTuGvys3kvmTnEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67732770"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67732770"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:10 -0800
X-CSE-ConnectionGUID: WgBhSCEwTJ6PY5AFCP0xIw==
X-CSE-MsgGUID: u/dHkqXISl6lzALu1j6dng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235090418"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:10 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/5] drm/i915/gvt: Add header to use display offset functions
 in macros
Date: Mon, 15 Dec 2025 16:48:39 +0530
Message-ID: <20251215111842.2099789-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
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

Include gvt/display_helpers.h after display headers to avoid
conflicts.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c      |  2 ++
 drivers/gpu/drm/i915/gvt/display.c         |  2 ++
 drivers/gpu/drm/i915/gvt/display_helpers.h | 39 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/fb_decoder.c      |  2 ++
 drivers/gpu/drm/i915/gvt/handlers.c        |  2 ++
 5 files changed, 47 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index df04e4ead8ea..6b5e18fca403 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -59,6 +59,8 @@
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_context.h"
 
+#include "gvt/display_helpers.h"
+
 #define INVALID_OP    (~0U)
 
 #define OP_LEN_MI           9
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 06517d1f07a2..7a51c13b9b58 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -49,6 +49,8 @@
 #include "display/intel_dpio_phy.h"
 #include "display/intel_sprite_regs.h"
 
+#include "gvt/display_helpers.h"
+
 static int get_edp_pipe(struct intel_vgpu *vgpu)
 {
 	u32 data = vgpu_vreg(vgpu, _TRANS_DDI_FUNC_CTL_EDP);
diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
new file mode 100644
index 000000000000..6f68a1e8751a
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -0,0 +1,39 @@
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
+enum pipe;
+enum trans;
+struct display;
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
index a8079cfa8e1d..ee4213fa2cda 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -47,6 +47,8 @@
 #include "display/intel_sprite_regs.h"
 #include "display/skl_universal_plane_regs.h"
 
+#include "gvt/display_helpers.h"
+
 #define PRIMARY_FORMAT_NUM	16
 struct pixel_format {
 	int drm_format;	/* Pixel format in DRM definition */
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 36ea12ade849..3e58e35ea2b9 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -67,6 +67,8 @@
 #include "gt/intel_gt_regs.h"
 #include <linux/vmalloc.h>
 
+#include "gvt/display_helpers.h"
+
 /* XXX FIXME i915 has changed PP_XXX definition */
 #define PCH_PP_STATUS  _MMIO(0xc7200)
 #define PCH_PP_CONTROL _MMIO(0xc7204)
-- 
2.45.2

