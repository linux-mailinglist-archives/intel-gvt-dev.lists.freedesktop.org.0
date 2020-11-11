Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D792AF3D4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Nov 2020 15:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5A26E056;
	Wed, 11 Nov 2020 14:40:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443456E056
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 11 Nov 2020 14:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=9BC4mcyZprdl/h0tMcX9LjxJx1iOardvBYHCErImstE=; b=S0P2aOOlW3nkOIt/JOT1s4w6gA
 dMR6waNzkc0iKyWV7dVbBofikJofivRAgS/g7La59Eja35r3jFI4fm/WSY9mBJ8iRx5ke4s/KdDGl
 7X11PxGVFyGuCqVV8YFyEbI0OODXDbMJtmjO2gPNqjf+PLGpkt8QTGtW/3UoTzn+g/Rnkzn4XEFlk
 7AkSC5zAkfzyGibIdTFQb4Hf+C6/j8nuEgMOMXVCQwvknHBpSMNhsC53UdeDbKGPdf3e3RXkWAT9E
 qqMxqiWHkn9qJy3wHHuH9wS/TwlpLTkn2LZR5k2CD7vZsTZ+45OAV+OJh0vBtuF7eoFoc2wE0+1e7
 o76Pbx6w==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kcrID-0006bn-9G; Wed, 11 Nov 2020 15:40:13 +0100
Received: from [2001:16b8:508b:7300:db84:91f:33f9:5d39] (helo=linux.fritz.box)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kcrIC-000TPf-W5; Wed, 11 Nov 2020 15:40:13 +0100
Message-ID: <1139c2e657c26b1664baffad619ba4d004e670ce.camel@cyberus-technology.de>
Subject: Re: GVT Scheduler
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Wed, 11 Nov 2020 15:40:11 +0100
In-Reply-To: <06ccf18ee1ea548a0d8fbe33d3f2890c885a8ea7.camel@cyberus-technology.de>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
 <e2d543701d3442f78aae7bc10b54487d@intel.com>
 <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
 <5a74d2abdd034a61a336944148b9d40c@intel.com>
 <9286d367b5f95b4b819f5f41b7654e5a79e40328.camel@cyberus-technology.de>
 <1de9f44bf6c7766a2afc089395984192995be2ec.camel@cyberus-technology.de>
 <20201103033336.GA27141@zhen-hp.sh.intel.com>
 <06ccf18ee1ea548a0d8fbe33d3f2890c885a8ea7.camel@cyberus-technology.de>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25984/Tue Nov 10 14:18:29 2020)
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Stefan Hertrampf <stefan.hertrampf@cyberus-technology.de>,
 Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 2020-11-09 at 15:47 +0100, Julian Stecklina wrote:
> On Tue, 2020-11-03 at 11:33 +0800, Zhenyu Wang wrote:
> > Hmm, looks one i915 change removed check of actual request preempted for
> > status...
> > I'm not sure if that's relevant, but maybe you could try like:
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > index d0be98b67138..f1a16d4b6e6a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > @@ -1439,7 +1439,9 @@ __execlists_schedule_out(struct i915_request *rq,
> >  
> >         intel_context_update_runtime(ce);
> >         intel_engine_context_out(engine);
> > -       execlists_context_status_change(rq, INTEL_CONTEXT_SCHEDULE_OUT);
> > +       execlists_context_status_change(rq, i915_request_completed(rq) ?
> > +                                       INTEL_CONTEXT_SCHEDULE_OUT:
> > +                                       INTEL_CONTEXT_SCHEDULE_PREEMPTED);
> >         if (engine->fw_domain && !atomic_dec_return(&engine->fw_active))
> >                 intel_uncore_forcewake_put(engine->uncore, engine-
> > >fw_domain);
> >         intel_gt_pm_put_async(engine->gt);

I've tried this change without our workarounds and this resulted in a crash
running Unigine Heaven in Windows after ~2.5h. So I guess there is something
else going on.

<4>[ 8074.678118] CPU: 3 PID: 0 Comm: swapper/3 Tainted:
P           O      5.4.68+ #1
<4>[ 8074.678120] Hardware name: LENOVO 20N2S00600/20N2S00600, BIOS N2IET83W
(1.61 ) 01/19/2020
<4>[ 8074.678124] RIP: 0010:[<ffffffff814b3fcb>]
queued_spin_lock_slowpath+0x17b/0x1c0
<4>[ 8074.678126] Code: f3 90 48 8b 32 48 85 f6 74 f6 eb a0 c1 ee 12 83 e0 03 83
ee 01 48 c1 e0 04 48 63 f6 48 05 c0 63 02 00 48 03 04 f5 c0 7f 23 82 <48> 89 10
8b 42 08 85 c0 75 09 f3 90 8b 42 08 85 c0 74 f7 48 8b 32
<4>[ 8074.678128] RSP: 0000:ffffc900001a0db8 EFLAGS: 00010002
<4>[ 8074.678131] RAX: 00000000000263e0 RBX: ffff888572753e50 RCX:
0000000000100000
<4>[ 8074.678137] RDX: ffff8886828e63c0 RSI: 0000000000003fbe RDI:
ffff888572753e50
<4>[ 8074.678139] RBP: 0000000000000296 R08: 0000000000000000 R09:
0000000000000001
<4>[ 8074.678141] R10: ffff888631f19400 R11: 0000000000000000 R12:
ffff888673888000
<4>[ 8074.678143] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000003
<4>[ 8074.678146] FS:  0000000000000000(0000) GS:ffff8886828c0000(0000)
knlGS:0000000000000000
<4>[ 8074.678148] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[ 8074.678150] CR2: 00000000000263e0 CR3: 000000002c204004 CR4:
00000000003606f0 shadow CR4: 00000000003606f0
<4>[ 8074.678152] Call Trace:
<4>[ 8074.678155]  <IRQ>
<4>[ 8074.678160]  [<ffffffff8208f547>] _raw_spin_lock_irqsave+0x37/0x40
<4>[ 8074.678165]  [<ffffffff814ad151>] __wake_up_common_lock+0x51/0xa0
<4>[ 8074.678170]  [<ffffffff81a51cc3>] shadow_context_status_change+0x143/0x1b0
<4>[ 8074.678173]  [<ffffffff8148e1a6>] notifier_call_chain+0x56/0x90
<4>[ 8074.678176]  [<ffffffff8148e216>] atomic_notifier_call_chain+0x16/0x20
<4>[ 8074.678193]  [<ffffffff81967f93>] process_csb+0x463/0x6d0
<4>[ 8074.678197]  [<ffffffff81968213>] execlists_submission_tasklet+0x13/0x70
<4>[ 8074.678202]  [<ffffffff814720d7>] tasklet_action_common+0x77/0x130
<4>[ 8074.678206]  [<ffffffff81400116>] __do_softirq+0x116/0x326
<4>[ 8074.678210]  [<ffffffff81472637>] irq_exit+0x97/0xb0
<4>[ 8074.678213]  [<ffffffff812019b6>] do_IRQ+0x56/0x100
<4>[ 8074.678217]  [<ffffffff81200a8f>] common_interrupt+0xf/0xf
<4>[ 8074.678219]  </IRQ>

Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
