Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E441FCBDAD3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 13:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC3489D56;
	Mon, 15 Dec 2025 12:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIGdFLl0";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765ED89D56;
 Mon, 15 Dec 2025 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765800193; x=1797336193;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ozKUF7eNY0QPa+yES6PcH5XsVJDrbyaiHTWXMzQ7gyU=;
 b=JIGdFLl0+KxFETitWS7rHWkI/+KuaSi3bGzG/IliQRYluOCQqFqPeOV0
 6bBF8LyPofb5DKkybTvbANYveKTFgxw/0gq5SmodG1T0p3P+0w8tnyHow
 FecbdiD/7iG50TXA7d/BMYcsDoL4U3GjcHtScUhDLSap61RFzvLwyZZTt
 3WzXFOKSJYfPNCRW7ton+SFjwynTqL5911FmUqEfm7kzuvyb6BRCiT89d
 Hrr4lmnH+sIAJgdYisiTZ9StKdoQB7utRmkoAMCNm/IwfBDK9dWLb+y7b
 I5KsdF3X1fwLESLHEToEIB8+Pc+mSyfqUotxGrFpnXdtQsEVbk8XVSvcU w==;
X-CSE-ConnectionGUID: bmjQSsCVSoS+qDpeN9l8fQ==
X-CSE-MsgGUID: bUQVIqECRAeaySuGKO0r1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85110693"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="85110693"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 04:03:13 -0800
X-CSE-ConnectionGUID: k0FsacDCSFGCqmEEcUTOOA==
X-CSE-MsgGUID: RaNv+ci5Srq5d9SoSQnWuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="198223354"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 04:03:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 5/5] drm/i915/gvt/display_helpers: Cast argument to enum
 pipe for pipe-offset macro
In-Reply-To: <20251215111842.2099789-6-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-6-ankit.k.nautiyal@intel.com>
Date: Mon, 15 Dec 2025 14:03:08 +0200
Message-ID: <9498ecce59866b5fac5410fa9d75c6d7d5a0e11e@intel.com>
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
> TRANSCONF() expands via _MMIO_PIPE2, i.e., it uses pipe-based addressing.
> In GVT, some call sites pass an enum transcoder to TRANSCONF(), which now
> routes through INTEL_DISPLAY_DEVICE_PIPE_OFFSET() and ultimately calls
> intel_display_device_pipe_offset(), whose parameter type is enum pipe.
>
> This results in -Werror=enum-conversion.
>
> To address this, cast the index to enum pipe in the GVT-side macro
> override.
>
> This works for all cases as TRANSCODER_{A,B,C,D} all have 1:1 mapping to
> PIPE_{A,B,C,D} except for TRANSCODER_EDP.
>
> There is one place which uses TRANSCONF() with TRANSCODER_EDP, which
> appears to be incorrect. In any case, the cast preserves the previous
> behaviour.

Maybe the question to ask is if TRANSCONF() using _MMIO_PIPE2() is
correct or not?

BR,
Jani.

>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display_helpers.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
> index d11ebb03b946..fb75cc9f97cc 100644
> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
> @@ -21,8 +21,8 @@ struct display;
>  #ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
>  #undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
>  #endif
> -#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
> -	intel_display_device_pipe_offset((display), (pipe))
> +#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, idx) \
> +	intel_display_device_pipe_offset((display), (enum pipe)(idx))
>  
>  #ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
>  #undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET

-- 
Jani Nikula, Intel
