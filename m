Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DEB16A361
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Feb 2020 11:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C766E3EB;
	Mon, 24 Feb 2020 10:00:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3410F6E3EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Feb 2020 10:00:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 02:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; 
 d="asc'?scan'208";a="231084383"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 02:00:31 -0800
Date: Mon, 24 Feb 2020 17:47:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Separate display reset from ALL_ENGINES
 reset
Message-ID: <20200224094725.GB13783@zhen-hp.sh.intel.com>
References: <20200221023234.28635-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200221023234.28635-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0943077598=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0943077598==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.02.21 10:32:34 +0800, Tina Zhang wrote:
> ALL_ENGINES reset doesn't clobber display with the current gvt-g
> supported platforms. Thus ALL_ENGINES reset shouldn't reset the
> display engine registers emulated by gvt-g.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

I applied message like below one with fixes info added.

Thanks!

=46rom 3eb55e6f753a379e293395de8d5f3be28351a7f8 Mon Sep 17 00:00:00 2001
=46rom: Tina Zhang <tina.zhang@intel.com>
Date: Fri, 21 Feb 2020 10:32:34 +0800
Subject: [PATCH] drm/i915/gvt: Separate display reset from ALL_ENGINES reset

ALL_ENGINES reset doesn't clobber display with the current gvt-g
supported platforms. Thus ALL_ENGINES reset shouldn't reset the
display engine registers emulated by gvt-g.

This fixes guest warning like

[ 14.622026] [drm] Initialized i915 1.6.0 20200114 for 0000:00:03.0 on mino=
r 0
[ 14.967917] fbcon: i915drmfb (fb0) is primary device
[ 25.100188] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]=
 E RROR [CRTC:51:pipe A] flip_done timed out
[ 25.100860] -----------[ cut here ]-----------
[ 25.100861] pll on state mismatch (expected 0, found 1)
[ 25.101024] WARNING: CPU: 1 PID: 30 at drivers/gpu/drm/i915/display/intel_=
dis play.c:14382 verify_single_dpll_state.isra.115+0x28f/0x320 [i915]
[ 25.101025] Modules linked in: intel_rapl_msr intel_rapl_common kvm_intel =
kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i915 aesni_=
intel cr ypto_simd cryptd glue_helper cec rc_core video drm_kms_helper joyd=
ev drm input_l eds i2c_algo_bit serio_raw fb_sys_fops syscopyarea sysfillre=
ct sysimgblt mac_hid qemu_fw_cfg sch_fq_codel parport_pc ppdev lp parport i=
p_tables x_tables autofs4 e1000 psmouse i2c_piix4 pata_acpi floppy
[ 25.101052] CPU: 1 PID: 30 Comm: kworker/u4:1 Not tainted 5.5.0+ #1
[ 25.101053] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS re=
l-1 .12.1-0-ga5cab58 04/01/2014
[ 25.101055] Workqueue: events_unbound async_run_entry_fn
[ 25.101092] RIP: 0010:verify_single_dpll_state.isra.115+0x28f/0x320 [i915]
[ 25.101093] Code: e0 d9 ff e9 a3 fe ff ff 80 3d e9 c2 11 00 00 44 89 f6 48=
 c7 c7 c0 9d 88 c0 75 3b e8 eb df d9 ff e9 c7 fe ff ff e8 d1 e0 ae c4 <0f> =
0b e9 7a fe ff ff 80 3d c0 c2 11 00 00 8d 71 41 89 c2 48 c7 c7
[ 25.101093] RSP: 0018:ffffb1de80107878 EFLAGS: 00010286
[ 25.101094] RAX: 0000000000000000 RBX: ffffb1de80107884 RCX: 0000000000000=
007
[ 25.101095] RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff94fdfdd19=
740
[ 25.101095] RBP: ffffb1de80107938 R08: 0000000d6bfdc7b4 R09: 0000000000000=
02b
[ 25.101096] R10: ffff94fdf82dc000 R11: 0000000000000225 R12: 0000000000000=
1f8
[ 25.101096] R13: ffff94fdb3ca6a90 R14: ffff94fdb3ca0000 R15: 0000000000000=
000
[ 25.101097] FS: 0000000000000000(0000) GS:ffff94fdfdd00000(0000) knlGS:000=
00 00000000000
[ 25.101098] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 25.101098] CR2: 00007fbc3e2be9c8 CR3: 000000003339a003 CR4: 0000000000360=
ee0
[ 25.101101] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000=
000
[ 25.101101] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000=
400
[ 25.101102] Call Trace:
[ 25.101139] intel_atomic_commit_tail+0xde4/0x1520 [i915]
[ 25.101141] ? flush_workqueue_prep_pwqs+0xfa/0x130
[ 25.101142] ? flush_workqueue+0x198/0x3c0
[ 25.101174] intel_atomic_commit+0x2ad/0x320 [i915]
[ 25.101209] drm_atomic_commit+0x4a/0x50 [drm]
[ 25.101220] drm_client_modeset_commit_atomic+0x1c4/0x200 [drm]
[ 25.101231] drm_client_modeset_commit_force+0x47/0x170 [drm]
[ 25.101250] drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_kms_h=
el per]
[ 25.101255] drm_fb_helper_set_par+0x2d/0x60 [drm_kms_helper]
[ 25.101287] intel_fbdev_set_par+0x1a/0x40 [i915]
[ 25.101289] ? con_is_visible+0x2e/0x60
[ 25.101290] fbcon_init+0x378/0x600
[ 25.101292] visual_init+0xd5/0x130
[ 25.101296] do_bind_con_driver+0x217/0x430
[ 25.101297] do_take_over_console+0x7d/0x1b0
[ 25.101298] do_fbcon_takeover+0x5c/0xb0
[ 25.101299] fbcon_fb_registered+0x199/0x1a0
[ 25.101301] register_framebuffer+0x22c/0x330
[ 25.101306] __drm_fb_helper_initial_config_and_unlock+0x31a/0x520 [drm_kms=
_h elper]
[ 25.101311] drm_fb_helper_initial_config+0x35/0x40 [drm_kms_helper]
[ 25.101341] intel_fbdev_initial_config+0x18/0x30 [i915]
[ 25.101342] async_run_entry_fn+0x3c/0x150
[ 25.101343] process_one_work+0x1fd/0x3f0
[ 25.101344] worker_thread+0x34/0x410
[ 25.101346] kthread+0x121/0x140
[ 25.101346] ? process_one_work+0x3f0/0x3f0
[ 25.101347] ? kthread_park+0x90/0x90
[ 25.101350] ret_from_fork+0x35/0x40
[ 25.101351] --[ end trace b5b47d44cd998ba1 ]--

Fixes: 6294b61ba769 ("drm/i915/gvt: add missing display part reset for vGPU=
 reset")
Signed-off-by: Tina Zhang <tina.zhang@intel.com>
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20200221023234.28635-1-t=
ina.zhang@intel.com
---

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXlObrQAKCRCxBBozTXgY
J/WEAKCKdmVorXundycknW3ZSxLvrqe7bACfQITRBqkLqQi6Eg+fRwt0T306uHo=
=NgoT
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--

--===============0943077598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0943077598==--
