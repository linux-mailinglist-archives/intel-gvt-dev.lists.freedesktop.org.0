Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1E260E9D
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 11:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5878B6E5D5;
	Tue,  8 Sep 2020 09:25:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7946E5D3;
 Tue,  8 Sep 2020 09:25:03 +0000 (UTC)
IronPort-SDR: bff3409VNWkSvScnzM/Bacxb2bdPxRcpxQY1IKuenACjwZ355RmBAjUPMW5hk6CIT7Wz6BHrFd
 81zH2tpwQTgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145810542"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
 d="asc'?scan'208";a="145810542"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:25:02 -0700
IronPort-SDR: TZZYT36tOIPZoK2OXwx5ENwSMeNK1gBFlFPeEudK3xPqjJF9oOQejPiwKinLgfSliWATTecLKk
 MdQCobaTApvA==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
 d="asc'?scan'208";a="479946798"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:25:00 -0700
Date: Tue, 8 Sep 2020 17:05:47 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Introduce per object locking in GVT
 scheduler.
Message-ID: <20200908090547.GA1426@zhen-hp.sh.intel.com>
References: <20200907200203.535-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200907200203.535-1-zhi.a.wang@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============1716628338=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1716628338==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.07 23:02:03 +0300, Zhi Wang wrote:
> To support ww locking and per-object implemented in i915, GVT scheduler n=
eeds
> to be refined. Most of the changes are located in shadow batch buffer, sh=
adow
> wa context in GVT-g, where use quite a lot of i915 gem object APIs.
>=20
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 68 ++++++++++++++++++++++++++++++=
------
>  1 file changed, 57 insertions(+), 11 deletions(-)

Looks ok to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Pls verify against latest gvt-staging then create pull against gt-next
for 5.10.

Thanks

