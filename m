Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAADCCB6CA
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 11:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFB610E68D;
	Thu, 18 Dec 2025 10:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1BD6GU+";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A6F10EDCF;
 Thu, 18 Dec 2025 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766054235; x=1797590235;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZlBe6qL9KxteK5/wBZYn2gm0POVJtiFM8Z1KzXZqfik=;
 b=S1BD6GU+kfdWnQONfKhkwKtN80BnKeyJP1vKb9a0cDtBIa2GLHNT8sfM
 vyRaRHuHlDX2i1lf55Q2VFbvcHvZIwISWcoKsB9AWNCIeN4ipvhKbZqIT
 gvN+93Ma0UmEEermzgUBWEaxJweeEJvc8hSNMyZUACLDOgQCrrsV3pvx7
 +XF/BzmE7Mr20V/u1SoLeXLNtneWEiKT+J1sMxF0iUoAO0L+cxeTcNKPq
 AVO819AYAFp1XBeOdOdw0xNZEfWpxfdnWpqI8ey47sFS/dbVysauTC3zN
 2Vt466AFMBXes2/PSCiut4qDAF2ctURRGEhdkp9+TJnHJPeVv5i9Sn39K w==;
X-CSE-ConnectionGUID: vjaDmmz3RpaV7hbZuEVGOw==
X-CSE-MsgGUID: m+o0aboOQsuvYNO/kDxHGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79375562"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79375562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:37:15 -0800
X-CSE-ConnectionGUID: ehUeG0UXT3upY0sz2lzCPw==
X-CSE-MsgGUID: Kg6B6e4gTIqErP3ylfVbUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198619888"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:37:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 7/7] drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
In-Reply-To: <20251218082302.2327243-8-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-8-ankit.k.nautiyal@intel.com>
Date: Thu, 18 Dec 2025 12:37:08 +0200
Message-ID: <18f8135091af6a08faf7c4d13abc2e8dafe31060@intel.com>
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
> Now that i915/display macros have been substituted with wrappers that call
> the new display-device helpers, we can drop the conflicting includes from
> GVT and remove the temporary #ifdef/#undef macro overrides.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c      |  1 -
>  drivers/gpu/drm/i915/gvt/display_helpers.h | 12 ------------
>  drivers/gpu/drm/i915/gvt/fb_decoder.c      |  1 -
>  drivers/gpu/drm/i915/gvt/handlers.c        |  1 -
>  4 files changed, 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index fbc8a5e28576..e5301733f4e4 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -53,7 +53,6 @@
>  #include "trace.h"
>  
>  #include "display/i9xx_plane_regs.h"
> -#include "display/intel_display_core.h"
>  #include "display/intel_sprite_regs.h"
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_pm.h"
> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
> index a910f8b8833d..f365e02a71fb 100644
> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
> @@ -8,27 +8,15 @@
>  
>  #include "display/intel_gvt_api.h"
>  
> -#ifdef DISPLAY_MMIO_BASE
> -#undef DISPLAY_MMIO_BASE
> -#endif
>  #define DISPLAY_MMIO_BASE(display) \
>  	intel_display_device_mmio_base((display))
>  
> -#ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
> -#undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
> -#endif
>  #define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, idx) \
>  	intel_display_device_pipe_offset((display), (enum pipe)(idx))
>  
> -#ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
> -#undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
> -#endif
>  #define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
>  	intel_display_device_trans_offset((display), (trans))
>  
> -#ifdef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
> -#undef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
> -#endif
>  #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>  	intel_display_device_cursor_offset((display), (pipe))
>  
> diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
> index c402f3b5a0ab..3d1a7e5c8cd3 100644
> --- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
> +++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
> @@ -43,7 +43,6 @@
>  
>  #include "display/i9xx_plane_regs.h"
>  #include "display/intel_cursor_regs.h"
> -#include "display/intel_display_core.h"
>  #include "display/intel_sprite_regs.h"
>  #include "display/skl_universal_plane_regs.h"
>  #include "display_helpers.h"
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index 9ada97d01b6c..7063d3c77562 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -49,7 +49,6 @@
>  #include "display/i9xx_plane_regs.h"
>  #include "display/intel_crt_regs.h"
>  #include "display/intel_cursor_regs.h"
> -#include "display/intel_display_core.h"
>  #include "display/intel_display_types.h"
>  #include "display/intel_dmc_regs.h"
>  #include "display/intel_dp_aux_regs.h"

-- 
Jani Nikula, Intel
