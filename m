Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A438A1CBDF3
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  9 May 2020 07:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0C86E2DD;
	Sat,  9 May 2020 05:52:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE126E2DD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  9 May 2020 05:52:49 +0000 (UTC)
IronPort-SDR: She31qQcBemIGo/SDaZh9vYT4PqVc2OYWBss4D0KFZ94aDh26k0YBzrSoTpIN2riD31jLW4NIk
 xwdg0UQKMWuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 22:52:49 -0700
IronPort-SDR: QkcKsocizdCzein9EglMAlhB8WNaemJxujYRo/oJRRGIYJEYuU9bpMV2RlaRmojcQVXWJ7XynN
 NEoPr1gJN9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,370,1583222400"; d="scan'208";a="250657810"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga007.fm.intel.com with ESMTP; 08 May 2020 22:52:48 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 8 May 2020 22:52:48 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.210]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.95]) with mapi id 14.03.0439.000;
 Sat, 9 May 2020 13:52:44 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
Thread-Topic: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
Thread-Index: AQHWI40QN1fxKiNhjkOqerANxdQWF6id+YkQ//+W8QCAAQCWAIAAs1Ug
Date: Sat, 9 May 2020 05:52:43 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC2798D6F5@SHSMSX104.ccr.corp.intel.com>
References: <20200506095918.124913-1-zhenyuw@linux.intel.com>
 <8082FF9BCB2B054996454E47167FF4EC2798C4AE@SHSMSX104.ccr.corp.intel.com>
 <20200508115018.GE18545@zhen-hp.sh.intel.com>
 <20200509030840.GK18545@zhen-hp.sh.intel.com>
In-Reply-To: <20200509030840.GK18545@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> On 2020.05.08 19:50:18 +0800, Zhenyu Wang wrote:
> > On 2020.05.08 11:13:38 +0000, Zhang, Xiong Y wrote:
> > > > -----Original Message-----
> > > > From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org>
> > > > On Behalf Of Zhenyu Wang
> > > > Sent: Wednesday, May 6, 2020 5:59 PM
> > > > To: intel-gvt-dev@lists.freedesktop.org
> > > > Subject: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt
> > > > guest
> > > >
> > > > As i915 won't allocate extra PDP for current default PML4 table,
> > > > so for 3-level ppgtt guest, we would hit kernel pointer access failure on
> extra PDP pointers.
> > > > So this trys to bypass that now.
> > > > It won't impact real shadow PPGTT setup, so guest context still works.
> > > >
> > > > This is verified on 4.15 guest kernel with i915.enable_ppgtt=1 to
> > > > force on old aliasing ppgtt behavior.
> > > >
> > > > Fixes: 4f15665ccbba ("drm/i915: Add ppgtt to GVT GEM context")
> > > > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/gvt/scheduler.c | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > > index 9c3558489d17..6ab1d95c1fae 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > > @@ -420,7 +420,11 @@ static void
> > > > set_context_ppgtt_from_shadow(struct
> > > > intel_vgpu_workload *workload,
> > > >  		for (i = 0; i < GVT_RING_CTX_NR_PDPS; i++) {
> > > >  			struct i915_page_directory * const pd =
> > > >  				i915_pd_entry(ppgtt->pd, i);
> > > > -
> > > > +			/* skip now as current i915 ppgtt alloc won't allocate
> > > > +			   top level pdp for non 4-level table, won't impact
> > > > +			   shadow ppgtt. */
> > > > +			if (!pd)
> > > > +				break;
> > > [Zhang, Xiong Y]  does it  exist in older kernel only ?  current staging code
> allocate 4 pdp for non 4-level table.
> >
> > But in all current case we'll only allocate for pml4 as it checks hw info.
> >
> > > I915_context_ppgtt_root_restore()  have the same issue, it should be
> modified also.
> >
> > yeah, missed that although not shown in my test..
> >
> 
> Double checked that ppgtt_root_save/restore is not relevant here, which is
> only for shadow ctx that always align with i915 setup e.g in pml4.
> But in this case for 3-level guest, we tried to directly set pdp ptr which is not
> allocated in host pml4 setup. So have to skip that and update shadow ctx
> state for 3-level pdp still works ok.
[Zhang, Xiong Y] OK.
Reviewed-by: Xiong Zhang <xiong.y.zhang@intel.com>

thanks
> 
> > > >  			px_dma(pd) = mm->ppgtt_mm.shadow_pdps[i];
> > > >  		}
> > > >  	}
> > > > --
> > > > 2.26.2
> > > >
> > > > _______________________________________________
> > > > intel-gvt-dev mailing list
> > > > intel-gvt-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> >
> > --
> > Open Source Technology Center, Intel ltd.
> >
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> 
> 
> 
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> 
> 
> --
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
