Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A20340AF
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 09:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4276189791;
	Tue,  4 Jun 2019 07:50:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B83389791
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 07:50:28 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 00:50:27 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga007.jf.intel.com with ESMTP; 04 Jun 2019 00:50:26 -0700
Date: Tue, 4 Jun 2019 15:48:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: rename is_inhibit_context to
 is_restore_inhibit_context
Message-ID: <20190604074854.GO9684@zhen-hp.sh.intel.com>
References: <20190603045617.31011-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190603045617.31011-1-yan.y.zhao@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Weinan Li <weinan.z.li@intel.com>
Content-Type: multipart/mixed; boundary="===============1643068222=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1643068222==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wfe1KbQWcwuymTys"
Content-Disposition: inline


--Wfe1KbQWcwuymTys
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.03 00:56:17 -0400, Yan Zhao wrote:
> There are two inhibit contexts: restore inhibit and save inhibit
> we need to distinguish between the two.
>=20
> Cc: Weinan Li <weinan.z.li@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---

Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/mmio_context.c | 9 +++------
>  drivers/gpu/drm/i915/gvt/mmio_context.h | 2 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c    | 2 +-
>  3 files changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 96e1edf21b3f..0c3e2f21e28c 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -438,14 +438,11 @@ static void switch_mocs(struct intel_vgpu *pre, str=
uct intel_vgpu *next,
> =20
>  #define CTX_CONTEXT_CONTROL_VAL	0x03
> =20
> -bool is_inhibit_context(struct intel_context *ce)
> +bool is_restore_inhibit_context(struct intel_context *ce)
>  {
>  	const u32 *reg_state =3D ce->lrc_reg_state;
> -	u32 inhibit_mask =3D
> -		_MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT);
> =20
> -	return inhibit_mask =3D=3D
> -		(reg_state[CTX_CONTEXT_CONTROL_VAL] & inhibit_mask);
> +	return IS_RESTORE_INHIBIT(reg_state[CTX_CONTEXT_CONTROL_VAL]);
>  }
> =20
>  /* Switch ring mmio values (context). */
> @@ -493,7 +490,7 @@ static void switch_mmio(struct intel_vgpu *pre,
>  			 * itself.
>  			 */
>  			if (mmio->in_context &&
> -			    !is_inhibit_context(s->shadow[ring_id]))
> +			    !is_restore_inhibit_context(s->shadow[ring_id]))
>  				continue;
> =20
>  			if (mmio->mask)
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.h b/drivers/gpu/drm/i9=
15/gvt/mmio_context.h
> index f7eaa442403f..08e3a775fae7 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.h
> @@ -49,7 +49,7 @@ void intel_gvt_switch_mmio(struct intel_vgpu *pre,
> =20
>  void intel_gvt_init_engine_mmio_context(struct intel_gvt *gvt);
> =20
> -bool is_inhibit_context(struct intel_context *ce);
> +bool is_restore_inhibit_context(struct intel_context *ce);
> =20
>  int intel_vgpu_restore_inhibit_context(struct intel_vgpu *vgpu,
>  				       struct i915_request *req);
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 8f3ba49b06f5..5c2087600442 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -313,7 +313,7 @@ static int copy_workload_to_ring_buffer(struct intel_=
vgpu_workload *workload)
>  	u32 *cs;
>  	int err;
> =20
> -	if (IS_GEN(req->i915, 9) && is_inhibit_context(req->hw_context))
> +	if (IS_GEN(req->i915, 9) && is_restore_inhibit_context(req->hw_context))
>  		intel_vgpu_restore_inhibit_context(vgpu, req);
> =20
>  	/*
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

--Wfe1KbQWcwuymTys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPYiZgAKCRCxBBozTXgY
J2fWAKCMbBb91wY3Fk1gCC1EWoKeK87HxwCeKHnvqJQy5PsX24+fKoTgGtycTyA=
=SedS
-----END PGP SIGNATURE-----

--Wfe1KbQWcwuymTys--

--===============1643068222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1643068222==--
