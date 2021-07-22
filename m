Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044823D1D06
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jul 2021 06:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8216EE68;
	Thu, 22 Jul 2021 04:25:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA40C6EE68;
 Thu, 22 Jul 2021 04:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=C/r3ANcXDC518ennIM924RjQ9wh6F1NRXXFY5ujMDOo=; b=XfwP0MDQxF6m2CshJtU6sFGa6D
 JdN45ZAR6MSG1L5ti6CtXn0ZLByoMTRI+//Z8lGMl6PQF7aOaiAchbLyfbuEhRk0gTOSS4MJ7cF6U
 xmhcLiJKPxPcSWNiEVY5T75F9ROmQj93oM+DQreup0IIeP/Nv75GuIat/h+z+SrcEKGZ+R4QSLzBl
 +SrFPdJRr1BUYYf2fbp/nMcar6jGh0dKsdXJpG3bBfCVHeuOOs6gHJv1iipjKAYVTXw8mhian8BIx
 noD0KhQN9OWFA7btuTVx9dEM2DOjdszXd6PLwvWmCr5/8KiAuRUburY97yP8jrrpyaTsd/o/8R5ri
 uzQbUGow==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6QG6-009sjB-Fm; Thu, 22 Jul 2021 04:24:34 +0000
Date: Thu, 22 Jul 2021 05:24:30 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
Message-ID: <YPjy/sYgy1SvZBD+@infradead.org>
References: <YPgAuSt6Ps7w4/AI@infradead.org> <YPgD/8Y3/te/Hsu3@intel.com>
 <YPhApJo1o6yBYUh2@infradead.org> <YPiGI9tzLzGZg47j@infradead.org>
 <YPiPGv/wtnjsxSZy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPiPGv/wtnjsxSZy@intel.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 05:18:18PM -0400, Rodrigo Vivi wrote:
> could you please try this small patch?

I had to hand apply it as it wa corruped to due to cut off context.

It fixes one of the warnings, new output below:

