Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B716512E6D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 10:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D8E10E377;
	Thu, 28 Apr 2022 08:28:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D7610E385;
 Thu, 28 Apr 2022 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651134502; x=1682670502;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IXgZNRnMzOKtdG3h8qbA1g4osr8YkO0nUUuFH9iYeBM=;
 b=Yfqf1lqfJdVJruZzFXbkO4tyS5eP7rncJoj+j8jhbbtGAFvW1de1davZ
 iM7e5eycAH3q3vZcqXZ/TXXNjd2csCD1Uj6MrHtRL/WIbF9B8yC/DLlbU
 5OT+kvvJb25ohnPDTi8gCsTnuoV7gwUIS1BWY7Y4obbur2VDYxEnKd9vC
 0zYWRY1VkJ3hv65vnGaTpaf/PlfDzgMaJMJ1AYCQzsJsUZ6TEmFlzcpjj
 3+5RYTXPMGKiq2OIbJjmSp7HihCL+7E/oj1IBLPDLzPHWRdVsXzib/CAf
 2v1rsV62XJqI0mHvpXqFtUDf95EznpiLt4XPhQv8vrCWOAmZAn1uw+OZ0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="326699653"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="326699653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 01:28:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="731288395"
Received: from mswiniar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.154.87])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 01:28:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/gvt: Make intel_gvt_match_device() static
In-Reply-To: <20220427212849.18109-1-zhi.a.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220427212849.18109-1-zhi.a.wang@intel.com>
Date: Thu, 28 Apr 2022 11:28:15 +0300
Message-ID: <87czh1txwg.fsf@intel.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 27 Apr 2022, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> After the refactor of GVT-g, the reference of intel_gvt_match_device()
> only happens in handlers.c. Make it static to let the compiler be
> happy.
>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index cf00398c2870..a93f8fd423c2 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -72,7 +72,7 @@ unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
>  	return 0;
>  }
>  
> -bool intel_gvt_match_device(struct intel_gvt *gvt,
> +static bool intel_gvt_match_device(struct intel_gvt *gvt,
>  		unsigned long device)
>  {
>  	return intel_gvt_get_device_type(gvt) & device;

-- 
Jani Nikula, Intel Open Source Graphics Center
