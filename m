Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF185512E72
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 10:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7615610ED6F;
	Thu, 28 Apr 2022 08:29:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0C710ED41;
 Thu, 28 Apr 2022 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651134594; x=1682670594;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UAf4djUbqasgSXBIB9OZfbdv4fwN5mjAX558wgDc4tE=;
 b=ne1aJEbbGREWWgsBhjywqi2BnytSDJ6izBkIAsIdr2vZG15niAc8hOK6
 QlVY0YR6DAPZMsbOeXp3AO9UrOO6Ast4Qtn8Z8C2KS1mn8O2OQnjE9CuL
 6d+rq/hClFz3rdQ1+eyHDQlDh5C+Wu/m4gfKNKOt9x8G/CcWBmgTfXLG5
 cMwb3lMvI0qLDGsgA9Z0pPHGxhavT/jgLOm/WCfzTp0kyaSHSUoNknfWu
 Zbq1WETG0mRDKUF39F+LMrWm6lU2rDUH5FSIQwBtM87FcxTkgce6OO5KJ
 8jWgwddpRmh3qKsnafiszfb/XDW7JYci494W6Mdsj1Qw8NWPkarN+SVKx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="248139578"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="248139578"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 01:29:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="682245814"
Received: from mswiniar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.154.87])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 01:29:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/gvt: Fix the compiling error when
 CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n
In-Reply-To: <20220427212849.18109-2-zhi.a.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220427212849.18109-1-zhi.a.wang@intel.com>
 <20220427212849.18109-2-zhi.a.wang@intel.com>
Date: Thu, 28 Apr 2022 11:29:48 +0300
Message-ID: <87a6c5txtv.fsf@intel.com>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 27 Apr 2022, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> A compiling error was reported when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n.
> Fix the problem by using the pre-defined macro.
>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>

We'll get this right, for now, but I do wonder if breaking these is
going to be a perpetual thing. :(

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/intel_gvt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
> index 24bc693439e8..e98b6d69a91a 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.c
> +++ b/drivers/gpu/drm/i915/intel_gvt.c
> @@ -309,7 +309,9 @@ EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
>  EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
> +#endif
>  EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);

-- 
Jani Nikula, Intel Open Source Graphics Center
