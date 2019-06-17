Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D036447B02
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 17 Jun 2019 09:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7864F8916C;
	Mon, 17 Jun 2019 07:30:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662918916C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 17 Jun 2019 07:30:18 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 00:30:17 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2019 00:30:17 -0700
Date: Mon, 17 Jun 2019 15:28:16 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Weinan Li <weinan.z.li@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: ignore unexpected pvinfo write
Message-ID: <20190617072816.GB9684@zhen-hp.sh.intel.com>
References: <20190614013519.13672-1-weinan.z.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190614013519.13672-1-weinan.z.li@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1580906972=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1580906972==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kPcv0S3lnZZ9UV+7"
Content-Disposition: inline


--kPcv0S3lnZZ9UV+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.14 09:35:19 +0800, Weinan Li wrote:
> There is pvinfo writing come from vgpu might be unexpected, like writing
> to one unknown address, now GVT-g lets it write to the vreg with prompt
> error message. It's better to ignore the unexpected pvinfo write access
> and leave the vreg as the default value.
>=20
> v2: ignore unexpected pvinfo write instead of return predefined value
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Weinan Li <weinan.z.li@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index a6ade66349bd..25f78196b964 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1254,18 +1254,15 @@ static int send_display_ready_uevent(struct intel=
_vgpu *vgpu, int ready)
>  static int pvinfo_mmio_write(struct intel_vgpu *vgpu, unsigned int offse=
t,
>  		void *p_data, unsigned int bytes)
>  {
> -	u32 data;
> -	int ret;
> -
> -	write_vreg(vgpu, offset, p_data, bytes);
> -	data =3D vgpu_vreg(vgpu, offset);
> +	u32 data =3D *(u32 *)p_data;
> +	bool invalid_write =3D false;

maybe add assert here later for bytes not equal to dword for any surprise,
others look fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> =20
>  	switch (offset) {
>  	case _vgtif_reg(display_ready):
>  		send_display_ready_uevent(vgpu, data ? 1 : 0);
>  		break;
>  	case _vgtif_reg(g2v_notify):
> -		ret =3D handle_g2v_notification(vgpu, data);
> +		handle_g2v_notification(vgpu, data);
>  		break;
>  	/* add xhot and yhot to handled list to avoid error log */
>  	case _vgtif_reg(cursor_x_hot):
> @@ -1282,13 +1279,19 @@ static int pvinfo_mmio_write(struct intel_vgpu *v=
gpu, unsigned int offset,
>  	case _vgtif_reg(execlist_context_descriptor_hi):
>  		break;
>  	case _vgtif_reg(rsv5[0])..._vgtif_reg(rsv5[3]):
> +		invalid_write =3D true;
>  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_INSUFFICIENT_RESOURCE);
>  		break;
>  	default:
> +		invalid_write =3D true;
>  		gvt_vgpu_err("invalid pvinfo write offset %x bytes %x data %x\n",
>  				offset, bytes, data);
>  		break;
>  	}
> +
> +	if (!invalid_write)
> +		write_vreg(vgpu, offset, p_data, bytes);
> +
>  	return 0;
>  }
> =20
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

--kPcv0S3lnZZ9UV+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXQdBEAAKCRCxBBozTXgY
J+fZAKCJRYYTbLSDewZfP4FsDC3tFoBuwwCfTwT16zZbLhmHWYKpu1Flp2LtBKA=
=viZA
-----END PGP SIGNATURE-----

--kPcv0S3lnZZ9UV+7--

--===============1580906972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1580906972==--
