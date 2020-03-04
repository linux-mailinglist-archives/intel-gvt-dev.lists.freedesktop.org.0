Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75059179125
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Mar 2020 14:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C586E169;
	Wed,  4 Mar 2020 13:17:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3D56E15F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Mar 2020 13:17:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 05:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; 
 d="asc'?scan'208";a="240456898"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga003.jf.intel.com with ESMTP; 04 Mar 2020 05:17:47 -0800
Date: Wed, 4 Mar 2020 21:05:35 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Fix display port type issue.
Message-ID: <20200304130535.GJ28483@zhen-hp.sh.intel.com>
References: <20200304095035.25319-1-tina.zhang@intel.com>
 <20200304095035.25319-2-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200304095035.25319-2-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0981524701=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0981524701==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Content-Disposition: inline


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.04 17:50:35 +0800, Tina Zhang wrote:
> According to the emulated opregion, the emulated display should support
> dp type output instead of HDMI or DVI.
>

What's the test result for this? Does guest probe DP and does it work fine?

As below error looks vblank related, not sure if caused by this and what's
the state after this change, could you elaborate?

> Otherwise, guest complains about the failures in HDMI initialization like:
>=20
> [   57.746829] WARN_ON(drm_crtc_vblank_get(crtc) =3D=3D 0)
> [   57.746944] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/i915/display/in=
tel_display.c:1322 assert_vblank_disabled+0x45/0x50 [i915]
> [   57.748593] Modules linked in: i915(E) intel_rapl_msr video drm_kms_he=
lper cec intel_rapl_common rc_core drm kvm_intel kvm i2c_algo_bit fb_sys_fo=
ps syscopyarea sysfillrect sysimgblt crct10dif_pclmul crc32_pclmul ghash_cl=
mulni_intel aesni_intel crypto_simd cryptd glue_helper joydev input_leds in=
tel_rapl_perf serio_raw mac_hid qemu_fw_cfg sch_fq_codel parport_pc ppdev l=
p parport ip_tables x_tables autofs4 psmouse floppy e1000 pata_acpi i2c_pii=
x4
> [   57.752619] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G            E  =
   5.6.0-rc3+ #13
