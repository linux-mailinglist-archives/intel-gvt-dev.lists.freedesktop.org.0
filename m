Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47AA2C66C8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Nov 2020 14:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E1D6ED18;
	Fri, 27 Nov 2020 13:26:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA4A6ED18;
 Fri, 27 Nov 2020 13:26:33 +0000 (UTC)
IronPort-SDR: sy/gP+wJQg82S87q+v7gLL6x4ylGOcW3V9T8noBuBee40+kZP1we9P679g4+w3FbQWOqcgruwk
 u5G6Uhxj/FIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="236522388"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="236522388"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 05:26:21 -0800
IronPort-SDR: qet7gQT70gQOuu9K6pjqghKzYR2TIzRzFu2ckXI1y8zwjQaGAJeoVrKbL4aFHTN/NbPubV0lWB
 4XUWBVqYa9sQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548049158"
Received: from jmikkola-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.21.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 05:26:18 -0800
MIME-Version: 1.0
In-Reply-To: <20201124031359.GE16939@zhen-hp.sh.intel.com>
References: <20201123090517.GC16939@zhen-hp.sh.intel.com>
 <160612395828.4926.14269845290017694082@jlahtine-mobl.ger.corp.intel.com>
 <20201124031359.GE16939@zhen-hp.sh.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160648357653.10416.1504182474021040036@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 27 Nov 2020 15:26:16 +0200
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Quoting Zhenyu Wang (2020-11-24 05:13:59)
> On 2020.11.23 11:32:38 +0200, Joonas Lahtinen wrote:
> > Quoting Zhenyu Wang (2020-11-23 11:05:17)
> > > 
> > > Hi,
> > > 
> > > Here's gvt next pull for v5.11. Mostly it's for host suspend/resume
> > > fix with vGPU active and with some other enhancement as details below.
> > > Note that this includes some minor i915 driver change to add gvt hook
> > > in suspend/resume function which has been sent and reviewed on
> > > intel-gfx list.
> > > 
> > > I just generated against drm-intel-next-queued-2020-11-03 which this
> > > tree bases on now. Let me know if there's any issue in merge.
> > 
> > Sometimes GVT changes are paired with changes related the i915 side
> > to adjust the running virtual clients. The changes are more often
> > related to GT side, but there's also been display related changes.
> > 
> > Going forward, would we want to continue to apply gvt-next to
> > drm-intel-next (-queued is planned to be deprecated) or
> > should we use drm-intel-gt-next?
> >
> 
> Is there any clear criteria on patches for -next or -gt-next now?
> Something might be only gvt specific, e.g we'll have some enhancement patches
> for guest context parse, this might be considered as 'gt' part? I'm not sure.
> But yes, I hope we just stick with one, currently thinking drm-intel-next.

For anything self-contained in gvt directory only, we can make a choice.

I think the patches that concern vgpu, have most often been around the GT
related code (opposed to display and PM).

That kind of makes me think we would get away with least amount of topic
branches and backmerges in the future if we also merged gvt-next to
drm-intel-gt-next. Thoughts?

That'd just mean a shift in timeline to send gvt-next latest early in -rc4
week.

Regards, Joonas

> > Or should we always strictly apply the GVT changes to drm-intel-next,
> > and then any related i915 changes to drm-intel-next or drm-intel-gt-next
> > depending on which one they are related to?
> >
> 
> How about basically we just apply to drm-intel-next, but there might be gvt
> specific pull required for -gt-next e.g ww-lock fixes? I think we can do that way
> now to see if there'll be any real issue popup.
> 
> Thanks
> 
> > 
> > > Thanks
> > > --
> > > The following changes since commit 139caf7ca2866cd0a45814ff938cb0c33920a266:
> > > 
> > >   drm/i915: Update DRIVER_DATE to 20201103 (2020-11-03 14:21:25 +0200)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   https://github.com/intel/gvt-linux tags/gvt-next-2020-11-23
> > > 
> > > for you to fetch changes up to 9a3a238b3de97b4210c6de66aa88b2d7021ac086:
> > > 
> > >   drm/i915/gvt: treat intel_gvt_mpt as const in gvt code (2020-11-23 17:14:20 +0800)
> > > 
> > > ----------------------------------------------------------------
> > > gvt-next-2020-11-23
> > > 
> > > - Fix host suspend/resume with vGPU (Colin)
> > > - optimize idr init (Varma)
> > > - Change intel_gvt_mpt as const (Julian)
> > > - One comment error fix (Yan)
> > > 
> > > ----------------------------------------------------------------
> > > Colin Xu (3):
> > >       drm/i915/gvt: Save/restore HW status to support GVT suspend/resume
> > >       drm/i915: Add GVT resume routine to i915
> > >       drm/i915/gvt: Fix virtual display setup for BXT/APL
> > > 
> > > Deepak R Varma (1):
> > >       drm/i915/gvt: replace idr_init() by idr_init_base()
> > > 
> > > Julian Stecklina (1):
> > >       drm/i915/gvt: treat intel_gvt_mpt as const in gvt code
> > > 
> > > Yan Zhao (1):
> > >       drm/i915/gvt: correct a false comment of flag F_UNALIGN
> > > 
> > >  drivers/gpu/drm/i915/gvt/display.c  | 179 ++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/i915/gvt/gtt.c      |  64 +++++++++++++
> > >  drivers/gpu/drm/i915/gvt/gtt.h      |   4 +
> > >  drivers/gpu/drm/i915/gvt/gvt.c      |  13 ++-
> > >  drivers/gpu/drm/i915/gvt/gvt.h      |   7 +-
> > >  drivers/gpu/drm/i915/gvt/handlers.c |  44 ++++++++-
> > >  drivers/gpu/drm/i915/gvt/kvmgt.c    |   2 +-
> > >  drivers/gpu/drm/i915/gvt/mmio.c     |   5 +
> > >  drivers/gpu/drm/i915/gvt/mmio.h     |   4 +
> > >  drivers/gpu/drm/i915/gvt/mpt.h      |   2 +-
> > >  drivers/gpu/drm/i915/gvt/vgpu.c     |   2 +-
> > >  drivers/gpu/drm/i915/i915_drv.c     |   2 +
> > >  drivers/gpu/drm/i915/intel_gvt.c    |  15 +++
> > >  drivers/gpu/drm/i915/intel_gvt.h    |   5 +
> > >  14 files changed, 338 insertions(+), 10 deletions(-)
> > > 
> > > -- 
> > > 
> > > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
