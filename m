Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0115F19F
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Jul 2019 04:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B734A6E21B;
	Thu,  4 Jul 2019 02:57:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016126E21B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Jul 2019 02:57:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 19:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; 
 d="asc'?scan'208";a="187453943"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2019 19:57:53 -0700
Date: Thu, 4 Jul 2019 10:55:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Do not check shadowed when adding ppgtt to
 GVT GEM context
Message-ID: <20190704025515.GS9684@zhen-hp.sh.intel.com>
References: <20190704000929.3359-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190704000929.3359-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0928347912=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0928347912==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5BSwYavaev5qNTlX"
Content-Disposition: inline


--5BSwYavaev5qNTlX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.04 08:09:29 +0800, Colin Xu wrote:
> Windows guest can't run after force-TDR with host log:
> ...
> gvt: vgpu 1: workload shadow ppgtt isn't ready
> gvt: vgpu 1: fail to dispatch workload, skip
> ...
>=20
> The error is raised by set_context_ppgtt_from_shadow(), when it checks
> and found the shadow_mm isn't marked as shadowed.
>=20
> In work thread before each submission, a shadow_mm is set to shadowed in:
> shadow_ppgtt_mm()
> <-intel_vgpu_pin_mm()
> <-prepare_workload()
> <-dispatch_workload()
> <-workload_thread()
> However checking whether or not shadow_mm is shadowed is prior to it:
> set_context_ppgtt_from_shadow()
> <-dispatch_workload()
> <-workload_thread()
>=20
> In normal case, create workload will check the existence of shadow_mm,
> if not it will create a new one and marked as shadowed. If already exist
> it will reuse the old one. Since shadow_mm is reused, checking of shadowed
> in set_context_ppgtt_from_shadow() actually always see the state set in
> creation, but not the state set in intel_vgpu_pin_mm().
>=20
> When force-TDR, all engines are reset, since it's not dmlr level, all
> ppgtt_mm are invalidated but not destroyed. Invalidation will mark all
> reused shadow_mm as not shadowed but still keeps in ppgtt_mm_list_head.
> If workload submission phase those shadow_mm are reused with shadowed
> not set, then set_context_ppgtt_from_shadow() will report error.
>=20
> No need to check shadowed state in set_context_ppgtt_from_shadow().

Thanks for tracing this! I think this is a side effect from 1e18d5e6731d674=
fee0bb4b66f5ea61e504452a3,
which I moved this setting out of scan function.

One potential issue with this is shadow_pdps at this time might not have va=
lid value yet,
how about we move shadow ctx ppgtt setting after we really prepared mm for =
workload and
before i915 submission? As this setting now is mostly to please i915, we ha=
ve already set
context's ppgtt by ourself.

>=20
> Fixes: 4f15665ccbba (drm/i915: Add ppgtt to GVT GEM context)
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 196b4155a309..a5db57926962 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -371,7 +371,7 @@ static int set_context_ppgtt_from_shadow(struct intel=
_vgpu_workload *workload,
>  	struct i915_ppgtt *ppgtt =3D i915_vm_to_ppgtt(ctx->vm);
>  	int i =3D 0;
> =20
> -	if (mm->type !=3D INTEL_GVT_MM_PPGTT || !mm->ppgtt_mm.shadowed)
> +	if (mm->type !=3D INTEL_GVT_MM_PPGTT)
>  		return -EINVAL;
> =20
>  	if (mm->ppgtt_mm.root_entry_type =3D=3D GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
> --=20
> 2.22.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--5BSwYavaev5qNTlX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXR1qkwAKCRCxBBozTXgY
J8cTAJoCxxbBUnySvxAn5llu7sp0foGbHwCaAn4oB16Du3QHGBJsV0EcqbLJtQU=
=f3P/
-----END PGP SIGNATURE-----

--5BSwYavaev5qNTlX--

--===============0928347912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0928347912==--
