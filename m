Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A1410A9BF
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Nov 2019 06:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D156E6E0D2;
	Wed, 27 Nov 2019 05:03:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F50F6E0D2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Nov 2019 05:03:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 21:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; 
 d="asc'?scan'208";a="202952300"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 26 Nov 2019 21:03:51 -0800
Date: Wed, 27 Nov 2019 13:02:48 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Gao, Fred" <fred.gao@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/gvt: Refine non privilege register
 address calucation
Message-ID: <20191127050248.GN4196@zhen-hp.sh.intel.com>
References: <20191126160735.1026-1-fred.gao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191126160735.1026-1-fred.gao@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0153492526=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0153492526==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QL7GpiDjsJ+k4pJB"
Content-Disposition: inline


--QL7GpiDjsJ+k4pJB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On 2019.11.27 00:07:35 +0800, Gao, Fred wrote:
> The BitField of non privilege register address is only from bit 2 to 25.
>=20
> v2: use REG_GENMASK instead. (Zhenyu)
>=20
> Signed-off-by: Gao Fred <fred.gao@intel.com>

For two in this series.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 45a9124e53b6..f346bdd266ab 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -508,7 +508,7 @@ static inline bool in_whitelist(unsigned int reg)
>  static int force_nonpriv_write(struct intel_vgpu *vgpu,
>  	unsigned int offset, void *p_data, unsigned int bytes)
>  {
> -	u32 reg_nonpriv =3D *(u32 *)p_data;
> +	u32 reg_nonpriv =3D (*(u32 *)p_data) & REG_GENMASK(25, 2);
>  	int ring_id =3D intel_gvt_render_mmio_to_ring_id(vgpu->gvt, offset);
>  	u32 ring_base;
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> @@ -528,7 +528,7 @@ static int force_nonpriv_write(struct intel_vgpu *vgp=
u,
>  			bytes);
>  	} else
>  		gvt_err("vgpu(%d) Invalid FORCE_NONPRIV write %x at offset %x\n",
> -			vgpu->id, reg_nonpriv, offset);
> +			vgpu->id, *(u32 *)p_data, offset);
> =20
>  	return 0;
>  }
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--QL7GpiDjsJ+k4pJB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXd4DeAAKCRCxBBozTXgY
JyhYAKCYe1sh7NemDpHZ+3epq8iP6VNOuACfUOkzpV94W0iohG+ewc6xbLHWups=
=0x7H
-----END PGP SIGNATURE-----

--QL7GpiDjsJ+k4pJB--

--===============0153492526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0153492526==--
