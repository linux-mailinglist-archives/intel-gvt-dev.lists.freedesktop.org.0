Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382191EA91
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 May 2019 11:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F9F894D4;
	Wed, 15 May 2019 09:02:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DCC894D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 May 2019 09:02:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 02:02:12 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 15 May 2019 02:02:10 -0700
Date: Wed, 15 May 2019 17:01:23 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: cancel dma map only for not present
 ggtt entry
Message-ID: <20190515090123.GU12913@zhen-hp.sh.intel.com>
References: <20190515081921.4394-1-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190515081921.4394-1-xiaolin.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com
Content-Type: multipart/mixed; boundary="===============1042552653=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1042552653==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WqttXA4Bds05TaHY"
Content-Disposition: inline


--WqttXA4Bds05TaHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.15 16:19:21 +0800, Xiaolin Zhang wrote:
> only cancel ggtt entry dma map for invalid ggtt entry, don't do it
> for paritial update or old ggtt entry.
>=20
> this change can address DMA "fault reason 23" issue for win guest with
> intel iommu on.
>=20
> v2: update handling of ggtt partial update (Zhenyu, Yan, Henry)
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index c2f7d20f6346..4856b9fec411 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2243,10 +2243,21 @@ static int emulate_ggtt_mmio_write(struct intel_v=
gpu *vgpu, unsigned int off,
>  		}
>  	}
> =20
> -	if (!partial_update && (ops->test_present(&e))) {
> +	if (!ops->test_present(&e)) {
> +		ggtt_get_host_entry(ggtt_mm, &m, g_gtt_index);
> +		ggtt_invalidate_pte(vgpu, &m);
> +		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> +		ops->clear_present(&m);
> +	} else {
>  		gfn =3D ops->get_pfn(&e);
>  		m =3D e;
> =20
> +		if (partial_update) {
> +			ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> +			ops->clear_present(&m);
> +			goto out;
> +		}
> +
>  		/* one PTE update may be issued in multiple writes and the
>  		 * first write may not construct a valid gfn
>  		 */
> @@ -2266,17 +2277,9 @@ static int emulate_ggtt_mmio_write(struct intel_vg=
pu *vgpu, unsigned int off,
>  			ops->set_pfn(&m, gvt->gtt.scratch_mfn);
>  		} else
>  			ops->set_pfn(&m, dma_addr >> PAGE_SHIFT);
> -	} else {
> -		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> -		ops->clear_present(&m);
>  	}
> -
>  out:
>  	ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
> -
> -	ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
> -	ggtt_invalidate_pte(vgpu, &e);
> -
>  	ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
>  	ggtt_invalidate(gvt->dev_priv);
>  	return 0;
> --=20

How about below simpler change?

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 08c74e65836b..8f27db9d7a1e 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2269,16 +2269,16 @@ static int emulate_ggtt_mmio_write(struct intel_vgp=
u *vgpu, unsigned int off,
 			ops->set_pfn(&m, gvt->gtt.scratch_mfn);
 		} else
 			ops->set_pfn(&m, dma_addr >> PAGE_SHIFT);
-	} else {
+	} else
 		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
-		ops->clear_present(&m);
-	}
=20
 out:
 	ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
=20
-	ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
-	ggtt_invalidate_pte(vgpu, &e);
+	if (!partial_update) {
+		ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
+		ggtt_invalidate_pte(vgpu, &e);
+	}
=20
 	ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
 	ggtt_invalidate(gvt->dev_priv);


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--WqttXA4Bds05TaHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNvVYwAKCRCxBBozTXgY
J5klAKCbrDEQ9XXPkHDTdlL7Sd4a9BKHoQCeILD/W5Js2dz0qMxiuQRmpoveKGs=
=yLdX
-----END PGP SIGNATURE-----

--WqttXA4Bds05TaHY--

--===============1042552653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1042552653==--
