Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9FCBD7FD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7776A10E42B;
	Mon, 15 Dec 2025 11:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8J+l0x0";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256C710E425;
 Mon, 15 Dec 2025 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765798267; x=1797334267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NhcTatZAhC8Q2u0okKzNj3rtRoHVylLJRwRraiXyXsk=;
 b=R8J+l0x0XDRejy34luyGBJd9DgRjjhN4TCS8pDfKtMRCb+5iFFE56dpq
 1s88YsfyKKpc6DY4vUb+jTs4iITaTpmnAQNStqQFnkXoSGD7fe8tD+YK1
 Fj1/kOeIw8+FNae4wNJV1yNFqDAn0Cy7WDMjQfybTs1t68kkA3uvsCa4j
 a876BzQbmwVpX/Fnvd+8vuMKx3ZdEZggaT9pPJBwC4lR9LkcPyJJuy93G
 aS5QMV/G1Aq73aWseLrr2TmaT8kgl1yAmVyDZXjQThl16IElIw1VZ+ZTk
 RSG1WfJYM73/Wsz0EqPnwx4AVUaIFU4giQzBldW2i7m0W+C80ReKdNraR g==;
X-CSE-ConnectionGUID: zmW5je79Qdms/4zB4oMmHQ==
X-CSE-MsgGUID: wCeKOV5kTj+afqAxjm5eBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67732760"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67732760"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:06 -0800
X-CSE-ConnectionGUID: 8UypnijqSIeEyszKCPSWkg==
X-CSE-MsgGUID: 0n+YbyfaQSSyGe0kBkczdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235090401"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:05 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/5] drm/i915/display: Abstract pipe/trans/cursor offset
 calculation
Date: Mon, 15 Dec 2025 16:48:37 +0530
Message-ID: <20251215111842.2099789-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
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

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../gpu/drm/i915/display/intel_display_device.h | 17 +++++++++++++++++
 .../drm/i915/display/intel_display_reg_defs.h   | 15 ++++-----------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 50b2e9ae2c18..05bba7a9899a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -260,6 +260,23 @@ struct intel_display_platforms {
 	 ((id) == ARLS_HOST_BRIDGE_PCI_ID3) || \
 	 ((id) == ARLS_HOST_BRIDGE_PCI_ID4))
 
+#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
+	(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
+	 DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE(display))
+
+#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
+	(DISPLAY_INFO(display)->trans_offsets[(trans)] - \
+	 DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
+	 DISPLAY_MMIO_BASE(display))
+
+#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
+	(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
+	 DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE(display))
+
+#define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)
+
 struct intel_display_runtime_info {
 	struct intel_display_ip_ver {
 		u16 ver;
diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index b83ad06f2ea7..74f572d3a202 100644
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
+#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) + (reg))
+#define _MMIO_TRANS2(display, trans, reg)	_MMIO(INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) + (reg))
+#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) + (reg))
 
 #endif /* __INTEL_DISPLAY_REG_DEFS_H__ */
-- 
2.45.2

