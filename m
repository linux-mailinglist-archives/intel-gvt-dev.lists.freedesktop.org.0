Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80B26056
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 May 2019 11:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3A289725;
	Wed, 22 May 2019 09:20:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9948889725
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 May 2019 09:20:49 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 02:20:49 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 22 May 2019 02:20:48 -0700
Date: Wed, 22 May 2019 17:19:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH V2] drm/i915/gvt: save RING_HEAD into vreg when vgpu
 switched out
Message-ID: <20190522091945.GL12913@zhen-hp.sh.intel.com>
References: <1558501680-15920-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1558501680-15920-1-git-send-email-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0019045074=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0019045074==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fnQcXX7HS76HjDan"
Content-Disposition: inline


--fnQcXX7HS76HjDan
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.22 13:08:00 +0800, Xiaolin Zhang wrote:
> to save RING_HEAD into vgpu reg when vgpu switched out and report
> it's value back to guest.
>=20
> v2: save RING_TAIL as well during vgpu mmio switch to meet ring_is_idle
> condition. (Fred Gao)
> v1: based on input from Weinan. (Weinan Li)
>=20
> Fixes: 519a019491b8 ("drm/i915/hangcheck: Replace hangcheck.seqno with RI=
NG_HEAD")
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 96e1edf..758a8b3 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -457,6 +457,7 @@ static void switch_mmio(struct intel_vgpu *pre,
>  	struct intel_vgpu_submission *s;
>  	struct engine_mmio *mmio;
>  	u32 old_v, new_v;
> +	u32 ring_base;
> =20
>  	dev_priv =3D pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
>  	if (INTEL_GEN(dev_priv) >=3D 9)
> @@ -519,6 +520,14 @@ static void switch_mmio(struct intel_vgpu *pre,
>  				  old_v, new_v);
>  	}
> =20
> +	if (pre) {
> +		ring_base =3D dev_priv->engine[ring_id]->mmio_base;
> +		vgpu_vreg_t(pre, RING_HEAD(ring_base)) =3D
> +				I915_READ_FW(RING_HEAD(ring_base));
> +		vgpu_vreg_t(pre, RING_TAIL(ring_base)) =3D
> +				I915_READ_FW(RING_TAIL(ring_base));
> +	}
> +

I think we should put these into save_ring_hw_state() to capture each
state change, instead of lagging until switch time?

>  	if (next)
>  		handle_tlb_pending_event(next, ring_id);
>  }
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

--fnQcXX7HS76HjDan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOUUMQAKCRCxBBozTXgY
J0SBAJ987DwCZJhTnDOEVUYknYOFv0GIdwCfX2koTnhLgZOH0im3ceinyRfiHE8=
=tjwc
-----END PGP SIGNATURE-----

--fnQcXX7HS76HjDan--

--===============0019045074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0019045074==--
