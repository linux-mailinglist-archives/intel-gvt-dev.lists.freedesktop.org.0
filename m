Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7DECCAE8D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 09:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F98210E6E3;
	Thu, 18 Dec 2025 08:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlJ/5QrD";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BED910E6BC;
 Thu, 18 Dec 2025 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766046924; x=1797582924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A3QUvRTmz8rIrkSdvv7lQxNppLdsbdY5lRrTbo0/HqI=;
 b=ZlJ/5QrDX3B992yXPpyfAUleMp906h/TrctnvF38B1iQwdkp48BOdYZd
 c3GVIKPlOAVWkRibF+bzqLKJmq1Fh1GWUro2YrIHtYXN9mUCH65cJ5S9D
 AWEAFc2yGMDxuPfKzAMUARiFQjzRSX8jRFTDvfkOFD935UKb0rqjRjJFZ
 UUAzrafiFNfT71QscWpKuoUk/7Pdb2bvo8TsORB7RTDhhVA9pGhfoDbhy
 LLSqw0uD3NEKXyrzLHfXrpRWtVptCGwwyLjK8Qi0FaOtaMdBxTK0pCj3b
 7Yp8F2yCrneAO6zddDaVkvVRD9fH2rbkoIUrkO/djoR287GBGzHP/c1SU Q==;
X-CSE-ConnectionGUID: s3wT6FmQQQKgWxQacfgMBQ==
X-CSE-MsgGUID: B/jh5objTReNICOg/XAfUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79365784"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79365784"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:24 -0800
X-CSE-ConnectionGUID: yxhvmNIETMSpMV8xqPhxSA==
X-CSE-MsgGUID: ColOydgTRW+1FhRN+DY8vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203597726"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:21 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/7] drm/i915/display: Abstract pipe/trans/cursor offset
 calculation
Date: Thu, 18 Dec 2025 13:52:54 +0530
Message-ID: <20251218082302.2327243-2-ankit.k.nautiyal@intel.com>
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

