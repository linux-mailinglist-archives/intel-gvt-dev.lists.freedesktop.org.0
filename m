Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227765F243
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Jul 2019 07:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E606E1CD;
	Thu,  4 Jul 2019 05:25:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98F46E1CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Jul 2019 05:25:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 22:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; 
 d="asc'?scan'208";a="166737337"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 03 Jul 2019 22:25:19 -0700
Date: Thu, 4 Jul 2019 13:22:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Do not check shadowed when adding ppgtt to
 GVT GEM context
Message-ID: <20190704052240.GU9684@zhen-hp.sh.intel.com>
References: <20190704000929.3359-1-colin.xu@intel.com>
 <20190704025515.GS9684@zhen-hp.sh.intel.com>
 <3b3542e7-8af7-5141-020a-2d93ca28b936@intel.com>
MIME-Version: 1.0
In-Reply-To: <3b3542e7-8af7-5141-020a-2d93ca28b936@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============2086415268=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2086415268==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCdOcaDGF7gDEeiN"
Content-Disposition: inline


--bCdOcaDGF7gDEeiN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.04 12:27:35 +0800, Colin Xu wrote:
>=20
> On 2019-07-04 10:55, Zhenyu Wang wrote:
> > On 2019.07.04 08:09:29 +0800, Colin Xu wrote:
> > > Windows guest can't run after force-TDR with host log:
> > > ...
> > > gvt: vgpu 1: workload shadow ppgtt isn't ready
> > > gvt: vgpu 1: fail to dispatch workload, skip
> > > ...
> > >=20
> > > The error is raised by set_context_ppgtt_from_shadow(), when it checks
> > > and found the shadow_mm isn't marked as shadowed.
> > >=20
> > > In work thread before each submission, a shadow_mm is set to shadowed=
 in:
> > > shadow_ppgtt_mm()
> > > <-intel_vgpu_pin_mm()
> > > <-prepare_workload()
> > > <-dispatch_workload()
> > > <-workload_thread()
> > > However checking whether or not shadow_mm is shadowed is prior to it:
> > > set_context_ppgtt_from_shadow()
> > > <-dispatch_workload()
> > > <-workload_thread()
> > >=20
> > > In normal case, create workload will check the existence of shadow_mm,
> > > if not it will create a new one and marked as shadowed. If already ex=
ist
> > > it will reuse the old one. Since shadow_mm is reused, checking of sha=
dowed
> > > in set_context_ppgtt_from_shadow() actually always see the state set =
in
> > > creation, but not the state set in intel_vgpu_pin_mm().
> > >=20
> > > When force-TDR, all engines are reset, since it's not dmlr level, all
> > > ppgtt_mm are invalidated but not destroyed. Invalidation will mark all
> > > reused shadow_mm as not shadowed but still keeps in ppgtt_mm_list_hea=
d.
> > > If workload submission phase those shadow_mm are reused with shadowed
> > > not set, then set_context_ppgtt_from_shadow() will report error.
> > >=20
> > > No need to check shadowed state in set_context_ppgtt_from_shadow().
> > Thanks for tracing this! I think this is a side effect from 1e18d5e6731=
d674fee0bb4b66f5ea61e504452a3,
> > which I moved this setting out of scan function.
>=20
> I think even before 1e18d5e6731d674fee0bb4b66f5ea61e504452a it still has =
problem
> since intel_gvt_scan_and_shadow_workload() is before prepare_workload().
>

Yep.

> >=20
> > One potential issue with this is shadow_pdps at this time might not hav=
e valid value yet,
> > how about we move shadow ctx ppgtt setting after we really prepared mm =
for workload and
> > before i915 submission? As this setting now is mostly to please i915, w=
e have already set
> > context's ppgtt by ourself.
> >=20
> If prepare_workload() failed, should we still set context ppgtt for the s=
hadow?
>

As we always populate our shadow ppgtt by context state, the shadow i915 ct=
x ppgtt
is not actually used but only for context pin. As long as we ensure ctx ppg=
tt is set
for dispatch workload, then it's ok.

For newer code which we always pin gvt context, maybe just setup it once is=
 enough,
that could be refined later.

> > > Fixes: 4f15665ccbba (drm/i915: Add ppgtt to GVT GEM context)
> > >=20
> > > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i=
915/gvt/scheduler.c
> > > index 196b4155a309..a5db57926962 100644
> > > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > @@ -371,7 +371,7 @@ static int set_context_ppgtt_from_shadow(struct i=
ntel_vgpu_workload *workload,
> > >   	struct i915_ppgtt *ppgtt =3D i915_vm_to_ppgtt(ctx->vm);
> > >   	int i =3D 0;
> > > -	if (mm->type !=3D INTEL_GVT_MM_PPGTT || !mm->ppgtt_mm.shadowed)
> > > +	if (mm->type !=3D INTEL_GVT_MM_PPGTT)
> > >   		return -EINVAL;
> > >   	if (mm->ppgtt_mm.root_entry_type =3D=3D GTT_TYPE_PPGTT_ROOT_L4_ENT=
RY) {
> > > --=20
> > > 2.22.0
> > >=20
> > > _______________________________________________
> > > intel-gvt-dev mailing list
> > > intel-gvt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>=20
> --=20
> Best Regards,
> Colin Xu
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--bCdOcaDGF7gDEeiN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXR2NIAAKCRCxBBozTXgY
J291AJ4k2weih+xyESiPXvVV7C3VjzgVjQCfXEq+qRoTMs5dZTwvqNqQHK/vTDw=
=pmJY
-----END PGP SIGNATURE-----

--bCdOcaDGF7gDEeiN--

--===============2086415268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2086415268==--
