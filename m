Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996DF28FD61
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 06:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D46E1CE;
	Fri, 16 Oct 2020 04:39:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E4C6E1CE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Oct 2020 04:39:52 +0000 (UTC)
IronPort-SDR: uYxI2H5ATYg7o6pSc6qmxA0h2dk+sA+1eQS1GppS63ZvfNlJWRMpOQBdCBHUXG3T+dqdhD0R7E
 8rRz/qkUBJqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="163052461"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; 
 d="asc'?scan'208";a="163052461"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 21:39:52 -0700
IronPort-SDR: dQ3bAIRS+XCryk4OYITq3Ef7pmKmNTgTaBQXTN62kvRswLhAg9+GwL0eUYrQtfAKSzFt4BqhLT
 gwNi1ttJbCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; 
 d="asc'?scan'208";a="346406734"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2020 21:39:51 -0700
Date: Fri, 16 Oct 2020 12:19:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to
 workaround GPU BB hang
Message-ID: <20201016041913.GG27141@zhen-hp.sh.intel.com>
References: <20201012045231.226748-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201012045231.226748-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1551452172=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1551452172==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tAmVnWIZ6lqEAvSf"
Content-Disposition: inline


--tAmVnWIZ6lqEAvSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.12 12:52:31 +0800, Colin Xu wrote:
> If guest fills non-priv bb on ApolloLake/Broxton as Mesa i965 does in:
> 717e7539124d (i965: Use a WC map and memcpy for the batch instead of pw-)
> Due to the missing flush of bb filled by VM vCPU, host GPU hangs on
> executing these MI_BATCH_BUFFER.
>=20
> Temporarily workaround this by setting SNOOP bit for PAT3 used by PPGTT
> PML4 PTE: PAT(0) PCD(1) PWT(1).
>=20
> The performance is still expected to be low, will need further improvemen=
t.
>

Let's mitigate the hang issue now.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 32 ++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 9891501da064..75cb0394c661 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1651,6 +1651,34 @@ static int edp_psr_imr_iir_write(struct intel_vgpu=
 *vgpu,
>  	return 0;
>  }
> =20
> +/**
> + * FixMe:
> + * If guest fills non-priv batch buffer on ApolloLake/Broxton as Mesa i9=
65 did:
> + * 717e7539124d (i965: Use a WC map and memcpy for the batch instead of =
pwrite.)
> + * Due to the missing flush of bb filled by VM vCPU, host GPU hangs on e=
xecuting
> + * these MI_BATCH_BUFFER.
> + * Temporarily workaround this by setting SNOOP bit for PAT3 used by PPG=
TT
> + * PML4 PTE: PAT(0) PCD(1) PWT(1).
> + * The performance is still expected to be low, will need further improv=
ement.
> + */
> +static int bxt_ppat_low_write(struct intel_vgpu *vgpu, unsigned int offs=
et,
> +			      void *p_data, unsigned int bytes)
> +{
> +	u64 pat =3D
> +		GEN8_PPAT(0, CHV_PPAT_SNOOP) |
> +		GEN8_PPAT(1, 0) |
> +		GEN8_PPAT(2, 0) |
> +		GEN8_PPAT(3, CHV_PPAT_SNOOP) |
> +		GEN8_PPAT(4, CHV_PPAT_SNOOP) |
> +		GEN8_PPAT(5, CHV_PPAT_SNOOP) |
> +		GEN8_PPAT(6, CHV_PPAT_SNOOP) |
> +		GEN8_PPAT(7, CHV_PPAT_SNOOP);
> +
> +	vgpu_vreg(vgpu, offset) =3D lower_32_bits(pat);
> +
> +	return 0;
> +}
> +
>  static int guc_status_read(struct intel_vgpu *vgpu,
>  			   unsigned int offset, void *p_data,
>  			   unsigned int bytes)
> @@ -2813,7 +2841,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
> =20
>  	MMIO_DH(GEN6_PCODE_MAILBOX, D_BDW_PLUS, NULL, mailbox_write);
> =20
> -	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS);
> +	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS & ~D_BXT);
>  	MMIO_D(GEN8_PRIVATE_PAT_HI, D_BDW_PLUS);
> =20
>  	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
> @@ -3323,6 +3351,8 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
> =20
>  	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
> =20
> +	MMIO_DH(GEN8_PRIVATE_PAT_LO, D_BXT, NULL, bxt_ppat_low_write);
> +
>  	return 0;
>  }
> =20
> --=20
> 2.28.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--tAmVnWIZ6lqEAvSf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX4kfQQAKCRCxBBozTXgY
J02qAJ0bxCI4vohOZE+7FYRYB0Q/LjoIXwCfW5SdiPxPidE6klStHSaCJyULsrU=
=20Bc
-----END PGP SIGNATURE-----

--tAmVnWIZ6lqEAvSf--

--===============1551452172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1551452172==--
