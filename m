Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515029FA38
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Aug 2019 08:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1790689958;
	Wed, 28 Aug 2019 06:11:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFAC89958;
 Wed, 28 Aug 2019 06:11:44 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 23:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; 
 d="asc'?scan'208";a="192483221"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 27 Aug 2019 23:11:42 -0700
Date: Wed, 28 Aug 2019 14:06:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiong Zhang <xiong.y.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915: Move vgpu balloon info into
 i915_virtual_gpu struct
Message-ID: <20190828060659.GA4868@zhen-hp.sh.intel.com>
References: <1566279978-9659-2-git-send-email-xiong.y.zhang@intel.com>
 <1566357790-5003-1-git-send-email-xiong.y.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1566357790-5003-1-git-send-email-xiong.y.zhang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0729228355=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0729228355==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.08.21 11:23:10 +0800, Xiong Zhang wrote:
> vgpu ballon info consists of four drm_mm_node which is used to reserve
> ggtt space, then linux guest won't use these reserved ggtt space.
>=20
> Each vgpu has its own ballon info, so move ballon info into
> i915_virtual_gpu structure.
>=20
> v2: Fix dim PARENTHESIS_ALIGNMENT check warning
>=20
> Signed-off-by: Xiong Zhang <xiong.y.zhang@intel.com>
> ---

