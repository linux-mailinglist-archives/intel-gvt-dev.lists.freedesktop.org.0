Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7283D0D28
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 13:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B46E858;
	Wed, 21 Jul 2021 11:11:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937686E858;
 Wed, 21 Jul 2021 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ML6cTSbG4olJqAAHFFZMODAzAYXEeVGcxB0FEXL9aVE=; b=EsEl0FJ2viZU4mAJLd+1IxeBMo
 lwyEZ7chcjCuNTVBvZF36sAoqLXCkMBcRKqQY7FrL4BQoDwczOMEsHne6P/tQIoRisAylnz15QJSk
 c8wj8PchF3LMrMsm1eXbqc8MWYCga/RjdPzspPHPih32kVD2FneAafcRAYfPw5mGhLVPRGrzmsBp5
 BTc+7YdprnN05kju5ksZo7nWCHtHBb1DJd+Txf3QGnuO/aj/4ryGJslxKxfjqXyRZm+bC5UO1jB5k
 CMmaELoPVhQqJd0yTqgWHpYiiHC2ruHLMHBht+Tgy5X7Yz+1TtisBDtiEZ+hFE13BWI44+YmiWV4h
 bInhRJsw==;
Received: from [2001:4bb8:193:7660:a581:7bc3:cf86:643e] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6A7m-0097E2-Pz; Wed, 21 Jul 2021 11:10:56 +0000
Date: Wed, 21 Jul 2021 13:10:49 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: 5.14-rc2 warnings with kvmgvt
Message-ID: <YPgAuSt6Ps7w4/AI@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi all,

I'm trying to test some changes for the gvt code, but even with a baseline
5.14-rc2 host and guest the 915 driver does not seem overly happy:

