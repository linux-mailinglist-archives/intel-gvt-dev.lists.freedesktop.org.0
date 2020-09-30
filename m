Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A927E7A4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Sep 2020 13:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D79E6E4CD;
	Wed, 30 Sep 2020 11:28:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEA56E4CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Sep 2020 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=r1yrzRIGza48+jEiTQfe+A88d/QWmqedvTZJtj7f2nM=; b=ngzS+VLGpJ4VCbUP3dBOmeEepK
 nggTT2LdT+pLNlC7z5KC1sVE0JNZcvXA9gO607ygxg7F4059Uo5DUkJ57X8ZBZfx/upHeUzyOmwA0
 YSLhI2i4/DFRNhqF3OSyZjyVRjcDyI/WpSpZ7NA1FK0f0Ng4az6dwI9B4z0i3yDInhnak6KtZhqTg
 8O37gbmo5laQ0iWAFFVaeYUoCLLehqbwgPOoqFPLrmql/jvkrJcxOB72LqgZlgLLQ/6Idq4+VULFm
 2NYd9aSYNUgc1owEvYgBdjpQgvAGTt88/dQ6O1WL/h/T+58MX1lmuvbVk0i8NMnmJ/NHgzgz8dFvm
 vBneWfKQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kNaHs-0006cX-LX; Wed, 30 Sep 2020 13:28:44 +0200
Received: from [2001:16b8:509b:f800:8af2:52b7:26d1:3793]
 (helo=linux-2.fritz.box)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kNaHs-0000df-E4; Wed, 30 Sep 2020 13:28:44 +0200
Message-ID: <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
Subject: Re: GVT Scheduler
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Date: Wed, 30 Sep 2020 13:28:43 +0200
In-Reply-To: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25942/Tue Sep 29 15:56:33 2020)
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

Hello,

we've just found this discussion from 2017 that looks directly related:
https://lists.freedesktop.org/archives/intel-gvt-dev/2017-February/000063.html

Especially, the race between complete_current_workload
and shadow_context_status_change looks problematic and reading the current code
I cannot convince myself that it's race free.

In our testing we have seen page faults in shadow_context_status_change in the
final wake_up(&workload->shadow_ctx_status_wq); call that are hard to explain
without a race like that. The backtraces always look like the one below.

We are currently testing with v5.4.68, but I don't see anything relevant being
changed in newer versions.

Any pointers are appreciated.

[ 2594.865440] BUG: unable to handle page fault for address: 00000000000263e0
[ 2594.865448] RIP: 0010:[<ffffffff814b3fcb>]
queued_spin_lock_slowpath+0x17b/0x1c0
[...]
[ 2594.865484] Call Trace:
[ 2594.865487]  <IRQ>
[ 2594.865490] _raw_spin_lock_irqsave (kernel/locking/spinlock.c:159)
[ 2594.865494] __wake_up_common_lock (kernel/sched/wait.c:123)
[ 2594.865499] shadow_context_status_change
(drivers/gpu/drm/i915/gvt/scheduler.c:286)
[ 2594.865501] notifier_call_chain (kernel/notifier.c:104)
[ 2594.865504] atomic_notifier_call_chain (kernel/notifier.c:203)
[ 2594.865507] process_csb (drivers/gpu/drm/i915/gt/intel_lrc.c:610
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
[ 2594.865520] irq_exit (kernel/softirq.c:373 kernel/softirq.c:413)
[ 2594.865523] do_IRQ (arch/x86/kernel/irq.c:267)
[ 2594.865526] common_interrupt (arch/x86/entry/entry_64.S:890)

Julian

On Tue, 2020-09-29 at 15:03 +0200, Julian Stecklina wrote:
> Hello everyone!
> 
> I'm currently trying to understand the GVT scheduler (gvt/scheduler.c) better.
> I'm specifically trying to understand how the shadow_context_status_change()
> callback is synchronized with other code that modifies the current_workload
> array. I would be very grateful, if someone has a couple of minutes to shed
> some
> light here. :)
> 
> Can shadow_context_status_change[1] run concurrently with other code that
> modifies scheduler->current_workload[ring_id]? I see other functions holding
> gvt->sched_lock, but the callback does not.
> 
> If sched_lock is not required in the callback, what currently prevents
> concurrent exection, e.g. with workload_thread()?
> 
> Thanks!
> Julian
> 
> [1] 
> https://elixir.bootlin.com/linux/v5.9-rc7/source/drivers/gpu/drm/i915/gvt/scheduler.c#L268
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
