Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H+pEYvYcGkOaAAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jan 2026 14:45:47 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B297E57BE1
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jan 2026 14:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77310E205;
	Wed, 21 Jan 2026 13:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMn1JsI/";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604DB10E154;
 Wed, 21 Jan 2026 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769003143; x=1800539143;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XueELBJu97blWbfgp7t5pd9+spftDfRhmvAtR3T4x34=;
 b=OMn1JsI/0r3SPjznXq0eO07YmOf8dy7dyNLR8Kh7A2sKw0dUnURzxy1J
 A5IbopEVTkKewugzt2wItPpav/fI1xyqYKkmzptmL4BGf/oqKDs3nQSt4
 MnU/uPQCpzFJa9wkL/GPUff2OaN0k8oDI6y1aqh+WBj7SxP3rC3epH065
 SWjQd62LkVmNDK0lF9n7tNEPAyqfva3hO3WItYPElbGwChaES7msKxxax
 e5syvJGgCeUrTz5GOqO+MIJhJTn0+Ry4tmcwut8/hV4ZYTYypRaUZY08q
 Iii4xLdd23tTfhdhRf4gowdNR3JqUd97eqOdOvKUwVH1b0roynA0+2Oci w==;
X-CSE-ConnectionGUID: z/4HdqNzQjiA34viDyDHGg==
X-CSE-MsgGUID: s64+5kfgTiGMdX+rA0XK9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70128865"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70128865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 05:45:43 -0800
X-CSE-ConnectionGUID: gacHPRiURiygrKGXZo6/dQ==
X-CSE-MsgGUID: H7o9KcPZQtOlGfLLlIKfZw==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 05:45:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH] drm/i915/gvt_mmio_table: Use the gvt versions of the
 display macros
In-Reply-To: <20260114025456.1639171-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260114025456.1639171-1-ankit.k.nautiyal@intel.com>
Date: Wed, 21 Jan 2026 15:45:37 +0200
Message-ID: <0bc65f08b4bc32eeaaa0b96d8b56a3db80253d40@intel.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: B297E57BE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 14 Jan 2026, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Include gvt/display_helpers.h so that the display register macros in
> intel_gvt_mmio_table.c expand through the exported display functions.
> This lets us keep the existing macro calls while avoiding direct
> access to display internals, helping the display modularization work.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> index 478d00f89a4b..052596ac83a0 100644
> --- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -11,12 +11,12 @@
>  #include "display/intel_color_regs.h"
>  #include "display/intel_crt_regs.h"
>  #include "display/intel_cursor_regs.h"
> -#include "display/intel_display_core.h"
>  #include "display/intel_display_regs.h"
>  #include "display/intel_display_types.h"
>  #include "display/intel_dmc_regs.h"
>  #include "display/intel_dp_aux_regs.h"
>  #include "display/intel_dpio_phy.h"
> +#include "display/intel_fbc.h"
>  #include "display/intel_fbc_regs.h"
>  #include "display/intel_fdi_regs.h"
>  #include "display/intel_lvds_regs.h"
> @@ -32,6 +32,7 @@
>  #include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  
> +#include "gvt/display_helpers.h"
>  #include "gvt/reg.h"
>  
>  #include "i915_drv.h"

-- 
Jani Nikula, Intel
