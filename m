Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FD7179E2D
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Mar 2020 04:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15796E03E;
	Thu,  5 Mar 2020 03:18:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009C56E03E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Mar 2020 03:18:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 19:18:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; 
 d="asc'?scan'208";a="352259102"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2020 19:18:06 -0800
Date: Thu, 5 Mar 2020 11:05:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix emulated opregion size issue
Message-ID: <20200305030553.GK28483@zhen-hp.sh.intel.com>
References: <BN6PR11MB1666BA10DD924835EAB80D1B89E20@BN6PR11MB1666.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR11MB1666BA10DD924835EAB80D1B89E20@BN6PR11MB1666.namprd11.prod.outlook.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1771049589=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1771049589==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Content-Disposition: inline


--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.05 01:51:24 +0000, Zhang, Tina wrote:
> The background of the warns is this: since our opregion was considered as
> broken, guest i915 driver directly used the configurations in the fuse
> register. On CFL, gvt-g got the fuse register's data from hardware, and t=
he
> real hardware told us that the port F was used. However, gvt-d doesn't em=
ulate
> port F. The following warnings are guest i915 guest driver complaining ab=
out
> the port F doesn't configured correctly.
>=20
> So, it looks we can have two options:
> 1) Support port F emulation in gvt-g and fix our opregion and add port F
> support to the opregion.
> 2) Fix our opregion and let it tell guests OS that we only support port A=
/B/C/D
> with dp type output.
>=20
> As we all agree that we should have only one opregion configuration which=
 can
> deal with all the supported platforms, I think the option 2 is better.
> Otherwise, we have to bring platform knowledge into opregion, as not all
> platforms support port F.
>=20

Yes, that make sense. Could you add that into commit description?
=46rom the patch it fixes vbt size issue, but looks not obvious that
this actually fixed opregion for guest right? With above explanation
below trace log does make sense.


>=20
> BR,
> Tina
>=20
>=20
> -------------------------------------------------------------------------=
------
> From: Zhenyu Wang
> Sent: Wednesday, March 4, 2020 9:00 PM
> To: Zhang, Tina
> Cc: intel-gvt-dev@lists.freedesktop.org
> Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix emulated opregion size issue
>=20
> On 2020.03.04 17:50:34 +0800, Tina Zhang wrote:
> > The emulated opregion doesn't tell its size correctly. According to the
> > intel_vbt_defs.h, vbt_header.vbt_size should the size of VBT (VBT Heade=
r,
> > BDB Header and data blocks), and bdb_header.bdb_size should be the size
> > of BDB (BDB Header and data blocks).
> >
>=20
> The fix looks sane to me, but is below warning directly related to this?
> Looks that need some explanation.
>=20
> > This fixes guest warnings on cfl like:
> >
> > [   41.054953] Missing case (encoder->hpd_pin =3D=3D 9)
> > [   41.055572] WARNING: CPU: 0 PID: 145 at drivers/gpu/drm/i915/display/
> intel_dp.c:5443 cpt_digital_port_connected.isra.28+0x31/0x70 [i915]
> > [   41.056805] Modules linked in: intel_rapl_msr intel_rapl_common kvm_=
intel
> kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i915 aesni_intel
> crypto_simd video drm_kms_helper cec rc_core drm cryptd glue_helper
> intel_rapl_perf joydev i2c_algo_bit fb_sys_fops syscopyarea input_leds
> sysfillrect mac_hid serio_raw sch_fq_codel sysimgblt qemu_fw_cfg parport_=
pc
> ppdev lp parport ip_tables x_tables autofs4 psmouse e1000 i2c_piix4 pata_=
acpi
> floppy
> > [   41.060685] CPU: 0 PID: 145 Comm: kworker/u4:2 Not tainted 5.6.0-rc3=
+ #13
> > [   41.061369] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS
> rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-linux-1 04/01/2014
> > [   41.062670] Workqueue: events_unbound async_run_entry_fn
> > [   41.063578] RIP: 0010:cpt_digital_port_connected.isra.28+0x31/0x70 [=
i915]
> > [   41.064274] Code: fe 06 48 89 f8 48 89 e5 53 74 57 83 fe 07 74 4b 83=
 fe 05
> 74 1c 89 f2 48 c7 c7 7f 64 56 c0 48 c7 c6 d8 65 56 c0 e8 5f 3e bc c0 <0f>=
 0b 31
