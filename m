Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE969A735CE
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Mar 2025 16:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD3010E907;
	Thu, 27 Mar 2025 15:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvHdN67m";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EEF10E907
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Mar 2025 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743090064; x=1774626064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YQ4n6u+t6thrrA8aXZRoErGdYuccmPtRszKaFvHrYCg=;
 b=dvHdN67msqM0fA54C3375j9bvXVH7FQEDEn65l4YgW9JwzA6Myi3nswn
 uAGUdsEa8iFWlpjlQ1dT9hPS+wvgBsoLCyE1FK465WYzhYLPaquBhIG3H
 HHHPKMGz0IasZtdsQzvwGUQefBVP/oYc/M3JrSheLtWIgsVFfsNliC1zW
 B2EwUTwzPpxR9jq5NkxxXT+Q9rGpFUFUP0Acv4xGaClQO3D50hbpcoEGF
 KPz7t1MfNiSBlWT/MAqP+Lx+3Jw4Wj8Ql4bxlfwsi424eYRoTQoXvuMK+
 I3NmWZ/aKUMvpzsnyf4lavQ4wrBkmRil3+krgPXzhGFcYS8ACWwO1eVQE A==;
X-CSE-ConnectionGUID: Yy+BwZ9mTuaq7LrHU1WG+g==
X-CSE-MsgGUID: i8/9cNkjQt+o2LfEnVLiVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="47167129"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="47167129"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:41:03 -0700
X-CSE-ConnectionGUID: kQ4Dn1mNSuqpVUlBFFm7qg==
X-CSE-MsgGUID: Wi2q/Ao+RTGPrR0m0SrVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="124930563"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:41:00 -0700
Date: Thu, 27 Mar 2025 16:40:57 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com
Subject: Re: [PATCH] drm/i915/gvt: char array initialization overflow
Message-ID: <Z-VxJfzIYgcglE51@ashyti-mobl2.lan>
References: <20250325-gvt-v1-1-ef41d30592fd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-gvt-v1-1-ef41d30592fd@intel.com>
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

Hi Arun,

This produces a build error in my configuration, could you please
cc also intel-gfx so that we run also the CI tests?

Thanks,
Andi

On Tue, Mar 25, 2025 at 09:16:43AM +0530, Arun R Murthy wrote:
> Initializer string for array of char is too long, since the char array
> is initialized in place leave the length as open and let compiler choose
> based on the initialized value.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
> index 509f9ccae3a9f09a7596904d88a3ac15cf6b1be7..c5ea490bf2e184c4184e161973675a38436e078c 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -222,7 +222,7 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
>  	u8 *buf;
>  	struct opregion_header *header;
>  	struct vbt v;
> -	const char opregion_signature[16] = OPREGION_SIGNATURE;
> +	const char opregion_signature[] = OPREGION_SIGNATURE;
>  
>  	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
>  	vgpu_opregion(vgpu)->va = (void *)__get_free_pages(GFP_KERNEL |
> 
> ---
> base-commit: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056
> change-id: 20250325-gvt-4e9f71337d3f
> 
> Best regards,
> -- 
> Arun R Murthy <arun.r.murthy@intel.com>
