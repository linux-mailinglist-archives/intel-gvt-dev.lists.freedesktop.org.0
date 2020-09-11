Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFAF265739
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Sep 2020 05:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4D6E27C;
	Fri, 11 Sep 2020 03:03:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9C66E27C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Sep 2020 03:03:57 +0000 (UTC)
IronPort-SDR: FhFESIVdeCMMbAneIr1K4sn5vuc2Y6jjjS5kPVN9eqCMYn0YBv6sBoPWvA/5AQ0DLBMRZXymqT
 b7EYBfzYXzVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="222882113"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
 d="asc'?scan'208";a="222882113"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 20:03:56 -0700
IronPort-SDR: meDpVOAhHeYVHsgiJxO9SrytJeVcxyD0pudOQFxlAN/CEUSjTPS+WVs8voyYbejTYfhvdsRMAY
 quElTFBA6q2Q==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
 d="asc'?scan'208";a="481154262"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 20:03:55 -0700
Date: Fri, 11 Sep 2020 10:44:35 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Skip writing 0 to HWSP during D3 resume
Message-ID: <20200911024435.GP28614@zhen-hp.sh.intel.com>
References: <20200819010953.55350-1-colin.xu@intel.com>
 <20200908091518.GE1426@zhen-hp.sh.intel.com>
 <7c369be0-d2bb-692b-e207-fd042fd11380@intel.com>
 <20200909020420.GE28614@zhen-hp.sh.intel.com>
 <da21010d-c366-b69b-1045-8ab840e646e5@intel.com>
 <20200909024133.GG28614@zhen-hp.sh.intel.com>
 <64ac9381-714d-0c1d-dcf9-a06037cdfded@intel.com>
 <1a743924-b9e8-7835-6902-3f5e07f73bb1@intel.com>
MIME-Version: 1.0
In-Reply-To: <1a743924-b9e8-7835-6902-3f5e07f73bb1@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0706895923=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0706895923==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8JPrznbw0YAQ/KXy"
Content-Disposition: inline


--8JPrznbw0YAQ/KXy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.11 10:26:21 +0800, Colin Xu wrote:
> Maybe we still need this change or a similar one. The HWSP zero out failu=
re
> will result in to mmio write fail and guest then enters failsafe mode. Fr=
om
> guest perspective, it will fail to resume and enter reset cycle.
>=20
>=20
> >>> Trigger system_wakeup in qemu monitor
>=20
> [=A0 753.165063] gvt: vgpu 2: write invalid HWSP address, reg:0x2080,
> value:0x0
> [=A0 753.165065] gvt: vgpu 2: fail to emulate MMIO write 00002080 len 4
> [=A0 753.165206] gvt: vgpu 2: write invalid HWSP address, reg:0x12080,
> value:0x0
> [=A0 753.165207] gvt: vgpu 2: fail to emulate MMIO write 00012080 len 4
> [=A0 753.165247] gvt: vgpu 2: write invalid HWSP address, reg:0x22080,
> value:0x0
> [=A0 753.165248] gvt: vgpu 2: fail to emulate MMIO write 00022080 len 4
> [=A0 753.165295] gvt: vgpu 2: write invalid HWSP address, reg:0x1a080,
> value:0x0
> [=A0 753.165297] gvt: vgpu 2: fail to emulate MMIO write 0001a080 len 4
> [=A0 753.165645] Detected your guest driver doesn't support GVT-g.
> [=A0 753.165646] Now vgpu 2 will enter failsafe mode.
>

Maybe we just take that 0 address as special case and not return
failure, as it's a valid setting from device driver point of view.

