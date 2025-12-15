Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441CCBDAA9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 13:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8B910E46F;
	Mon, 15 Dec 2025 12:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffhclWew";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D84110E474;
 Mon, 15 Dec 2025 12:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765800069; x=1797336069;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=a7J9cXlVxiyjvS/iWvxTSaNoNMJG7z0g5HLTqv/VcMI=;
 b=ffhclWewVwMbV/6SQHcE5wx027oRflNKOCDi6Y6SnDU4GStAIkSswMIW
 bxAtaiBFjmOmLP+Rc3kgw8Bl8X+XPrHQ29/unkI2dEa+JLYLMaBuiSQUL
 MFCViChm35lWZm/ns6zIL7A7LiHWF7M6DEs55FD1Ll81xxjuzx3K7PXN+
 B7zSl9G1igF8rIGHtPIgPN9ceXIp6FjGJjIipT8ChDx7on8RqgC4K162u
 Smfy2rOrnnmBAjtGp2+EvioVBmvA1hEbkgrAzgECBwxN70f6kI+ZKlJJ+
 JinpO5mjdLz5wcB0+Q+2jnA0UlYg4qoPAxt38WNwZcY/mSti5IYylaQff A==;
X-CSE-ConnectionGUID: Udr1iRpUTRCxq2ecWdaWPA==
X-CSE-MsgGUID: 1y6mZ7CYTFuEPL4ZOw1cvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67853354"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67853354"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 04:01:09 -0800
X-CSE-ConnectionGUID: O2aiBP/QTCyMN4+FjRPJMw==
X-CSE-MsgGUID: t0HWtlv+RauYEELHzD334g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197323698"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 04:01:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 4/5] drm/i915/gvt: Change for_each_pipe to use pipe_mask
 API
In-Reply-To: <20251215111842.2099789-5-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-5-ankit.k.nautiyal@intel.com>
Date: Mon, 15 Dec 2025 14:00:55 +0200
Message-ID: <2785d3cddb6199bc7e6cef3374dbff46d4cae205@intel.com>
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

On Mon, 15 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Add a new API to get pipe_mask from DISPLAY_RUNTIME_INFO() for GVT.
> Update the for_each_pipe() macro in GVT to call this API, instead of
> accessing DISPLAY_RUNTIME_INFO()->pipe_mask directly.
>
> This keeps the macro usable in GVT without exposing display internals
> and prepares for display modularization.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gvt_api.c | 6 ++++++
>  drivers/gpu/drm/i915/display/intel_gvt_api.h | 1 +
>  drivers/gpu/drm/i915/gvt/display_helpers.h   | 7 +++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
> index 8abea318fbc2..0b09bbf2c29a 100644
> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.c
> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
> @@ -32,3 +32,9 @@ u32 intel_display_device_mmio_base(struct intel_display *display)
>  	return DISPLAY_MMIO_BASE(display);
>  }
>  EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
> +
> +u8 intel_display_runtime_info_pipe_mask(struct intel_display *display)
> +{
> +	return DISPLAY_RUNTIME_INFO(display)->pipe_mask;
> +}

I don't think gvt needs to know it's about "runtime info". Maybe make it
just intel_display_device_pipe_mask()?

Though I'm also wondering about making it even more abstracted with
something like intel_display_device_pipe_valid(), and using that for the
various other cases that check pipes in GVT. But maybe the patch at hand
is a good start.

> +EXPORT_SYMBOL_GPL(intel_display_runtime_info_pipe_mask);
> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
> index e9a1122a988d..8ceda30a969b 100644
> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.h
> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
> @@ -16,5 +16,6 @@ u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pi
>  u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
>  u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
>  u32 intel_display_device_mmio_base(struct intel_display *display);
> +u8 intel_display_runtime_info_pipe_mask(struct intel_display *display);
>  
>  #endif /* __INTEL_GVT_API_H__ */
> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
> index 6f68a1e8751a..d11ebb03b946 100644
> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
> @@ -36,4 +36,11 @@ struct display;
>  #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>  	intel_display_device_cursor_offset((display), (pipe))
>  
> +#ifdef for_each_pipe

Ditto about ifdefs here as with previous patch.

> +#undef for_each_pipe
> +#endif
> +#define for_each_pipe(display, __p) \
> +	for ((__p) = 0; (__p) < I915_MAX_PIPES; (__p)++) \
> +		for_each_if(intel_display_runtime_info_pipe_mask((display)) & BIT(__p))
> +
>  #endif /* __DISPLAY_HELPERS_H__ */

-- 
Jani Nikula, Intel
