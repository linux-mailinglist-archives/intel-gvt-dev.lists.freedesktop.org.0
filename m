Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B0EF3BF
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 03:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F99B6E8DD;
	Tue,  5 Nov 2019 02:54:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804506E8DD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 02:54:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 18:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,269,1569308400"; 
 d="asc'?scan'208";a="200673062"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2019 18:54:21 -0800
Date: Tue, 5 Nov 2019 10:54:07 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Stop initializing pvinfo through reading
 mmio
Message-ID: <20191105025407.GC1769@zhen-hp.sh.intel.com>
References: <20191104053148.7161-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191104053148.7161-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0776822970=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0776822970==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4hmTAJAngH+SZkLl"
Content-Disposition: inline


--4hmTAJAngH+SZkLl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.11.04 13:31:48 +0800, Tina Zhang wrote:
> The region of pvinfo is reserved for communication between a VMM and
> the GPU driver executing on a virtual machine. HW doesn't have any
> backing mmio store support for the pvinfo region, thus accessing to
> this range through MMIO read/write from host side is forbidden which
> is regarded as unclaimed register access.
>=20
> This patch leaves pvinfo range be initialized with zero.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index afd7f66bdc2d..bd12af349123 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3420,6 +3420,10 @@ int intel_gvt_for_each_tracked_mmio(struct intel_g=
vt *gvt,
>  	}
> =20
>  	for (i =3D 0; i < gvt->mmio.num_mmio_block; i++, block++) {
> +		/* pvinfo data doesn't come from hw mmio */
> +		if (i915_mmio_reg_offset(block->offset) =3D=3D VGT_PVINFO_PAGE)
> +			continue;

Equal to remove PVINFO in mmio_block list? Could we just remove it there in=
stead
of this special case?

> +
>  		for (j =3D 0; j < block->size; j +=3D 4) {
>  			ret =3D handler(gvt,
>  				      i915_mmio_reg_offset(block->offset) + j,
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4hmTAJAngH+SZkLl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXcDkTwAKCRCxBBozTXgY
J3h8AJsGOF85/ShUqjQi+QEHcEMyhnioJQCfc8ym3uqqgj+odGnNgdGFSpxCDF8=
=Vj/6
-----END PGP SIGNATURE-----

--4hmTAJAngH+SZkLl--

--===============0776822970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0776822970==--
