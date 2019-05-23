Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B627489
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 04:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10F789C52;
	Thu, 23 May 2019 02:48:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC96E89C52
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 02:48:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 19:48:49 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 22 May 2019 19:48:48 -0700
Date: Thu, 23 May 2019 10:47:44 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
Message-ID: <20190523024744.GN12913@zhen-hp.sh.intel.com>
References: <20190522221836.3777-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190522221836.3777-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0009239070=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0009239070==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KnD4IZsf9tI8pAcs"
Content-Disposition: inline


--KnD4IZsf9tI8pAcs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.23 06:18:36 +0800, Tina Zhang wrote:
> Stack struct intel_gvt_gtt_entry value needs to be initialized before
> being used, as the fields may contain garbage values.
>=20
> W/o this patch, set_ggtt_entry prints:
> -------------------------------------
> 274.046840: set_ggtt_entry: vgpu1:set ggtt entry 0x9bed8000ffffe900
> 274.046846: set_ggtt_entry: vgpu1:set ggtt entry 0xe55df001
> 274.046852: set_ggtt_entry: vgpu1:set ggtt entry 0x9bed8000ffffe900
>=20
> 0x9bed8000 is the stack grabage.
>=20
> W/ this patch, set_ggtt_entry prints:
> ------------------------------------
> 274.046840: set_ggtt_entry: vgpu1:set ggtt entry 0xffffe900
> 274.046846: set_ggtt_entry: vgpu1:set ggtt entry 0xe55df001
> 274.046852: set_ggtt_entry: vgpu1:set ggtt entry 0xffffe900
>=20
> v2:
> - Initialize during declaration. (Zhenyu)
>=20
> Fixes: 7598e8700e9a(drm/i915/gvt: Missed to cancel dma map for ggtt entri=
es)
> Cc: stable@vger.kernel.org # v4.20+
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---

Will merge this, thanks for the fix!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/gtt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 15216c5b40aa..ebc1e5228bf5 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2179,7 +2179,8 @@ static int emulate_ggtt_mmio_write(struct intel_vgp=
u *vgpu, unsigned int off,
>  	struct intel_gvt_gtt_pte_ops *ops =3D gvt->gtt.pte_ops;
>  	unsigned long g_gtt_index =3D off >> info->gtt_entry_size_shift;
>  	unsigned long gma, gfn;
> -	struct intel_gvt_gtt_entry e, m;
> +	struct intel_gvt_gtt_entry e =3D {.val64 =3D 0, .type =3D GTT_TYPE_GGTT=
_PTE};
> +	struct intel_gvt_gtt_entry m =3D {.val64 =3D 0, .type =3D GTT_TYPE_GGTT=
_PTE};
>  	dma_addr_t dma_addr;
>  	int ret;
>  	struct intel_gvt_partial_pte *partial_pte, *pos, *n;
> @@ -2246,7 +2247,8 @@ static int emulate_ggtt_mmio_write(struct intel_vgp=
u *vgpu, unsigned int off,
> =20
>  	if (!partial_update && (ops->test_present(&e))) {
>  		gfn =3D ops->get_pfn(&e);
> -		m =3D e;
> +		m.val64 =3D e.val64;
> +		m.type =3D e.type;
> =20
>  		/* one PTE update may be issued in multiple writes and the
>  		 * first write may not construct a valid gfn
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--KnD4IZsf9tI8pAcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOYJ0AAKCRCxBBozTXgY
J6tPAJ9YteHvzJFrM8IM3ifi/2w7n8qDqACdFHDZT0O7bsij5iAPlY7KQfJxJg8=
=y883
-----END PGP SIGNATURE-----

--KnD4IZsf9tI8pAcs--

--===============0009239070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0009239070==--
