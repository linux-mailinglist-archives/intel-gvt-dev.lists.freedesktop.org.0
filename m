Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71F2CA7EC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 17:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A926E56D;
	Tue,  1 Dec 2020 16:16:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A7989BC0;
 Tue,  1 Dec 2020 16:16:42 +0000 (UTC)
IronPort-SDR: h/PEUK83vTSJDaxNWYtBog7D6qN/BFBiPlVNsSRE7CUYnYBvKBmo0NR7ix7yU1ZJLROmMHHJ/u
 RoKAtpgnUV/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="169354207"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="169354207"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:16:41 -0800
IronPort-SDR: aX0hiIXHbE2FBl6ASmw6VCrs+wjew2zRiyABJ0Yi+VdWUW4SVQPbeTWxehmw+RMdjqb7hv32SC
 +eo1plELL5jA==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="549631630"
Received: from ivgeniax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.42.176])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:16:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 09/10] drm/i915/gvt: replace I915_WRITE with
 intel_uncore_write
In-Reply-To: <20201130111601.2817-9-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201130111601.2817-1-jani.nikula@intel.com>
 <20201130111601.2817-9-jani.nikula@intel.com>
Date: Tue, 01 Dec 2020 18:16:35 +0200
Message-ID: <87o8jdcxi4.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, chris@chris-wilson.co.uk,
 Colin Xu <colin.xu@intel.com>, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 30 Nov 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> Let's avoid adding new I915_WRITE uses while we try to get rid of them.
>
> Fixes: 5f60b12edcd0 ("drm/i915/gvt: Save/restore HW status to support GVT suspend/resume")
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Hang Yuan <hang.yuan@linux.intel.com>
> Cc: Colin Xu <colin.xu@intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Pushed up to, but *excluding* this patch to dinq. Thanks for the
reviews.

Zhenyu, Zhi, may I have your review/ack for merging this one directly
via dinq to not add a dependency on the gvt tree?


BR,
Jani.


> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index 6f0706e885cb..eba626ba640f 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3693,7 +3693,7 @@ static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
>  	struct drm_i915_private *dev_priv = gvt->gt->i915;
>  
>  	if (gvt->mmio.mmio_attribute[offset >> 2] & F_PM_SAVE)
> -		I915_WRITE(_MMIO(offset), vgpu_vreg(vgpu, offset));
> +		intel_uncore_write(&dev_priv->uncore, _MMIO(offset), vgpu_vreg(vgpu, offset));
>  
>  	return 0;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
