Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676DECCB5BE
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 11:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2226010EDAF;
	Thu, 18 Dec 2025 10:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0oVNCIb";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1C910EDAD;
 Thu, 18 Dec 2025 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766053578; x=1797589578;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZQpqbekmKPRo5A0BsiWobppWHjkYl09GhWygJ3ZCjKQ=;
 b=X0oVNCIbXTU4+WwvNiUjNr3aSorMm6LmzEdUTxTg6nAgncrHxL6EYaMZ
 dPPGHtcH8XyaTBXIWKQQT7aPaHROylDJrIPr1rH2lfR9YCDX+JH/oiVre
 vZ1tHRfEE3HDY6+eQLgTAFQ1mJbHALgl4cS1PmmyvdWG18+ObKeZK5XyW
 uaWstxt68Lxyxkx3aRiQR6NHlpptmYYmH5XbTz0A5t+hrudba5/1lP1R/
 VLepYoAcPjxMYpo9HHcteF9v/dldX5N/0RyH38XV4Z+rIUsye8R/XiwsR
 wlmKrhblTEduj8g0jbVNyl6NG2IsOzDyGo+5GbKZg6MIvPdRCa5Bg1k6h A==;
X-CSE-ConnectionGUID: GRsTU3NUTOyrENhlj7RFIw==
X-CSE-MsgGUID: LyNtImPeQdKMjNl/OhUVgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="93477983"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="93477983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:26:18 -0800
X-CSE-ConnectionGUID: vx+khHisTB6bIX8v4TilNA==
X-CSE-MsgGUID: JKL4yA17TNOT+Pw8HpyX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="202731774"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:26:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 3/7] drm/i915/gvt: Add header to use display offset
 functions in macros
In-Reply-To: <20251218082302.2327243-4-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-4-ankit.k.nautiyal@intel.com>
Date: Thu, 18 Dec 2025 12:26:13 +0200
Message-ID: <1a7ee73533ab587bbc6e3af7b90b56749d0d5c94@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
> Introduce gvt/display_helpers.h to make DISPLAY_MMIO_BASE and
> INTEL_DISPLAY_DEVICE_*_OFFSET macros call exported display functions.
> This lets GVT keep using existing register macros (e.g.,
> TRANSCONF(display, pipe)) while ensuring offset calculations happen
> through functions instead of accessing display internals.
>
> Ideally, we would remove the display headers that define these macros,
> but some macros in GVT still depend on them and have not yet been
> ported. Keeping those headers leads to build conflicts, so as a
> stopgap, we use temporary ifdef/undef blocks to override the macros
> with API-backed versions. These will be removed once all dependent
> macros are ported and the conflicting headers can be safely dropped.
>
> v2:
>  - Remove prefix `gvt/` while including the header file. (Jani)
>  - Explain the rationale behind temporary ifdef/undefs and plan to drop
>    them. (Jani).
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

See my reply to the next patch, with that incorporated,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c      |  1 +
>  drivers/gpu/drm/i915/gvt/display.c         |  1 +
>  drivers/gpu/drm/i915/gvt/display_helpers.h | 35 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/fb_decoder.c      |  1 +
>  drivers/gpu/drm/i915/gvt/handlers.c        |  1 +
>  5 files changed, 39 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index df04e4ead8ea..fbc8a5e28576 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -58,6 +58,7 @@
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_pm.h"
>  #include "gt/intel_context.h"
> +#include "display_helpers.h"
>=20=20
>  #define INVALID_OP    (~0U)
>=20=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 06517d1f07a2..9d6b22b2e4d0 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -46,6 +46,7 @@
>  #include "display/intel_cursor_regs.h"
>  #include "display/intel_display.h"
>  #include "display/intel_display_core.h"
> +#include "display_helpers.h"
>  #include "display/intel_dpio_phy.h"
>  #include "display/intel_sprite_regs.h"
>=20=20
> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm=
/i915/gvt/display_helpers.h
> new file mode 100644
> index 000000000000..97ebc92768fc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#ifndef __DISPLAY_HELPERS_H__
> +#define __DISPLAY_HELPERS_H__
> +
> +#include "display/intel_gvt_api.h"
> +
> +#ifdef DISPLAY_MMIO_BASE
> +#undef DISPLAY_MMIO_BASE
> +#endif
> +#define DISPLAY_MMIO_BASE(display) \
> +	intel_display_device_mmio_base((display))
> +
> +#ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
> +#undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
> +#endif
> +#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
> +	intel_display_device_pipe_offset((display), (pipe))
> +
> +#ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
> +#undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
> +#endif
> +#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
> +	intel_display_device_trans_offset((display), (trans))
> +
> +#ifdef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
> +#undef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
> +#endif
> +#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
> +	intel_display_device_cursor_offset((display), (pipe))
> +
> +#endif /* __DISPLAY_HELPERS_H__ */
> diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915=
/gvt/fb_decoder.c
> index a8079cfa8e1d..c402f3b5a0ab 100644
> --- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
> +++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
> @@ -46,6 +46,7 @@
>  #include "display/intel_display_core.h"
>  #include "display/intel_sprite_regs.h"
>  #include "display/skl_universal_plane_regs.h"
> +#include "display_helpers.h"
>=20=20
>  #define PRIMARY_FORMAT_NUM	16
>  struct pixel_format {
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 36ea12ade849..9ada97d01b6c 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -66,6 +66,7 @@
>  #include "display/vlv_dsi_pll_regs.h"
>  #include "gt/intel_gt_regs.h"
>  #include <linux/vmalloc.h>
> +#include "display_helpers.h"
>=20=20
>  /* XXX FIXME i915 has changed PP_XXX definition */
>  #define PCH_PP_STATUS  _MMIO(0xc7200)

--=20
Jani Nikula, Intel
