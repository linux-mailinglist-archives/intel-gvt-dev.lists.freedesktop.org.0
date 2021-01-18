Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970FE2F994F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Jan 2021 06:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114889EF7;
	Mon, 18 Jan 2021 05:34:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FD889EF7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jan 2021 05:34:48 +0000 (UTC)
IronPort-SDR: PdW2mCOokXhk8//QzHzypEbuUiNZaL602RhCj6eO2vlb0fLuOYJaOwk9d4DbBu8xIpcjssOcQR
 YlSqlaTHPnzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="242831593"
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; 
 d="asc'?scan'208";a="242831593"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 21:34:47 -0800
IronPort-SDR: wbM0RbZRjKe8+fuIc98Xafb/g3YFdGNiNu8XFUY2bzig3IEbfrJgJu1eOO4LoXFSxKlywr4wZ/
 WJNkGzOmwG2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; 
 d="asc'?scan'208";a="399011508"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2021 21:34:45 -0800
Date: Mon, 18 Jan 2021 13:17:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: Introduce per object locking in GVT
 scheduler.
Message-ID: <20210118051757.GZ15982@zhen-hp.sh.intel.com>
References: <1610314985-26065-1-git-send-email-zhi.wang.linux@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1610314985-26065-1-git-send-email-zhi.wang.linux@gmail.com>
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1349699967=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1349699967==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.01.10 23:43:05 +0200, Zhi Wang wrote:
> To support ww locking and per-object implemented in i915, GVT scheduler n=
eeds
> to be refined. Most of the changes are located in shadow batch buffer, sh=
adow
> wa context in GVT-g, where use quite a lot of i915 gem object APIs.
>=20
> v2:
>=20
> - Adjust the usage of ww lock on context pin/unpin. (maarten)
> - Rebase the patch on the newest staging branch.
>=20
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---

Looks fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/scheduler.c | 49 +++++++++++++++++++++++++++++-=
------
>  1 file changed, 40 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 43f31c2..4dfa418 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -412,7 +412,9 @@ static void release_shadow_wa_ctx(struct intel_shadow=
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
> @@ -520,6 +522,7 @@ static int prepare_shadow_batch_buffer(struct intel_v=
gpu_workload *workload)
>  	struct intel_gvt *gvt =3D workload->vgpu->gvt;
>  	const int gmadr_bytes =3D gvt->device_info.gmadr_bytes_in_cmd;
>  	struct intel_vgpu_shadow_bb *bb;
> +	struct i915_gem_ww_ctx ww;
>  	int ret;
> =20
>  	list_for_each_entry(bb, &workload->shadow_bb, list) {
> @@ -544,10 +547,19 @@ static int prepare_shadow_batch_buffer(struct intel=
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
> @@ -561,13 +573,15 @@ static int prepare_shadow_batch_buffer(struct intel=
_vgpu_workload *workload)
>  						      0);
>  			if (ret)
>  				goto err;
> -		}
> =20
> -		/* No one is going to touch shadow bb from now on. */
> -		i915_gem_object_flush_map(bb->obj);
> +			/* No one is going to touch shadow bb from now on. */
> +			i915_gem_object_flush_map(bb->obj);
> +			i915_gem_object_unlock(bb->obj);
> +		}
>  	}
>  	return 0;
>  err:
> +	i915_gem_ww_ctx_fini(&ww);
>  	release_shadow_batch_buffer(workload);
>  	return ret;
>  }
> @@ -594,14 +608,29 @@ static int prepare_shadow_wa_ctx(struct intel_shado=
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
> =20
>  	/* FIXME: we are not tracking our pinned VMA leaving it
>  	 * up to the core to fix up the stray pin_count upon
> @@ -635,12 +664,14 @@ static void release_shadow_batch_buffer(struct inte=
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
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYAUaAAAKCRCxBBozTXgY
JxiKAKCdKsr8jwlqfi80O/Kp5YiMHXcCFQCfVNWOuF9Ha/5on7AGznyMHkKoJg4=
=S2g1
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--

--===============1349699967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1349699967==--