[    4.182820] i915 0000:00:04.0: [drm] Virtual GPU for Intel GVT-g detected.
[    4.184076] i915 0000:00:04.0: [drm] VT-d active for gfx access
[    4.185199] i915 0000:00:04.0: [drm] iGVT-g active, disabling use of stolen memory
[    4.207889] i915 0000:00:04.0: BAR 6: can't assign [??? 0x00000000 flags 0x20000000] (bogus a)
[    4.210062] i915 0000:00:04.0: [drm] Failed to find VBIOS tables (VBT)
[    4.212256] i915 0000:00:04.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owm
[    4.214447] i915 0000:00:04.0: Direct firmware load for i915/kbl_dmc_ver1_04.bin failed with 2
[    4.215447] i915 0000:00:04.0: [drm] Failed to load DMC firmware i915/kbl_dmc_ver1_04.bin. Di.
[    4.216643] i915 0000:00:04.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/li5
[    4.227760] i915 0000:00:04.0: [drm] failed to retrieve link info, disabling eDP
[    4.229706] ------------[ cut here ]------------
[    4.230204] Missing case (port == 5)
[    4.230652] WARNING: CPU: 3 PID: 1 at drivers/gpu/drm/i915/display/intel_hdmi.c:2740 intel_hd0
[    4.231815] Modules linked in:
[    4.232146] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc2+ #40
[    4.232826] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
[    4.233706] RIP: 0010:intel_hdmi_init_connector+0x7cf/0x880
[    4.234330] Code: b6 fb 45 89 fb e9 bd fb ff ff 49 63 d7 48 c7 c6 da 67 18 83 44 89 44 24 10 4
[    4.236289] RSP: 0000:ffffc90000013be8 EFLAGS: 00010282
[    4.236949] RAX: 0000000000000000 RBX: ffff888104cda000 RCX: 0000000000000000
[    4.237703] RDX: 0000000000000001 RSI: ffffffff831a7617 RDI: 00000000ffffffff
[    4.238499] RBP: ffff888104c01000 R08: 0000000000000001 R09: 0000000000000001
[    4.239240] R10: 00000000ffff0000 R11: 3fffffffffffffff R12: ffff8881054c0000
[    4.240112] R13: 0000000000000005 R14: ffff8881054c0000 R15: 0000000000000005
[    4.240963] FS:  0000000000000000(0000) GS:ffff88813bd80000(0000) knlGS:0000000000000000
[    4.241856] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.242533] CR2: 0000000000000000 CR3: 0000000003462000 CR4: 00000000000006e0
[    4.243437] Call Trace:
[    4.243754]  intel_ddi_init+0x88d/0xc30
[    4.244216]  intel_modeset_init_nogem+0xdab/0x1310
[    4.244792]  ? intel_irq_postinstall+0x1aa/0x520
[    4.245372]  i915_driver_probe+0x695/0xd30
[    4.245908]  ? _raw_spin_unlock_irqrestore+0x33/0x50
[    4.246507]  pci_device_probe+0xcd/0x140
[    4.246933]  really_probe.part.0+0x99/0x270
[    4.247421]  __driver_probe_device+0x8b/0x120
[    4.247887]  driver_probe_device+0x19/0x90
[    4.248328]  __driver_attach+0x79/0x120
[    4.248740]  ? __device_attach_driver+0x90/0x90
[    4.249225]  bus_for_each_dev+0x78/0xc0
[    4.249637]  bus_add_driver+0x109/0x1b0
[    4.250051]  driver_register+0x86/0xd0
[    4.250512]  ? ttm_init+0x18/0x18
[    4.250884]  i915_init+0x58/0x72
[    4.251234]  do_one_initcall+0x56/0x2e0
[    4.251644]  ? rcu_read_lock_sched_held+0x3a/0x70
[    4.252150]  kernel_init_freeable+0x186/0x1ce
[    4.252625]  ? rest_init+0x250/0x250
[    4.253032]  kernel_init+0x11/0x110
[    4.253464]  ret_from_fork+0x22/0x30
[    4.253864] irq event stamp: 8201065
[    4.254308] hardirqs last  enabled at (8201075): [<ffffffff811acba3>] console_unlock+0x323/0x0
[    4.255377] hardirqs last disabled at (8201082): [<ffffffff811acc50>] console_unlock+0x3d0/0x0
[    4.256325] softirqs last  enabled at (8200736): [<ffffffff8113f3c8>] irq_exit_rcu+0x108/0x140
[    4.257234] softirqs last disabled at (8200695): [<ffffffff8113f3c8>] irq_exit_rcu+0x108/0x140
[    4.258142] ---[ end trace 2e5275f4e68f236b ]---
[    4.259727] i915 0000:00:04.0: [drm] [ENCODER:94:DDI B/PHY B] is disabled/in DSI mode with ant
[    4.260917] i915 0000:00:04.0: [drm] [ENCODER:110:DDI C/PHY C] is disabled/in DSI mode with at
[    4.262086] i915 0000:00:04.0: [drm] [ENCODER:130:DDI F/PHY F] is disabled/in DSI mode with at
[    4.263764] i915 0000:00:04.0: [drm] VGT ballooning configuration:
[    4.264418] i915 0000:00:04.0: [drm] Mappable graphic memory: base 0x2180000 size 65536KiB
[    4.265284] i915 0000:00:04.0: [drm] Unmappable graphic memory: base 0x10000000 size 393216KiB
[    4.266188] i915 0000:00:04.0: [drm] balloon space: range [ 0x28000000 - 0x100000000 ] 353894.
[    4.267159] i915 0000:00:04.0: [drm] balloon space: range [ 0x0 - 0x2180000
] 34304 KiB.
[    4.268025] i915 0000:00:04.0: [drm] balloon space: range [ 0x6180000 - 0x10000000 ] 162304 K.
[    4.268968] i915 0000:00:04.0: [drm] VGT balloon successfully
[    4.888116] i915 0000:00:04.0: [drm] *ERROR* Failed to disable SAGV (-110)
[    4.908031] [drm] Initialized i915 1.6.0 20201103 for 0000:00:04.0 on minor
0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
