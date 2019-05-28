Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12AD2BDC1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 May 2019 05:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF7189A88;
	Tue, 28 May 2019 03:31:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70F789A88
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 May 2019 03:31:04 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 20:31:04 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga008.fm.intel.com with ESMTP; 27 May 2019 20:31:03 -0700
Date: Tue, 28 May 2019 11:29:47 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiong Zhang <xiong.y.zhang@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gvt: refine ggtt range validation
Message-ID: <20190528032947.GJ29553@zhen-hp.sh.intel.com>
References: <1558935953-3944-1-git-send-email-xiong.y.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1558935953-3944-1-git-send-email-xiong.y.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1396650107=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1396650107==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17/8oYur5Y32USnW"
Content-Disposition: inline


--17/8oYur5Y32USnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.27 13:45:50 +0800, Xiong Zhang wrote:
> The vgpu ggtt range should be in vgpu aperture or hidden range. This
> patch enforce begin and end address check and guarantee both of them are
> in the valid range.
>=20
> For size=3D0, it will regress to vgpu_gmadr_is_valid(), will refine
> this usage in a later fix.
>=20
> Fixes: 2707e4446688 ("drm/i915/gvt: vGPU graphics memory virtualization")
> Signed-off-by: Xiong Zhang <xiong.y.zhang@intel.com>
> ---

Ack for this series.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/gtt.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index f3a75bb..d767c45 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -53,13 +53,19 @@ static int preallocated_oos_pages =3D 8192;
>   */
>  bool intel_gvt_ggtt_validate_range(struct intel_vgpu *vgpu, u64 addr, u3=
2 size)
>  {
> -	if ((!vgpu_gmadr_is_valid(vgpu, addr)) || (size
> -			&& !vgpu_gmadr_is_valid(vgpu, addr + size - 1))) {
> -		gvt_vgpu_err("invalid range gmadr 0x%llx size 0x%x\n",
> -				addr, size);
> -		return false;
> -	}
> -	return true;
> +	if (size =3D=3D 0)
> +		return vgpu_gmadr_is_valid(vgpu, addr);
> +
> +	if (vgpu_gmadr_is_aperture(vgpu, addr) &&
> +	    vgpu_gmadr_is_aperture(vgpu, addr + size - 1))
> +		return true;
> +	else if (vgpu_gmadr_is_hidden(vgpu, addr) &&
> +		 vgpu_gmadr_is_hidden(vgpu, addr + size - 1))
> +		return true;
> +
> +	gvt_dbg_mm("Invalid ggtt range at 0x%llx, size: 0x%x\n",
> +		     addr, size);
> +	return false;
>  }
> =20
>  /* translate a guest gmadr to host gmadr */
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--17/8oYur5Y32USnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOyrKwAKCRCxBBozTXgY
J+T6AJ4jErqvUNWq+eSSjR+ECU0OrSJHlQCfeZjsXfHG+stoUD840OhjuJ3SG08=
=iRj/
-----END PGP SIGNATURE-----

--17/8oYur5Y32USnW--

--===============1396650107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1396650107==--
