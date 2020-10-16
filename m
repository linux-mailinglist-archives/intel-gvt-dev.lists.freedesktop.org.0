Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A461428FD5B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 06:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2678C6E1CE;
	Fri, 16 Oct 2020 04:36:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBAC6E1CE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Oct 2020 04:36:41 +0000 (UTC)
IronPort-SDR: QFsKRHSxtbFSnU1IA26TL0jsKL0x7UdUA7p/fI9v8cjmhWi3rm1F3LP6pSFV0Tg1wRmHmQJDNc
 ixqbY2UmCARg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="166581778"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; 
 d="asc'?scan'208";a="166581778"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 21:36:40 -0700
IronPort-SDR: /dEn0znv9ZklYBT6z2fH3VZaCkKq72AlRfovO5dhRX4I8HbvjkklwU0t64aDykr0hKfYSz6XL5
 JfEYS0+YI5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; 
 d="asc'?scan'208";a="346406145"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2020 21:36:39 -0700
Date: Fri, 16 Oct 2020 12:16:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Fix mmio handler break on BXT/APL.
Message-ID: <20201016041601.GF27141@zhen-hp.sh.intel.com>
References: <20201014011816.11926-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201014011816.11926-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0300009120=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0300009120==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TKDEsImF70pdVIl+"
Content-Disposition: inline


--TKDEsImF70pdVIl+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.14 09:18:16 +0800, Colin Xu wrote:
> - Remove dup mmio handler for BXT/APL. Otherwise mmio handler will fail
>   to init.
> - Add engine GPR with F_CMD_ACCESS since BXT/APL will load them via
>   LRI. Otherwise, guest will enter failsafe mode.
>=20
> V2:
> Use RCS/BCS GPR macros instead of offset.
> Revise comment.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 0031e7c43ea8..2691ae841971 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3140,7 +3140,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  		 NULL, NULL);
> =20
>  	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
> =20
>  	return 0;
>  }
> @@ -3314,6 +3314,12 @@ static int init_bxt_mmio_info(struct intel_gvt *gv=
t)
>  	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
>  	MMIO_D(GEN6_GFXPAUSE, D_BXT);
>  	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_F(HSW_CS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(_MMIO(0x12600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(BCS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(_MMIO(0x2a600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);

Should be like GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), etc.

> =20
>  	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
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

--TKDEsImF70pdVIl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX4kegQAKCRCxBBozTXgY
JwhJAJwNKLw/2pdBB7yyH0AjS6Zp+vlopgCcDYWUcnst793PFzezNukrzcdqJVI=
=EVZ7
-----END PGP SIGNATURE-----

--TKDEsImF70pdVIl+--

--===============0300009120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0300009120==--
