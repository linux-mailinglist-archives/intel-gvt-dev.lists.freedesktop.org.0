Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE4287A37
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Oct 2020 18:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F47D6EA96;
	Thu,  8 Oct 2020 16:41:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5C6EA96
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  8 Oct 2020 16:41:57 +0000 (UTC)
IronPort-SDR: IRff2sD1b1YsqIFqcTNx+wI2dN/W+dLQqZRRmJ8roe27oCQP1Kmvr3z5ZPRX/f+t9MxlBLG1Z0
 4gFPTHnLE5UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="164578990"
X-IronPort-AV: E=Sophos;i="5.77,351,1596524400"; d="scan'208";a="164578990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 09:41:57 -0700
IronPort-SDR: NeYegRi+HzEQPXAzHAYaTlCXcbF+HjYZJoPdrDyjCZ9QTsTqeK2mn2h06INtU/db2yZX0wlOkc
 0E7khtd45ZCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,351,1596524400"; d="scan'208";a="519406643"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga005.fm.intel.com with ESMTP; 08 Oct 2020 09:41:56 -0700
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 8 Oct 2020 17:41:55 +0100
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Thu, 8 Oct 2020 17:41:55 +0100
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>, Intel GVT Dev
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: GVT Scheduler
Thread-Topic: GVT Scheduler
Thread-Index: AQHWlmD7vRQ0WUIfx0qW6wyUpKsGnqmA/C6AgAz24HA=
Date: Thu, 8 Oct 2020 16:41:55 +0000
Message-ID: <e2d543701d3442f78aae7bc10b54487d@intel.com>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
In-Reply-To: <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [163.33.253.164]
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Julian:

Thanks for your message. 

Every workload is addressed with a GPU context. The workload in i915 is submitted by the HW interfaces called execlist. When the workload is finished, the HW will notice the i915 by an interrupt and switch out the context. Then i915 will process the CSB (context status block) and call the shadow_context_status_change through the notifier in the interrupt handler (or tasklet).

I915 also put a breadcrumb after the workload inside the context to figure out if a workload is finished or not.

Now let's see the timeline:

- GVT-g submits a workload to i915.
- i915 append the breadcrumb to the workload
- i915 submits the workload to HW.
- GVT-g called i915_wait_request to wait for the GPU execution passed the breadcrumb. (But the context might not be switched out at this time)
- GVT-g waits for the context to be switched out by the shadow_context_status_change. (Because GVT-g need to copy the content in the shadow context back to the guest context. The shadow context must be idle at this time.)
- No one is going to touch the shadow context anymore and GVT-g call complete_current_workload. 

The race between shadow_context_status_change and complete_current_workload should be addressed in our design. So this problem might be caused by i915 change, e.g. the timing of call shadow_context_status_change is changed. But we will double confirm in GVT-g as well.

The patch you mentioned is for a corner case in GPU reset. But this shouldn't happen in a normal submission flow unless someone breaks the flow above.

Thanks,
Zhi.

-----Original Message-----
From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf Of Julian Stecklina
Sent: Wednesday, September 30, 2020 2:29 PM
To: Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Subject: Re: GVT Scheduler

Hello,

we've just found this discussion from 2017 that looks directly related:
https://lists.freedesktop.org/archives/intel-gvt-dev/2017-February/000063.html

Especially, the race between complete_current_workload and shadow_context_status_change looks problematic and reading the current code I cannot convince myself that it's race free.

In our testing we have seen page faults in shadow_context_status_change in the final wake_up(&workload->shadow_ctx_status_wq); call that are hard to explain without a race like that. The backtraces always look like the one below.

We are currently testing with v5.4.68, but I don't see anything relevant being changed in newer versions.

Any pointers are appreciated.

[ 2594.865440] BUG: unable to handle page fault for address: 00000000000263e0 [ 2594.865448] RIP: 0010:[<ffffffff814b3fcb>]
queued_spin_lock_slowpath+0x17b/0x1c0
[...]
[ 2594.865484] Call Trace:
[ 2594.865487]  <IRQ>
[ 2594.865490] _raw_spin_lock_irqsave (kernel/locking/spinlock.c:159) [ 2594.865494] __wake_up_common_lock (kernel/sched/wait.c:123) [ 2594.865499] shadow_context_status_change
(drivers/gpu/drm/i915/gvt/scheduler.c:286)
[ 2594.865501] notifier_call_chain (kernel/notifier.c:104) [ 2594.865504] atomic_notifier_call_chain (kernel/notifier.c:203) [ 2594.865507] process_csb (drivers/gpu/drm/i915/gt/intel_lrc.c:610
drivers/gpu/drm/i915/gt/intel_lrc.c:640
drivers/gpu/drm/i915/gt/intel_lrc.c:1590)
[ 2594.865510] execlists_submission_tasklet
(drivers/gpu/drm/i915/gt/intel_lrc.c:1637)
[ 2594.865514] tasklet_action_common (./arch/x86/include/asm/bitops.h:75
./include/asm-generic/bitops-instrumented.h:57 ./include/linux/interrupt.h:624
kernel/softirq.c:523)
[ 2594.865517] __do_softirq (./arch/x86/include/asm/jump_label.h:25
./include/linux/jump_label.h:200 ./include/trace/events/irq.h:142
kernel/softirq.c:293)
[ 2594.865520] irq_exit (kernel/softirq.c:373 kernel/softirq.c:413) [ 2594.865523] do_IRQ (arch/x86/kernel/irq.c:267) [ 2594.865526] common_interrupt (arch/x86/entry/entry_64.S:890)

Julian

On Tue, 2020-09-29 at 15:03 +0200, Julian Stecklina wrote:
> Hello everyone!
> 
> I'm currently trying to understand the GVT scheduler (gvt/scheduler.c) better.
> I'm specifically trying to understand how the 
> shadow_context_status_change() callback is synchronized with other 
> code that modifies the current_workload array. I would be very 
> grateful, if someone has a couple of minutes to shed some light here. 
> :)
> 
> Can shadow_context_status_change[1] run concurrently with other code 
> that modifies scheduler->current_workload[ring_id]? I see other 
> functions holding
> gvt->sched_lock, but the callback does not.
> 
> If sched_lock is not required in the callback, what currently prevents 
> concurrent exection, e.g. with workload_thread()?
> 
> Thanks!
> Julian
> 
> [1]
> https://elixir.bootlin.com/linux/v5.9-rc7/source/drivers/gpu/drm/i915/
> gvt/scheduler.c#L268
> 
> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
