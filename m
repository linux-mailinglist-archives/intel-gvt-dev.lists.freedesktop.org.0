Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49092CBDA1C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3163910E460;
	Mon, 15 Dec 2025 11:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnNxgCG+";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226B010E11F;
 Mon, 15 Dec 2025 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765799636; x=1797335636;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=m9rserkfTnH9DdB9Bc2Akzmppd5aP72Xqfg+5DIiRgc=;
 b=OnNxgCG+HrultnBvpab5nTg8/CBm5EgLQlxPE77Tk0bow3l1GQNFNtps
 TmRDDnIbFMshRofV6+gXZgI+SYrjo6vHqeV6RKbNw7uOUxO+6xT5MuJ3y
 s5vRKqONEZHzmFY/gfUSHGpJtgAP/LxfpTgXSSRz+WWJn4G0n4qI1puaA
 OAT6KEvANAuEMM09RBeI7YSpWGttlNxppTH5bY+0P6TVyuwb7xOZxcfYP
 BUVucJG4TlemTRqTGj0BGaVSgmlPy6jjpstvxHuNfkkjVhAR6nn2MQVoL
 laBXHteZbybCaqfDiSFN9eLop2Q0b4lg1p3RrW696x9acX4KLM4bHu6ll A==;
X-CSE-ConnectionGUID: D3XS1ERlSMyo8AmQdy3SPw==
X-CSE-MsgGUID: E4Yf5tUHSwqA+Jwm1zfI2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66685122"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="66685122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:53:56 -0800
X-CSE-ConnectionGUID: 4lutLiItTVS5uun6y0dl1w==
X-CSE-MsgGUID: roQa5F/NR+mnjtOtceixgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="202816479"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:53:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 3/5] drm/i915/gvt: Add header to use display offset
 functions in macros
In-Reply-To: <20251215111842.2099789-4-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-4-ankit.k.nautiyal@intel.com>
Date: Mon, 15 Dec 2025 13:53:50 +0200
Message-ID: <fa0657de720e63a4f966fd07e86d998f2f94e5f2@intel.com>
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

On Mon, 15 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Introduce gvt/display_helpers.h to make DISPLAY_MMIO_BASE and
> INTEL_DISPLAY_DEVICE_*_OFFSET macros call exported display functions.
> This lets GVT keep using existing register macros (e.g.,
> TRANSCONF(display, pipe)) while ensuring offset calculations happen
> through functions instead of accessing display internals.
>
> Include gvt/display_helpers.h after display headers to avoid
> conflicts.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c      |  2 ++
>  drivers/gpu/drm/i915/gvt/display.c         |  2 ++
>  drivers/gpu/drm/i915/gvt/display_helpers.h | 39 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/fb_decoder.c      |  2 ++
>  drivers/gpu/drm/i915/gvt/handlers.c        |  2 ++
>  5 files changed, 47 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index df04e4ead8ea..6b5e18fca403 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -59,6 +59,8 @@
>  #include "gem/i915_gem_pm.h"
>  #include "gt/intel_context.h"
>=20=20
> +#include "gvt/display_helpers.h"

None of these includes need the gvt/ prefix as they're in the same
subdirectory.

> +
>  #define INVALID_OP    (~0U)
>=20=20
>  #define OP_LEN_MI           9
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 06517d1f07a2..7a51c13b9b58 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -49,6 +49,8 @@
>  #include "display/intel_dpio_phy.h"
>  #include "display/intel_sprite_regs.h"
>=20=20
> +#include "gvt/display_helpers.h"
> +
>  static int get_edp_pipe(struct intel_vgpu *vgpu)
>  {
>  	u32 data =3D vgpu_vreg(vgpu, _TRANS_DDI_FUNC_CTL_EDP);
> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm=
/i915/gvt/display_helpers.h
> new file mode 100644
> index 000000000000..6f68a1e8751a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
> @@ -0,0 +1,39 @@
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
> +enum pipe;
> +enum trans;
> +struct display;
> +
> +#ifdef DISPLAY_MMIO_BASE

Ideally, we shouldn't need these ifdefs. I think it's better if we can
drop any includes from gvt that would cause a conflict here, and it's
better to get the build failure.

If we can't do that in this patch already, then please drop the relevant
includes and these ifdefs at the end of the series.

BR,
Jani.

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
> index a8079cfa8e1d..ee4213fa2cda 100644
> --- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
> +++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
> @@ -47,6 +47,8 @@
>  #include "display/intel_sprite_regs.h"
>  #include "display/skl_universal_plane_regs.h"
>=20=20
> +#include "gvt/display_helpers.h"
> +
>  #define PRIMARY_FORMAT_NUM	16
>  struct pixel_format {
>  	int drm_format;	/* Pixel format in DRM definition */
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 36ea12ade849..3e58e35ea2b9 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -67,6 +67,8 @@
>  #include "gt/intel_gt_regs.h"
>  #include <linux/vmalloc.h>
>=20=20
> +#include "gvt/display_helpers.h"
> +
>  /* XXX FIXME i915 has changed PP_XXX definition */
>  #define PCH_PP_STATUS  _MMIO(0xc7200)
>  #define PCH_PP_CONTROL _MMIO(0xc7204)

--=20
Jani Nikula, Intel