> c0 5b 5d c3 bb 00 00 20 00 48 8d b8 b8 07 00 00 ba 01 00
> > [   41.066161] RSP: 0018:ffffc9000019fac8 EFLAGS: 00010286
> > [   41.066716] RAX: 0000000000000000 RBX: ffff888116266000 RCX:
> 0000000000000000
> > [   41.067429] RDX: 0000000000000001 RSI: ffff888133c19808 RDI:
> ffff888133c19808
> > [   41.068196] RBP: ffffc9000019fad0 R08: 000000000000042a R09:
> ffff888138017378
> > [   41.068907] R10: ffff888116266000 R11: ffffc9000019f918 R12:
> 0000000000000000
> > [   41.069619] R13: ffff88811ea00000 R14: ffff88811ea00000 R15:
> ffff888116266000
> > [   41.070334] FS:  0000000000000000(0000) GS:ffff888133c00000(0000)
> knlGS:0000000000000000
> > [   41.071136] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   41.071712] CR2: 00007f08b0ca6320 CR3: 0000000131f3a006 CR4:
> 0000000000360ef0
> > [   41.072427] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> > [   41.073142] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> > [   41.073862] Call Trace:
> > [   41.074187]  intel_digital_port_connected+0x345/0x470 [i915]
> > [   41.074792]  intel_dp_detect+0x279/0x540 [i915]
> > [   41.075371]  ? ww_mutex_lock+0x64/0x70
> > [   41.075760]  drm_helper_probe_detect+0x50/0x90 [drm_kms_helper]
> > [   41.076360]  drm_helper_probe_single_connector_modes+0xe5/0x710
> [drm_kms_helper]
> > [   41.077113]  drm_client_modeset_probe+0x211/0x14b0 [drm]
> > [   41.077646]  ? __schedule+0x294/0x710
> > [   41.078025]  ? wq_worker_running+0xe/0x40
> > [   41.078431]  ? schedule+0x72/0xb0
> > [   41.078770]  ? __switch_to_asm+0x40/0x70
> > [   41.079169]  ? __switch_to_asm+0x34/0x70
> > [   41.079564]  ? __switch_to_asm+0x40/0x70
> > [   41.079963]  ? __switch_to_asm+0x34/0x70
> > [   41.080361]  ? __switch_to_asm+0x40/0x70
> > [   41.080758]  ? __switch_to_asm+0x34/0x70
> > [   41.081152]  ? __switch_to_asm+0x40/0x70
> > [   41.081554]  __drm_fb_helper_initial_config_and_unlock+0x46/0x520
> [drm_kms_helper]
> > [   41.082320]  ? __switch_to_asm+0x34/0x70
> > [   41.082716]  ? __switch_to_asm+0x40/0x70
> > [   41.083119]  ? __switch_to_xtra+0x130/0x4b0
> > [   41.083546]  ? __switch_to_asm+0x34/0x70
> > [   41.083948]  ? __switch_to_asm+0x40/0x70
> > [   41.084345]  drm_fb_helper_initial_config+0x35/0x40 [drm_kms_helper]
> > [   41.085014]  intel_fbdev_initial_config+0x18/0x30 [i915]
> > [   41.085553]  async_run_entry_fn+0x3c/0x150
> > [   41.085972]  process_one_work+0x1fa/0x3f0
> > [   41.086368]  worker_thread+0x34/0x410
> > [   41.086742]  kthread+0x121/0x140
> > [   41.087073]  ? process_one_work+0x3f0/0x3f0
> > [   41.087499]  ? kthread_park+0x90/0x90
> > [   41.087869]  ret_from_fork+0x35/0x40
> > [   41.088235] ---[ end trace 18d9147ae17b62df ]---
> >
> > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/opregion.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915=
/gvt/
> opregion.c
> > index 867e7629025b..33569b910ed5 100644
> > --- a/drivers/gpu/drm/i915/gvt/opregion.c
> > +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> > @@ -147,15 +147,14 @@ static void virt_vbt_generation(struct vbt *v)
> >        /* there's features depending on version! */
> >        v->header.version =3D 155;
> >        v->header.header_size =3D sizeof(v->header);
> > -     v->header.vbt_size =3D sizeof(struct vbt) - sizeof(v->header);
> > +     v->header.vbt_size =3D sizeof(struct vbt);
> >        v->header.bdb_offset =3D offsetof(struct vbt, bdb_header);
> >=20
> >        strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
> >        v->bdb_header.version =3D 186; /* child_dev_size =3D 33 */
> >        v->bdb_header.header_size =3D sizeof(v->bdb_header);
> >=20
> > -     v->bdb_header.bdb_size =3D sizeof(struct vbt) - sizeof(struct vbt=
_header)
> > -             - sizeof(struct bdb_header);
> > +     v->bdb_header.bdb_size =3D sizeof(struct vbt) - sizeof(struct
> vbt_header);
> >=20
> >        /* general features */
> >        v->general_features_header.id =3D BDB_GENERAL_FEATURES;
> > --
> > 2.17.1
> >
>=20
> --
> Open Source Technology Center, Intel ltd.
>=20
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXmBskQAKCRCxBBozTXgY
J9qfAJ4s9f4U4HpnE3hIibDr78CkAtyBdACdHaZjpaHNHbuVeq7RHVmA/zvpw9o=
=9lof
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--

--===============1771049589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1771049589==--
