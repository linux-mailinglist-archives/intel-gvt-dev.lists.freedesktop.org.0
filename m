Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1006C5A6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 05:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77E76E2F3;
	Thu, 18 Jul 2019 03:08:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6E66E2F3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 03:08:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 20:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; 
 d="asc'?scan'208";a="343232767"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 17 Jul 2019 20:08:51 -0700
Date: Thu, 18 Jul 2019 11:05:41 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: fix incorrect cache entry for guest page
 mapping
Message-ID: <20190718030541.GC16681@zhen-hp.sh.intel.com>
References: <1563383424-23315-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1563383424-23315-1-git-send-email-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1843849494=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1843849494==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p11K2BJEgMZL61bg"
Content-Disposition: inline


--p11K2BJEgMZL61bg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.18 01:10:24 +0800, Xiaolin Zhang wrote:
> GPU hang observed during the guest OCL conformance test which is caused
> by THP GTT feature used durning the test.
>=20
> It was observed the same GFN with different size (4K and 2M) requested
> from the guest in GVT. So during the guest page dma map stage, it is
> required to unmap first with orginal size and then remap again with
> requested size.
>=20
> Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---

Applied, thanks!

>  drivers/gpu/drm/i915/gvt/kvmgt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index a68addf..4a7cf86 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1911,6 +1911,18 @@ static int kvmgt_dma_map_guest_page(unsigned long =
handle, unsigned long gfn,
>  		ret =3D __gvt_cache_add(info->vgpu, gfn, *dma_addr, size);
>  		if (ret)
>  			goto err_unmap;
> +	} else if (entry->size !=3D size) {
> +		/* the same gfn with different size: unmap and re-map */
> +		gvt_dma_unmap_page(vgpu, gfn, entry->dma_addr, entry->size);
> +		__gvt_cache_remove_entry(vgpu, entry);
> +
> +		ret =3D gvt_dma_map_page(vgpu, gfn, dma_addr, size);
> +		if (ret)
> +			goto err_unlock;
> +
> +		ret =3D __gvt_cache_add(info->vgpu, gfn, *dma_addr, size);
> +		if (ret)
> +			goto err_unmap;
>  	} else {
>  		kref_get(&entry->ref);
>  		*dma_addr =3D entry->dma_addr;
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--p11K2BJEgMZL61bg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXS/iBQAKCRCxBBozTXgY
J8AZAJ994iBkcLjTJOZSs5VsyDpn7kn+RQCdEyVtanjb3XVy00Ve6A12JZpZaMw=
=jkcs
-----END PGP SIGNATURE-----

--p11K2BJEgMZL61bg--

--===============1843849494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1843849494==--