> [   57.753445] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-linux-1 04/01/2014
> [   57.754746] Workqueue: events output_poll_execute [drm_kms_helper]
> [   57.755394] RIP: 0010:assert_vblank_disabled+0x45/0x50 [i915]
> [   57.755973] Code: bd 67 12 00 00 48 c7 c6 b0 a9 51 c0 48 c7 c7 1b e7 5=
3 c0 75 10 e8 3b 87 e9 ff 48 89 df e8 53 ae e9 ff 5b 5d c3 e8 4b c1 c6 c0 <=
0f> 0b eb ec 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 48 89 e5 41 56
> [   57.757904] RSP: 0018:ffffc9000010f928 EFLAGS: 00010286
> [   57.758434] RAX: 0000000000000000 RBX: ffff88812129b000 RCX: 000000000=
0000000
> [   57.759203] RDX: 0000000000000027 RSI: ffffffff82b83c07 RDI: 000000000=
0000246
> [   57.759919] RBP: ffffc9000010f930 R08: ffffffff82b83be0 R09: 000000000=
0000027
> [   57.760631] R10: ffff88811f9ca800 R11: 0000000000000024 R12: ffff88812=
8e25000
> [   57.761354] R13: ffff888100f06300 R14: ffff888128e25000 R15: ffff88812=
8e27000
> [   57.762128] FS:  0000000000000000(0000) GS:ffff888133d00000(0000) knlG=
S:0000000000000000
> [   57.763095] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   57.763675] CR2: 0000555c6091f628 CR3: 000000011f80a004 CR4: 000000000=
0360ee0
> [   57.764391] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   57.765108] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   57.765836] Call Trace:
> [   57.766122]  intel_crtc_vblank_on+0x1a/0x50 [i915]
> [   57.766631]  intel_enable_ddi+0x4b/0x3f0 [i915]
> [   57.767110]  intel_encoders_enable+0x85/0xb0 [i915]
> [   57.767624]  hsw_crtc_enable+0x420/0x6b0 [i915]
> [   57.768104]  intel_update_crtc+0x1b8/0x1e0 [i915]
> [   57.768601]  skl_commit_modeset_enables+0x61b/0x6d0 [i915]
> [   57.769175]  intel_atomic_commit_tail+0x328/0x1530 [i915]
> [   57.769729]  ? flush_workqueue_prep_pwqs+0xfa/0x130
> [   57.770225]  ? flush_workqueue+0x198/0x3c0
> [   57.770662]  intel_atomic_commit+0x2ad/0x320 [i915]
> [   57.771173]  drm_atomic_commit+0x4a/0x50 [drm]
> [   57.771636]  drm_client_modeset_commit_atomic+0x1c4/0x200 [drm]
> [   57.772244]  drm_client_modeset_commit_locked+0x47/0x170 [drm]
> [   57.772838]  ? mutex_lock+0x12/0x40
> [   57.773202]  drm_client_modeset_commit+0x26/0x50 [drm]
> [   57.773732]  drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_=
kms_helper]
> [   57.774490]  drm_fb_helper_set_par+0x2d/0x60 [drm_kms_helper]
> [   57.775076]  drm_fb_helper_hotplug_event.part.21+0xb7/0xc0 [drm_kms_he=
lper]
> [   57.775783]  drm_fb_helper_hotplug_event+0x1f/0x30 [drm_kms_helper]
> [   57.776435]  intel_fbdev_output_poll_changed+0x6b/0xa0 [i915]
> [   57.777045]  drm_kms_helper_hotplug_event+0x2a/0x40 [drm_kms_helper]
> [   57.777769]  output_poll_execute+0x181/0x1b0 [drm_kms_helper]
> [   57.778353]  process_one_work+0x1fa/0x3f0
> [   57.778808]  worker_thread+0x34/0x410
> [   57.779182]  kthread+0x121/0x140
> [   57.779513]  ? process_one_work+0x3f0/0x3f0
> [   57.779940]  ? kthread_park+0x90/0x90
> [   57.780314]  ret_from_fork+0x35/0x40
> [   57.780681] ---[ end trace b40a2ff1454022b5 ]---
> [   57.781195] ------------[ cut here ]------------
> [   57.781742] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/drm_vblank.c:13=
36 drm_crtc_set_max_vblank_count+0x44/0x50 [drm]
> [   57.782811] Modules linked in: i915(E) intel_rapl_msr video drm_kms_he=
lper cec intel_rapl_common rc_core drm kvm_intel kvm i2c_algo_bit fb_sys_fo=
ps syscopyarea sysfillrect sysimgblt crct10dif_pclmul crc32_pclmul ghash_cl=
mulni_intel aesni_intel crypto_simd cryptd glue_helper joydev input_leds in=
tel_rapl_perf serio_raw mac_hid qemu_fw_cfg sch_fq_codel parport_pc ppdev l=
p parport ip_tables x_tables autofs4 psmouse floppy e1000 pata_acpi i2c_pii=
x4
> [   57.786706] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G        W   E  =
   5.6.0-rc3+ #13
