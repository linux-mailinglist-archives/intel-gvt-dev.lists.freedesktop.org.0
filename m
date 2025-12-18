Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8BCCB69C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 11:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4E510EDBA;
	Thu, 18 Dec 2025 10:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJUowBTm";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E10A10EDBA;
 Thu, 18 Dec 2025 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766054178; x=1797590178;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LIAgvpqvdS9R/g5ZvnxwoQO8KvYwvzwI3udqA0mf0B8=;
 b=hJUowBTmmU9iPm6ZNgwRbE5wdCSH5TMi3W4EanX0NyE0OThFYmRkuWG8
 QuKJojnENRieQ+8QiE6HUH423B8lEgawHN8XxVctAYlVS8dRUjqO9IXIr
 RA/EKY+66DPEP7Jlm1PbEAxPy4IvaxuYLWyVZZ67/htiKjYrx57hFI0eh
 FPQyHzfW0Vwrr7xjg79a9ojJYVDiLLHVOEXD+KSX0XgYezGFiQYIURGSI
 Tc5DZCA5j0lL9+D6PfJB0L6kxLG91jyWB9znYygEOHgLajzqfiikXs9E9
 ldQIPsgznw5NxAGHB1zhLeJGBYRtM6bmiyzEnwiM+1FjUoHWarDaXXQcB w==;
X-CSE-ConnectionGUID: ofLaQhCBQSOV7V8rYls8xQ==
X-CSE-MsgGUID: Pwr2BxLCQJmNxejvfjuYZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79128180"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79128180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:36:17 -0800
X-CSE-ConnectionGUID: 7PF5PmlnTmeBqBb25f9oRQ==
X-CSE-MsgGUID: k0YakRtdRjyV5goKG//qlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="197698709"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:36:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 5/7] drm/i915/gvt: Change for_each_pipe to use
 pipe_valid API
In-Reply-To: <20251218082302.2327243-6-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-6-ankit.k.nautiyal@intel.com>
Date: Thu, 18 Dec 2025 12:36:11 +0200
Message-ID: <fab98bc3d1034b8752a151a026c78370b6662ac3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 18 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Add a new API to check if a given pipe is valid using
> DISPLAY_RUNTIME_INFO() for GVT.
>
> Update GVT to use this API instead of accessing
> `DISPLAY_RUNTIME_INFO->pipe_mask` directly in the `for_each_pipe` macro.
>
> Since `for_each_pipe` is defined in i915/display/intel_display.h, which
> also contains other macros used by gvt/display.c, we cannot drop the
> intel_display.h header yet. This causes a build error because
> `for_each_pipe` is included from both i915/display/intel_display.h and
> gvt/display_helpers.h.
>
> To resolve this, rename the GVT macro to `gvt_for_each_pipe` and make it
> call the new API. This avoids exposing display internals and prepares for
> display modularization.
>
> v2:
>  - Expose API to check if pipe is valid rather than the runtime info
>    pipe mask. (Jani)
>  - Rename the macro to `gvt_for_each_pipe` to resolve build error.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gvt_api.c | 11 +++++++++++
>  drivers/gpu/drm/i915/display/intel_gvt_api.h |  1 +
>  drivers/gpu/drm/i915/gvt/display.c           |  6 +++---
>  drivers/gpu/drm/i915/gvt/display_helpers.h   |  4 ++++
>  4 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
> index 8abea318fbc2..45f12f239a2d 100644
> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.c
> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
> @@ -32,3 +32,14 @@ u32 intel_display_device_mmio_base(struct intel_display *display)
>  	return DISPLAY_MMIO_BASE(display);
>  }
>  EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
> +
> +bool intel_display_device_pipe_valid(struct intel_display *display, enum pipe pipe)
> +{
> +	u8 pipe_mask = DISPLAY_RUNTIME_INFO(display)->pipe_mask;
> +
> +	if (pipe < PIPE_A || pipe >= I915_MAX_PIPES)
> +		return false;
> +
> +	return !!(pipe_mask & BIT(pipe));

Nitpick, return pipe_mask & BIT(pipe); is sufficient, the !! is
superfluous.

> +}
> +EXPORT_SYMBOL_GPL(intel_display_device_pipe_valid);

EXPORT_SYMBOL_NS_GPL(..., "I915_GVT");

> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
> index e9a1122a988d..a53687f7d934 100644
> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.h
> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
> @@ -16,5 +16,6 @@ u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pi
>  u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
>  u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
>  u32 intel_display_device_mmio_base(struct intel_display *display);
> +bool intel_display_device_pipe_valid(struct intel_display *display, enum pipe pipe);
>  
>  #endif /* __INTEL_GVT_API_H__ */
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
> index 9d6b22b2e4d0..11855c71e05e 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -200,7 +200,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>  			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_B) |
>  			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_C));
>  
> -		for_each_pipe(display, pipe) {
> +		gvt_for_each_pipe(display, pipe) {
>  			vgpu_vreg_t(vgpu, TRANSCONF(display, pipe)) &=
>  				~(TRANSCONF_ENABLE | TRANSCONF_STATE_ENABLE);
>  			vgpu_vreg_t(vgpu, DSPCNTR(display, pipe)) &= ~DISP_ENABLE;
> @@ -516,7 +516,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>  		vgpu_vreg_t(vgpu, PCH_ADPA) &= ~ADPA_CRT_HOTPLUG_MONITOR_MASK;
>  
>  	/* Disable Primary/Sprite/Cursor plane */
> -	for_each_pipe(display, pipe) {
> +	gvt_for_each_pipe(display, pipe) {
>  		vgpu_vreg_t(vgpu, DSPCNTR(display, pipe)) &= ~DISP_ENABLE;
>  		vgpu_vreg_t(vgpu, SPRCTL(pipe)) &= ~SPRITE_ENABLE;
>  		vgpu_vreg_t(vgpu, CURCNTR(display, pipe)) &= ~MCURSOR_MODE_MASK;
> @@ -672,7 +672,7 @@ void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu)
>  	int pipe;
>  
>  	mutex_lock(&vgpu->vgpu_lock);
> -	for_each_pipe(display, pipe)
> +	gvt_for_each_pipe(display, pipe)
>  		emulate_vblank_on_pipe(vgpu, pipe);
>  	mutex_unlock(&vgpu->vgpu_lock);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
> index 3af878e3d78e..a910f8b8833d 100644
> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
> @@ -32,4 +32,8 @@
>  #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>  	intel_display_device_cursor_offset((display), (pipe))
>  
> +#define gvt_for_each_pipe(display, __p) \
> +	for ((__p) = 0; (__p) < I915_MAX_PIPES; (__p)++) \
> +		for_each_if(intel_display_device_pipe_valid((display), (enum pipe)(__p)))

I think the caller should use enum pipe instead of int pipe and casting
here.

BR,
Jani.

> +
>  #endif /* __DISPLAY_HELPERS_H__ */

-- 
Jani Nikula, Intel
