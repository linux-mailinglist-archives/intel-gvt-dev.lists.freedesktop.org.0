Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87314B99EE
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Feb 2022 08:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBCC10E96B;
	Thu, 17 Feb 2022 07:38:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC85D10E157;
 Thu, 17 Feb 2022 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645083507; x=1676619507;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=95PVtzd8+x4bl4Blz6/cVKLMrONA/5I7Kdokv0tHahc=;
 b=L6hOhU5MVWYVaj/7zYDXdTW21PEX5S2cye/d/OnTaWdvxsZHnbnDGn1a
 byuommMck/UIbujNWAd3zqIR2qWIsTJmjORpcX7ns/7Z0Rw9K2ZhpO8wR
 /M3lUQ7RI9cbvt21iDMvuQOtrSDqot8BRmtcjzNYojRJ1OvzmF1Ck/K+t
 hVGOvtQ99A0ENGkkIAM+1XmXgoF6IwUgqhY0eV0RSeQWO08j04VFtU/95
 zBLdhySoH5LF4Qq1MaRhf8NsOnJcWFwDU/4/2LeTIW6JI2DdgQ98AUZHF
 ppeAzH5npRAg98Oc/YxIxz4yPNSwid55eluCSCim0VPX/REA9F0kUZklE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="238219891"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="238219891"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 23:38:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="501477825"
Received: from acushion-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.21.45])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 23:38:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: #include drm_edid.h for
 drm_edid_block_valid()
In-Reply-To: <bddb363f-2772-4c1b-0637-5ac3165a1979@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220215122030.2741656-1-jani.nikula@intel.com>
 <bddb363f-2772-4c1b-0637-5ac3165a1979@intel.com>
Date: Thu, 17 Feb 2022 09:38:21 +0200
Message-ID: <87a6eq3pua.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> On 2/15/22 12:20 PM, Nikula, Jani wrote:
>> As the excessive #includes from i915_drv.h were axed, kvmgt.c build
>> started failing. Add the necessary #include where needed.
>> 
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Fixes: 14da21cc4671 ("drm/i915: axe lots of unnecessary includes from i915_drv.h")
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>> Cc: Zhi Wang <zhi.a.wang@intel.com>
>> Cc: intel-gvt-dev@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Going to merge this via drm-intel-next along with the regressing commit.
>> ---
>>  drivers/gpu/drm/i915/gvt/kvmgt.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
>> index 20b82fb036f8..e8d6c76e9234 100644
>> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
>> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
>> @@ -46,6 +46,8 @@
>>  
>>  #include <linux/nospec.h>
>>  
>> +#include <drm/drm_edid.h>
>> +
>>  #include "i915_drv.h"
>>  #include "gvt.h"
>>  
>> 
> Hi:
>
> Thanks for the notification!
>
> Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>

Thanks, pushed to drm-intel-next.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
