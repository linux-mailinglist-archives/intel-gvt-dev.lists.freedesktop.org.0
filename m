Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C717148A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Feb 2020 10:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FB16E517;
	Thu, 27 Feb 2020 09:57:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5B46E517
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Feb 2020 09:57:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 01:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,491,1574150400"; 
 d="asc'?scan'208";a="272126194"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2020 01:57:07 -0800
Date: Thu, 27 Feb 2020 17:45:09 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix dma-buf display blur issue on CFL
Message-ID: <20200227094509.GC5412@zhen-hp.sh.intel.com>
References: <20200227010041.32248-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200227010041.32248-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1890113832=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1890113832==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.02.27 09:00:41 +0800, Tina Zhang wrote:
> Commit c3b5a8430daad ("drm/i915/gvt: Enable gfx virtualiztion for CFL")
> added the support on CFL. The vgpu emulation hotplug support on CFL was
> supposed to be included in that patch. Without the vgpu emulation
> hotplug support, the dma-buf based display gives us a blur face.
>=20
> So fix this issue by adding the vgpu emulation hotplug support on CFL.
>=20
> Fixes: c3b5a8430daad ("drm/i915/gvt: Enable gfx virtualiztion for CFL")
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 9bfc0ae30157..14e139e66e45 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -459,7 +459,8 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *vg=
pu, bool connected)
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> =20
>  	/* TODO: add more platforms support */
> -	if (IS_SKYLAKE(dev_priv) || IS_KABYLAKE(dev_priv)) {
> +	if (IS_SKYLAKE(dev_priv) || IS_KABYLAKE(dev_priv) ||
> +		IS_COFFEELAKE(dev_priv)) {
>  		if (connected) {
>  			vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
>  				SFUSE_STRAP_DDID_DETECTED;

Maybe more clean way is to check platform only when enable VFIO edid
so we don't need to add extra hw check in edid handling, so won't bring
extra step to miss sth, but can leave that later..

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXlePpAAKCRCxBBozTXgY
J+bFAJ94pbUh6QPZjmrmAA31HV1bdEJaVQCfbu/4okLMfHBHLOxLXXg+wCZ6E+U=
=p4KG
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--

--===============1890113832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1890113832==--
