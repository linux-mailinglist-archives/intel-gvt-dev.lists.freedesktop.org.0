Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FECCCB63C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 11:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D210C10EC91;
	Thu, 18 Dec 2025 10:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrCncB1Z";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC4110E8E0;
 Thu, 18 Dec 2025 10:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766053964; x=1797589964;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KlY+MFvvYMERc6aykTgotQSyyzK5SFSWJxI6oUGSNKc=;
 b=VrCncB1ZgMlBVm+w+HPQhf8+FU1sP7Ij/90zvKoDTRu2//Qzc5zbrrc5
 H3V3u748XRKZCwDgGB3nJhHA4uMcArN05kkFExSbAa8laIeWy7k1gNuSd
 vpl+eqCoECzPS/KyhtMflQKzyEia2IPgttmRbYgLJvRLTNBV+jmc/RkJz
 otzY4jDbhns9CjktcNrzJUV3gaHB9R+/EKtpS6vr6KiIDPqgsZ63jvb5A
 OQLe7QEnf/odKcH/0aYvYtzaZRBOIK7wx1VA+kge4dpqEgA4os41coZqB
 RBL4vD9m3sZ1C5NaSOz6p+0yn23LOs7MsNmIxjsVHGzPHfM9gYL89OQPs Q==;
X-CSE-ConnectionGUID: rNjnGq06Tm2ocZTi6kciSw==
X-CSE-MsgGUID: 5SurjU+ORdeNpTgeBPzKKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85589250"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="85589250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:32:39 -0800
X-CSE-ConnectionGUID: 9sdls6NtQ+WXa44qYuJQvg==
X-CSE-MsgGUID: a/2xog0vTA2H2dOdjBIsQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203448631"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:32:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 2/7] drm/i915/display: Add APIs to be used by gvt to get
 the register offsets
In-Reply-To: <20251218082302.2327243-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-3-ankit.k.nautiyal@intel.com>
Date: Thu, 18 Dec 2025 12:32:34 +0200
Message-ID: <d3d285c5180e950b8189d7d96d06d21f1d88cf6f@intel.com>
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
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

Actually, this should be:

i915-$(CONFIG_DRM_I915_GVT) +=3D \
	display/intel_gvt_api.o

i.e. let's not add this stuff unless GVT is actually enabled.

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

And the exports should be

EXPORT_SYMBOL_NS_GPL(..., "I915_GVT");

to limit the exposure.

Sorry for not catching this earlier.

BR,
Jani.

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
