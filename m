Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B720B19DD26
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Apr 2020 19:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB826EC55;
	Fri,  3 Apr 2020 17:50:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A426EC55;
 Fri,  3 Apr 2020 17:50:37 +0000 (UTC)
IronPort-SDR: abwFa6hJEZy51mkaHJuqgtKUijjL/weVTmuuaUmc+0zo5RqILb6WHX8Y0nePzmO7ULTzW1jlxZ
 6fOhH5O1Q9RQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 10:50:36 -0700
IronPort-SDR: fQ8AOj3EUsvvQsfj01gJpVMeRq62LXcQooTqQhbLRmGmGp+XqWQpT+GCpcSFSrJgwZ85kP4/hG
 JYtFlaNPoYyA==
X-IronPort-AV: E=Sophos;i="5.72,340,1580803200"; d="scan'208";a="423605727"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 10:50:36 -0700
Date: Fri, 3 Apr 2020 10:50:33 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
Message-ID: <20200403175033.GA3997092@intel.com>
References: <20200331070025.GB16629@zhen-hp.sh.intel.com>
 <20200331162644.GA3779315@intel.com>
 <20200403030507.GQ16629@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403030507.GQ16629@zhen-hp.sh.intel.com>
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


+Dave and Daniel,

On Fri, Apr 03, 2020 at 11:05:07AM +0800, Zhenyu Wang wrote:
> On 2020.03.31 09:26:44 -0700, Rodrigo Vivi wrote:
> > On Tue, Mar 31, 2020 at 03:00:25PM +0800, Zhenyu Wang wrote:
> > > 
> > > Hi,
> > > 
> > > Here's more queued gvt fixes for 5.7. Please see details below.
> > > 
> > > Thanks
> > > --
> > > The following changes since commit a61ac1e75105a077ec1efd6923ae3c619f862304:
> > > 
> > >   drm/i915/gvt: Wean gvt off using dev_priv (2020-03-06 10:08:10 +0800)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2020-03-31
> > > 
> > > for you to fetch changes up to eb0ff8074e0baecba2cd0c7813f6cfa99bafc430:
> > > 
> > >   drm/i915/gvt: Fix klocwork issues about data size (2020-03-27 15:37:58 +0800)
> > 
> > pulled, thanks
> 
> I forgot to mention one thing for 5.7. We've fixed to change guest mem r/w
> from KVM to use new VFIO dma r/w instead in this series: https://patchwork.freedesktop.org/series/72038/
> 
> As this depends on VFIO tree and looks VFIO pull for 5.7 is not settled down
> yet, we'd need to backmerge and send pull against vfio merge for 5.7.

I'm not sure if I'm following on which backmerge you are willing
us to do here. And for me it looks like late for 5.7 already.

Maybe you mean we ack all of this to go through vfio flow
then once that is settled drm backmerge and then drm-intel backmerge
and you backmerge...

Is that what you want?

> 
> thanks
> 
> > 
> > > 
> > > ----------------------------------------------------------------
> > > gvt-next-fixes-2020-03-31
> > > 
> > > - Fix non-privilege access warning (Tina)
> > > - Fix display port type (Tina)
> > > - BDW cmd parser missed SWTESS_BASE_ADDRESS (Yan)
> > > - Bypass length check of LRI (Yan)
> > > - Fix one klocwork warning (Tina)
> > > 
> > > ----------------------------------------------------------------
> > > Tina Zhang (3):
> > >       drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
> > >       drm/i915/gvt: Fix display port type issue
> > >       drm/i915/gvt: Fix klocwork issues about data size
> > > 
> > > Yan Zhao (2):
> > >       drm/i915/gvt: add support to command SWTESS_BASE_ADDRESS
> > >       drm/i915/gvt: do not check len & max_len for lri
> > > 
> > >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 16 ++++------------
> > >  drivers/gpu/drm/i915/gvt/display.c    |  6 +++---
> > >  drivers/gpu/drm/i915/gvt/handlers.c   |  8 ++++++--
> > >  drivers/gpu/drm/i915/gvt/scheduler.c  |  4 ++--
> > >  4 files changed, 15 insertions(+), 19 deletions(-)
> > > 
> > > -- 
> > > Open Source Technology Center, Intel ltd.
> > > 
> > > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> > 
> > 
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827



> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
