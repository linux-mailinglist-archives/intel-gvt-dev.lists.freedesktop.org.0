Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A71E1D2A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 May 2020 10:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C1089B7D;
	Tue, 26 May 2020 08:22:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54B589B7D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 May 2020 08:22:38 +0000 (UTC)
IronPort-SDR: zhYWha/wiBzQFYb/flDEk+8jOetUezeSYqzvclT3h4x+VSaR5HPsXbuzaMIPALTCeCRV7UJzVC
 xNvz1mhOYrYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 01:22:38 -0700
IronPort-SDR: XWKcf7eW2vO/IMWemjzv7H4tZhXJohaGhIQpTIooc2qinFE7JTYCT0WBRtmwnN4PXqtfCi9H+5
 UQp3IduAZiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; d="scan'208";a="291101253"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2020 01:22:37 -0700
Date: Tue, 26 May 2020 04:12:44 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: Semantics of dma_{map,pin,unmap}_guest_page
Message-ID: <20200526081244.GB19560@joy-OptiPlex-7040>
References: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
 <20200526060229.GA19560@joy-OptiPlex-7040>
 <3fef2ebc2506dd2bd71f5411033c2cfb1b1a00bd.camel@cyberus-technology.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fef2ebc2506dd2bd71f5411033c2cfb1b1a00bd.camel@cyberus-technology.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 10:11:12AM +0200, Julian Stecklina wrote:
> Hi Yan,
> 
> thanks for the quick response!
> 
> On Tue, 2020-05-26 at 02:02 -0400, Yan Zhao wrote:
> > On Mon, May 25, 2020 at 05:32:39PM +0200, Julian Stecklina wrote:
> > > I would also expect that after I call `intel_gvt_ops->vgpu_destroy`, all DMA
> > > mappings are released by the mediator with the appropriate number of unmap
> > > calls. This doesn't seem to be the case, as I see many DMA mappings that are
> > > still alive after the vGPU is destroyed.
> > > 
> > as the Unmap calls are triggered from guest page table modification, its
> > count does not necessarily match to that of Map calls.
> > But unpon vGPU is destroyed, gvt_cache_destroy() would be called by
> > kvmgt_guest_exit() and would remove all DMA mappings which might be still
> > alive regardless of its ref count.
> 
> If page tables stay pinned across a call to vgpu_destroy, that would explain
> what I'm seeing. This is then also harmless. I was worried that we accumulate
> these pins over time.
> 
> That being said, I've opened an issue in our internal bug tracker to re-visit
> this issue and confirm the theories.
>
guest page tables are not necessarily cleared before vgpu_destroy,
especially when guest is killed or crashed.
so Unmap count is always less than Map count. I don't think it's a bug,
and it's safe to clear all dma mappings generated for guest and unpin all
previously pinned guest pages as now guest is destroyed. isn't it?

Thanks
Yan
> > 
> > > At this point, I'm a bit unsure what to do with these mappings, because they
> > > might still be in use. So the options are to either free them (and risk
> > > memory
> > > corruption) or keep them around leak memory.
> > > 
> > > Do I have a flaw in my assumptions or is it expected behavior to clean up
> > > some
> > > mappings that still have a reference count >0 after the vGPU is destroyed?
> > > 
> > > 
> > as with the presence of gvt_cache_destroy(), I did not observe the
> > mentioned leak. if you do encounter it, could you details the
> > reproducing procedures? so we can check if it's a bug unnoticed.
> 
> Yes, gvt_cache_destroy removes any mappings. My question was only whether its
> actually safe to clean them up even if they have a reference count >0. And if I
> understand you correctly, that's the case. Thanks for explaining!
> 
> That being said, it would be easier to catch bugs in this logic if vgpu_destroy
> would unpin all DMA mappings it knows of itself. Then the hypervisor backend can
> just yell, if anything is left pinned when it cleans up, but I'm not sure how
> hard this is to implement.
> 
> Julian
> 
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
