Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF51A0E76
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Apr 2020 15:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D826E877;
	Tue,  7 Apr 2020 13:36:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA516E878;
 Tue,  7 Apr 2020 13:36:09 +0000 (UTC)
IronPort-SDR: JLNKQv1M4e6JNbrligPrBe9bOQdD+Li9DFVPmAwQGhiliNnLtAt9ncNjx4f/y6U1L7wuXW9Ihh
 tDFnrijsBGMA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 06:36:08 -0700
IronPort-SDR: f03lzbREHfYyRJJSIkxBMjd3X9BnJgYjf/trQbUvW5bGG8hM66bULyPpNF+NnPUHGHbxAZO6KX
 fM/Y1mXFE3Rg==
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; d="scan'208";a="269429139"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 06:36:08 -0700
Date: Tue, 7 Apr 2020 06:35:59 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
Message-ID: <20200407133559.GB4170610@intel.com>
References: <20200331070025.GB16629@zhen-hp.sh.intel.com>
 <20200331162644.GA3779315@intel.com>
 <20200403030507.GQ16629@zhen-hp.sh.intel.com>
 <20200403175033.GA3997092@intel.com>
 <20200407080256.GU16629@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407080256.GU16629@zhen-hp.sh.intel.com>
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 04:02:56PM +0800, Zhenyu Wang wrote:
> On 2020.04.03 10:50:33 -0700, Rodrigo Vivi wrote:
> > 
> > +Dave and Daniel,
> > 
> > > 
> > > I forgot to mention one thing for 5.7. We've fixed to change guest mem r/w
> > > from KVM to use new VFIO dma r/w instead in this series: https://patchwork.freedesktop.org/series/72038/
> > > 
> > > As this depends on VFIO tree and looks VFIO pull for 5.7 is not settled down
> > > yet, we'd need to backmerge and send pull against vfio merge for 5.7.
> > 
> > I'm not sure if I'm following on which backmerge you are willing
> > us to do here. And for me it looks like late for 5.7 already.
> > 
> > Maybe you mean we ack all of this to go through vfio flow
> > then once that is settled drm backmerge and then drm-intel backmerge
> > and you backmerge...
> > 
> > Is that what you want?
> > 
> 
> My purpose is to get GVT side fixes of guest memory r/w through new
> vfio dma r/w interface in 5.7. As vfio 5.7-rc1 pull has already been
> merged in linus master, looks just want drm-intel backmerge now then
> could send gvt side fixes. Ok for you?

I'm afraid it is too late for that. That would depend on backmerge
of drm itself as well... And we are in a point that we are about to
move from drm-next to drm-fixes.

Also looking to the patches itself they look more content for -next
than -fixes and our window with drm closed on -rc6

So it looks to me that this will have to wait for the 5.8.

One good suggestion I heard from Daniel for cases like this in the
future is the use of topic branches so things don't get spread into
multiple versions like this.

> 
> Sorry for late reply, I was out for a short vacation.

Sorry for not been able to help further here

Thanks,
Rodrigo.

> 
> Thanks
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
