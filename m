Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD46CCEA01
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Dec 2025 07:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28510EE0B;
	Fri, 19 Dec 2025 06:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2WP6+Mu";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF4810EE0B;
 Fri, 19 Dec 2025 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766124931; x=1797660931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GI1u3E+Dys+aEZfnV0Geqa0ZxSngpFXGSZkxzq0ZEmA=;
 b=e2WP6+Mu0SpgxGXKOw0efRbKl0Jk/inCu0/5msvs2MEI+EzeSPHRXpCQ
 zKNhKBCTrluage86Nct8Q+MxwHFuJCPp7UPqupkjrM2HeQmh5mGq8kzgU
 ghP19sMmSA8DOMcPYWiE0r/TKigbwbjwcTRrQwb8m8kIzmd79uWkNnhA9
 e3NmMbAjRA0SA3DqBlFuo0jz/bBWBJVZEWBgTktaApyuhsu3q48ZB44NG
 9W6Mf6N1hNvQ1OwHdHg5OTfsbfeXN6S67o+Nys3RcCxUoS8xQUuPkGf4y
 SvnQea/fFzB/h3L2Is5qFiaDT0m7CxYWvExjFO7sR9od1ZxsrMYJ9cr6t Q==;
X-CSE-ConnectionGUID: 8J3h+W/uQiycY2l7UR9ing==
X-CSE-MsgGUID: eUGgfgAKQl6zVbHuNr2vrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68058623"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68058623"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:31 -0800
X-CSE-ConnectionGUID: 7nSFi1QbR/2NKc77Kr1sRQ==
X-CSE-MsgGUID: ymazxihXQIO1eJOJoAdvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229464693"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:30 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/6] drm/i915/gvt: Change for_each_pipe to use pipe_valid API
Date: Fri, 19 Dec 2025 11:32:57 +0530
Message-ID: <20251219060302.2365123-5-ankit.k.nautiyal@intel.com>
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

Add a new API to check if a given pipe is valid using
DISPLAY_RUNTIME_INFO() for GVT.

Update GVT to use this API instead of accessing
`DISPLAY_RUNTIME_INFO->pipe_mask` directly in the `for_each_pipe` macro.

Since `for_each_pipe` is defined in i915/display/intel_display.h, which
also contains other macros used by gvt/display.c, we cannot drop the
intel_display.h header yet. This causes a build error because
`for_each_pipe` is included from both i915/display/intel_display.h and
gvt/display_helpers.h.

To resolve this, rename the GVT macro to `gvt_for_each_pipe` and make it
call the new API. This avoids exposing display internals and prepares for
display modularization.

v2:
 - Expose API to check if pipe is valid rather than the runtime info
   pipe mask. (Jani)
 - Rename the macro to `gvt_for_each_pipe` to resolve build error.
v3:
 - Use EXPORT_SYMBOL_NS_GPL(..., "I915_GVT"); (Jani)
 - Use enum pipe at call sites instead of casting in the macro. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gvt_api.c |  9 +++++++++
 drivers/gpu/drm/i915/display/intel_gvt_api.h |  1 +
 drivers/gpu/drm/i915/gvt/display.c           | 10 +++++-----
 drivers/gpu/drm/i915/gvt/display_helpers.h   |  4 ++++
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
index b1bfe4843135..a69e249395ae 100644
--- a/drivers/gpu/drm/i915/display/intel_gvt_api.c
+++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
@@ -32,3 +32,12 @@ u32 intel_display_device_mmio_base(struct intel_display *display)
 	return DISPLAY_MMIO_BASE(display);
 }
 EXPORT_SYMBOL_NS_GPL(intel_display_device_mmio_base, "I915_GVT");
+
+bool intel_display_device_pipe_valid(struct intel_display *display, enum pipe pipe)
+{
+	if (pipe < PIPE_A || pipe >= I915_MAX_PIPES)
+		return false;
+
+	return DISPLAY_RUNTIME_INFO(display)->pipe_mask & BIT(pipe);
+}
+EXPORT_SYMBOL_NS_GPL(intel_display_device_pipe_valid, "I915_GVT");
diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
index e9a1122a988d..a53687f7d934 100644
--- a/drivers/gpu/drm/i915/display/intel_gvt_api.h
+++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
@@ -16,5 +16,6 @@ u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pi
 u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
 u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
 u32 intel_display_device_mmio_base(struct intel_display *display);
+bool intel_display_device_pipe_valid(struct intel_display *display, enum pipe pipe);
 
 #endif /* __INTEL_GVT_API_H__ */
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 9d6b22b2e4d0..1d0c581a8ccc 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -188,7 +188,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
 	struct intel_display *display = dev_priv->display;
-	int pipe;
+	enum pipe pipe;
 
 	if (IS_BROXTON(dev_priv)) {
 		enum transcoder trans;
@@ -200,7 +200,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_B) |
 			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_C));
 
-		for_each_pipe(display, pipe) {
+		gvt_for_each_pipe(display, pipe) {
 			vgpu_vreg_t(vgpu, TRANSCONF(display, pipe)) &=
 				~(TRANSCONF_ENABLE | TRANSCONF_STATE_ENABLE);
 			vgpu_vreg_t(vgpu, DSPCNTR(display, pipe)) &= ~DISP_ENABLE;
@@ -516,7 +516,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 		vgpu_vreg_t(vgpu, PCH_ADPA) &= ~ADPA_CRT_HOTPLUG_MONITOR_MASK;
 
 	/* Disable Primary/Sprite/Cursor plane */
-	for_each_pipe(display, pipe) {
+	gvt_for_each_pipe(display, pipe) {
 		vgpu_vreg_t(vgpu, DSPCNTR(display, pipe)) &= ~DISP_ENABLE;
 		vgpu_vreg_t(vgpu, SPRCTL(pipe)) &= ~SPRITE_ENABLE;
 		vgpu_vreg_t(vgpu, CURCNTR(display, pipe)) &= ~MCURSOR_MODE_MASK;
@@ -669,10 +669,10 @@ void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu)
 {
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	struct intel_display *display = i915->display;
-	int pipe;
+	enum pipe pipe;
 
 	mutex_lock(&vgpu->vgpu_lock);
-	for_each_pipe(display, pipe)
+	gvt_for_each_pipe(display, pipe)
 		emulate_vblank_on_pipe(vgpu, pipe);
 	mutex_unlock(&vgpu->vgpu_lock);
 }
diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
index 46c5192a79a7..7c6e15aa280a 100644
--- a/drivers/gpu/drm/i915/gvt/display_helpers.h
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -42,4 +42,8 @@
 #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
 	intel_display_device_cursor_offset((display), (pipe))
 
+#define gvt_for_each_pipe(display, __p) \
+	for ((__p) = PIPE_A; (__p) < I915_MAX_PIPES; (__p)++) \
+		for_each_if(intel_display_device_pipe_valid((display), (__p)))
+
 #endif /* __DISPLAY_HELPERS_H__ */
-- 
2.45.2

