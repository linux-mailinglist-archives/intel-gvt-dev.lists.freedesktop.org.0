Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4426B706
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Jul 2019 08:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAC06E23B;
	Wed, 17 Jul 2019 06:55:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1668F6E23D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Jul 2019 06:55:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 23:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; 
 d="asc'?scan'208";a="158372510"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga007.jf.intel.com with ESMTP; 16 Jul 2019 23:55:45 -0700
Date: Wed, 17 Jul 2019 14:52:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: addressed vGPU hang during OCL conformance
 test
Message-ID: <20190717065237.GX16681@zhen-hp.sh.intel.com>
References: <1563372360-38030-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1563372360-38030-1-git-send-email-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0499460859=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0499460859==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="psiTe9LjpVyD9953"
Content-Disposition: inline


--psiTe9LjpVyD9953
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Better change title on the driver issue this fixes.

On 2019.07.17 22:06:00 +0800, Xiaolin Zhang wrote:
> GPU hang observed during the guest OCL conformance test which is caused
> by THP GTT feature used durning the test.
>=20
> it was observed the same GFN with different size (4K and 2M) requested
> from the quest in GVT. so during the guest page dma map stage, it is
> required to unmap first with orginal size and then remap again with
> requested size.
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
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

looks good to me. This should deserve to cc stable kernel.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

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

--psiTe9LjpVyD9953
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXS7FtQAKCRCxBBozTXgY
Jz0NAKCGFuxVMQDCRiKNEtkK3Qur5bXQ4ACeOR9ZBHfD8yWa9CPzKyaF46uff9o=
=pMEE
-----END PGP SIGNATURE-----

--psiTe9LjpVyD9953--

--===============0499460859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0499460859==--
