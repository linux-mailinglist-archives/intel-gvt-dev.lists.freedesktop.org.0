Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0BCCB823
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 11:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982E610EE5E;
	Thu, 18 Dec 2025 10:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENxkTX8r";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B399B10E3CA;
 Thu, 18 Dec 2025 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766055433; x=1797591433;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ewg0/jr685m+lcz1X1TNZPQWbDF1blNDFIPcmMV7q7A=;
 b=ENxkTX8rHrOvycrBi1Tq690zXKIXBrZB6TqCEiQVq0OMgQpZKTHZucT6
 FonsmnGOOTmmkq4MUk9niPHH6BlkGpqLsODQukgsXgHYZCyPwWa38Fis8
 sbR8sBd2JokzG3ke2lWr93z2TuYibEoxo6i6cejvJGu4peKbrpTxf3N65
 VBwBDYVN4tP6HISyJw7BqxbjL54EK+H7Se9dS7726VhdSzqAL3Z8qkISU
 Q484WkpUEO20O8hO6MU1nzhl1e+90MnAHSib7g1sDDk89putUy19wBxrn
 1JtCH2hOd1oxovCjcCnJwSPPC3DtV4hoMgMrQcPYudHlxa4EKIPxDkYR2 g==;
X-CSE-ConnectionGUID: budObvLFQP2nYsFousAQnA==
X-CSE-MsgGUID: 5urDgaarRU+svcXAyP1V/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79129488"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79129488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:57:13 -0800
X-CSE-ConnectionGUID: hUJD9oYnS/WmjbC2EmfmkQ==
X-CSE-MsgGUID: 51ugCaprQj+SRn4ufUfAUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="197702892"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:57:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 0/7] Prepare GVT for display modularization
In-Reply-To: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
Date: Thu, 18 Dec 2025 12:57:08 +0200
Message-ID: <aec7910187fc14d556af6fb84c4b9e6a43575f37@intel.com>
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
> GVT currently relies on display internals through register macros and
> helpers like for_each_pipe(). This tight coupling makes modularization
> difficult because GVT should not access struct intel_display directly.
> Add an API for GVT code to expose DISPLAY_RUNTIME_INFO()->pipe_mask.
> This series introduces changes to make GVT independent of display internals
> while keeping existing macros usable:
>
> - Abstract offset calculations in display using
>   INTEL_DISPLAY_DEVICE_*_OFFSET() macros.
> - Add APIs for GVT to compute offsets and pipe mask via functions.
> - Update GVT to use these APIs by overriding helper macros and
>   for_each_pipe().

Oh, this doesn't handle intel_gvt_mmio_table.c, which is part of i915.

That can be a follow-up, I guess, but still needs to be addressed.

BR,
Jani.

>
> Rev2:
> - Remove conflicting headers and get rid of #ifdefs/#undefs in last
>   patch.
> - Wrap macro arguments in paranthesis.
> - Rename for_each_pipe to gvt_for_each_pipe.
>
> PS: I have not yet addressed the question about whether we need to start
>     using _MMIO_TRANS2() instead of_MMIO_PIPE2() in TRANSCONF() macro.
>     That likely needs a separate patch and discussion.
>     For now, I have kept the patch#4 to deal with the
>     -Werror=enum-conversion:
>      - drm/i915/gvt/display_helpers: Cast argument to enum pipe for
>        pipe-offset macro
>
> Ankit Nautiyal (7):
>   drm/i915/display: Abstract pipe/trans/cursor offset calculation
>   drm/i915/display: Add APIs to be used by gvt to get the register
>     offsets
>   drm/i915/gvt: Add header to use display offset functions in macros
>   drm/i915/gvt/display_helpers: Cast argument to enum pipe for
>     pipe-offset macro
>   drm/i915/gvt: Change for_each_pipe to use pipe_valid API
>   drm/i915/gvt: Use the appropriate header for the DPLL macro
>   drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
>
>  drivers/gpu/drm/i915/Makefile                 |  1 +
>  .../drm/i915/display/intel_display_device.h   | 17 +++++++
>  .../drm/i915/display/intel_display_limits.c   |  0
>  .../drm/i915/display/intel_display_reg_defs.h | 15 ++-----
>  drivers/gpu/drm/i915/display/intel_gvt_api.c  | 45 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_gvt_api.h  | 21 +++++++++
>  drivers/gpu/drm/i915/gvt/cmd_parser.c         |  2 +-
>  drivers/gpu/drm/i915/gvt/display.c            |  9 ++--
>  drivers/gpu/drm/i915/gvt/display_helpers.h    | 27 +++++++++++
>  drivers/gpu/drm/i915/gvt/fb_decoder.c         |  2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>  11 files changed, 123 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
>  create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h

-- 
Jani Nikula, Intel