> [   57.787571] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-linux-1 04/01/2014
> [   57.788911] Workqueue: events output_poll_execute [drm_kms_helper]
> [   57.789546] RIP: 0010:drm_crtc_set_max_vblank_count+0x44/0x50 [drm]
> [   57.790177] Code: 48 c1 e0 04 48 03 82 30 01 00 00 8b 92 40 01 00 00 8=
5 d2 75 0c 8b 50 6c 85 d2 74 0e 89 70 68 5d c3 0f 0b 8b 50 6c 85 d2 75 f2 <=
0f> 0b 89 70 68 5d c3 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41
> [   57.792168] RSP: 0018:ffffc9000010f930 EFLAGS: 00010246
> [   57.793752] RAX: ffff88811f9ca800 RBX: ffff88812129b000 RCX: 000000000=
0000000
> [   57.794589] RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffff88812=
129b000
> [   57.795298] RBP: ffffc9000010f930 R08: ffffffff82b83be0 R09: 000000000=
0000027
> [   57.796009] R10: ffff88811f9ca800 R11: 0000000000000024 R12: ffff88812=
8e25000
> [   57.796721] R13: ffff888100f06300 R14: ffff888128e25000 R15: ffff88812=
8e27000
> [   57.797439] FS:  0000000000000000(0000) GS:ffff888133d00000(0000) knlG=
S:0000000000000000
> [   57.798244] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   57.798820] CR2: 0000555c6091f628 CR3: 000000011f80a004 CR4: 000000000=
0360ee0
> [   57.799531] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   57.800243] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   57.800956] Call Trace:
> [   57.801373]  intel_crtc_vblank_on+0x35/0x50 [i915]
> [   57.801881]  intel_enable_ddi+0x4b/0x3f0 [i915]
> [   57.802357]  intel_encoders_enable+0x85/0xb0 [i915]
> [   57.802865]  hsw_crtc_enable+0x420/0x6b0 [i915]
> [   57.803338]  intel_update_crtc+0x1b8/0x1e0 [i915]
> [   57.803829]  skl_commit_modeset_enables+0x61b/0x6d0 [i915]
> [   57.804397]  intel_atomic_commit_tail+0x328/0x1530 [i915]
> [   57.804942]  ? flush_workqueue_prep_pwqs+0xfa/0x130
> [   57.805436]  ? flush_workqueue+0x198/0x3c0
> [   57.805866]  intel_atomic_commit+0x2ad/0x320 [i915]
> [   57.806369]  drm_atomic_commit+0x4a/0x50 [drm]
> [   57.806827]  drm_client_modeset_commit_atomic+0x1c4/0x200 [drm]
> [   57.807458]  drm_client_modeset_commit_locked+0x47/0x170 [drm]
> [   57.808087]  ? mutex_lock+0x12/0x40
> [   57.808445]  drm_client_modeset_commit+0x26/0x50 [drm]
> [   57.808966]  drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_=
kms_helper]
> [   57.809719]  drm_fb_helper_set_par+0x2d/0x60 [drm_kms_helper]
> [   57.810296]  drm_fb_helper_hotplug_event.part.21+0xb7/0xc0 [drm_kms_he=
lper]
> [   57.810993]  drm_fb_helper_hotplug_event+0x1f/0x30 [drm_kms_helper]
> [   57.811642]  intel_fbdev_output_poll_changed+0x6b/0xa0 [i915]
> [   57.812219]  drm_kms_helper_hotplug_event+0x2a/0x40 [drm_kms_helper]
> [   57.812925]  output_poll_execute+0x181/0x1b0 [drm_kms_helper]
> [   57.813640]  process_one_work+0x1fa/0x3f0
> [   57.814045]  worker_thread+0x34/0x410
> [   57.814415]  kthread+0x121/0x140
> [   57.814745]  ? process_one_work+0x3f0/0x3f0
> [   57.815166]  ? kthread_park+0x90/0x90
> [   57.815537]  ret_from_fork+0x35/0x40
> [   57.815900] ---[ end trace b40a2ff1454022b6 ]---
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 14e139e66e45..86dc80405977 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -261,7 +261,7 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>  			TRANS_DDI_PORT_MASK);
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> -			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
> +			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>  			(PORT_D << TRANS_DDI_PORT_SHIFT) |
>  			TRANS_DDI_FUNC_ENABLE);
>  		if (IS_BROADWELL(dev_priv)) {
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXl+nnwAKCRCxBBozTXgY
J9IIAJ4uy2dhNUshjb5LP4oD6FtbLiD29gCbBMaqlpEY0wSL4+NVmm3aRDJ+rqM=
=97UU
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--

--===============0981524701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0981524701==--
