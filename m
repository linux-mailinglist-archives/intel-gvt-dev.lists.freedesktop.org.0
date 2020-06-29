Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3C20CD3C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Jun 2020 10:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D6F89FC9;
	Mon, 29 Jun 2020 08:18:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1168889FC9;
 Mon, 29 Jun 2020 08:18:51 +0000 (UTC)
IronPort-SDR: mf8Q3DJ1iFTUMWXhaKckXEbOWIHuwQexanugPqbLfHjcggpiCgcYLHvOHTZ+Eh1XQ8+2ElwuV2
 Qap2FwJYLGbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="143402882"
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="143402882"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 01:18:49 -0700
IronPort-SDR: zpt2v7dpA7h5vIywHKRLhVMzG09IbtIdW7Voiz0jx3gJecnZCwL76l2hET0VCUgjfbN6ZlQBLU
 Cx7ROVIEqHRA==
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="454112237"
Received: from unknown (HELO localhost) ([10.252.54.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 01:18:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20200623030711.GA5687@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200617043418.GQ5687@zhen-hp.sh.intel.com>
 <159248448107.8757.1901135788098329902@jlahtine-desk.ger.corp.intel.com>
 <20200623030711.GA5687@zhen-hp.sh.intel.com>
Date: Mon, 29 Jun 2020 11:18:42 +0300
Message-ID: <87wo3qmgil.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 23 Jun 2020, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> On 2020.06.18 15:48:01 +0300, Joonas Lahtinen wrote:
>> Quoting Zhenyu Wang (2020-06-17 07:34:18)
>> > 
>> > Hi,
>> > 
>> > This contains misc fixes for gvt. Two MMIO handler fixes on SKL/CFL,
>> > one mask register bit checking fix exposed in suspend/resume path and
>> > one lockdep error fix for debugfs entry access.
>> 
>> Could not pull this one due to the extra hassle with CI this week.
>> 
>> Jani, can you please pull this next week.
>> 
>
> Got it. Please help to pull then.

Pulled, thanks.

BR,
Jani.


>
> One thing I forgot to mention that change in "drm/i915/gvt: Fix incorrect check of enabled bits in mask registers"
> would cause a minor conflict if backmerging from linux master to dinq, which
> is because of new IS_COMETLAKE. Change like below could resolve that.
>
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index 9f48db0bf9d5..78ba2857144e 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1734,14 +1734,9 @@ static int ring_mode_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
>  		return 0;
>  	}
>  
> -<<<<<<< HEAD
>  	if ((IS_COFFEELAKE(vgpu->gvt->gt->i915) ||
>  	     IS_COMETLAKE(vgpu->gvt->gt->i915)) &&
> -	    data & _MASKED_BIT_ENABLE(2)) {
> -=======
> -	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) &&
>  	    IS_MASKED_BITS_ENABLED(data, 2)) {
> ->>>>>>> origin/gvt-next-fixes
>  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
>  		return 0;
>  	}
>
>> 
>> > Thanks.
>> > --
>> > The following changes since commit 8e68c6340d5833077b3753eabedab40755571383:
>> > 
>> >   drm/i915/display: Fix the encoder type check (2020-06-16 11:34:24 +0300)
>> > 
>> > are available in the Git repository at:
>> > 
>> >   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-06-17
>> > 
>> > for you to fetch changes up to a291e4fba259a56a6a274c1989997acb6f0bb03a:
>> > 
>> >   drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context (2020-06-17 12:36:19 +0800)
>> > 
>> > ----------------------------------------------------------------
>> > gvt-fixes-2020-06-17
>> > 
>> > - Two missed MMIO handler fixes for SKL/CFL (Colin)
>> > - Fix mask register bits check (Colin)
>> > - Fix one lockdep error for debugfs entry access (Colin)
>> > 
>> > ----------------------------------------------------------------
>> > Colin Xu (4):
>> >       drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
>> >       drm/i915/gvt: Fix two CFL MMIO handling caused by regression.
>> >       drm/i915/gvt: Fix incorrect check of enabled bits in mask registers
>> >       drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context
>> > 
>> >  drivers/gpu/drm/i915/gvt/debugfs.c      |  2 +-
>> >  drivers/gpu/drm/i915/gvt/handlers.c     | 24 +++++++++++++-----------
>> >  drivers/gpu/drm/i915/gvt/mmio_context.h |  6 +++---
>> >  drivers/gpu/drm/i915/gvt/reg.h          |  5 +++++
>> >  4 files changed, 22 insertions(+), 15 deletions(-)
>> _______________________________________________
>> intel-gvt-dev mailing list
>> intel-gvt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
