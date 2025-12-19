Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA3CCE9F2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Dec 2025 07:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EC510EE01;
	Fri, 19 Dec 2025 06:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrPf9BIb";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0162110EDD0;
 Fri, 19 Dec 2025 06:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766124924; x=1797660924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A3QUvRTmz8rIrkSdvv7lQxNppLdsbdY5lRrTbo0/HqI=;
 b=XrPf9BIbQwXtOQQa3MryoMjx2V35znBJizPihaek2bnjYGlGnLcOREGl
 /pTuZHvos4Q7cXdibfwDUw0OliD9grePfRjhNuQ7Qunc5It71Ojq98l4+
 UI4ux1V9w4IATEjT4nanMUQE+97we6X/Pv24+xJ/tccMwvDsYhcctRbLY
 yN/LX+f5ljUZI4tVhJUAvLNa/3NU9oyHcT+G8BCBTZFJWO44bx9xsjl8j
 DF9efS3gipsaKFb7lxeWvs7XC46JHkgbBUWK1xvqzgaJ/SME44qLMlRTv
 9+6hC0VacC9rRwuH5RrFprVfooKEORaxJuQMynBiE/iIAAx8ciTsqvBP7 w==;
X-CSE-ConnectionGUID: UxBV7HKVSyOM/bULbQJcDg==
X-CSE-MsgGUID: /hIEgXDYQZe5JcWaXFP+oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68058612"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68058612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:24 -0800
X-CSE-ConnectionGUID: WKdj6qmTRNKfW7gxXGGvRQ==
X-CSE-MsgGUID: yeHnSFb3ThWDzj3gVqfRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229464665"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:22 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/6] drm/i915/display: Abstract pipe/trans/cursor offset
 calculation
Date: Fri, 19 Dec 2025 11:32:54 +0530
Message-ID: <20251219060302.2365123-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
References: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
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

Introduce INTEL_DISPLAY_DEVICE_*_OFFSET() macros to compute absolute
MMIO offsets for pipe, transcoder, and cursor registers.

Update _MMIO_PIPE2/_MMIO_TRANS2/_MMIO_CURSOR2 to use these macros
for cleaner abstraction and to prepare for external API usage (e.g. GVT).

Also move DISPLAY_MMIO_BASE() to intel_display_device.h so it can be
abstracted in GVT, allowing register macros to resolve via
exported helpers rather than peeking into struct intel_display.

v2: Wrap the macro argument usages in parenthesis. (Jani)

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_device.h | 17 +++++++++++++++++
 .../drm/i915/display/intel_display_reg_defs.h   | 15 ++++-----------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 50b2e9ae2c18..13b6616bc496 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -260,6 +260,23 @@ struct intel_display_platforms {
 	 ((id) == ARLS_HOST_BRIDGE_PCI_ID3) || \
 	 ((id) == ARLS_HOST_BRIDGE_PCI_ID4))
 
+#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
+	(DISPLAY_INFO((display))->pipe_offsets[(pipe)] - \
+	 DISPLAY_INFO((display))->pipe_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE((display)))
+
+#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
+	(DISPLAY_INFO((display))->trans_offsets[(trans)] - \
+	 DISPLAY_INFO((display))->trans_offsets[TRANSCODER_A] + \
+	 DISPLAY_MMIO_BASE((display)))
+
+#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
+	(DISPLAY_INFO((display))->cursor_offsets[(pipe)] - \
+	 DISPLAY_INFO((display))->cursor_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE((display)))
+
+#define DISPLAY_MMIO_BASE(display)	(DISPLAY_INFO((display))->mmio_offset)
+
 struct intel_display_runtime_info {
 	struct intel_display_ip_ver {
 		u16 ver;
diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index b83ad06f2ea7..175334b41bba 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -8,8 +8,6 @@
 
 #include "i915_reg_defs.h"
 
-#define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)
-
 #define VLV_DISPLAY_BASE		0x180000
 
 /*
@@ -36,14 +34,9 @@
  * Device info offset array based helpers for groups of registers with unevenly
  * spaced base offsets.
  */
-#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
-						      DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
-						      DISPLAY_MMIO_BASE(display) + (reg))
-#define _MMIO_TRANS2(display, tran, reg)	_MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
-						      DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
-						      DISPLAY_MMIO_BASE(display) + (reg))
-#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
-						      DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
-						      DISPLAY_MMIO_BASE(display) + (reg))
+
+#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(INTEL_DISPLAY_DEVICE_PIPE_OFFSET((display), (pipe)) + (reg))
+#define _MMIO_TRANS2(display, trans, reg)	_MMIO(INTEL_DISPLAY_DEVICE_TRANS_OFFSET((display), (trans)) + (reg))
+#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(INTEL_DISPLAY_DEVICE_CURSOR_OFFSET((display), (pipe)) + (reg))
 
 #endif /* __INTEL_DISPLAY_REG_DEFS_H__ */
-- 
2.45.2

