Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107451EF0C5
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Jun 2020 07:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0036E836;
	Fri,  5 Jun 2020 05:00:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069666E836
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Jun 2020 05:00:05 +0000 (UTC)
IronPort-SDR: 9/XoAWBFokg9tFXs0YL5kac8Gk1TB7m7NoYcfyPGz7G2s0vGBjZ0MEPb1JZ53Jy7UMC7N3I5u6
 3x49P1R0Zz9A==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 22:00:04 -0700
IronPort-SDR: fphpE2332sxa1HCSCZWkNZN9IqN915G+zWUmbKWbVlT4ed1vJI1vddT1hDgJ2NgaCxtOpkhgjm
 5D6wPfG1JAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; 
 d="asc'?scan'208";a="259086799"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2020 22:00:03 -0700
Date: Fri, 5 Jun 2020 12:44:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH V2] drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in
 atomic context
Message-ID: <20200605044426.GR5687@zhen-hp.sh.intel.com>
References: <20200601035556.19999-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200601035556.19999-1-colin.xu@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0710679019=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0710679019==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sk71+Upln2BLuDmg"
Content-Disposition: inline


--Sk71+Upln2BLuDmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.06.01 11:55:56 +0800, Colin Xu wrote:
> GFP_KERNEL flag specifies a normal kernel allocation in which executing
> in process context without any locks and can sleep.
> mmio_diff takes sometime to finish all the diff compare and it has
> locks, continue using GFP_KERNEL will output below trace if LOCKDEP
> enabled.
>=20
> Use GFP_ATOMIC instead.
>=20
> V2: Rebase.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
> 5.7.0-rc2 #400 Not tainted
> -----------------------------------------------------
> is trying to acquire:
> ffffffffb47bea20 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.0+=
0x0/0x30
>=20
>                and this task is already holding:
> ffff88845b85cc90 (&gvt->scheduler.mmio_context_lock){+.-.}-{2:2}, at: vgp=
u_mmio_diff_show+0xcf/0x2e0
> which would create a new lock dependency:
>  (&gvt->scheduler.mmio_context_lock){+.-.}-{2:2} -> (fs_reclaim){+.+.}-{0=
:0}
>=20
>                but this new dependency connects a SOFTIRQ-irq-safe lock:
>  (&gvt->scheduler.mmio_context_lock){+.-.}-{2:2}
>=20
>                ... which became SOFTIRQ-irq-safe at:
>   lock_acquire+0x175/0x4e0
>   _raw_spin_lock_irqsave+0x2b/0x40
>   shadow_context_status_change+0xfe/0x2f0
>   notifier_call_chain+0x6a/0xa0
>   __atomic_notifier_call_chain+0x5f/0xf0
>   execlists_schedule_out+0x42a/0x820
>   process_csb+0xe7/0x3e0
>   execlists_submission_tasklet+0x5c/0x1d0
>   tasklet_action_common.isra.0+0xeb/0x260
>   __do_softirq+0x11d/0x56f
>   irq_exit+0xf6/0x100
>   do_IRQ+0x7f/0x160
>   ret_from_intr+0x0/0x2a
>   cpuidle_enter_state+0xcd/0x5b0
>   cpuidle_enter+0x37/0x60
>   do_idle+0x337/0x3f0
>   cpu_startup_entry+0x14/0x20
>   start_kernel+0x58b/0x5c5
>   secondary_startup_64+0xa4/0xb0
>=20
>                to a SOFTIRQ-irq-unsafe lock:
>  (fs_reclaim){+.+.}-{0:0}
>=20
>                ... which became SOFTIRQ-irq-unsafe at:
> ...
>   lock_acquire+0x175/0x4e0
>   fs_reclaim_acquire.part.0+0x20/0x30
>   kmem_cache_alloc_node_trace+0x2e/0x290
>   alloc_worker+0x2b/0xb0
>   init_rescuer.part.0+0x17/0xe0
>   workqueue_init+0x293/0x3bb
>   kernel_init_freeable+0x149/0x325
>   kernel_init+0x8/0x116
>   ret_from_fork+0x3a/0x50
>=20
>                other info that might help us debug this:
>=20
>  Possible interrupt unsafe locking scenario:
>=20
>        CPU0                    CPU1
>        ----                    ----
>   lock(fs_reclaim);
>                                local_irq_disable();
>                                lock(&gvt->scheduler.mmio_context_lock);
>                                lock(fs_reclaim);
>   <Interrupt>
>     lock(&gvt->scheduler.mmio_context_lock);
>=20
>                 *** DEADLOCK ***
>=20
> 3 locks held by cat/1439:
>  #0: ffff888444a23698 (&p->lock){+.+.}-{3:3}, at: seq_read+0x49/0x680
>  #1: ffff88845b858068 (&gvt->lock){+.+.}-{3:3}, at: vgpu_mmio_diff_show+0=
xc7/0x2e0
>  #2: ffff88845b85cc90 (&gvt->scheduler.mmio_context_lock){+.-.}-{2:2}, at=
: vgpu_mmio_diff_show+0xcf/0x2e0
>=20
>                the dependencies between SOFTIRQ-irq-safe lock and the hol=
ding lock:
> -> (&gvt->scheduler.mmio_context_lock){+.-.}-{2:2} ops: 31 {
>    HARDIRQ-ON-W at:
>                     lock_acquire+0x175/0x4e0
>                     _raw_spin_lock_bh+0x2f/0x40
>                     vgpu_mmio_diff_show+0xcf/0x2e0
>                     seq_read+0x242/0x680
>                     full_proxy_read+0x95/0xc0
>                     vfs_read+0xc2/0x1b0
>                     ksys_read+0xc4/0x160
>                     do_syscall_64+0x63/0x290
>                     entry_SYSCALL_64_after_hwframe+0x49/0xb3
>    IN-SOFTIRQ-W at:
>                     lock_acquire+0x175/0x4e0
>                     _raw_spin_lock_irqsave+0x2b/0x40
>                     shadow_context_status_change+0xfe/0x2f0
>                     notifier_call_chain+0x6a/0xa0
>                     __atomic_notifier_call_chain+0x5f/0xf0
>                     execlists_schedule_out+0x42a/0x820
>                     process_csb+0xe7/0x3e0
>                     execlists_submission_tasklet+0x5c/0x1d0
>                     tasklet_action_common.isra.0+0xeb/0x260
>                     __do_softirq+0x11d/0x56f
>                     irq_exit+0xf6/0x100
>                     do_IRQ+0x7f/0x160
>                     ret_from_intr+0x0/0x2a
>                     cpuidle_enter_state+0xcd/0x5b0
>                     cpuidle_enter+0x37/0x60
>                     do_idle+0x337/0x3f0
>                     cpu_startup_entry+0x14/0x20
>                     start_kernel+0x58b/0x5c5
>                     secondary_startup_64+0xa4/0xb0
>    INITIAL USE at:
>                    lock_acquire+0x175/0x4e0
>                    _raw_spin_lock_irqsave+0x2b/0x40
>                    shadow_context_status_change+0xfe/0x2f0
>                    notifier_call_chain+0x6a/0xa0
>                    __atomic_notifier_call_chain+0x5f/0xf0
>                    execlists_schedule_in+0x2c8/0x690
>                    __execlists_submission_tasklet+0x1303/0x1930
>                    execlists_submit_request+0x1e7/0x230
>                    submit_notify+0x105/0x2a4
>                    __i915_sw_fence_complete+0xaa/0x380
>                    __engine_park+0x313/0x5a0
>                    ____intel_wakeref_put_last+0x3e/0x90
>                    intel_gt_resume+0x41e/0x440
>                    intel_gt_init+0x283/0xbc0
>                    i915_gem_init+0x197/0x240
>                    i915_driver_probe+0xc2d/0x12e0
>                    i915_pci_probe+0xa2/0x1e0
>                    local_pci_probe+0x6f/0xb0
>                    pci_device_probe+0x171/0x230
>                    really_probe+0x17a/0x380
>                    driver_probe_device+0x70/0xf0
>                    device_driver_attach+0x82/0x90
>                    __driver_attach+0x60/0x100
>                    bus_for_each_dev+0xe4/0x140
>                    bus_add_driver+0x257/0x2a0
>                    driver_register+0xd3/0x150
>                    i915_init+0x6d/0x80
>                    do_one_initcall+0xb8/0x3a0
>                    kernel_init_freeable+0x2b4/0x325
>                    kernel_init+0x8/0x116
>                    ret_from_fork+0x3a/0x50
>  }
> __key.77812+0x0/0x40
>  ... acquired at:
>    lock_acquire+0x175/0x4e0
>    fs_reclaim_acquire.part.0+0x20/0x30
>    kmem_cache_alloc_trace+0x2e/0x260
>    mmio_diff_handler+0xc0/0x150
>    intel_gvt_for_each_tracked_mmio+0x7b/0x140
>    vgpu_mmio_diff_show+0x111/0x2e0
>    seq_read+0x242/0x680
>    full_proxy_read+0x95/0xc0
>    vfs_read+0xc2/0x1b0
>    ksys_read+0xc4/0x160
>    do_syscall_64+0x63/0x290
>    entry_SYSCALL_64_after_hwframe+0x49/0xb3
>=20
>                the dependencies between the lock to be acquired
>  and SOFTIRQ-irq-unsafe lock:
> -> (fs_reclaim){+.+.}-{0:0} ops: 1999031 {
>    HARDIRQ-ON-W at:
>                     lock_acquire+0x175/0x4e0
>                     fs_reclaim_acquire.part.0+0x20/0x30
>                     kmem_cache_alloc_node_trace+0x2e/0x290
>                     alloc_worker+0x2b/0xb0
>                     init_rescuer.part.0+0x17/0xe0
>                     workqueue_init+0x293/0x3bb
>                     kernel_init_freeable+0x149/0x325
>                     kernel_init+0x8/0x116
>                     ret_from_fork+0x3a/0x50
>    SOFTIRQ-ON-W at:
>                     lock_acquire+0x175/0x4e0
>                     fs_reclaim_acquire.part.0+0x20/0x30
>                     kmem_cache_alloc_node_trace+0x2e/0x290
>                     alloc_worker+0x2b/0xb0
>                     init_rescuer.part.0+0x17/0xe0
>                     workqueue_init+0x293/0x3bb
>                     kernel_init_freeable+0x149/0x325
>                     kernel_init+0x8/0x116
>                     ret_from_fork+0x3a/0x50
>    INITIAL USE at:
>                    lock_acquire+0x175/0x4e0
>                    fs_reclaim_acquire.part.0+0x20/0x30
>                    kmem_cache_alloc_node_trace+0x2e/0x290
>                    alloc_worker+0x2b/0xb0
>                    init_rescuer.part.0+0x17/0xe0
>                    workqueue_init+0x293/0x3bb
>                    kernel_init_freeable+0x149/0x325
>                    kernel_init+0x8/0x116
>                    ret_from_fork+0x3a/0x50
>  }
> __fs_reclaim_map+0x0/0x60
>  ... acquired at:
>    lock_acquire+0x175/0x4e0
>    fs_reclaim_acquire.part.0+0x20/0x30
>    kmem_cache_alloc_trace+0x2e/0x260
>    mmio_diff_handler+0xc0/0x150
>    intel_gvt_for_each_tracked_mmio+0x7b/0x140
>    vgpu_mmio_diff_show+0x111/0x2e0
>    seq_read+0x242/0x680
>    full_proxy_read+0x95/0xc0
>    vfs_read+0xc2/0x1b0
>    ksys_read+0xc4/0x160
>    do_syscall_64+0x63/0x290
>    entry_SYSCALL_64_after_hwframe+0x49/0xb3
>=20
>                stack backtrace:
> CPU: 5 PID: 1439 Comm: cat Not tainted 5.7.0-rc2 #400
> Hardware name: Intel(R) Client Systems NUC8i7BEH/NUC8BEB, BIOS BECFL357.8=
6A.0056.2018.1128.1717 11/28/2018
> Call Trace:
>  dump_stack+0x97/0xe0
>  check_irq_usage.cold+0x428/0x434
>  ? check_usage_forwards+0x2c0/0x2c0
>  ? class_equal+0x11/0x20
>  ? __bfs+0xd2/0x2d0
>  ? in_any_class_list+0xa0/0xa0
>  ? check_path+0x22/0x40
>  ? check_noncircular+0x150/0x2b0
>  ? print_circular_bug.isra.0+0x1b0/0x1b0
>  ? mark_lock+0x13d/0xc50
>  ? __lock_acquire+0x1e32/0x39b0
>  __lock_acquire+0x1e32/0x39b0
>  ? timerqueue_add+0xc1/0x130
>  ? register_lock_class+0xa60/0xa60
>  ? mark_lock+0x13d/0xc50
>  lock_acquire+0x175/0x4e0
>  ? __zone_pcp_update+0x80/0x80
>  ? check_flags.part.0+0x210/0x210
>  ? mark_held_locks+0x65/0x90
>  ? _raw_spin_unlock_irqrestore+0x32/0x40
>  ? lockdep_hardirqs_on+0x190/0x290
>  ? fwtable_read32+0x163/0x480
>  ? mmio_diff_handler+0xc0/0x150
>  fs_reclaim_acquire.part.0+0x20/0x30
>  ? __zone_pcp_update+0x80/0x80
>  kmem_cache_alloc_trace+0x2e/0x260
>  mmio_diff_handler+0xc0/0x150
>  ? vgpu_mmio_diff_open+0x30/0x30
>  intel_gvt_for_each_tracked_mmio+0x7b/0x140
>  vgpu_mmio_diff_show+0x111/0x2e0
>  ? mmio_diff_handler+0x150/0x150
>  ? rcu_read_lock_sched_held+0xa0/0xb0
>  ? rcu_read_lock_bh_held+0xc0/0xc0
>  ? kasan_unpoison_shadow+0x33/0x40
>  ? __kasan_kmalloc.constprop.0+0xc2/0xd0
>  seq_read+0x242/0x680
>  ? debugfs_locked_down.isra.0+0x70/0x70
>  full_proxy_read+0x95/0xc0
>  vfs_read+0xc2/0x1b0
>  ksys_read+0xc4/0x160
>  ? kernel_write+0xb0/0xb0
>  ? mark_held_locks+0x24/0x90
>  do_syscall_64+0x63/0x290
>  entry_SYSCALL_64_after_hwframe+0x49/0xb3
> RIP: 0033:0x7ffbe3e6efb2
> Code: c0 e9 c2 fe ff ff 50 48 8d 3d ca cb 0a 00 e8 f5 19 02 00 0f 1f 44 0=
0 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 0f 05 <48> 3d 00 f0 ff=
 ff 77 56 c3 0f 1f 44 00 00 48 83 ec 28 48 89 54 24
