Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C906F1E1D9E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 May 2020 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A76E89AC0;
	Tue, 26 May 2020 08:47:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A9789ABE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 May 2020 08:47:41 +0000 (UTC)
IronPort-SDR: Ds8F5hqDV9JKapImzfsolXo5JyKjcfGhq8KPIVCsk5jQAFydAoOFDwq6lOjUBa0UVSdI0Iilfv
 BGEzbIkOU7ig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 01:47:40 -0700
IronPort-SDR: 7JUZwaS8t+4VrPF6qDc36unKlAkMNy3RBHeL7CR/uPMwvJ2dsnC8ZYfCzjbTzGO2mPK35ncB4w
 C2LrIR047rLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; d="scan'208";a="291106769"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2020 01:47:40 -0700
Date: Tue, 26 May 2020 04:37:47 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: Semantics of dma_{map,pin,unmap}_guest_page
Message-ID: <20200526083747.GC19560@joy-OptiPlex-7040>
References: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
 <20200526060229.GA19560@joy-OptiPlex-7040>
 <3fef2ebc2506dd2bd71f5411033c2cfb1b1a00bd.camel@cyberus-technology.de>
 <20200526081244.GB19560@joy-OptiPlex-7040>
 <3bdc659d41ad00d7ab1bf981dd97c2bb34163d0f.camel@cyberus-technology.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bdc659d41ad00d7ab1bf981dd97c2bb34163d0f.camel@cyberus-technology.de>
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

On Tue, May 26, 2020 at 10:30:36AM +0200, Julian Stecklina wrote:
> On Tue, 2020-05-26 at 04:12 -0400, Yan Zhao wrote:
> > On Tue, May 26, 2020 at 10:11:12AM +0200, Julian Stecklina wrote:
> > > On Tue, 2020-05-26 at 02:02 -0400, Yan Zhao wrote:
> > > > as the Unmap calls are triggered from guest page table modification, its
> > > > count does not necessarily match to that of Map calls.
> > > > But unpon vGPU is destroyed, gvt_cache_destroy() would be called by
> > > > kvmgt_guest_exit() and would remove all DMA mappings which might be still
> > > > alive regardless of its ref count.
> > > 
> > > If page tables stay pinned across a call to vgpu_destroy, that would explain
> > > what I'm seeing. This is then also harmless. I was worried that we
> > > accumulate
> > > these pins over time.
> > > 
> > > That being said, I've opened an issue in our internal bug tracker to re-
> > > visit
> > > this issue and confirm the theories.
> > > 
> > guest page tables are not necessarily cleared before vgpu_destroy,
> > especially when guest is killed or crashed.
> > so Unmap count is always less than Map count. I don't think it's a bug,
> > and it's safe to clear all dma mappings generated for guest and unpin all
> > previously pinned guest pages as now guest is destroyed. isn't it?
> 
> It's fine. It was just a bit surprising to me.
> 
> As I said before, it would be easier to spot bugs if vgpu_destroy would clean
> DMA mappings up that it knows about, but it's mostly cosmetic.
>
yes, if vgpu could maintain a list of its pinned pages and unpin them in
vgpu_destroy, it's fine.
But hypervisor adapter layer still needs to maintain a list in order to catch up
the missed ones to make itself complete.
so putting DMA mappings cleanup in hypervisor adapter layer makes our
life easier now:)

Thanks
Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
