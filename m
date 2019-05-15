Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0A1E821
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 May 2019 08:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9FD892EF;
	Wed, 15 May 2019 06:08:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1888B892EF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 May 2019 06:08:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 23:08:22 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 14 May 2019 23:08:21 -0700
Date: Wed, 15 May 2019 14:07:34 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: cancel dma map only for not present ggtt
 entry
Message-ID: <20190515060734.GT12913@zhen-hp.sh.intel.com>
References: <20190515060559.7506-1-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190515060559.7506-1-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1157498336=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1157498336==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Eo/fsYe8uqGHvExr"
Content-Disposition: inline


--Eo/fsYe8uqGHvExr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.15 14:05:59 +0800, Xiaolin Zhang wrote:
> only cancel ggtt entry dma map for invalid ggtt entry, don't do it
> for paritial update or old ggtt entry.
>=20
> this change can address DMA "fault reason 23" issue for win guest with
> intel iommu on.
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index c2f7d20f6346..6d021d830f37 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2243,7 +2243,12 @@ static int emulate_ggtt_mmio_write(struct intel_vg=
pu *vgpu, unsigned int off,
>  		}
>  	}
> =20
> -	if (!partial_update && (ops->test_present(&e))) {
> +	if (!ops->test_present(&e)) {
> +		ggtt_get_host_entry(ggtt_mm, &m, g_gtt_index);
> +		ggtt_invalidate_pte(vgpu, &m);
> +		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> +		ops->clear_present(&m);
> +	} else if (!partial_update && (ops->test_present(&e))) {
>  		gfn =3D ops->get_pfn(&e);
>  		m =3D e;

I think this makes condition check a bit cumbersome, as the special case
you need to handle is for partial_update instead of test_present.

> =20
> @@ -2266,19 +2271,11 @@ static int emulate_ggtt_mmio_write(struct intel_v=
gpu *vgpu, unsigned int off,
>  			ops->set_pfn(&m, gvt->gtt.scratch_mfn);
>  		} else
>  			ops->set_pfn(&m, dma_addr >> PAGE_SHIFT);
> -	} else {
> -		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> -		ops->clear_present(&m);
>  	}
> -
>  out:
> -	ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
> -
> -	ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
> -	ggtt_invalidate_pte(vgpu, &e);

Can we do unmap for !partial_update only and remove above clear_present?
So still use scratch for host in case of partial update.

> -
>  	ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
>  	ggtt_invalidate(gvt->dev_priv);
> +	ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
>  	return 0;
>  }
> =20
> --=20
> 2.15.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Eo/fsYe8uqGHvExr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNuspgAKCRCxBBozTXgY
J8YIAJwL0jRqLoOsP1Qyb92p9ogIcB2dlwCdGQoSOtKMvAxkK1g3+aRT6xAqH3Y=
=T6SE
-----END PGP SIGNATURE-----

--Eo/fsYe8uqGHvExr--

--===============1157498336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1157498336==--
