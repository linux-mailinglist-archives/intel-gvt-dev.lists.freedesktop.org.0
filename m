Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2631EF0B6
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Jun 2020 06:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0794C6E834;
	Fri,  5 Jun 2020 04:52:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04D06E834
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Jun 2020 04:52:17 +0000 (UTC)
IronPort-SDR: RciX0XG8EotS1Awt45J37vSqplOfoiAJJvRnqFFVEetr1L2Efg1hd9NS5qT4TZu2W1JSPffYBu
 0ts7whMb2EGQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 21:52:16 -0700
IronPort-SDR: nt62RVTNwrxphL3swmGGC+S9qa7d2u9v4Q3SrMdupPtTIk69Pn5ZPrRnitCE7qaq0lzNW3sysh
 KANFuZ2jqluQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; 
 d="asc'?scan'208";a="273351826"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 04 Jun 2020 21:52:15 -0700
Date: Fri, 5 Jun 2020 12:36:38 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH V3] drm/i915/gvt: Fix two CFL MMIO handling caused by
 regression.
Message-ID: <20200605043638.GO5687@zhen-hp.sh.intel.com>
References: <20200601030638.16002-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200601030638.16002-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0886771569=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0886771569==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zHDeOHGDnzKksZSU"
Content-Disposition: inline


--zHDeOHGDnzKksZSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.06.01 11:06:38 +0800, Colin Xu wrote:
> Fixes: 43226e6fe798 (drm/i915/gvt: replaced register address with name)
>

Normally Fixes tag is put after description with s-o-b line.

> D_CFL was incorrectly removed for:
> GAMT_CHKN_BIT_REG
> GEN9_CTX_PREEMPT_REG
>=20
> V2: Update commit message.
> V3: Rebase and split Fixes and mis-handled MMIO.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 3e88e3b5c43a..d2839cc036c1 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3131,8 +3131,8 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>  		 NULL, NULL);
> =20
> -	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL);
> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_KBL | D_SKL);
> +	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
>

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

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

--zHDeOHGDnzKksZSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXtnL1gAKCRCxBBozTXgY
J0LIAKCZmO8n/BZ4DfMDHJJXpJAIgHCq8gCeOEnfdi64RmWFFmcTsaXAULbkczU=
=VXNx
-----END PGP SIGNATURE-----

--zHDeOHGDnzKksZSU--

--===============0886771569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0886771569==--
