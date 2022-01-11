Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170AA48AFB8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jan 2022 15:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C09E10E343;
	Tue, 11 Jan 2022 14:40:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C5210E343;
 Tue, 11 Jan 2022 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641912036; x=1673448036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0fI1L/2R6TCi3ZunCsAB7x5GndtclqN8UHNcgES3ACA=;
 b=aTMF9ih5SQaDxJOtQ0HWXGxFnpWeVlJb6KzaqbUIh46pvK4JWXfqp4yp
 L7dLt+KEegiW0cgm3QEeChQGsypqERSKbu1qRa+kFbbb5q+nOi6KtWj9O
 Y7TbfcxQtN1OIhJ/pNNs2QNHKk+yzYlPq7uuY+pYP2odS36C0zZDIpZcx
 sB8/oH93/oqe+fgmSGEcvVoOR9Zex3Stwk0xstk4XjDQiT3C3P538JjfU
 tYfb6LL+pcy7/lqQHaJp+8S22P5bMc/xtQOvxi15i9Fuzk3iLN/8x8/Vk
 /Ik0P3u9Sa6Nle0jlwTLeEIeIW+CTyJwudgKVIOa/u15q8wFmxiwkUSZB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="223478684"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="223478684"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:40:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528763069"
Received: from kumaryog-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.255.38.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:40:35 -0800
Date: Tue, 11 Jan 2022 09:40:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next-queued
Message-ID: <Yd2W4T1Y8X0cP/PL@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
 <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 06:08:28AM -0500, Wang, Zhi A wrote:
> On 1/11/22 6:08 AM, Wang, Zhi A wrote:
> > On 1/11/2022 12:52 AM, Vivi, Rodrigo wrote:
> >> On Fri, 2022-01-07 at 14:43 +0000, Wang, Zhi A wrote:
> >>> Hi folks:
> >>>
> >>> Happy holidays! This pull mostly contains the code re-factors patches
> >>> from Guenter Roeck and Rikard. Also a minor change from Zhenyu.
> >>>
> >>> Zhi
> >>>
> >>> The following changes since commit
> >>> 3bfa7d40ce736ffbbfe07127061f54b359ee2b12:
> >>>
> >>>     drm/i915/dg2: Add support for new DG2-G11 revid 0x5 (2021-08-06
> >>> 09:03:10 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>     https://github.com/intel/gvt-linux tags/gvt-next-2022-01-07
> >>>
> >>> for you to fetch changes up to
> >>> d7a8585430f2b6df5960bbc305edcec5a55180f3:
> >> I'm not sure what's going on here, but:
> >>
> >> dim: no pull request found
> >>
> >> did you do anything different on this round for generating and sending
> >> out this pull request email?
> > Strange.
> >
> > I generated this pull request by git pull-request since there is no
> > support for generating pull-request for gvt-next right in dim now. Can
> > you share me the command line of dim you were using for apply this pull
> > request? I can try to apply it before sending the pull request.
> >
> > Thanks,
> >
> > Zhi.
> >
> Hi Vivi:
> 
> I did some checks and dumped the plain source of the email I sent. I
> guess I figured out the reason. It's the problem of thunderbird in
> Windows. When it sends the plain email, it will replace some space with
> "Â", which caused the dim cannot find the git repo url. I have no idea
> how that can happen since Thunderbird in Linux worked totally fine with
> the same settings.
> 
> Before the vacation, my VPN certificate in Linux has been expired. I had
> to use the thunderbird in Windows, which caused the problem above.
> 
> Will re-sent. Sorry for the bumps.

understood. no problem at all. it happens.

Thanks for resending, but there's something else now...

dim attempt a mega rebase of thousands and thousands of patches
when trying to apply this.

Could you please rebase on a more recent drm-intel-next tag?

Thanks,
Rodrigo.

> 
> Zhi.
> 
> >>>     drm/i915/gvt: Constify vgpu_types (2021-12-16 09:13:02 -0500)
> >>>
> >>> ----------------------------------------------------------------
> >>> Guenter Roeck (1):
> >>>         drm/i915/gvt: Use list_entry to access list members
> >>>
> >>> Rikard Falkeborn (9):
> >>>         drm/i915/gvt: Constify intel_gvt_gtt_gma_ops
> >>>         drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
> >>>         drm/i915/gvt: Constify intel_gvt_irq_ops
> >>>         drm/i915/gvt: Constify intel_gvt_sched_policy_ops
> >>>         drm/i915/gvt: Constify gvt_mmio_block
> >>>         drm/i915/gvt: Constify cmd_interrupt_events
> >>>         drm/i915/gvt: Constify formats
> >>>         drm/i915/gvt: Constify gtt_type_table_entry
> >>>         drm/i915/gvt: Constify vgpu_types
> >>>
> >>> Zhenyu Wang (1):
> >>>         drm/i915/gvt: Fix cmd parser error for Passmark9
> >>>
> >>>    drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
> >>>    drivers/gpu/drm/i915/gvt/dmabuf.c       | 18 +++------
> >>>    drivers/gpu/drm/i915/gvt/fb_decoder.c   | 24 ++++++------
> >>>    drivers/gpu/drm/i915/gvt/gtt.c          | 68
> >>> ++++++++++++++++-----------------
> >>>    drivers/gpu/drm/i915/gvt/gtt.h          |  4 +-
> >>>    drivers/gpu/drm/i915/gvt/gvt.h          |  2 +-
> >>>    drivers/gpu/drm/i915/gvt/handlers.c     | 13 ++++---
> >>>    drivers/gpu/drm/i915/gvt/interrupt.c    | 10 ++---
> >>>    drivers/gpu/drm/i915/gvt/interrupt.h    |  2 +-
> >>>    drivers/gpu/drm/i915/gvt/sched_policy.c |  2 +-
> >>>    drivers/gpu/drm/i915/gvt/scheduler.h    |  2 +-
> >>>    drivers/gpu/drm/i915/gvt/vgpu.c         |  4 +-
> >>>    12 files changed, 72 insertions(+), 79 deletions(-)
> >>>
> >
> 
