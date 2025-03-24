Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79367A6D79F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 10:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5A010E285;
	Mon, 24 Mar 2025 09:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUlne60F";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E875C10E284;
 Mon, 24 Mar 2025 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742809090; x=1774345090;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xum1MmTp1CXfeSxTSdmDj7gdVqmKq5X9Q1ojm4hMPXM=;
 b=gUlne60FRSrRqGmTisBGldV6yttF/4HtkiHHODcLMhU/E0qyGvo/KpIJ
 q1/DTwt3+QhDa4kThH7n30CgsIjwcOblI8vBiHjdZahrS5jXXLuiSt4q1
 iksUV9fg7+paVupnODoGCSHMbyKno0lhIGgR1C84CRlJz59xgicY0nbgY
 1k6v5uhDK9hVfcC8ismXpMWQ1GqEJYWDIbpoArRQ5pSfQKJJXArKfTwwP
 wSbv1W/giU5jPmLnhlA7u3sZcejVuDflXAhKjBB5xvQMq+FPfUOPsooqt
 hEKtWuSOWJl1MCPhdzXsgH6ItCI6i1Q6wezXc/VOtoWMq8Sqe8wwX8Up5 w==;
X-CSE-ConnectionGUID: OEkq60sDRbuPMsrkh0OxZg==
X-CSE-MsgGUID: BienkNrwRomaxD+jtYrDLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="69360145"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="69360145"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:38:08 -0700
X-CSE-ConnectionGUID: zhEpJ0HcRAGBIp/woNBoCQ==
X-CSE-MsgGUID: XMMtvz8JRlWLvchGy9tF/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="161232106"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:38:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Chauvet <kwizart@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] Revert "drm/i915/gvt: Fix out-of-bounds buffer
 write into opregion->signature[]"
In-Reply-To: <20250324083755.12489-2-kwizart@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250324083755.12489-1-kwizart@gmail.com>
 <20250324083755.12489-2-kwizart@gmail.com>
Date: Mon, 24 Mar 2025 11:38:01 +0200
Message-ID: <87ecymbwg6.fsf@intel.com>
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

On Mon, 24 Mar 2025, Nicolas Chauvet <kwizart@gmail.com> wrote:
> This reverts commit ea26c96d59b27e878fe61e8ef0fed840d2281a2f.
>
> This fix truncates the OPREGION_SIGNATURE to fit into 16 chars instead of
> enlarging the target field, hence only moving the size missmatch to later.
>
> As shown with gcc-15:
> drivers/gpu/drm/i915/gvt/opregion.c: In function intel_vgpu_init_opregion:
> drivers/gpu/drm/i915/gvt/opregion.c:35:28: error: initializer-string for array of char is too long [-Werror=unterminated-string-initialization]
>    35 | #define OPREGION_SIGNATURE "IntelGraphicsMem"
>       |                            ^~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gvt/opregion.c:225:45: note: in expansion of macro OPREGION_SIGNATURE
>   225 |         const char opregion_signature[16] = OPREGION_SIGNATURE;
>       |                                             ^~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Cc: stable@vger.kernel.org
> Reported-by: Nicolas Chauvet <kwizart@gmail.com>
> Fixes: ea26c96d59 ("drm/i915/gvt: Fix out-of-bounds buffer write into opregion->signature[]")
> Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>

This introduces a buffer overflow.

sizeof(OPREGION_SIGNATURE) == 17.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/gvt/opregion.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
> index 509f9ccae3a9..9a8ead6039e2 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -222,7 +222,6 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
>  	u8 *buf;
>  	struct opregion_header *header;
>  	struct vbt v;
> -	const char opregion_signature[16] = OPREGION_SIGNATURE;
>  
>  	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
>  	vgpu_opregion(vgpu)->va = (void *)__get_free_pages(GFP_KERNEL |
> @@ -236,8 +235,8 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
>  	/* emulated opregion with VBT mailbox only */
>  	buf = (u8 *)vgpu_opregion(vgpu)->va;
>  	header = (struct opregion_header *)buf;
> -	memcpy(header->signature, opregion_signature,
> -	       sizeof(opregion_signature));
> +	memcpy(header->signature, OPREGION_SIGNATURE,
> +			sizeof(OPREGION_SIGNATURE));
>  	header->size = 0x8;
>  	header->opregion_ver = 0x02000000;
>  	header->mboxes = MBOX_VBT;

-- 
Jani Nikula, Intel
