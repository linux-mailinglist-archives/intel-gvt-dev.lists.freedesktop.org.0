Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA11D7127
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 08:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B367D89FA0;
	Mon, 18 May 2020 06:38:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E4589FA0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 06:38:15 +0000 (UTC)
IronPort-SDR: SfTZzQ0uD4kKzMDL6u4Q/W+rQRF25OeWqkOE16VC5aS6KGXKn9XZqbk4jrltLFriqeV5Ox2u7Y
 fcM0SOCI/MmQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 23:38:14 -0700
IronPort-SDR: D1yUebt4xvZfAK0JaSzQWvJ7YF2QS/6Ybk9zye21VBbHd9Wy4bzzQ6iYmp89QtMzS41v4TdpFs
 wn5hzyHlDOZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; 
 d="asc'?scan'208";a="465466799"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005.fm.intel.com with ESMTP; 17 May 2020 23:38:13 -0700
Date: Mon, 18 May 2020 14:23:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/gvt/i915: Fix two missed and add one MMIO handling
 for CFL
Message-ID: <20200518062317.GT18545@zhen-hp.sh.intel.com>
References: <20200518053506.83368-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200518053506.83368-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0227764350=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0227764350==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WUr/cuZz0HKWk6w/"
Content-Disposition: inline


--WUr/cuZz0HKWk6w/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.18 13:35:06 +0800, Colin Xu wrote:
> D_CFL was incorrectly removed.
> GAMT_CHKN_BIT_REG
> GEN9_CTX_PREEMPT_REG
> Fixes: 43226e6fe798 (drm/i915/gvt: replaced register address with name)
>
> Add _PLANE_SURF_3_B.

Please put Fixes tag apart from commit description, e.g one blank line.
Or if target for specific commit fix, should just split it.

>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 3e88e3b5c43a..f39a6b20bbaf 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3055,6 +3055,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
>  	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
>  	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
> =20
>  	MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
>  	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
> @@ -3131,8 +3132,8 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>  		 NULL, NULL);
> =20
> -	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL);
> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_KBL | D_SKL);
> +	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
> =20
>  	return 0;
>  }
> --=20
> 2.26.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--WUr/cuZz0HKWk6w/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXsIp1AAKCRCxBBozTXgY
J34IAKCW45/Qg6mpEeXqWADQmZdoVJ8YAACfSTRIFBGplOyTFPnkhjmkTppziKI=
=mEVT
-----END PGP SIGNATURE-----

--WUr/cuZz0HKWk6w/--

--===============0227764350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0227764350==--
