Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25927A797A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Sep 2019 05:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EFF899B5;
	Wed,  4 Sep 2019 03:56:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105F899B5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Sep 2019 03:56:41 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 20:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; 
 d="asc'?scan'208";a="266516793"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 03 Sep 2019 20:56:39 -0700
Date: Wed, 4 Sep 2019 11:51:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Weinan Li <weinan.z.li@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: update RING_START reg of vGPU when the
 context is submitted to i915
Message-ID: <20190904035140.GF25478@zhen-hp.sh.intel.com>
References: <20190902055759.30367-1-weinan.z.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190902055759.30367-1-weinan.z.li@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0905710260=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0905710260==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.09.02 13:57:59 +0800, Weinan Li wrote:
> The guest may use this register to identify the running state of one
> context. Emulate it as the value in context image as if the context runs
> on the GPU hardware.
>=20
> Signed-off-by: Weinan Li <weinan.z.li@intel.com>

I was thinking if this could be when we shadow guest context, but even
=66rom point of view on native hw run, those mmio regs may still be updated
until really dispatched. So this seems ok to me for now, unless there's
some regs would be checked by guest immediately after submission, which loo=
ks
not the case.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 166b998b09b3..6c79d16b381e 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -568,6 +568,16 @@ static int prepare_shadow_wa_ctx(struct intel_shadow=
_wa_ctx *wa_ctx)
>  	return 0;
>  }
> =20
> +static void update_vreg_in_ctx(struct intel_vgpu_workload *workload)
> +{
> +	struct intel_vgpu *vgpu =3D workload->vgpu;
> +	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> +	u32 ring_base;
> +
> +	ring_base =3D dev_priv->engine[workload->ring_id]->mmio_base;
> +	vgpu_vreg_t(vgpu, RING_START(ring_base)) =3D workload->rb_start;
> +}
> +
>  static void release_shadow_batch_buffer(struct intel_vgpu_workload *work=
load)
>  {
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
> @@ -1016,6 +1026,13 @@ static int workload_thread(void *priv)
>  		if (need_force_wake)
>  			intel_uncore_forcewake_get(&gvt->dev_priv->uncore,
>  					FORCEWAKE_ALL);
> +		/*
> +		 * Update the vReg of the vGPU which submitted this
> +		 * workload. The vGPU may use these registers for checking
> +		 * the context state. The value comes from GPU commands
> +		 * in this workload.
> +		 */
> +		update_vreg_in_ctx(workload);
> =20
>  		ret =3D dispatch_workload(workload);
> =20
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXW80zAAKCRCxBBozTXgY
J5VSAJ9Ug8+xhPfeO9V3lWBWQLmhZfqbFwCfYO8AJn6tcFmY1pYCfUQm1Uo5il0=
=J5Nv
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--

--===============0905710260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0905710260==--
