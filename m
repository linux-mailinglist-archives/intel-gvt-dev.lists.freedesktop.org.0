Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064892ACFEA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Nov 2020 07:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98F689856;
	Tue, 10 Nov 2020 06:42:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7877189856
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 10 Nov 2020 06:42:40 +0000 (UTC)
IronPort-SDR: M+YgP844PudLe6ZO5eivZ4QR8wE7FUExnMAXH299QmIYr0Pa1Q7Ab72wpG1pqrY32/frJspLrU
 6pqqWdcUXl2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170037502"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="170037502"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 22:42:39 -0800
IronPort-SDR: +47YzdpHVcduapuuCXtT7etVAKcKZ+QbqfPWldmBMsUakq/56zQO0gJKeK2uMulw1f2Ay28rQs
 e1JbIkF99x4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="356007465"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2020 22:42:38 -0800
Date: Tue, 10 Nov 2020 14:28:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL
Message-ID: <20201110062825.GL1239@zhen-hp.sh.intel.com>
References: <20201109073939.758302-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201109073939.758302-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1082998748=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1082998748==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YH9Qf6Fh2G5kB/85"
Content-Disposition: inline


--YH9Qf6Fh2G5kB/85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.09 15:39:39 +0800, Colin Xu wrote:
> Some disply regs are not setup correctly during HPD for BXT/APL thus
> vfio_edid still not working. Temporarily disable the vfio_edid dynamic
> update until issue fixed.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/vgpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index f6d7e33c7099..399582aeeefb 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -439,7 +439,8 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(str=
uct intel_gvt *gvt,
> =20
>  	if (IS_BROADWELL(dev_priv))
>  		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
> -	else
> +	/* FixMe: Re-enable APL/BXT once vfio_edid enabled */
> +	else if (!IS_BROXTON(dev_priv))
>  		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
>  	if (ret)
>  		goto out_clean_sched_policy;
> --=20
> 2.29.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--YH9Qf6Fh2G5kB/85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX6ozCQAKCRCxBBozTXgY
JwJLAJ9eBy3XFwNYCEHk/Q+9e5vBH+6yFgCfTXDJD1MBk2uILymMWKePCgJGMIw=
=50bN
-----END PGP SIGNATURE-----

--YH9Qf6Fh2G5kB/85--

--===============1082998748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1082998748==--
