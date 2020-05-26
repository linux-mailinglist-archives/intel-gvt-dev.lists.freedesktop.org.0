Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27C1E1CF6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 May 2020 10:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B8B6E109;
	Tue, 26 May 2020 08:11:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A446E109
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 May 2020 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lv4UHudtO/kx0Nwe7HkbRuFhy4HWz2pJqE1Q17hwAr0=; b=kxA5+nQ+JPVh6rBtDythXDh67
 iFCbnUO2+qH/+iC6d9HnDW2FndAJSowdMtE7OYKpTsB2zFPn3FwuA7MZ1V2II+fOz+QTHAmzUAuku
 3jAldFbqtZZm3AFoKMevTa4acLq8wy+xtsjVS4m6p1fy5ZNIwFYv/CnDbwL98EUGrGsIL8MDzr9tm
 2kiYzBXGieA9ec1u6cUy81qnTaaqjP69bGd2kOzCxo6JRbyQjh2NFzkMQmFsVkEYEjmt1maRNIr3o
 hX7qzip04lzOWzNNPcQ/yCqc338cNtRt2voYBJ4BSFDEvaWPS27fVrsoDgfIiCdbyOtmve0uFLBRQ
 kt4gSw7cQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jdUg7-0006Xg-Gy; Tue, 26 May 2020 10:11:15 +0200
Received: from [2001:16b8:5730:6e00:5e60:c12d:6fd5:1814] (helo=linux.fritz.box)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jdUg7-000EnH-Ah; Tue, 26 May 2020 10:11:15 +0200
Message-ID: <3fef2ebc2506dd2bd71f5411033c2cfb1b1a00bd.camel@cyberus-technology.de>
Subject: Re: Semantics of dma_{map,pin,unmap}_guest_page
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Yan Zhao <yan.y.zhao@intel.com>
Date: Tue, 26 May 2020 10:11:12 +0200
In-Reply-To: <20200526060229.GA19560@joy-OptiPlex-7040>
References: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
 <20200526060229.GA19560@joy-OptiPlex-7040>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25823/Mon May 25 14:23:53 2020)
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Yan,

thanks for the quick response!

On Tue, 2020-05-26 at 02:02 -0400, Yan Zhao wrote:
> On Mon, May 25, 2020 at 05:32:39PM +0200, Julian Stecklina wrote:
> > I would also expect that after I call `intel_gvt_ops->vgpu_destroy`, all DMA
> > mappings are released by the mediator with the appropriate number of unmap
> > calls. This doesn't seem to be the case, as I see many DMA mappings that are
> > still alive after the vGPU is destroyed.
> > 
> as the Unmap calls are triggered from guest page table modification, its
> count does not necessarily match to that of Map calls.
> But unpon vGPU is destroyed, gvt_cache_destroy() would be called by
> kvmgt_guest_exit() and would remove all DMA mappings which might be still
> alive regardless of its ref count.

If page tables stay pinned across a call to vgpu_destroy, that would explain
what I'm seeing. This is then also harmless. I was worried that we accumulate
these pins over time.

That being said, I've opened an issue in our internal bug tracker to re-visit
this issue and confirm the theories.

> 
> > At this point, I'm a bit unsure what to do with these mappings, because they
> > might still be in use. So the options are to either free them (and risk
> > memory
> > corruption) or keep them around leak memory.
> > 
> > Do I have a flaw in my assumptions or is it expected behavior to clean up
> > some
> > mappings that still have a reference count >0 after the vGPU is destroyed?
> > 
> > 
> as with the presence of gvt_cache_destroy(), I did not observe the
> mentioned leak. if you do encounter it, could you details the
> reproducing procedures? so we can check if it's a bug unnoticed.

Yes, gvt_cache_destroy removes any mappings. My question was only whether its
actually safe to clean them up even if they have a reference count >0. And if I
understand you correctly, that's the case. Thanks for explaining!

That being said, it would be easier to catch bugs in this logic if vgpu_destroy
would unpin all DMA mappings it knows of itself. Then the hypervisor backend can
just yell, if anything is left pinned when it cleans up, but I'm not sure how
hard this is to implement.

Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
