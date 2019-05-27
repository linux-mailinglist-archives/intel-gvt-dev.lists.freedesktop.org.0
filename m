Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EB2B13C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 11:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB44189916;
	Mon, 27 May 2019 09:24:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F0E89916
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 09:24:26 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 02:24:25 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 27 May 2019 02:24:24 -0700
Date: Mon, 27 May 2019 17:23:10 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix vGPU CSFE_CHICKEN1_REG mmio handler
Message-ID: <20190527092310.GH29553@zhen-hp.sh.intel.com>
References: <c5e5e6a0-34bb-af80-a88e-091b3eb45fc7@intel.com>
MIME-Version: 1.0
In-Reply-To: <c5e5e6a0-34bb-af80-a88e-091b3eb45fc7@intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0916470527=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0916470527==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
Content-Disposition: inline


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.23 15:48:24 +0800, Colin Xu wrote:
> Enter failsafe if vgpu tries to change CSFE_CHICKEN1_REG setting
> which is controlled by host.
>=20
> Signed-off-by: Colin Xu<colin.xu@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/handlers.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index edb1416585f5..7732caa1a546 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1789,6 +1789,21 @@ static int ring_reset_ctl_write(struct intel_vgpu =
*vgpu,
>  	return 0;
>  }
> +static int csfe_chicken1_mmio_write(struct intel_vgpu *vgpu,
> +				    unsigned int offset, void *p_data,
> +				    unsigned int bytes)
> +{
> +	u32 data =3D *(u32 *)p_data;
> +
> +	(*(u32 *)p_data) &=3D ~_MASKED_BIT_ENABLE(0x18);
> +	write_vreg(vgpu, offset, p_data, bytes);
> +
> +	if (data & _MASKED_BIT_ENABLE(0x10) || data & _MASKED_BIT_ENABLE(0x8))
> +		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
> +
> +	return 0;
> +}
> +
>  #define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
>  	ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
>  		f, s, am, rm, d, r, w); \
> @@ -3075,7 +3090,10 @@ static int init_skl_mmio_info(struct intel_gvt *gv=
t)
>  	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_C)), D_SKL_PLUS);
>  	MMIO_D(_MMIO(0x44500), D_SKL_PLUS);
> -	MMIO_DFH(GEN9_CSFE_CHICKEN1_RCS, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> +#define CSFE_CHICKEN1_REG(base) _MMIO((base) + 0xD4)
> +	MMIO_RING_DFH(CSFE_CHICKEN1_REG, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
> +		      NULL, csfe_chicken1_mmio_write);
> +#undef CSFE_CHICKEN1_REG
>  	MMIO_DFH(GEN8_HDC_CHICKEN1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>  		 NULL, NULL);
>  	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
> -- 2.21.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOusfgAKCRCxBBozTXgY
J7uEAJwKNturPVWr7vp7mC/0H1bxmyExGQCeMnnBlTTGzvZkUmBWXZokpum/Z5k=
=6y9m
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--

--===============0916470527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0916470527==--
