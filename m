Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4677B855C
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Oct 2023 18:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1810E38D;
	Wed,  4 Oct 2023 16:33:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3E410E38D;
 Wed,  4 Oct 2023 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696437206; x=1727973206;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KdPiQxoB660tURy+BkteJmnES3wVNXvvSt2qBALPwPU=;
 b=dnGvrnBuM0wQnbuUbD57aqbkBY67gYPFG1yF+ZRsjsW5EafKga55Z0Cl
 oJdo5tib1jUyjQGp/5esIAkZuJjhLg0W+E326seqgnkJWKfL8sslL9l38
 8UePpLcI9Fc1w1xGP8mVqs8ru0FjTQ37dV40/+xgCPV15Al5SrZDfddqo
 1hi0DZBkKmyxaZbIRgSdiSGapWVHMyFLwrP3hMbow3ySEoLKasvrGFZvf
 Wmrik3gcPs6jq/ERTQCaXPcb+ca/QytooNjXE9KoqYd0iflBJCaZ/GKsQ
 87H5jXMqYKVSDm7ziSAa/Qz3JqxLiMCLCcQMvq7wrM62zvFTkVkpV8WCo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469495147"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="469495147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817170941"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="817170941"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:33:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang
 <zhenyuw@linux.intel.com>
Subject: RE: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
In-Reply-To: <DM4PR11MB55490489E47D54FF8224A982CACBA@DM4PR11MB5549.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230926121904.499888-1-jani.nikula@intel.com>
 <871qeafszw.fsf@intel.com>
 <DM4PR11MB55490489E47D54FF8224A982CACBA@DM4PR11MB5549.namprd11.prod.outlook.com>
Date: Wed, 04 Oct 2023 19:33:20 +0300
Message-ID: <87a5sye4a7.fsf@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 04 Oct 2023, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> Singed-off-by: Zhi Wang <zhi.a.wang@intel.com>

Mmh, sorry, what does that mean here? Are you picking them up via gvt?

BR,
Jani.

>
> Thanks,
> Zhi.
>
> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Wednesday, October 4, 2023 3:54 PM
> To: intel-gvt-dev@lists.freedesktop.org; Zhenyu Wang <zhenyuw@linux.intel.com>; Wang, Zhi A <zhi.a.wang@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Subject: Re: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce includes
>
> On Tue, 26 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> gvt.h has no need to include i915_drv.h once the unused to_gvt() has
>> been removed.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Zhenyu, Zhi, ping?
>
> BR,
> Jani.
>
>
>
>> ---
>>  drivers/gpu/drm/i915/gvt/gvt.h | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h
>> b/drivers/gpu/drm/i915/gvt/gvt.h index 53a0a42a50db..3a0624fe63bf
>> 100644
>> --- a/drivers/gpu/drm/i915/gvt/gvt.h
>> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
>> @@ -39,7 +39,7 @@
>>
>>  #include <asm/kvm_page_track.h>
>>
>> -#include "i915_drv.h"
>> +#include "gt/intel_gt.h"
>>  #include "intel_gvt.h"
>>
>>  #include "debug.h"
>> @@ -368,11 +368,6 @@ struct intel_gvt {
>>       struct dentry *debugfs_root;
>>  };
>>
>> -static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
>> -{
>> -     return i915->gvt;
>> -}
>> -
>>  enum {
>>       /* Scheduling trigger by timer */
>>       INTEL_GVT_REQUEST_SCHED = 0,
>
> --
> Jani Nikula, Intel

-- 
Jani Nikula, Intel
