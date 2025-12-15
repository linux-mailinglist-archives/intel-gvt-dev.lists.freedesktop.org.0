Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6E7CBD944
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306AF10E43C;
	Mon, 15 Dec 2025 11:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eH0KDkAE";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A385A10E42F;
 Mon, 15 Dec 2025 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765799093; x=1797335093;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3oYr9SHPo7Yyr+Nv2YY10qX9wsIYJdTD1+cRCA59af4=;
 b=eH0KDkAEnoWCiQKN3sScEmo7gIZ9veTnB34nZE4XAF8ztqtRXof/4Cot
 urz6VrRGVBKKUV3LpAyZHUH0OiYg3D67ZzW+h0jwt3A2opqoqP5aRcgUe
 OwTzbfLYlJ8123O0AGYTDfFyUEAcY0c68B9NSM/2RIuKSgylxVWNwvw37
 29Whou5s9xsbc9EafGfrU7/bFCuZyV769Mg7W2ZRp+bYgmIywcWJcZ07y
 TGmv7ZwZNJO+IAxc6AFGuzQG6tAkEY+9J6/DYOuWlM7X/S/YlIsSOymac
 ++Jabzf3yWrtI/wcbkELj6V0JtExvevFbCwG8AZiVszns9qYSuSvs6ktf Q==;
X-CSE-ConnectionGUID: 7Vqsh0D9SFKLVjgStSv9HQ==
X-CSE-MsgGUID: dHNceC/fRC6MGsDNW9LwaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66880968"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="66880968"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:44:52 -0800
X-CSE-ConnectionGUID: Ll6EP8vgTnKFPtS9wNvHrQ==
X-CSE-MsgGUID: MaQVdqGCSV+MW3pWBhEiJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="202114469"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:44:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 1/5] drm/i915/display: Abstract pipe/trans/cursor offset
 calculation
In-Reply-To: <20251215111842.2099789-2-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-2-ankit.k.nautiyal@intel.com>
Date: Mon, 15 Dec 2025 13:44:47 +0200
Message-ID: <9c87d4900c7ab9aeeaaa3336544230e0f4e47cf5@intel.com>
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
> Introduce INTEL_DISPLAY_DEVICE_*_OFFSET() macros to compute absolute
> MMIO offsets for pipe, transcoder, and cursor registers.
>
> Update _MMIO_PIPE2/_MMIO_TRANS2/_MMIO_CURSOR2 to use these macros
> for cleaner abstraction and to prepare for external API usage (e.g. GVT).
>
> Also move DISPLAY_MMIO_BASE() to intel_display_device.h so it can be
> abstracted in GVT, allowing register macros to resolve via
> exported helpers rather than peeking into struct intel_display.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_device.h | 17 +++++++++++++++++
>  .../drm/i915/display/intel_display_reg_defs.h   | 15 ++++-----------
>  2 files changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 50b2e9ae2c18..05bba7a9899a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -260,6 +260,23 @@ struct intel_display_platforms {
>  	 ((id) == ARLS_HOST_BRIDGE_PCI_ID3) || \
>  	 ((id) == ARLS_HOST_BRIDGE_PCI_ID4))
>  
> +#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
> +	(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
> +	 DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
> +	 DISPLAY_MMIO_BASE(display))
> +
> +#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
> +	(DISPLAY_INFO(display)->trans_offsets[(trans)] - \
> +	 DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
> +	 DISPLAY_MMIO_BASE(display))
> +
> +#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
> +	(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
> +	 DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
> +	 DISPLAY_MMIO_BASE(display))
> +
> +#define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)

Please s/dev_priv/display/ while at it.

> +
>  struct intel_display_runtime_info {
>  	struct intel_display_ip_ver {
>  		u16 ver;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
> index b83ad06f2ea7..74f572d3a202 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
> @@ -8,8 +8,6 @@
>  
>  #include "i915_reg_defs.h"
>  
> -#define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)
> -
>  #define VLV_DISPLAY_BASE		0x180000
>  
>  /*
> @@ -36,14 +34,9 @@
>   * Device info offset array based helpers for groups of registers with unevenly
>   * spaced base offsets.
>   */
> -#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
> -						      DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
> -						      DISPLAY_MMIO_BASE(display) + (reg))
> -#define _MMIO_TRANS2(display, tran, reg)	_MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
> -						      DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
> -						      DISPLAY_MMIO_BASE(display) + (reg))
> -#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
> -						      DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
> -						      DISPLAY_MMIO_BASE(display) + (reg))
> +
> +#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) + (reg))
> +#define _MMIO_TRANS2(display, trans, reg)	_MMIO(INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) + (reg))
> +#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) + (reg))

Please wrap the macro argument usage in parenthesis, even if not
strictly needed here. IMO it's just good code hygiene, and sets the
example.

With these fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.

>  
>  #endif /* __INTEL_DISPLAY_REG_DEFS_H__ */

-- 
Jani Nikula, Intel
