Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332FF2923A3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 10:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32F489E7C;
	Mon, 19 Oct 2020 08:31:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE7289E7C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 19 Oct 2020 08:31:33 +0000 (UTC)
IronPort-SDR: hjYpAp5R26rQYrtAP0+VWkm+bZKGzIaYCqVpSiefaisY5SpsAjJB6BCr3Zmtk2yjJuIxp+NnOH
 pzU2UYTBnJmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="154781654"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="154781654"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 01:31:32 -0700
IronPort-SDR: DFQt+zwniyTOtTjFAVRH+lmrSwfAuMZb2ER733mgw5S8EqdNh0vJ6VdimjBhi+lJYldTiJms2l
 XV3mHSa0o/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="358086337"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2020 01:31:30 -0700
Date: Mon, 19 Oct 2020 16:10:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v3] drm/i915/gvt: Fix mmio handler break on BXT/APL.
Message-ID: <20201019081045.GO27141@zhen-hp.sh.intel.com>
References: <20201016052913.209248-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201016052913.209248-1-colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com
Content-Type: multipart/mixed; boundary="===============0671075540=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0671075540==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QGBKWVSgmlsIyJ+t"
Content-Disposition: inline


--QGBKWVSgmlsIyJ+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.16 13:29:13 +0800, Colin Xu wrote:
> - Remove dup mmio handler for BXT/APL. Otherwise mmio handler will fail
>   to init.
> - Add engine GPR with F_CMD_ACCESS since BXT/APL will load them via
>   LRI. Otherwise, guest will enter failsafe mode.
>=20
> V2:
> Use RCS/BCS GPR macros instead of offset.
> Revise commit message.
>=20
> V3:
> Use GEN8_RING_CS_GPR macros on ring base.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/handlers.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 0031e7c43ea8..593cfc21b7b0 100644
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
> @@ -3314,6 +3314,16 @@ static int init_bxt_mmio_info(struct intel_gvt *gv=
t)
>  	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
>  	MMIO_D(GEN6_GFXPAUSE, D_BXT);
>  	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
> +	       0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(GEN8_RING_CS_GPR(GEN6_BSD_RING_BASE, 0), 0x40, F_CMD_ACCESS,
> +	       0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(GEN8_RING_CS_GPR(BLT_RING_BASE, 0), 0x40, F_CMD_ACCESS,
> +	       0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(GEN8_RING_CS_GPR(VEBOX_RING_BASE, 0), 0x40, F_CMD_ACCESS,
> +	       0, 0, D_BXT, NULL, NULL);
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

--QGBKWVSgmlsIyJ+t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX41KBQAKCRCxBBozTXgY
Jx8gAJ9AVvWKO5WvC76HusvFBtislus5IQCfb+cr48o/dZSbFAOVE0I0qs+MZvw=
=S6Gi
-----END PGP SIGNATURE-----

--QGBKWVSgmlsIyJ+t--

--===============0671075540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0671075540==--