[    5.693099] i915 0000:00:04.0: [drm] Virtual GPU for Intel GVT-g detected.
[    5.694841] i915 0000:00:04.0: [drm] VT-d active for gfx access
[    5.696411] i915 0000:00:04.0: [drm] iGVT-g active, disabling use of stolen memory
[    5.711317] i915 0000:00:04.0: BAR 6: can't assign [??? 0x00000000 flags 0x20000000] (bogus alignm)
[    5.712847] i915 0000:00:04.0: [drm] Failed to find VBIOS tables (VBT)
[    5.714343] i915 0000:00:04.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=iom
[    5.716466] i915 0000:00:04.0: Direct firmware load for i915/kbl_dmc_ver1_04.bin failed with error2
[    5.718021] i915 0000:00:04.0: [drm] Failed to load DMC firmware i915/kbl_dmc_ver1_04.bin. Disabli.
[    5.719914] i915 0000:00:04.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/linux/k5
[    5.733269] i915 0000:00:04.0: [drm] failed to retrieve link info, disabling eDP
[    5.735841] i915 0000:00:04.0: [drm] *ERROR* crtc 51: Can't calculate constants, dotclock = 0!
[    5.737354] ------------[ cut here ]------------
[    5.738141] i915 0000:00:04.0: drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
[    5.738165] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_vblank.c:728 drm_crtc_vblank_helper_get_0
[    5.738745] Modules linked in:
[    5.738745] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc2+ #22
[    5.738745] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
[    5.738745] RIP: 0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x335/0x350
[    5.738745] Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 34 10 26 00 48 c7 c1 20 54 0d 83 4c 89 ea0
[    5.738745] RSP: 0000:ffffc90000013a90 EFLAGS: 00010086
[    5.738745] RAX: 0000000000000000 RBX: ffffffff81c3c5b0 RCX: 0000000000000000
[    5.738745] RDX: 0000000000000003 RSI: 00000000fffeffff RDI: 00000000ffffffff
[    5.738745] RBP: ffffc90000013b00 R08: ffffffff83bb3e28 R09: 0000000000000003
[    5.738745] R10: ffffffff834b3e40 R11: 3fffffffffffffff R12: 0000000000000000
[    5.738745] R13: ffff888100e982f0 R14: ffff8881053f0340 R15: ffff888105592178
[    5.738745] FS:  0000000000000000(0000) GS:ffff88813bc00000(0000) knlGS:0000000000000000
[    5.738745] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.738745] CR2: 0000000000000000 CR3: 0000000003462000 CR4: 00000000000006f0
[    5.738745] Call Trace:
[    5.738745]  drm_get_last_vbltimestamp+0xa5/0xb0
[    5.738745]  drm_reset_vblank_timestamp+0x56/0xc0
[    5.738745]  drm_crtc_vblank_on+0x81/0x140
[    5.738745]  intel_crtc_vblank_on+0x2b/0xe0
[    5.738745]  intel_modeset_setup_hw_state+0xa9c/0x1ab0
[    5.738745]  ? ww_mutex_lock+0x2b/0x90
[    5.738745]  intel_modeset_init_nogem+0x3c5/0x1310
[    5.738745]  ? intel_irq_postinstall+0x1aa/0x520
[    5.738745]  i915_driver_probe+0x695/0xd30
[    5.738745]  ? _raw_spin_unlock_irqrestore+0x33/0x50
[    5.738745]  pci_device_probe+0xcd/0x140
[    5.738745]  really_probe.part.0+0x99/0x270
[    5.738745]  __driver_probe_device+0x8b/0x120
[    5.738745]  driver_probe_device+0x19/0x90
[    5.738745]  __driver_attach+0x79/0x120
[    5.738745]  ? __device_attach_driver+0x90/0x90
[    5.738745]  bus_for_each_dev+0x78/0xc0
[    5.738745]  bus_add_driver+0x109/0x1b0
[    5.738745]  driver_register+0x86/0xd0
[    5.738745]  ? ttm_init+0x18/0x18
[    5.738745]  i915_init+0x58/0x72
[    5.738745]  do_one_initcall+0x56/0x2e0
[    5.738745]  ? rcu_read_lock_sched_held+0x3a/0x70
[    5.738745]  kernel_init_freeable+0x186/0x1ce
[    5.738745]  ? rest_init+0x250/0x250
[    5.738745]  kernel_init+0x11/0x110
[    5.738745]  ret_from_fork+0x22/0x30
[    5.738745] irq event stamp: 8200428
[    5.738745] hardirqs last  enabled at (8200427): [<ffffffff825d38e8>] _raw_spin_unlock_irqrestore+0
[    5.738745] hardirqs last disabled at (8200428): [<ffffffff825d3671>] _raw_spin_lock_irq+0x41/0x50
[    5.738745] softirqs last  enabled at (8199086): [<ffffffff8113f3c8>] irq_exit_rcu+0x108/0x140
[    5.738745] softirqs last disabled at (8199079): [<ffffffff8113f3c8>] irq_exit_rcu+0x108/0x140
[    5.738745] ---[ end trace e99e0812b8ee9c5d ]---
[    5.786472] i915 0000:00:04.0: [drm] VGT ballooning configuration:
[    5.787531] i915 0000:00:04.0: [drm] Mappable graphic memory: base 0x31c7000 size 65536KiB
[    5.788865] i915 0000:00:04.0: [drm] Unmappable graphic memory: base 0xe7ef8000 size 393216KiB
[    5.790270] i915 0000:00:04.0: [drm] balloon space: range [ 0x10000000 - 0xe7ef8000 ] 3537888 KiB.
[    5.791807] i915 0000:00:04.0: [drm] balloon space: range [ 0xffef8000 - 0x100000000 ] 1056 KiB.
[    5.793241] i915 0000:00:04.0: [drm] balloon space: range [ 0x0 - 0x31c7000 ] 50972 KiB.
[    5.794565] i915 0000:00:04.0: [drm] balloon space: range [ 0x71c7000 - 0x10000000 ] 145636 KiB.
[    5.796028] i915 0000:00:04.0: [drm] VGT balloon successfully
[    6.670284] ------------[ cut here ]------------
[    6.671155] crtc active state doesn't match with hw state (expected 0, found 1)
[    6.672376] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/i915/display/intel_display.c:8964 intel_atom0
[    6.674232] Modules linked in:
[    6.674767] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.14.0-rc2+ #22
[    6.676039] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
[    6.677402] RIP: 0010:intel_atomic_commit_tail+0x13c9/0x1410
[    6.678335] Code: 0f 0b 0f b6 34 24 89 f1 e9 8d fc ff ff e8 7f 19 7f 00 0f 0b e9 30 fd ff ff e8 739
[    6.681400] RSP: 0000:ffffc90000013b20 EFLAGS: 00010282
[    6.682264] RAX: 0000000000000000 RBX: ffff888105593800 RCX: 0000000000000000
[    6.683453] RDX: 0000000000000001 RSI: ffffffff831a6e3f RDI: 00000000ffffffff
[    6.684623] RBP: ffff888104ab2000 R08: 0000000000000001 R09: 0000000000000001
[    6.685782] R10: 00000000ffff0000 R11: 3fffffffffffffff R12: ffff888104baa000
[    6.686972] R13: ffff888104e5a000 R14: ffff8881053f0000 R15: ffff8881053f0000
[    6.688147] FS:  0000000000000000(0000) GS:ffff88813bc00000(0000) knlGS:0000000000000000
[    6.689475] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.690421] CR2: 0000000000000000 CR3: 0000000003462000 CR4: 00000000000006f0
[    6.691611] Call Trace:
[    6.692038]  intel_atomic_commit+0x32d/0x3b0
[    6.692751]  intel_initial_commit+0x156/0x1e0
[    6.693488]  intel_modeset_init+0x19/0x80
[    6.694156]  i915_driver_probe+0x6bb/0xd30
[    6.694860]  ? _raw_spin_unlock_irqrestore+0x33/0x50
[    6.695690]  pci_device_probe+0xcd/0x140
[    6.696346]  really_probe.part.0+0x99/0x270
[    6.697041]  __driver_probe_device+0x8b/0x120
[    6.697767]  driver_probe_device+0x19/0x90
[    6.698459]  __driver_attach+0x79/0x120
[    6.699120]  ? __device_attach_driver+0x90/0x90
[    6.699878]  bus_for_each_dev+0x78/0xc0
[    6.700522]  bus_add_driver+0x109/0x1b0
[    6.701163]  driver_register+0x86/0xd0
[    6.701786]  ? ttm_init+0x18/0x18
[    6.702342]  i915_init+0x58/0x72
[    6.702906]  do_one_initcall+0x56/0x2e0
[    6.703553]  ? rcu_read_lock_sched_held+0x3a/0x70
[    6.704335]  kernel_init_freeable+0x186/0x1ce
[    6.705057]  ? rest_init+0x250/0x250
[    6.705660]  kernel_init+0x11/0x110
[    6.706250]  ret_from_fork+0x22/0x30
[    6.706893] irq event stamp: 8204007
[    6.707520] hardirqs last  enabled at (8204015): [<ffffffff811acba3>] console_unlock+0x323/0x560
[    6.708967] hardirqs last disabled at (8204022): [<ffffffff811acc50>] console_unlock+0x3d0/0x560
[    6.710409] softirqs last  enabled at (8203694): [<ffffffff8113f3c8>] irq_exit_rcu+0x108/0x140
[    6.711894] softirqs last disabled at (8203689): [<ffffffff8113f3c8>] irq_exit_rcu+0x108/0x140
[    6.713302] ---[ end trace e99e0812b8ee9c5e ]---
[    6.719970] [drm] Initialized i915 1.6.0 20201103 for 0000:00:04.0 on minor 0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
