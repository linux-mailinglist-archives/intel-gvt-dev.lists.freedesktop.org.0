Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE82CB9CE
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Dec 2020 10:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693B16EA1E;
	Wed,  2 Dec 2020 09:57:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44DE6EA1E;
 Wed,  2 Dec 2020 09:57:07 +0000 (UTC)
IronPort-SDR: TXx5yNfmx3Hja6Y2BaIP8IJdrDRsmG0xY73GTsMsdp0SpxUGaVOChIUPdCmzPQvU1zOiqnfZaB
 UnNzo7SLmGuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="169486737"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="169486737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 01:57:07 -0800
IronPort-SDR: bTWkmrlEpnMpjk3hrHeSpH5KjAQNLgwrry/jSqnWLxJdDqaKdPyG/ocwMfNBb5ZSAqj9b8NLWK
 /F2FkyNWVvTg==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="549984546"
Received: from kropac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.43.63])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 01:57:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 09/10] drm/i915/gvt: replace I915_WRITE with
 intel_uncore_write
In-Reply-To: <20201202022913.GU16939@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201130111601.2817-1-jani.nikula@intel.com>
 <20201130111601.2817-9-jani.nikula@intel.com> <87o8jdcxi4.fsf@intel.com>
 <20201202022913.GU16939@zhen-hp.sh.intel.com>
Date: Wed, 02 Dec 2020 11:57:00 +0200
Message-ID: <87im9kcyz7.fsf@intel.com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, chris@chris-wilson.co.uk,
 Colin Xu <colin.xu@intel.com>, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 02 Dec 2020, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> On 2020.12.01 18:16:35 +0200, Jani Nikula wrote:
>> On Mon, 30 Nov 2020, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Let's avoid adding new I915_WRITE uses while we try to get rid of them.
>> >
>> > Fixes: 5f60b12edcd0 ("drm/i915/gvt: Save/restore HW status to support GVT suspend/resume")
>> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>> > Cc: Hang Yuan <hang.yuan@linux.intel.com>
>> > Cc: Colin Xu <colin.xu@intel.com>
>> > Cc: Zhi Wang <zhi.a.wang@intel.com>
>> > Cc: intel-gvt-dev@lists.freedesktop.org
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Pushed up to, but *excluding* this patch to dinq. Thanks for the
>> reviews.
>> 
>> Zhenyu, Zhi, may I have your review/ack for merging this one directly
>> via dinq to not add a dependency on the gvt tree?
>>
>
> Yep, that's fine to me.
>
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks, pushed to dinq.

BR,
Jani.

>
>> 
>> BR,
>> Jani.
>> 
>> 
>> > ---
>> >  drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>> > index 6f0706e885cb..eba626ba640f 100644
>> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
>> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>> > @@ -3693,7 +3693,7 @@ static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
>> >  	struct drm_i915_private *dev_priv = gvt->gt->i915;
>> >  
>> >  	if (gvt->mmio.mmio_attribute[offset >> 2] & F_PM_SAVE)
>> > -		I915_WRITE(_MMIO(offset), vgpu_vreg(vgpu, offset));
>> > +		intel_uncore_write(&dev_priv->uncore, _MMIO(offset), vgpu_vreg(vgpu, offset));
>> >  
>> >  	return 0;
>> >  }
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