>=20
> On 2020-09-09 11:05, Colin Xu wrote:
> >=20
> > On 2020-09-09 10:41, Zhenyu Wang wrote:
> > > On 2020.09.09 10:51:04 +0800, Colin Xu wrote:
> > > > On 2020-09-09 10:04, Zhenyu Wang wrote:
> > > > > On 2020.09.09 08:37:53 +0800, Colin Xu wrote:
> > > > > > On 2020-09-08 17:15, Zhenyu Wang wrote:
> > > > > > > On 2020.08.19 09:09:53 +0800, Colin Xu wrote:
> > > > > > > > Guest driver may reset HWSP to 0 as init value during D3->D=
0:
> > > > > > > > The full sequence is:
> > > > > > > > - Boot ->D0
> > > > > > > > - Update HWSP
> > > > > > > > - D0->D3
> > > > > > > > - ...In D3 state...
> > > > > > > > - D3->D0
> > > > > > > > - DMLR reset.
> > > > > > > > - Set engine HWSP to 0.
> > > > > > > > - Set engine ring mode to 0.
> > > > > > > > - Set engine HWSP to correct value.
> > > > > > > > - Set engine ring mode to correct value.
> > > > > > > > Ring mode is masked register so set 0 won't take effect.
> > > > > > > > However HWPS addr 0 is considered as invalid
> > > > > > > > GGTT address which will
> > > > > > > > report error like:
> > > > > > > > gvt: vgpu 1: write invalid HWSP address, reg:0x2080, value:=
0x0
> > > > > > > >=20
> > > > > > > So looks this is to handle that wrong error message but funct=
ion is
> > > > > > > still same, right?
> > > > > > Yes that's right. Current logic can guarantee that only
> > > > > > correct HWSP write
> > > > > > from guest are accepted by GVT. Invalid HWSP address
> > > > > > will be dropped and
> > > > > > won't be submitted to HW. During resume, correct HWSP will be u=
pdated
> > > > > > eventually updated. If pv_notified is set, the
> > > > > > intermediate HWSP zero-out
> > > > > > can be ignored until hit next reset.
> > > > > Might just move that error into debug message instead of putting
> > > > > effort on tracking guest state without much gain..
> > > > Sometimes such invalid HWSP addr write msg may still be helpful.
> > > > If put them
> > > > into gvt_dbg_mmio without considering different case, may miss the
> > > > information. So this change put real error into gvt_vgpu_err, but p=
ut
> > > > expected zero out to gvt_dbg_mmio.
> > > Could you elaborate what would be helpful? The current error message
> > > doesn't really help end user I think, but only for developer, so it
> > > makes more sense to turn into debug.
> >=20
> > For developer or user consideration, yes distinguish the msg is useless
> > for end user. Developer can tell the state and find out the HWSP addr is
> > really valid or just zero-out during resuming.
> >=20
> > If so I think we can move this msg to gvt_dbg in next cleanup.
> >=20
> > > > > > > > During vGPU in D3, per-engine HWSP gpa remains valid so we =
can skip
> > > > > > > > update HWSP in this case.
> > > > > > > > Check both pv_notified and previous engine HWSP gpa, if pv =
already
> > > > > > > > notified and previous HWSP gpa is valid, we skip this HWSP =
init and
> > > > > > > > let later HWSP write update the correct value.
> > > > > > > > We also need zero out
> > > > > > > > per-engine HWSP gpa on engine reset to make sure hws_pga is=
 valid.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > > > > > > > ---
