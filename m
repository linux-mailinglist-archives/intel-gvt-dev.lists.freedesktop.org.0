Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434B4FFC38
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 19:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74BA10E06D;
	Wed, 13 Apr 2022 17:16:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C03610E148;
 Wed, 13 Apr 2022 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649870170; x=1681406170;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xEIEdgtiPiiXaH4CPOTBcydtVmvhoAkEJd4UOtCh7RE=;
 b=h6Su9bzkNvMb/cYTJj1qPMfQS4Twfu+vuOz/CxI+ItgCNv5ddXjtDVPW
 httb9GXro2Rddm1VPYqT+AX47DBt3sw+rvEAamVbnjLWnr15QtK8bcHRH
 6k/aWX5U3mGYBn4Y9kmgGpmn4hN3CBnXI6OyvNV8SwQn1RdQztFwb0CYD
 bcW4p5afPbrSIrNx3aMYO7lHudSpaDVm5+jInmJRKooW0ekY28GOOsaY8
 4H2/8D2b0+zPsGrN/CJjs2p+1JMWMgVGXHIp33ub05R/xNUi1vG/lyepG
 jBxlTLelyhOVFXm446Ib9K91ZgtCwYcAQ/8c11BNy/ALZCNfc8wBgjbss A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="243311186"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="243311186"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:16:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="573362828"
Received: from jardanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.150.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:16:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cong Liu <liucong2@kylinos.cn>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915: Remove intel_gvt_init_host declaration
In-Reply-To: <20220413072415.27231-1-liucong2@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220413072415.27231-1-liucong2@kylinos.cn>
Date: Wed, 13 Apr 2022 20:16:02 +0300
Message-ID: <87sfqggazx.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Cong Liu <liucong2@kylinos.cn>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022, Cong Liu <liucong2@kylinos.cn> wrote:
> this function has been deleted since commit 9bdb073464d6 ("drm/i915/gvt:
> Change KVMGT as self load module"), remove the deprecated function
> declaration.

I don't want to push this right now avoid conflicts in other pending
work. Cc'd Zhi & Zhenyu to pick this up.

BR,
Jani.

>
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> ---
>  drivers/gpu/drm/i915/intel_gvt.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/intel_gvt.h
> index d7d3fb6186fd..daaf0957ebbc 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.h
> +++ b/drivers/gpu/drm/i915/intel_gvt.h
> @@ -31,7 +31,6 @@ int intel_gvt_init(struct drm_i915_private *dev_priv);
>  void intel_gvt_driver_remove(struct drm_i915_private *dev_priv);
>  int intel_gvt_init_device(struct drm_i915_private *dev_priv);
>  void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
> -int intel_gvt_init_host(void);
>  void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
>  void intel_gvt_resume(struct drm_i915_private *dev_priv);
>  #else

-- 
Jani Nikula, Intel Open Source Graphics Center
