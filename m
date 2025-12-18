Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FEACCB5AC
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 11:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECE710EDAC;
	Thu, 18 Dec 2025 10:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Md7Pwyag";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA0010EDAC;
 Thu, 18 Dec 2025 10:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766053522; x=1797589522;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8etLWeN9vMli19qY5aoTxcoQyfTNxQ3UM0Cpz52e4XU=;
 b=Md7Pwyagr+MsXiPyn4FfnixiiZsTPQ7IOG07UJ54+Fz2VRMVIbuny2sT
 6cin9FY+/fOwNNYUDlM4l24bvzWLDWDNBZ0l9jcJZWNPfArsZWW6KZouV
 xF+5d6Xrd7peoxMj8oG0yqR5lmc+S6uJTJHqZSpwc8OJmdQ6rWyox+QJC
 arsadb2QrkGhIJnC4Syn03As46w417yyUEaj5QBq0cCz+WeasBxBwAO0Y
 myw3ijfprVMSPOag5g5Y3Eozj5wzs0VPt6hupryS2ks3TBy0IcFJAvxxf
 bhsCdv9F5x5YvVzMwJOjjQrFilXNv+ee1ksSk2Shq5J+pdYDYFb0MN/rq Q==;
X-CSE-ConnectionGUID: g5xpdgxcSN2e8Z5Nmj9vMw==
X-CSE-MsgGUID: NJhLdObJQi2oJjYhJISbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67941818"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67941818"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:25:22 -0800
X-CSE-ConnectionGUID: brTraHSUSBGnwwFnQQ4RKA==
X-CSE-MsgGUID: BVDDDIVvRcGlgTw+QfIAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198317922"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:25:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 4/7] drm/i915/gvt/display_helpers: Cast argument to enum
 pipe for pipe-offset macro
In-Reply-To: <20251218082302.2327243-5-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-5-ankit.k.nautiyal@intel.com>
Date: Thu, 18 Dec 2025 12:25:16 +0200
Message-ID: <db0cedb60c1b9a32f0412efb97ca34e7870e1f71@intel.com>
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
> TRANSCONF() expands via _MMIO_PIPE2, i.e., it uses pipe-based addressing.
> In GVT, some call sites pass an enum transcoder to TRANSCONF(), which now
> routes through INTEL_DISPLAY_DEVICE_PIPE_OFFSET() and ultimately calls
> intel_display_device_pipe_offset(), whose parameter type is enum pipe.
>
> This results in -Werror=enum-conversion.

And that's really why this should be squashed to the previous patch,
with explanation in the commit message, as otherwise the previous one
fails to build.

I don't know, maybe could also add a FIXME comment about the cast?
*shrug*

BR,
Jani.

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
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display_helpers.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
> index 97ebc92768fc..3af878e3d78e 100644
> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
> @@ -17,8 +17,8 @@
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
