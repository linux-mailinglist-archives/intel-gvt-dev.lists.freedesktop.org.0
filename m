Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B514929D0D0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Oct 2020 16:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777BE6E483;
	Wed, 28 Oct 2020 15:46:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938956E4A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Oct 2020 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=GvEudwaPfTvtsmVbyvDnBGdcTHzSocaYi7DR5lOvJqg=; b=apZ9e4QyW/YDzsL00NJkOd453i
 ytlGNzpMTcdjGka2oK072EoY4ylVcL+TCSJfAqFChNJ6cr9cNlxjzs+7qe8cxzQraMKKeRKiHKSQl
 Fg55zEFsg9V0mqQY8gPVO1/IXlTzivwEyIgaDYtz8rZb5v9nmfgRsMKCiIJ6OuO7NuO6USChmD3Og
 OlINdnghG1A/wexJPF35/6zCMLiz7a0j4PqB09mIrV31SR7bi3sz3tPygbqUCGOniyrrkKp9U44vY
 /JvYwfPimvK7sgSqYuxIG+5q1JpHvbr7u5LooHCG66FHbRrX2O4nZaf32JPUYlgdTJjZjZOg//6DO
 Snqt9hag==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kXneY-0000oY-Hh; Wed, 28 Oct 2020 16:46:22 +0100
Received: from [5.12.18.230] (helo=localhost.localdomain)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kXneY-000RRV-B7; Wed, 28 Oct 2020 16:46:22 +0100
Message-ID: <1de9f44bf6c7766a2afc089395984192995be2ec.camel@cyberus-technology.de>
Subject: Re: GVT Scheduler
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Intel GVT Dev
 <intel-gvt-dev@lists.freedesktop.org>, Stefan Hertrampf
 <stefan.hertrampf@cyberus-technology.de>
Date: Wed, 28 Oct 2020 17:46:21 +0200
In-Reply-To: <9286d367b5f95b4b819f5f41b7654e5a79e40328.camel@cyberus-technology.de>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
 <e2d543701d3442f78aae7bc10b54487d@intel.com>
 <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
 <5a74d2abdd034a61a336944148b9d40c@intel.com>
 <9286d367b5f95b4b819f5f41b7654e5a79e40328.camel@cyberus-technology.de>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25971/Wed Oct 28 13:23:57 2020)
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

Hi!

On Wed, 2020-10-28 at 10:40 +0200, Julian Stecklina wrote:
> >   According to our assumption, there might be extra execlist schedule-out
> > status notification. Is it possible that you can open the tracepoint in
> > execlist_context_schedule_in and execlist_context_schedule_out in
> > intel_lrc.c?
> 
> 
> We'll try turning trace_i915_request_in / trace_i915_request_out into printks
> and see whether this helps in debugging. Alternatively, is there a way to get
> trace events out of a crashed kernel?
> 
> Btw, would it make sense to count the schedule_in and schedule_out events for
> each requests and dump a stacktrace when we see an unpaired schedule_out?

So we tried this out with a tiny patch that checks for matched schedule in/out
events:

https://github.com/blitz/linux/commit/441663fab60df4a4692d5cc031dcfdeffe243008

It would be good if you can check whether this is a useful invariant to warn on.
:)

On one system, we see this triggering right after boot with no VMs running at
all (see below). I haven't seen this with our production VM workload yet, but
that usually takes hours to manifest. So we might have something there tomorrow.