> > > > > > > > =A0=A0=A0 drivers/gpu/drm/i915/gvt/handlers.c | 30
> > > > > > > > ++++++++++++++++++++---------
> > > > > > > > =A0=A0=A0 drivers/gpu/drm/i915/gvt/vgpu.c=A0=A0=A0=A0 |=A0 =
7 +++++++
> > > > > > > > =A0=A0=A0 2 files changed, 28 insertions(+), 9 deletions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > > > > b/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > > > > index 840572add2d4..72860aaf1656 100644
> > > > > > > > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > > > > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > > > > @@ -1489,12 +1489,6 @@ static int
> > > > > > > > hws_pga_write(struct intel_vgpu *vgpu, unsigned
> > > > > > > > int offset,
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 const struct intel_engine_cs *engine =
=3D
> > > > > > > > intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
> > > > > > > > -=A0=A0=A0 if (!intel_gvt_ggtt_validate_range(vgpu,
> > > > > > > > value, I915_GTT_PAGE_SIZE)) {
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 gvt_vgpu_err("write invalid HWSP
> > > > > > > > address, reg:0x%x, value:0x%x\n",
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 offset=
, value);
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > > > -=A0=A0=A0 }
> > > > > > > > -
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 /*
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0 * Need to emulate all the HWSP reg=
ister
> > > > > > > > write to ensure host can
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0 * update the VM CSB status correct=
ly.
> > > > > > > > Here listed registers can
> > > > > > > > @@ -1505,9 +1499,27 @@ static int
> > > > > > > > hws_pga_write(struct intel_vgpu *vgpu, unsigned
> > > > > > > > int offset,
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 offset);
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > -=A0=A0=A0 vgpu->hws_pga[engine->id] =3D value;
> > > > > > > > -=A0=A0=A0 gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: 0x%x\n=
",
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgpu->id, value, offs=
et);
> > > > > > > > +
> > > > > > > > +=A0=A0=A0 if (!intel_gvt_ggtt_validate_range(vgpu,
> > > > > > > > value, I915_GTT_PAGE_SIZE)) {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 u32 old =3D vgpu->hws_pga[engine->id=
];
> > > > > > > > +
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 /* Skip zero out RING_HWS_PGA during=
 D3 resume */
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (vgpu->pv_notified && value =3D=
=3D 0 &&
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 intel_gvt_ggtt_validate_=
range(vgpu, old,
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 I915_GTT_PAGE_SIZE)) {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gvt_dbg_mmio("Skip zero =
out HWSP address, reg:0x%x, "
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "value:0x%x\n", offset, value);
> > > > > > > > +
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 } else {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gvt_vgpu_err("write inva=
lid HWSP address, reg:0x%x, "
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "value:0x%x\n", offset, value);
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > +=A0=A0=A0 } else {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 vgpu->hws_pga[engine->id] =3D value;
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 gvt_dbg_mmio("VM(%d) write: 0x%x to =
HWSP: 0x%x\n",
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgpu->id,=
 value, offset);
> > > > > > > > +=A0=A0=A0 }
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 return
> > > > > > > > intel_vgpu_default_mmio_write(vgpu, offset,
> > > > > > > > &value, bytes);
> > > > > > > > =A0=A0=A0 }
> > > > > > > > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c
> > > > > > > > b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > > > > > > index 8fa9b31a2484..e0e073045d83 100644
> > > > > > > > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > > > > > > > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > > > > > > @@ -558,6 +558,9 @@ void
> > > > > > > > intel_gvt_reset_vgpu_locked(struct intel_vgpu
> > > > > > > > *vgpu, bool dmlr,
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 intel_vgpu_reset_submission(vgpu, res=
etting_eng);
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 /* full GPU reset or device model lev=
el reset */
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 if (engine_mask =3D=3D ALL_ENGINES ||=
 dmlr) {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 struct intel_engine_cs *engine;
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 intel_engine_mask_t tmp;
> > > > > > > > +
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 intel_vgpu_select_submiss=
ion_ops(vgpu, ALL_ENGINES, 0);
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (engine_mask =3D=3D AL=
L_ENGINES)
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 intel_vgpu_in=
validate_ppgtt(vgpu);
> > > > > > > > @@ -588,6 +591,10 @@ void
> > > > > > > > intel_gvt_reset_vgpu_locked(struct intel_vgpu
> > > > > > > > *vgpu, bool dmlr,
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v=
gpu->pv_notified =3D false;
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > +
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 for_each_engine_masked(engine, gvt->=
gt,
> > > > > > > > engine_mask, tmp) {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgpu->hws_pga[engine->id=
] =3D 0;
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > =A0=A0=A0=A0=A0=A0=A0 vgpu->resetting_eng =3D 0;
> > > > > > > > --=20
> > > > > > > > 2.28.0
> > > > > > > >=20
> > > > > > > > _______________________________________________
> > > > > > > > intel-gvt-dev mailing list
> > > > > > > > intel-gvt-dev@lists.freedesktop.org
> > > > > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> > > > > > --=20
> > > > > > Best Regards,
> > > > > > Colin Xu
> > > > > >=20
> > > > --=20
> > > > Best Regards,
> > > > Colin Xu
> > > >=20
> --=20
> Best Regards,
> Colin Xu
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--8JPrznbw0YAQ/KXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1rkkwAKCRCxBBozTXgY
J1zwAJ0VAL7I6Oqt9Wi0WPHNgfrklGxOpwCdFUhcYShcc1pLzpOfXPgDYsIMbv4=
=lOg2
-----END PGP SIGNATURE-----

--8JPrznbw0YAQ/KXy--

--===============0706895923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0706895923==--
