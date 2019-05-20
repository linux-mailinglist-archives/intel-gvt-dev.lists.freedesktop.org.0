Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71EA22B8B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 07:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA88891B3;
	Mon, 20 May 2019 05:58:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096B891B3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 05:58:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 22:58:47 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2019 22:58:46 -0700
Date: Mon, 20 May 2019 13:57:48 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
Message-ID: <20190520055748.GG12913@zhen-hp.sh.intel.com>
References: <20190520053649.5906-1-tina.zhang@intel.com>
 <20190520053649.5906-3-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190520053649.5906-3-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0084648175=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0084648175==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VZx/YQmuLnG2i5Iq"
Content-Disposition: inline


--VZx/YQmuLnG2i5Iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.20 13:36:49 +0800, Tina Zhang wrote:
> In stack, intel_gvt_gtt_entry needs to be initialized before
> being used, as the fields may have some garbage values.
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
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index dcc207f04b75..bcb649285707 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2193,7 +2193,7 @@ static int emulate_ggtt_mmio_write(struct intel_vgp=
u *vgpu, unsigned int off,
>  	/* the VM may configure the whole GM space when ballooning is used */
>  	if (!vgpu_gmadr_is_valid(vgpu, gma))
>  		return 0;
> -
> +	e.val64 =3D 0;

Could we just initialize it during declaration?

>  	e.type =3D GTT_TYPE_GGTT_PTE;
>  	memcpy((void *)&e.val64 + (off & (info->gtt_entry_size - 1)), p_data,
>  			bytes);
> @@ -2246,7 +2246,8 @@ static int emulate_ggtt_mmio_write(struct intel_vgp=
u *vgpu, unsigned int off,
> =20
>  	if (!partial_update && (ops->test_present(&e))) {
>  		gfn =3D ops->get_pfn(&e);
> -		m =3D e;
> +		m.val64 =3D e.val64;
> +		m.type =3D e.type;

Better just memcpy which doesn't depend on struct definition.

> =20
>  		/* one PTE update may be issued in multiple writes and the
>  		 * first write may not construct a valid gfn
> @@ -2268,6 +2269,8 @@ static int emulate_ggtt_mmio_write(struct intel_vgp=
u *vgpu, unsigned int off,
>  		} else
>  			ops->set_pfn(&m, dma_addr >> PAGE_SHIFT);
>  	} else {
> +		m.val64 =3D 0;
> +		m.type =3D GTT_TYPE_GGTT_PTE;
>  		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
>  		ops->clear_present(&m);
>  	}
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--VZx/YQmuLnG2i5Iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOJB3AAKCRCxBBozTXgY
J2Z9AJ9PxVCDLuBhh6DZIZXtD2r1b4FlfwCfW9N/DjnYkascTkNs8RRw+LPH2xw=
=rPZk
-----END PGP SIGNATURE-----

--VZx/YQmuLnG2i5Iq--

--===============0084648175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0084648175==--
