Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F4CBD80D
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CF610E3FD;
	Mon, 15 Dec 2025 11:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cj5/H+3P";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AF310E3F4;
 Mon, 15 Dec 2025 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765798273; x=1797334273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s1fecovY+ehuPTdKPZLFKReYbzHtHee9l3YnzIquyvY=;
 b=Cj5/H+3Pdg/n8LFYBYoKCZET+zuxuGWoPmznnPfxP1HMVaPW9EFvAyPt
 Is+HkyQxeu1v153yCUVFgs42CpNrCNt4FZK6CIMqrqLeSCE5CCGuUWDAR
 5hnvr6jKxStJtJmFGPeVSOdENJvWt3dhq5gGy/rs13IfhliKaT8bwIRFo
 VAOGOKLFSNHdJi6ehZajSZejxGYbyL9mLDP7emioOoSIeohQSZU3aq7IW
 SZNNt+NDrjbWgEl+pgbYW8jZqVyNkgiVoEdsJ8RO0M14F+aRY3Cic5gt2
 Xg8hBg5G8+JCVL9aSIWqD3R51A36ytwc79VoFAdLLK/AUbxvoX9dK/s4A A==;
X-CSE-ConnectionGUID: nn3n4He7SGaBzMonVgL8WA==
X-CSE-MsgGUID: RnUYwbC8TXm9d8s6yb5ZDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67732777"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67732777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:12 -0800
X-CSE-ConnectionGUID: IvC5R59MTcSNPHGUvNmH/A==
X-CSE-MsgGUID: HUvbGO7cRCWr0HXBEmLDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235090425"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:12 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/5] drm/i915/gvt: Change for_each_pipe to use pipe_mask API
Date: Mon, 15 Dec 2025 16:48:40 +0530
Message-ID: <20251215111842.2099789-5-ankit.k.nautiyal@intel.com>
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

Add a new API to get pipe_mask from DISPLAY_RUNTIME_INFO() for GVT.
Update the for_each_pipe() macro in GVT to call this API, instead of
accessing DISPLAY_RUNTIME_INFO()->pipe_mask directly.

This keeps the macro usable in GVT without exposing display internals
and prepares for display modularization.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gvt_api.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_gvt_api.h | 1 +
 drivers/gpu/drm/i915/gvt/display_helpers.h   | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
index 8abea318fbc2..0b09bbf2c29a 100644
--- a/drivers/gpu/drm/i915/display/intel_gvt_api.c
+++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
@@ -32,3 +32,9 @@ u32 intel_display_device_mmio_base(struct intel_display *display)
 	return DISPLAY_MMIO_BASE(display);
 }
 EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
+
+u8 intel_display_runtime_info_pipe_mask(struct intel_display *display)
+{
+	return DISPLAY_RUNTIME_INFO(display)->pipe_mask;
+}
+EXPORT_SYMBOL_GPL(intel_display_runtime_info_pipe_mask);
diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
index e9a1122a988d..8ceda30a969b 100644
--- a/drivers/gpu/drm/i915/display/intel_gvt_api.h
+++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
@@ -16,5 +16,6 @@ u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pi
 u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
 u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
 u32 intel_display_device_mmio_base(struct intel_display *display);
+u8 intel_display_runtime_info_pipe_mask(struct intel_display *display);
 
 #endif /* __INTEL_GVT_API_H__ */
diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
index 6f68a1e8751a..d11ebb03b946 100644
--- a/drivers/gpu/drm/i915/gvt/display_helpers.h
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -36,4 +36,11 @@ struct display;
 #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
 	intel_display_device_cursor_offset((display), (pipe))
 
+#ifdef for_each_pipe
+#undef for_each_pipe
+#endif
+#define for_each_pipe(display, __p) \
+	for ((__p) = 0; (__p) < I915_MAX_PIPES; (__p)++) \
+		for_each_if(intel_display_runtime_info_pipe_mask((display)) & BIT(__p))
+
 #endif /* __DISPLAY_HELPERS_H__ */
-- 
2.45.2