Looks fine to me. You need to refresh after deballoon fix merged.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/i915_drv.h  | 14 ++++++++++++++
>  drivers/gpu/drm/i915/i915_vgpu.c | 40 +++++++++++++++++-----------------=
------
>  2 files changed, 31 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 18be8b2..9c14095 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1024,6 +1024,20 @@ struct i915_frontbuffer_tracking {
>  struct i915_virtual_gpu {
>  	bool active;
>  	u32 caps;
> +
> +	struct balloon_info {
> +		/*
> +		 * There are up to 2 regions per mappable/unmappable graphic
> +		 * memory that might be ballooned. Here, index 0/1 is for
> +		 * mappable graphic memory, 2/3 for unmappable graphic memory.
> +		 */
> +#define VGPU_MAPPABLE_BALLOON_LOW     0
> +#define VGPU_MAPPABLE_BALLOON_HIGH    1
> +#define VGPU_UNMAPPABLE_BALLOON_LOW   2
> +#define VGPU_UNMAPPABLE_BALLOON_HIGH  3
> +#define VGPU_MAX_BALLOON_NUM          4
> +		struct drm_mm_node space[VGPU_MAX_BALLOON_NUM];
> +	} bl_info;
>  };
> =20
>  /* used in computing the new watermarks state */
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915=
_vgpu.c
> index d2fd66f..0ed35f4 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -105,17 +105,6 @@ bool intel_vgpu_has_full_ppgtt(struct drm_i915_priva=
te *dev_priv)
>  	return dev_priv->vgpu.caps & VGT_CAPS_FULL_PPGTT;
>  }
> =20
> -struct _balloon_info_ {
> -	/*
> -	 * There are up to 2 regions per mappable/unmappable graphic
> -	 * memory that might be ballooned. Here, index 0/1 is for mappable
> -	 * graphic memory, 2/3 for unmappable graphic memory.
> -	 */
> -	struct drm_mm_node space[4];
> -};
> -
> -static struct _balloon_info_ bl_info;
> -
>  static void vgt_deballoon_space(struct i915_ggtt *ggtt,
>  				struct drm_mm_node *node)
>  {
> @@ -140,15 +129,16 @@ static void vgt_deballoon_space(struct i915_ggtt *g=
gtt,
>   */
>  void intel_vgt_deballoon(struct i915_ggtt *ggtt)
>  {
> +	struct drm_i915_private *dev_priv =3D ggtt->vm.i915;
>  	int i;
> =20
> -	if (!intel_vgpu_active(ggtt->vm.i915))
> +	if (!intel_vgpu_active(dev_priv))
>  		return;
> =20
>  	DRM_DEBUG("VGT deballoon.\n");
> =20
> -	for (i =3D 0; i < 4; i++)
> -		vgt_deballoon_space(ggtt, &bl_info.space[i]);
> +	for (i =3D 0; i < VGPU_MAX_BALLOON_NUM; i++)
> +		vgt_deballoon_space(ggtt, &dev_priv->vgpu.bl_info.space[i]);
>  }
> =20
>  static int vgt_balloon_space(struct i915_ggtt *ggtt,
> @@ -219,6 +209,7 @@ static int vgt_balloon_space(struct i915_ggtt *ggtt,
>  int intel_vgt_balloon(struct i915_ggtt *ggtt)
>  {
>  	struct intel_uncore *uncore =3D &ggtt->vm.i915->uncore;
> +	struct drm_mm_node *space;
>  	unsigned long ggtt_end =3D ggtt->vm.total;
> =20
>  	unsigned long mappable_base, mappable_size, mappable_end;
> @@ -253,9 +244,11 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
>  		return -EINVAL;
>  	}
> =20
> +	space =3D ggtt->vm.i915->vgpu.bl_info.space;
>  	/* Unmappable graphic memory ballooning */
>  	if (unmappable_base > ggtt->mappable_end) {
> -		ret =3D vgt_balloon_space(ggtt, &bl_info.space[2],
> +		ret =3D vgt_balloon_space(ggtt,
> +					&space[VGPU_UNMAPPABLE_BALLOON_LOW],
>  					ggtt->mappable_end, unmappable_base);
> =20
>  		if (ret)
> @@ -263,7 +256,8 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
>  	}
> =20
>  	if (unmappable_end < ggtt_end) {
> -		ret =3D vgt_balloon_space(ggtt, &bl_info.space[3],
> +		ret =3D vgt_balloon_space(ggtt,
> +					&space[VGPU_UNMAPPABLE_BALLOON_HIGH],
>  					unmappable_end, ggtt_end);
>  		if (ret)
>  			goto err_upon_mappable;
> @@ -271,17 +265,17 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
> =20
>  	/* Mappable graphic memory ballooning */
>  	if (mappable_base) {
> -		ret =3D vgt_balloon_space(ggtt, &bl_info.space[0],
> +		ret =3D vgt_balloon_space(ggtt,
> +					&space[VGPU_MAPPABLE_BALLOON_LOW],
>  					0, mappable_base);
> -
>  		if (ret)
>  			goto err_upon_unmappable;
>  	}
> =20
>  	if (mappable_end < ggtt->mappable_end) {
> -		ret =3D vgt_balloon_space(ggtt, &bl_info.space[1],
> +		ret =3D vgt_balloon_space(ggtt,
> +					&space[VGPU_MAPPABLE_BALLOON_HIGH],
>  					mappable_end, ggtt->mappable_end);
> -
>  		if (ret)
>  			goto err_below_mappable;
>  	}
> @@ -290,11 +284,11 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
>  	return 0;
> =20
>  err_below_mappable:
> -	vgt_deballoon_space(ggtt, &bl_info.space[0]);
> +	vgt_deballoon_space(ggtt, &space[VGPU_MAPPABLE_BALLOON_LOW]);
>  err_upon_unmappable:
> -	vgt_deballoon_space(ggtt, &bl_info.space[3]);
> +	vgt_deballoon_space(ggtt, &space[VGPU_UNMAPPABLE_BALLOON_HIGH]);
>  err_upon_mappable:
> -	vgt_deballoon_space(ggtt, &bl_info.space[2]);
> +	vgt_deballoon_space(ggtt, &space[VGPU_UNMAPPABLE_BALLOON_LOW]);
>  err:
>  	DRM_ERROR("VGT balloon fail\n");
>  	return ret;
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

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXWYaAwAKCRCxBBozTXgY
J0EeAJ0RouK01hZJND7Ax0clEh1wsclGXgCfRgD/Wlj5vlhr/t7EgXIHzYPVJww=
=Bsgs
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--

--===============0729228355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0729228355==--
