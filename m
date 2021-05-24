Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C138E0F2
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 May 2021 08:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FDD6E0AA;
	Mon, 24 May 2021 06:19:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FC26E0F2;
 Mon, 24 May 2021 06:19:00 +0000 (UTC)
IronPort-SDR: Ay/EV/sHFApqKbL7YlIbEw1GM0pY+FopGkff0i9CtM4YE5ZaEPnpCK5zp4yz2hvZC3Hw2IH+xU
 ilq3rbYe/H6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="201889994"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
 d="asc'?scan'208";a="201889994"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2021 23:18:59 -0700
IronPort-SDR: tRz6vta6SuhO7pz3DCLduXLnP1qnJMAiJjjLxgCUTk3ot5Hm6axGAPTg3FEQbJoT+4m2ta5aQ5
 8oqf4q0LmKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
 d="asc'?scan'208";a="441888194"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2021 23:18:58 -0700
Date: Mon, 24 May 2021 13:59:36 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: Add missing macro name changes
Message-ID: <20210524055936.GE27293@zhen-hp.sh.intel.com>
References: <20210521181229.4700-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210521181229.4700-1-anusha.srivatsa@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1951688971=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1951688971==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.21 11:12:29 -0700, Anusha Srivatsa wrote:
> Propagate changes to macros name containing CSR_*
> to DMC_* from display side.
>=20
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index dda320749c65..33496397a74f 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3342,9 +3342,9 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
>  	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
> =20
> -	MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
> -	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
> -	MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
> +	MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
> +	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
> +	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
> =20
>  	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> =20
> @@ -3655,7 +3655,7 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gv=
t)
>   * otherwise, need to update cmd_reg_handler in cmd_parser.c
>   */
>  static struct gvt_mmio_block mmio_blocks[] =3D {
> -	{D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
> +	{D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
>  	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
>  	{D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
>  		pvinfo_mmio_read, pvinfo_mmio_write},
> --=20

Sorry that I missed your fix before sending mine...

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYKtAvwAKCRCxBBozTXgY
Jyd0AJ9sPyAEtDwDofCpYJWB5jcP+p9GpACfWzuDYsu4TABYccQfWwy315WEe/E=
=1xT+
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--

--===============1951688971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1951688971==--
