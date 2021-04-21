Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107F3668CE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Apr 2021 12:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4189D56;
	Wed, 21 Apr 2021 10:04:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34A189D56
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Apr 2021 10:04:45 +0000 (UTC)
IronPort-SDR: O8Wo0mTsL/P4zIDiDaspQQk/SYMhXRPpJbhrOwhJ5+Oi+iViU2rDtfMOsX4l0+FeBjHdjOznm5
 uCwa+yPROk6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="281002559"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
 d="asc'?scan'208";a="281002559"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:04:45 -0700
IronPort-SDR: 9Q+CPo4hPixfpmGMe8lym4jrcckBDRmQQbS4kXvAwPfMKsfw2aRT1t01fpdWbzmpGFwatQtyex
 1oRnjm2Xc8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
 d="asc'?scan'208";a="617293583"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2021 03:04:44 -0700
Date: Wed, 21 Apr 2021 17:46:38 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Prevent divided by zero when calculating
 refresh rate
Message-ID: <20210421094638.GV1551@zhen-hp.sh.intel.com>
References: <20210416083355.159305-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210416083355.159305-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0853861742=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0853861742==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B8YbZbqleQryf2nq"
Content-Disposition: inline


--B8YbZbqleQryf2nq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.16 16:33:55 +0800, Colin Xu wrote:
> To get refresh rate as vblank timer period and keep the precision, the
> calculation of rate is multiplied by 1000. However old logic was using:
> rate =3D pixel clock / (h * v / 1000). When the h/v total is invalid, like
> all 0, h * v / 1000 will be rounded to 0, which leads to a divided by 0
> fault.
>=20
> 0 H/V are already checked above. Instead of divide after divide, refine
> the calculation to divide after multiply: "pixel clock * 1000 / (h * v)"
> Guest driver should guarantee the correctness of the timing regs' value.
>=20
> Fixes: 6a4500c7b83f ("drm/i915/gvt: Get accurate vGPU virtual display
> refresh rate from vreg")
>=20
> Reported-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/handlers.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 477badfcb258..dda320749c65 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -669,8 +669,8 @@ static void vgpu_update_refresh_rate(struct intel_vgp=
u *vgpu)
>  	link_n =3D vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A));
> =20
>  	/* Get H/V total from transcoder timing */
> -	htotal =3D (vgpu_vreg_t(vgpu, HTOTAL(TRANSCODER_A)) >> TRANS_HTOTAL_SHI=
FT) + 1;
> -	vtotal =3D (vgpu_vreg_t(vgpu, VTOTAL(TRANSCODER_A)) >> TRANS_VTOTAL_SHI=
FT) + 1;
> +	htotal =3D (vgpu_vreg_t(vgpu, HTOTAL(TRANSCODER_A)) >> TRANS_HTOTAL_SHI=
FT);
> +	vtotal =3D (vgpu_vreg_t(vgpu, VTOTAL(TRANSCODER_A)) >> TRANS_VTOTAL_SHI=
FT);
> =20
>  	if (dp_br && link_n && htotal && vtotal) {
>  		u64 pixel_clk =3D 0;
> @@ -682,7 +682,7 @@ static void vgpu_update_refresh_rate(struct intel_vgp=
u *vgpu)
>  		pixel_clk *=3D MSEC_PER_SEC;
> =20
>  		/* Calcuate refresh rate by (pixel_clk / (h_total * v_total)) */
> -		new_rate =3D DIV64_U64_ROUND_CLOSEST(pixel_clk, div64_u64(mul_u32_u32(=
htotal, vtotal), MSEC_PER_SEC));
> +		new_rate =3D DIV64_U64_ROUND_CLOSEST(mul_u64_u32_shr(pixel_clk, MSEC_P=
ER_SEC, 0), mul_u32_u32(htotal + 1, vtotal + 1));
> =20
>  		if (*old_rate !=3D new_rate)
>  			*old_rate =3D new_rate;
> --=20
> 2.31.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--B8YbZbqleQryf2nq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYH/0fgAKCRCxBBozTXgY
J6N3AJ9C2cdpfeck+INhmJDoI7nrVYBoEQCggR1d33ihlKtD0IlGpNWN8b1jGp0=
=T6mU
-----END PGP SIGNATURE-----

--B8YbZbqleQryf2nq--

--===============0853861742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0853861742==--
