Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864FE1BD198
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 Apr 2020 03:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EAA6E39E;
	Wed, 29 Apr 2020 01:18:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EE76E39E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Apr 2020 01:18:25 +0000 (UTC)
IronPort-SDR: bzo9dBaiJcmqS7byzZxbsRgX6WVZExcWKCQKe6I3gFM4ZIydR4+JydatdezRUZguQYR3Gh+001
 hPCxDdITOhHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 18:18:24 -0700
IronPort-SDR: 1kYDoudRIlgzH47xrCH8jCL4opijMJiyzGCVI+LmAwxH1gOyk6G4ujltA/a/EUA8V2JM+ZwOXp
 gyH/cq4kMl+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,329,1583222400"; d="scan'208";a="282340682"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2020 18:18:23 -0700
Date: Tue, 28 Apr 2020 21:08:40 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: Support PPGTT table load command
Message-ID: <20200429010840.GK12879@joy-OptiPlex-7040>
References: <20200426052803.GD12879@joy-OptiPlex-7040>
 <20200426065823.GC18545@zhen-hp.sh.intel.com>
 <20200426071736.GD18545@zhen-hp.sh.intel.com>
 <20200426075928.GE12879@joy-OptiPlex-7040>
 <20200426115145.GE18545@zhen-hp.sh.intel.com>
 <20200427025456.GF12879@joy-OptiPlex-7040>
 <20200427072149.GG12879@joy-OptiPlex-7040>
 <20200427092631.GH18545@zhen-hp.sh.intel.com>
 <F22B14EC3CFBB843AD3E03B6B78F2C6A4C4EF39D@shsmsx102.ccr.corp.intel.com>
 <20200428030253.GL18545@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428030253.GL18545@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Zhang, Tina" <tina.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 11:02:53AM +0800, Zhenyu Wang wrote:
> On 2020.04.28 00:41:48 +0000, Zhao, Yan Y wrote:
> > 
> > > On 2020.04.27 03:21:49 -0400, Yan Zhao wrote:
> > > > > >
> > > > > > I think the step is just to restore guest context and run through
> > > > > > loaded shadow mm, we only need to recover last guest pdp after
> > > > > > workload run.
> > > > > >
> > > > > sorry. sent too fast.
> > > > > I mean why not just update workload->shadow_mm and
> > > > > workload->shadow_mm->ppgtt_mm.guest_pdps, when lri pdp is found?
> > > > >
> > > > 1. if lri pdp1 (not the same as shadow_mm) and lri pdp2 (the same as
> > > > shadow_mm) are executed successively, we should not update the guest
> > > > pdp.
> > > 
> > > Actually we should, to replace with shadow ppgtt ptr also for same as
> > > shadow_mm case, otherwise wrong pdps would be loaded to HW. Next
> > > version will fix that.
> > > 
> > > > 2. if there's a save inhibit bit set in the workload, we cannot update
> > > > the guest context.
> > > 
> > > yep, looks currently we don't care about save inhibit but just update guest
> > > context. We might do this later.
> > > 
> > > > 3. there may be other cases to cause last entry in lri_shadow_mm no
> > > > aligning with the final one in workload.
> > > > so I think the safest way to update guest context is to find the
> > > > guest_pdps according to pdps in shadow context.
> > > 
> > > Hmm, I think it's safe now to mark last ppgtt LRI cmd as last context state
> > > because I can't think of other ways might affect that. And to find guest pdps,
> > > we have to walk through all shadow mm which seems not worth to me.
> > > 
> > No need to walk through all shadow mms.
> > Just shadow mms for current workload, and you can start from the most possible one.
> 
> Current shadow mm list is for per vgpu instead of per workload, so in this patch
> which adds new list for all possible shadow mm per workload.
> 
I think in update_guest_context(), shadow mm is still kept in
workload->shadow_mm.

so the choice is within workload->shadow_mm and entries in workload->lri_shadow_mm.


> > Why not choose the most robust way ?  (like save inhibit. it's possible that we might miss something)
> >
> 
> I think it's robust because we know exactly what the result should be
> for hw behavior emulation. How about to add a debug func to double
> check if context pdps matches? So in normal operation it won't bother.
> 
> Thanks
> 
> > > 
> > > >
> > > > > > > > > >
> > > > > > > > > > and what's the reason for us to use a lri_shadow_mm list?
> > > > > > > > >
> > > > > > > > > As in theory there could be multiple ppgtt loads in one ring
> > > > > > > > > submission, and previous code always assumes one e.g put
> > > > > > > > > older scanned shadow mm if found another one, which was not
> > > > > > > > > right to me. So here just uses a link to track all possible loads.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > 
> > > --
> > > Open Source Technology Center, Intel ltd.
> > > 
> > > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827



> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
