Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442FB7C4B1E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Oct 2023 09:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845210E475;
	Wed, 11 Oct 2023 07:04:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B26F10E455;
 Wed, 11 Oct 2023 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697007858; x=1728543858;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cixLQyXutMYDfsez0nxqrmuBvXxELpLmrP0C3lII17E=;
 b=jkD4ogI1NuRj/QFK/2DdA2sskrIyq/bY4cMZi2Xr0sMgxDAV+bKA2aWN
 xNLvc3T8oJ7HC74Mj3L9pdcM6S5eT0WtnADq/3l4NsAOz3rG6EY9MifvT
 RJqYEjGbjd64Pi7oqhWl2UIZvnusXUqqxcz282h3UZmia/26xx6GAKsNT
 o1vRLSSiHTRh3M8zmKbTRsWuyVmjYucvVkZTsV7f5ZQXR7KxpR/ZW6UTA
 BTfm+W27ktzk5zIN9d9/1snLhAScc93j/UqQbHvf1egW+M0jmB+KOo5UP
 M99C/E+d4Gfi7+w39FE6EMnp1Xvavse4bBjDDyrWj2WjjJD8c2f4xwC/C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="381846214"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="381846214"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 00:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897521746"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="897521746"
Received: from wprelogx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.229])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 00:02:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
In-Reply-To: <ZSYtkk0EldETrP8l@debian-scheme>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230926121904.499888-1-jani.nikula@intel.com>
 <871qeafszw.fsf@intel.com> <ZSYtkk0EldETrP8l@debian-scheme>
Date: Wed, 11 Oct 2023 10:04:09 +0300
Message-ID: <878r8963o6.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> On 2023.10.04 15:54:11 +0300, Jani Nikula wrote:
>> On Tue, 26 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> > gvt.h has no need to include i915_drv.h once the unused to_gvt() has
>> > been removed.
>> >
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Zhenyu, Zhi, ping?
>> 
>
> Sorry for late reply, as last week was full holiday here.
>
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>
> I don't think I need to do extra pick and pull request for this or
> let me know if you has question.

Did you pick them up to gvt-next or shall I pick them up to
drm-intel-next?

If the former, I think I'd actually like a pull request, because
otherwise the trees will be out-of-sync for a long time.


BR,
Jani.


>
> Thanks!
>
>> 
>> 
>> 
>> > ---
>> >  drivers/gpu/drm/i915/gvt/gvt.h | 7 +------
>> >  1 file changed, 1 insertion(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
>> > index 53a0a42a50db..3a0624fe63bf 100644
>> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
>> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
>> > @@ -39,7 +39,7 @@
>> >  
>> >  #include <asm/kvm_page_track.h>
>> >  
>> > -#include "i915_drv.h"
>> > +#include "gt/intel_gt.h"
>> >  #include "intel_gvt.h"
>> >  
>> >  #include "debug.h"
>> > @@ -368,11 +368,6 @@ struct intel_gvt {
>> >  	struct dentry *debugfs_root;
>> >  };
>> >  
>> > -static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
>> > -{
>> > -	return i915->gvt;
>> > -}
>> > -
>> >  enum {
>> >  	/* Scheduling trigger by timer */
>> >  	INTEL_GVT_REQUEST_SCHED = 0,
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
