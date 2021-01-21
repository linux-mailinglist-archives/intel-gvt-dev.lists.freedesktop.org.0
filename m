Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A782FEB4B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Jan 2021 14:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D8D6E8EA;
	Thu, 21 Jan 2021 13:15:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043346E8E6;
 Thu, 21 Jan 2021 13:15:39 +0000 (UTC)
IronPort-SDR: BpTdKwXyPDW3yRLyhWXynN4L7KgeeOLrS8fcwegcbQC7qhNJEphcIeuTbAbG0yr78wGzvBo9I3
 BPy8jf9t+cwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="175759763"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="175759763"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 05:15:31 -0800
IronPort-SDR: eJZ6LwMTZpLKgERrNzM7feRJkOx1NM2sv+Liky6QlrUIfi6JwbweTKWcmNm2ulhjwhXsjACL65
 NFV8scnU++UQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="385300850"
Received: from declanmu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.25])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 05:15:27 -0800
MIME-Version: 1.0
In-Reply-To: <20210121040825.GG15982@zhen-hp.sh.intel.com>
References: <20210118050739.GY15982@zhen-hp.sh.intel.com>
 <161114531233.12022.4976651928998688735@jlahtine-mobl.ger.corp.intel.com>
 <20210121040825.GG15982@zhen-hp.sh.intel.com>
Subject: Re: [PULL] gvt-gt-next
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <161123491821.9094.16627785208035798444@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 21 Jan 2021 15:15:19 +0200
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

Quoting Zhenyu Wang (2021-01-21 06:08:25)
> On 2021.01.20 14:21:53 +0200, Joonas Lahtinen wrote:
> > Quoting Zhenyu Wang (2021-01-18 07:07:39)
> > > 
> > > Hi,
> > > 
> > > This is GVT next for 5.12 against drm-intel-gt-next which is mostly
> > > for cmd parser enhancement which adds extra check on register load
> > > depending on initial context and handles vGPU register state
> > > accordingly.
> > 
> > I think we were bit inconclusive on this last time.
> >
> 
> Sorry about that, I was thinking we might just follow your previous idea.
> 
> > Even if this does not have any dependency to drm-intel-gt-next I can
> > pull this to drm-intel-gt-next. The only caveat is that for any -fixes,
> > there needs to be a backmerge to drm-intel-next.
> > 
> > Not sure if this is a problem. Do we want to make it a recurring practice
> > to backmerge drm-intel-gt-next into drm-intel-next after it lands in
> > drm-next?
> >
> 
> So -gt-next won't do -gt-next-fixes, right? For -next-fixes, we always do
> drm-next backmerge, right?
> 
> > So to recap: Do we want to pull to drm-intel-next whenever there are no
> > dependencies to drm-intel-gt-next, to avoid a backmerge?
> 
> yeah, that's fine to me. But for this time gvt-next pull, it's really targeting
> for -gt-next which has some dependency, I can double check to confirm.

I've now pulled to drm-intel-gt-next.

Indeed any changes in i915/gt side that affect GVT would become
dependencies.

I think it would be good to continue on the plan to build GVT as a
completely separate module and have a clear definition of the interface
between the two.

Regards, Joonas

> Thanks.
> 
> > Or do we want
> > to always do a backmerge in anticipation of -fixes.
> > 
> > Regards, Joonas
> > 
> > > Thanks.
> > > --
> > > The following changes since commit fe7bcfaeb2b775f257348dc7b935f8e80eef3e7d:
> > > 
> > >   drm/i915/gt: Refactor heartbeat request construction and submission (2020-12-24 18:07:26 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   https://github.com/intel/gvt-linux tags/gvt-gt-next-2021-01-18
> > > 
> > > for you to fetch changes up to 02dd2b12a685944c4d52c569d05f636372a7b6c7:
> > > 
> > >   drm/i915/gvt: unify lri cmd handler and mmio handlers (2020-12-25 11:16:32 +0800)
> > > 
> > > ----------------------------------------------------------------
> > > gvt-gt-next-2021-01-18
> > > 
> > > - GVT cmd parser enhancement against guest context (Yan)
> > > 
> > > ----------------------------------------------------------------
> > > Yan Zhao (11):
> > >       drm/i915/gvt: parse init context to update cmd accessible reg whitelist
> > >       drm/i915/gvt: scan VM ctx pages
> > >       drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
> > >       drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler
> > >       drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
> > >       drm/i915/gvt: export find_mmio_info
> > >       drm/i915/gvt: make width of mmio_attribute bigger
> > >       drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
> > >       drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
> > >       drm/i915/gvt: update F_CMD_WRITE_PATCH flag when parsing init ctx
> > >       drm/i915/gvt: unify lri cmd handler and mmio handlers
> > > 
> > >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 335 +++++++++++++++++++++++++++-------
> > >  drivers/gpu/drm/i915/gvt/cmd_parser.h |   4 +
> > >  drivers/gpu/drm/i915/gvt/gvt.h        |  37 +++-
> > >  drivers/gpu/drm/i915/gvt/handlers.c   |  15 +-
> > >  drivers/gpu/drm/i915/gvt/mmio.h       |   3 +
> > >  drivers/gpu/drm/i915/gvt/reg.h        |   2 +
> > >  drivers/gpu/drm/i915/gvt/scheduler.c  |  22 ++-
> > >  drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
> > >  8 files changed, 339 insertions(+), 83 deletions(-)
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
