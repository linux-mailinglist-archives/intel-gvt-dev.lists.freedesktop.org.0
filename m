Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FDCCB6B1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 11:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A440110EDBD;
	Thu, 18 Dec 2025 10:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lxlb9GIR";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FAB10EDBA;
 Thu, 18 Dec 2025 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766054214; x=1797590214;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AMxXN7w7wo/VRLJD7BfjL0RNc+0DTcVZ4x2ReGWfOW8=;
 b=Lxlb9GIRcxkQ8X+7b6b61sLlfJVJzr+OVaDjkrc34a3i3mkgwRjDVakC
 9XQYCFHveC1Wcks3WrQv8FAg3AyXCXKyef9cWbh1z3EomPjKj7mP2w5og
 yjaApOjiOgpnAOWec31O9mpw6+BPMG8SfIIBLPaygAdwEM/8eyOWyc6BS
 q2/+kyNVSvoGWIDb3zsNym0DEuHz6MBoSVpocrTl4Tr6bjt4ZOJppXbSL
 S15MkxlFGCxBX7PJll9yD1GYHHY8GXE0O4ZrbZUwJotedvQy3juIfxkqk
 Vu8ysO+GRLWDceP8pb0RwamjOKRG6gC3pqGpjyb3Irc0eCQll0lgrglqT A==;
X-CSE-ConnectionGUID: NrVnPEitQ5qXPwUd7moEgw==
X-CSE-MsgGUID: XXBAM77OSPSWCkBq6/9BMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79375552"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79375552"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:36:53 -0800
X-CSE-ConnectionGUID: yn6Uk2/FQnOHWsYiN0NU+Q==
X-CSE-MsgGUID: 3Sj+pWSyRhuPFXcsFaNzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198619860"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:36:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 6/7] drm/i915/gvt: Use the appropriate header for the
 DPLL macro
In-Reply-To: <20251218082302.2327243-7-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-7-ankit.k.nautiyal@intel.com>
Date: Thu, 18 Dec 2025 12:36:47 +0200
Message-ID: <c2f2a99cfa6ac6a332c62b7539b31cb13d620f11@intel.com>
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
> The macro `DPLL_ID_SKL_DPLL0` is defined in
> display/intel_dpll_mgr.h. Previously, GVT included the header
> display/intel_display_core.h` because other macros also depended on it.
> After porting those macros to use the new APIs, the only remaining
> dependency was for the DPLL macro.
>
> Replace the indirect include with the correct header and drop
> intel_display_core.h to reduce unnecessary dependencies.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
> index 11855c71e05e..6e034ab15d44 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -45,9 +45,9 @@
>  #include "display/intel_crt_regs.h"
>  #include "display/intel_cursor_regs.h"
>  #include "display/intel_display.h"
> -#include "display/intel_display_core.h"
>  #include "display_helpers.h"
>  #include "display/intel_dpio_phy.h"
> +#include "display/intel_dpll_mgr.h"
>  #include "display/intel_sprite_regs.h"
>  
>  static int get_edp_pipe(struct intel_vgpu *vgpu)

-- 
Jani Nikula, Intel