>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 1570eb8..fe7ee10 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -396,7 +396,9 @@ static void release_shadow_wa_ctx(struct intel_shadow=
_wa_ctx *wa_ctx)
>  	if (!wa_ctx->indirect_ctx.obj)
>  		return;
> =20
> +	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, NULL);
>  	i915_gem_object_unpin_map(wa_ctx->indirect_ctx.obj);
> +	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
>  	i915_gem_object_put(wa_ctx->indirect_ctx.obj);
> =20
>  	wa_ctx->indirect_ctx.obj =3D NULL;
> @@ -504,6 +506,7 @@ static int prepare_shadow_batch_buffer(struct intel_v=
gpu_workload *workload)
>  	struct intel_gvt *gvt =3D workload->vgpu->gvt;
>  	const int gmadr_bytes =3D gvt->device_info.gmadr_bytes_in_cmd;
>  	struct intel_vgpu_shadow_bb *bb;
> +	struct i915_gem_ww_ctx ww;
>  	int ret;
> =20
>  	list_for_each_entry(bb, &workload->shadow_bb, list) {
> @@ -528,10 +531,19 @@ static int prepare_shadow_batch_buffer(struct intel=
_vgpu_workload *workload)
>  		 * directly
>  		 */
>  		if (!bb->ppgtt) {
> -			bb->vma =3D i915_gem_object_ggtt_pin(bb->obj,
> -							   NULL, 0, 0, 0);
> +			i915_gem_ww_ctx_init(&ww, false);
> +retry:
> +			i915_gem_object_lock(bb->obj, &ww);
> +
> +			bb->vma =3D i915_gem_object_ggtt_pin_ww(bb->obj, &ww,
> +							      NULL, 0, 0, 0);
>  			if (IS_ERR(bb->vma)) {
>  				ret =3D PTR_ERR(bb->vma);
> +				if (ret =3D=3D -EDEADLK) {
> +					ret =3D i915_gem_ww_ctx_backoff(&ww);
> +					if (!ret)
> +						goto retry;
> +				}
>  				goto err;
>  			}
> =20
> @@ -545,13 +557,18 @@ static int prepare_shadow_batch_buffer(struct intel=
_vgpu_workload *workload)
>  						      0);
>  			if (ret)
>  				goto err;
> +
> +			/* No one is going to touch shadow bb from now on. */
> +			i915_gem_object_flush_map(bb->obj);
> +
> +			i915_gem_object_unlock(bb->obj);
> +			i915_gem_ww_ctx_fini(&ww);
>  		}
> =20
> -		/* No one is going to touch shadow bb from now on. */
> -		i915_gem_object_flush_map(bb->obj);
>  	}
>  	return 0;
>  err:
> +	i915_gem_ww_ctx_fini(&ww);
>  	release_shadow_batch_buffer(workload);
>  	return ret;
>  }
> @@ -578,14 +595,30 @@ static int prepare_shadow_wa_ctx(struct intel_shado=
w_wa_ctx *wa_ctx)
>  	unsigned char *per_ctx_va =3D
>  		(unsigned char *)wa_ctx->indirect_ctx.shadow_va +
>  		wa_ctx->indirect_ctx.size;
> +	struct i915_gem_ww_ctx ww;
> +	int ret;
> =20
>  	if (wa_ctx->indirect_ctx.size =3D=3D 0)
>  		return 0;
> =20
> -	vma =3D i915_gem_object_ggtt_pin(wa_ctx->indirect_ctx.obj, NULL,
> -				       0, CACHELINE_BYTES, 0);
> -	if (IS_ERR(vma))
> -		return PTR_ERR(vma);
> +	i915_gem_ww_ctx_init(&ww, false);
> +retry:
> +	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, &ww);
> +
> +	vma =3D i915_gem_object_ggtt_pin_ww(wa_ctx->indirect_ctx.obj, &ww, NULL,
> +					  0, CACHELINE_BYTES, 0);
> +	if (IS_ERR(vma)) {
> +		ret =3D PTR_ERR(vma);
> +		if (ret =3D=3D -EDEADLK) {
> +			ret =3D i915_gem_ww_ctx_backoff(&ww);
> +			if (!ret)
> +				goto retry;
> +		}
> +		return ret;
> +	}
> +
> +	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
> +	i915_gem_ww_ctx_fini(&ww);
> =20
>  	/* FIXME: we are not tracking our pinned VMA leaving it
>  	 * up to the core to fix up the stray pin_count upon
> @@ -619,12 +652,14 @@ static void release_shadow_batch_buffer(struct inte=
l_vgpu_workload *workload)
> =20
>  	list_for_each_entry_safe(bb, pos, &workload->shadow_bb, list) {
>  		if (bb->obj) {
> +			i915_gem_object_lock(bb->obj, NULL);
>  			if (bb->va && !IS_ERR(bb->va))
>  				i915_gem_object_unpin_map(bb->obj);
> =20
>  			if (bb->vma && !IS_ERR(bb->vma))
>  				i915_vma_unpin(bb->vma);
> =20
> +			i915_gem_object_unlock(bb->obj);
>  			i915_gem_object_put(bb->obj);
>  		}
>  		list_del(&bb->list);
> @@ -1337,6 +1372,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *=
vgpu)
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	struct intel_engine_cs *engine;
>  	struct i915_ppgtt *ppgtt;
> +	struct i915_gem_ww_ctx ww;
>  	enum intel_engine_id i;
>  	int ret;
> =20
> @@ -1368,11 +1404,20 @@ int intel_vgpu_setup_submission(struct intel_vgpu=
 *vgpu)
> =20
>  			ce->ring =3D __intel_context_ring_size(ring_size);
>  		}
> +		i915_gem_ww_ctx_init(&ww, false);
> +retry:
> +		ret =3D intel_context_pin_ww(ce, &ww);
> +		if (ret) {
> +			if (ret =3D=3D -EDEADLK) {
> +				ret =3D i915_gem_ww_ctx_backoff(&ww);
> +				if (!ret)
> +					goto retry;
> +			}
> +			goto out_shadow_ctx;
> +		}
> =20
> -		ret =3D intel_context_pin(ce);
>  		intel_context_put(ce);
> -		if (ret)
> -			goto out_shadow_ctx;
> +		i915_gem_ww_ctx_fini(&ww);
> =20
>  		s->shadow[i] =3D ce;
>  	}
> @@ -1400,6 +1445,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *=
vgpu)
>  	return 0;
> =20
>  out_shadow_ctx:
> +	i915_gem_ww_ctx_fini(&ww);
>  	i915_context_ppgtt_root_restore(s, ppgtt);
>  	for_each_engine(engine, vgpu->gvt->gt, i) {
>  		if (IS_ERR(s->shadow[i]))
> --=20
> 2.7.4
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1dJawAKCRCxBBozTXgY
JzddAJ9myE0gx412sFmM3wggVz3mpbBo9wCfQ4Jub6WAJYMoHyZy/8l4+SOydi4=
=++Tw
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--

--===============1716628338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1716628338==--
