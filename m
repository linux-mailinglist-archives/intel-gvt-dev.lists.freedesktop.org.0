Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDCCBD9EF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742AB10E445;
	Mon, 15 Dec 2025 11:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8Ara4ho";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5883B10E445;
 Mon, 15 Dec 2025 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765799489; x=1797335489;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=N3ZzlcNfg8rSjIZJqVXmSsyJ1r2iHEkHNLiP1SF1lVA=;
 b=L8Ara4ho9xW7ovgjsFyIEitsQgkrzZihct75XurTStWZxyk669RTNli1
 Q8I1CTYaqpL/q4GNy30Wyc+aWycuoXBRZhfVX1yYppWNwfaFtVtKO4RM/
 4LhJUaNheQ10alomWYXjs59G5P0vi5wDzF96fbRGlgbk16r431UqkQsV5
 aA49ZPyqW6QdXnFyDKmDM74NY6c102NIvp6SK4kwOE3Vu0k0qQoLTBtDR
 652m8LG1fS/htN8IwcpB4ZPquJKjJ2g+5L2DWA3hPEBkp2wyltPwlko9r
 my5GDOQ/FRZAtF5o1rILZOM+ZIDUEvoZiDl8eT9SZuvG67/GiWEbfjOKb w==;
X-CSE-ConnectionGUID: XkQdmzDARwqxSz2h04g8KA==
X-CSE-MsgGUID: iZ1U/a9BQEa8y04mcx7sAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67575434"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67575434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:51:28 -0800
X-CSE-ConnectionGUID: xwj+zhteRZOuV8St5VM13A==
X-CSE-MsgGUID: 6Nmcf14LR9+AgJDpNOO9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197588899"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:51:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 2/5] drm/i915/display: Add APIs to be used by gvt to get
 the register offsets
In-Reply-To: <20251215111842.2099789-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-3-ankit.k.nautiyal@intel.com>
Date: Mon, 15 Dec 2025 13:51:22 +0200
Message-ID: <f1c4f84c7676c7b84116f63d14c39350d0880d90@intel.com>
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
> GVT code uses macros for register offsets that require display internal
> structures. This makes clean separation of display code and
> modularization difficult.
>
> Introduce APIs to abstract offset calculations:
> - intel_display_device_pipe_offset()
> - intel_display_device_trans_offset()
> - intel_display_device_cursor_offset()
> - intel_display_device_mmio_base()
>
> These APIs return absolute base offsets for the respective register
> groups, allowing GVT to compute MMIO addresses without using internal
> macros or struct fields. This prepares the path to separate
> display-dependent code from i915/gvt/*.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

I think we'll probably need to unify the naming for other display
exports in the future, as well as make the exports namespaced. But seems
good enough for now,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/Makefile                 |  1 +
>  .../drm/i915/display/intel_display_limits.c   |  0
>  drivers/gpu/drm/i915/display/intel_gvt_api.c  | 34 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_gvt_api.h  | 20 +++++++++++
>  4 files changed, 55 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index f01b5d8a07c7..7974f017f263 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -360,6 +360,7 @@ i915-y +=3D \
>  	display/intel_dvo.o \
>  	display/intel_encoder.o \
>  	display/intel_gmbus.o \
> +	display/intel_gvt_api.o \
>  	display/intel_hdmi.o \
>  	display/intel_lspcon.o \
>  	display/intel_lt_phy.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.c b/driver=
s/gpu/drm/i915/display/intel_display_limits.c
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/d=
rm/i915/display/intel_gvt_api.c
> new file mode 100644
> index 000000000000..8abea318fbc2
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +#include "intel_display_core.h"
> +#include "intel_display_regs.h"
> +#include "intel_gvt_api.h"
> +
> +u32 intel_display_device_pipe_offset(struct intel_display *display, enum=
 pipe pipe)
> +{
> +	return INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe);
> +}
> +EXPORT_SYMBOL_GPL(intel_display_device_pipe_offset);
> +
> +u32 intel_display_device_trans_offset(struct intel_display *display, enu=
m transcoder trans)
> +{
> +	return INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans);
> +}
> +EXPORT_SYMBOL_GPL(intel_display_device_trans_offset);
> +
> +u32 intel_display_device_cursor_offset(struct intel_display *display, en=
um pipe pipe)
> +{
> +	return INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe);
> +}
> +EXPORT_SYMBOL_GPL(intel_display_device_cursor_offset);
> +
> +u32 intel_display_device_mmio_base(struct intel_display *display)
> +{
> +	return DISPLAY_MMIO_BASE(display);
> +}
> +EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/d=
rm/i915/display/intel_gvt_api.h
> new file mode 100644
> index 000000000000..e9a1122a988d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_GVT_API_H__
> +#define __INTEL_GVT_API_H__
> +
> +#include <linux/types.h>
> +
> +enum pipe;
> +enum transcoder;
> +struct intel_display;
> +
> +u32 intel_display_device_pipe_offset(struct intel_display *display, enum=
 pipe pipe);
> +u32 intel_display_device_trans_offset(struct intel_display *display, enu=
m transcoder trans);
> +u32 intel_display_device_cursor_offset(struct intel_display *display, en=
um pipe pipe);
> +u32 intel_display_device_mmio_base(struct intel_display *display);
> +
> +#endif /* __INTEL_GVT_API_H__ */

--=20
Jani Nikula, Intel
