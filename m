Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE45FF8D
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Jul 2019 04:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA706E3F5;
	Fri,  5 Jul 2019 02:44:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7D96E3F5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Jul 2019 02:44:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 19:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,453,1557212400"; 
 d="asc'?scan'208";a="191503248"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2019 19:44:04 -0700
Date: Fri, 5 Jul 2019 10:41:23 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v3] drm/i915/gvt: Adding ppgtt to GVT GEM context after
 shadow pdps settled.
Message-ID: <20190705024123.GX9684@zhen-hp.sh.intel.com>
References: <20190704084506.28360-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190704084506.28360-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1362595159=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1362595159==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rNtzt+pFA3UwHi4l"
Content-Disposition: inline


--rNtzt+pFA3UwHi4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.04 16:45:06 +0800, Colin Xu wrote:
> Windows guest can't run after force-TDR with host log:
> ...
> gvt: vgpu 1: workload shadow ppgtt isn't ready
> gvt: vgpu 1: fail to dispatch workload, skip
> ...
>=20
> The error is raised by set_context_ppgtt_from_shadow(), when it checks
> and found the shadow_mm isn't marked as shadowed.
>=20
> In work thread before each submission, a shadow_mm is set to shadowed in:
> shadow_ppgtt_mm()
> <-intel_vgpu_pin_mm()
> <-prepare_workload()
> <-dispatch_workload()
> <-workload_thread()
> However checking whether or not shadow_mm is shadowed is prior to it:
> set_context_ppgtt_from_shadow()
> <-dispatch_workload()
> <-workload_thread()
>=20
> In normal case, create workload will check the existence of shadow_mm,
> if not it will create a new one and marked as shadowed. If already exist
> it will reuse the old one. Since shadow_mm is reused, checking of shadowed
> in set_context_ppgtt_from_shadow() actually always see the state set in
> creation, but not the state set in intel_vgpu_pin_mm().
>=20
> When force-TDR, all engines are reset, since it's not dmlr level, all
> ppgtt_mm are invalidated but not destroyed. Invalidation will mark all
> reused shadow_mm as not shadowed but still keeps in ppgtt_mm_list_head.
> If workload submission phase those shadow_mm are reused with shadowed
> not set, then set_context_ppgtt_from_shadow() will report error.
>=20
> Pin for context after shadow_mm pinned and shadow pdps settled.
>=20
> Fixes: 4f15665ccbba (drm/i915: Add ppgtt to GVT GEM context)
>=20
> v2:
> Move set_context_ppgtt_from_shadow() after prepare_workload(). (zhenyu)
> v3:
> Move set_context_ppgtt_from_shadow() after shadow pdps updated.(zhenyu)
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Colin Xu <colin.xu@intel.com>

Applied, thanks!

> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 196b4155a309..9f3fd7d96a69 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -364,16 +364,13 @@ static void release_shadow_wa_ctx(struct intel_shad=
ow_wa_ctx *wa_ctx)
>  	wa_ctx->indirect_ctx.shadow_va =3D NULL;
>  }
> =20
> -static int set_context_ppgtt_from_shadow(struct intel_vgpu_workload *wor=
kload,
> -					 struct i915_gem_context *ctx)
> +static void set_context_ppgtt_from_shadow(struct intel_vgpu_workload *wo=
rkload,
> +					  struct i915_gem_context *ctx)
>  {
>  	struct intel_vgpu_mm *mm =3D workload->shadow_mm;
>  	struct i915_ppgtt *ppgtt =3D i915_vm_to_ppgtt(ctx->vm);
>  	int i =3D 0;
> =20
> -	if (mm->type !=3D INTEL_GVT_MM_PPGTT || !mm->ppgtt_mm.shadowed)
> -		return -EINVAL;
> -
>  	if (mm->ppgtt_mm.root_entry_type =3D=3D GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
>  		px_dma(ppgtt->pd) =3D mm->ppgtt_mm.shadow_pdps[0];
>  	} else {
> @@ -384,8 +381,6 @@ static int set_context_ppgtt_from_shadow(struct intel=
_vgpu_workload *workload,
>  			px_dma(pd) =3D mm->ppgtt_mm.shadow_pdps[i];
>  		}
>  	}
> -
> -	return 0;
>  }
> =20
>  static int
> @@ -614,6 +609,8 @@ static void release_shadow_batch_buffer(struct intel_=
vgpu_workload *workload)
>  static int prepare_workload(struct intel_vgpu_workload *workload)
>  {
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
> +	struct intel_vgpu_submission *s =3D &vgpu->submission;
> +	int ring =3D workload->ring_id;
>  	int ret =3D 0;
> =20
>  	ret =3D intel_vgpu_pin_mm(workload->shadow_mm);
> @@ -622,8 +619,16 @@ static int prepare_workload(struct intel_vgpu_worklo=
ad *workload)
>  		return ret;
>  	}
> =20
> +	if (workload->shadow_mm->type !=3D INTEL_GVT_MM_PPGTT ||
> +	    !workload->shadow_mm->ppgtt_mm.shadowed) {
> +		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
> +		return -EINVAL;
> +	}
> +
>  	update_shadow_pdps(workload);
> =20
> +	set_context_ppgtt_from_shadow(workload, s->shadow[ring]->gem_context);
> +
>  	ret =3D intel_vgpu_sync_oos_pages(workload->vgpu);
>  	if (ret) {
>  		gvt_vgpu_err("fail to vgpu sync oos pages\n");
> @@ -674,7 +679,6 @@ static int dispatch_workload(struct intel_vgpu_worklo=
ad *workload)
>  {
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	struct i915_request *rq;
>  	int ring_id =3D workload->ring_id;
>  	int ret;
> @@ -685,13 +689,6 @@ static int dispatch_workload(struct intel_vgpu_workl=
oad *workload)
>  	mutex_lock(&vgpu->vgpu_lock);
>  	mutex_lock(&dev_priv->drm.struct_mutex);
> =20
> -	ret =3D set_context_ppgtt_from_shadow(workload,
> -					    s->shadow[ring_id]->gem_context);
> -	if (ret < 0) {
> -		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
> -		goto err_req;
> -	}
> -
>  	ret =3D intel_gvt_workload_req_alloc(workload);
>  	if (ret)
>  		goto err_req;
> --=20
> 2.22.0
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--rNtzt+pFA3UwHi4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXR640wAKCRCxBBozTXgY
Jwu7AJ9VQY56FrBWJp63O3JzJjg9ryqamgCfZKSFTNXd12ufqdlhMHlKvtXT8Og=
=UbQV
-----END PGP SIGNATURE-----

--rNtzt+pFA3UwHi4l--

--===============1362595159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1362595159==--
