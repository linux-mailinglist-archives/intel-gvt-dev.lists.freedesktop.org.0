Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496B29CF0D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Oct 2020 09:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BD66E4BA;
	Wed, 28 Oct 2020 08:40:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E1A6E4AE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Oct 2020 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=m6OayGkQUTRYuLmdMwsAeu471FbDicCP4nI1S4NfV8w=; b=MfWiZNEF+XKsmtcVtxeEmqOxqT
 wr7TWMXrcQxygBubvCFQtrXHLeTWgRxIlAEBpsEudIuos+rythVv4RIWJ1X+Oa520i0DckReb+GLR
 WTYcOKat82vKwyg406i4n32VTrSdEKZcaFH7ILUCi1bzy1HwxAgml6ltn2lCLC6bp2g9L5YGoNyj8
 3sC56sXaKjUeIOjRAFiPTNm/IM6457eSUNNf/h/Zy4cXFQFWTuGA/9ipvx5D8RBQ3fAETc9zKW42l
 IGMFMNzNZE6dpbDMha9PF8zGaCCwKUFkvnctvTnDYACzIE7/Q5Be7O6E9fYOGAG/rhKK66r8IoV1z
 bNI7KI1A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kXh0D-000718-2f; Wed, 28 Oct 2020 09:40:17 +0100
Received: from [5.12.18.230] (helo=localhost.localdomain)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kXh0C-000CeB-Ri; Wed, 28 Oct 2020 09:40:16 +0100
Message-ID: <9286d367b5f95b4b819f5f41b7654e5a79e40328.camel@cyberus-technology.de>
Subject: Re: GVT Scheduler
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Intel GVT Dev
 <intel-gvt-dev@lists.freedesktop.org>, Stefan Hertrampf
 <stefan.hertrampf@cyberus-technology.de>
Date: Wed, 28 Oct 2020 10:40:15 +0200
In-Reply-To: <5a74d2abdd034a61a336944148b9d40c@intel.com>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
 <e2d543701d3442f78aae7bc10b54487d@intel.com>
 <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
 <5a74d2abdd034a61a336944148b9d40c@intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25970/Tue Oct 27 13:18:55 2020)
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi,

On Mon, 2020-10-19 at 06:11 +0000, Wang, Zhi A wrote:
> According to the discussion last time, I reviewed all the code paths of
> execlist context schedule-in and schedule-out in your code repo.

Thank you! Sorry for getting back so late, but a lot of us are currently on
vacation. I'm also adding Stefan to the thread, because I'm not available next
week and it would be good if we keep this rolling. :)

Our current workaround [1] results in hung tasks unfortunately, so it would be
really helpful to get to the rootcause of this issue to avoid having to put
bandaids over it.

>  According to our assumption, there might be extra execlist schedule-out
> status notification. Is it possible that you can open the tracepoint in
> execlist_context_schedule_in and execlist_context_schedule_out in intel_lrc.c?

We'll try turning trace_i915_request_in / trace_i915_request_out into printks
and see whether this helps in debugging. Alternatively, is there a way to get
trace events out of a crashed kernel?

Btw, would it make sense to count the schedule_in and schedule_out events for
each requests and dump a stacktrace when we see an unpaired schedule_out?

> so that we can check if there are unpair schedule_in and schedule_out events.
> Also, better move the trace_i915_request_in to __execlists_schedule_in as
> there is a seqlock like sync try_cmpxchg around.

Will do!

Thanks,
Julian

[1] 
https://github.com/blitz/linux/commit/50a1cfd0695f7c141d16377c087a3642faee9b99

> -----Original Message-----
> From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Julian Stecklina
> Sent: Friday, October 9, 2020 12:26 PM
> To: Wang, Zhi A <zhi.a.wang@intel.com>; Intel GVT Dev <
> intel-gvt-dev@lists.freedesktop.org>
> Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
> Subject: Re: GVT Scheduler
> 
> Hi Zhi,
> 
> your explanation is really helpful. Thank you! See my comments below.
> 
> On Thu, 2020-10-08 at 16:41 +0000, Wang, Zhi A wrote:
> > Now let's see the timeline:
> > 
> > - GVT-g submits a workload to i915.
> > - i915 append the breadcrumb to the workload
> > - i915 submits the workload to HW.
> > - GVT-g called i915_wait_request to wait for the GPU execution passed 
> > the breadcrumb. (But the context might not be switched out at this 
> > time)
> > - GVT-g waits for the context to be switched out by the 
> > shadow_context_status_change. (Because GVT-g need to copy the content 
> > in the shadow context back to the guest context. The shadow context 
> > must be idle at this time.)
> > - No one is going to touch the shadow context anymore and GVT-g call 
> > complete_current_workload.
> > 
> > The race between shadow_context_status_change and 
> > complete_current_workload should be addressed in our design. So this 
> > problem might be caused by i915 change, e.g. the timing of call 
> > shadow_context_status_change is changed. But we will double confirm in GVT-g 
> > as well.
> 
> We definitely see shadow_context_status_change being called for a workload
> that has already passed beyond wait_event(workload->shadow_ctx_status_wq,
> ...); in complete_current_workload.
> 
> > The patch you mentioned is for a corner case in GPU reset. But this 
> > shouldn't happen in a normal submission flow unless someone breaks the flow
> > above.
> 
> The problem for us is that we can only reproduce this issue in a hardened
> Linux build after many hours. So it's not exactly the most friendly issue to
> debug. :)
> 
> We are currently using a workaround that serializes the actual completion of
> the workload against handling schedule out in shadow_context_status_change:
> https://github.com/blitz/linux/commit/50a1cfd0695f7c141d16377c087a3642faee9b99
> 
> This is not pretty, but so far this has prevented the issue from popping up
> again.
> 
> Thanks,
> Julian
> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