> RSP: 002b:00007ffd021c08a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007ffbe3e6efb2
> RDX: 0000000000020000 RSI: 00007ffbe34cd000 RDI: 0000000000000003
> RBP: 00007ffbe34cd000 R08: 00007ffbe34cc010 R09: 0000000000000000
> R10: 0000000000000022 R11: 0000000000000246 R12: 0000562b6f0a11f0
> R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
> ------------[ cut here ]------------
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gv=
t/debugfs.c
> index ec47d4114554..62e6a14ad58e 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -66,7 +66,7 @@ static inline int mmio_diff_handler(struct intel_gvt *g=
vt,
>  	vreg =3D vgpu_vreg(param->vgpu, offset);
> =20
>  	if (preg !=3D vreg) {
> -		node =3D kmalloc(sizeof(*node), GFP_KERNEL);
> +		node =3D kmalloc(sizeof(*node), GFP_ATOMIC);
>  		if (!node)
>  			return -ENOMEM;
> =20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Sk71+Upln2BLuDmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXtnNqgAKCRCxBBozTXgY
J+g9AJ9h5P3d29qidgx+CUBKyZ8jlEE0dACfXHZsBuqZfbCpz+msI13iRLlARBU=
=rACr
-----END PGP SIGNATURE-----

--Sk71+Upln2BLuDmg--

--===============0710679019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0710679019==--
