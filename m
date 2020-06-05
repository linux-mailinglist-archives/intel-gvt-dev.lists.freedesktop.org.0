Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611E1EF0B2
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Jun 2020 06:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4B96E832;
	Fri,  5 Jun 2020 04:49:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D896E832
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Jun 2020 04:49:07 +0000 (UTC)
IronPort-SDR: SkBFPazc+PFwUKPdPq8NgZQH+QC5ALusLXsmPJ14koY6Rmng+l2/+hFWUJxGLtLq5MLnKVAA3f
 xQ+4/YCYsxrA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 21:49:06 -0700
IronPort-SDR: Am9Fnm8bAUn1zw1HutEu7fpg2wLVR2+6S63TKThoVFReypcJF2Ut2UNECoYjSiROPnwPuVJgQ7
 tZxl6QPJZTZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; 
 d="asc'?scan'208";a="287609694"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga002.jf.intel.com with ESMTP; 04 Jun 2020 21:49:05 -0700
Date: Fri, 5 Jun 2020 12:33:28 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
Message-ID: <20200605043328.GN5687@zhen-hp.sh.intel.com>
References: <20200601030457.14002-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200601030457.14002-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0873773849=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0873773849==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kaF1vgn83Aa7CiXN"
Content-Disposition: inline


--kaF1vgn83Aa7CiXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.06.01 11:04:57 +0800, Colin Xu wrote:
> _PLANE_CTL_3_A, _PLANE_CTL_3_B and _PLANE_SURF_3_A are handled, but
> miss _PLANE_SURF_3_B.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index d2839cc036c1..f39a6b20bbaf 100644
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
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--kaF1vgn83Aa7CiXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXtnLGAAKCRCxBBozTXgY
Jw5ZAKCQSyeyJ4jLUD62gQ3mBX7T0aKWMwCfSQkJ9M97TI62SodtlQ1sF24E3S0=
=KYIQ
-----END PGP SIGNATURE-----

--kaF1vgn83Aa7CiXN--

--===============0873773849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0873773849==--