[   10.370703] ------------[ cut here ]------------
[   10.370734] mismatched schedule in/out operations
[   10.370807] WARNING: CPU: 1 PID: 0 at drivers/gpu/drm/i915/gt/intel_lrc.c:612
process_csb+0x762/0x7a0 [i915]
[   10.370842]  fb_sys_fops e1000e igb i2c_i801 drm dca ahci i2c_algo_bit
libahci wmi video pinctrl_cannonlake pinctrl_intel
[   10.370849] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.61 #1
[   10.370849] Hardware name: Gigabyte Technology Co., Ltd. Q370M D3H GSM
PLUS/Q370M D3H GSM PLUS, BIOS F14 06/05/2019
[   10.370902] RIP: 0010:process_csb+0x762/0x7a0 [i915]
[   10.370904] Code: 88 aa 15 00 00 0f 85 0f fd ff ff 48 c7 c7 10 e3 70 c0 4c 89
55 b0 48 89 4d b8 48 89 55 c0 c6 05 68 aa 15 00 01 e8 99 b7 2a eb <0f> 0b 4c 8b
55 b0 48 8b 4d b8 48 8b 55 c0 e9 dd fc ff ff 4c 89 55
[   10.370905] RSP: 0018:ffffb1204014ce60 EFLAGS: 00010286
[   10.370906] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   10.370907] RDX: 0000000000000025 RSI: ffffffffad387405 RDI: 0000000000000246
[   10.370907] RBP: ffffb1204014cec0 R08: ffffffffad3873e0 R09: 0000000000000025
[   10.370907] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000006
[   10.370908] R13: ffff8ed12dcfe040 R14: 0000000000000001 R15: ffff8ed12f6fe000
[   10.370909] FS:  0000000000000000(0000) GS:ffff8ed130440000(0000)
knlGS:0000000000000000
[   10.370909] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.370910] CR2: 000055da74158008 CR3: 000000017b40a004 CR4: 00000000003606e0
[   10.370910] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   10.370910] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   10.370911] Call Trace:
[   10.370912]  <IRQ>
[   10.370928]  execlists_submission_tasklet+0x19/0x70 [i915]
[   10.370948]  tasklet_action_common.isra.0+0x60/0x110
[   10.370949]  tasklet_hi_action+0x1f/0x30
[   10.370952]  __do_softirq+0xe1/0x2d6
[   10.370955]  ? update_ts_time_stats+0x58/0x80
[   10.370956]  irq_exit+0xae/0xb0
[   10.370957]  scheduler_ipi+0xe4/0x130
[   10.370958]  smp_reschedule_interrupt+0x39/0xe0
[   10.370959]  reschedule_interrupt+0xf/0x20
[   10.370960]  </IRQ>
[   10.370964] RIP: 0010:cpuidle_enter_state+0xc5/0x450
[   10.370965] Code: ff e8 0f 78 82 ff 80 7d c7 00 74 17 9c 58 0f 1f 44 00 00 f6
c4 02 0f 85 65 03 00 00 31 ff e8 62 dc 88 ff fb 66 0f 1f 44 00 00 <45> 85 ed 0f
88 8f 02 00 00 49 63 cd 4c 8b 7d d0 4c 2b 7d c8 48 8d
[   10.370966] RSP: 0018:ffffb120400efe38 EFLAGS: 00000246 ORIG_RAX:
ffffffffffffff02
[   10.370966] RAX: ffff8ed13046a880 RBX: ffffffffacf58e80 RCX: 000000000000001f
[   10.370967] RDX: 0000000000000000 RSI: 000000002aaaab99 RDI: 0000000000000000
[   10.370967] RBP: ffffb120400efe78 R08: 000000026a23c65e R09: 000000028d99190d
[   10.370967] R10: ffff8ed130469580 R11: ffff8ed130469560 R12: ffff8ed130475928
[   10.370968] R13: 0000000000000008 R14: 0000000000000008 R15: ffff8ed130475928
[   10.370970]  ? cpuidle_enter_state+0xa1/0x450
[   10.370971]  cpuidle_enter+0x2e/0x40
[   10.370988]  call_cpuidle+0x23/0x40
[   10.370989]  do_idle+0x1dd/0x270
[   10.370990]  cpu_startup_entry+0x20/0x30
[   10.370992]  start_secondary+0x167/0x1c0
[   10.370994]  secondary_startup_64+0xa4/0xb0
[   10.370995] ---[ end trace 85cd1056f39ffa8d ]---

Julian


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
