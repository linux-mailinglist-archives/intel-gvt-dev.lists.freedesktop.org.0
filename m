Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43D18C63E
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Mar 2020 05:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141586EA2F;
	Fri, 20 Mar 2020 04:06:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B46EA2F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Mar 2020 04:06:31 +0000 (UTC)
IronPort-SDR: Ed9N+kfKsfKBUwNjTe/KgP23bvmbtfuEGlWSw6S5s48nQl1HmDyY8DxDuCcJSb29E2vMzwcP8D
 HaoUYSWrFTIw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 21:06:30 -0700
IronPort-SDR: O6qRkg8itL2Aov71WaSqt8ICpI+6I33Xz9ntGSifoBwfh3GwlXILftlQjICYynwa8F/41gab8G
 YWTZaMpcJ6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; 
 d="asc'?scan'208";a="268965593"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2020 21:06:29 -0700
Date: Fri, 20 Mar 2020 11:53:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Check engine id before using it
Message-ID: <20200320035343.GB8880@zhen-hp.sh.intel.com>
References: <20200318062635.21689-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200318062635.21689-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1491987258=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1491987258==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3jK+0sHr6j/jwA0V"
Content-Disposition: inline


--3jK+0sHr6j/jwA0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.18 14:26:35 +0800, Tina Zhang wrote:
> The number of engines is I915_NUM_ENGINES. Since the array starts from
> zero, the last one's index in the array should be (I915_NUM_ENGINES - 1).
> Directly using engined->id as the index of the array, may lead to out of
> array's range issue.
>=20
> Klocwork detected this issue and this patch solves it by checking
> engine->id before using it.

I don't think this is practically useful, or provide an enum id to
index helper? Which is just 1:1 but may add debug check.

>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/execlist.c  | 19 ++++++++++++++++---
>  drivers/gpu/drm/i915/gvt/handlers.c  |  7 ++++---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 19 +++++++++++++++----
>  3 files changed, 35 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/g=
vt/execlist.c
> index dd25c3024370..37f8fcac7b05 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.c
> +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> @@ -437,6 +437,9 @@ static int submit_context(struct intel_vgpu *vgpu,
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	struct intel_vgpu_workload *workload =3D NULL;
> =20
> +	if (!engine || engine->id >=3D I915_NUM_ENGINES)
> +		return -EINVAL;
> +
>  	workload =3D intel_vgpu_create_workload(vgpu, engine, desc);
>  	if (IS_ERR(workload))
>  		return PTR_ERR(workload);
> @@ -459,10 +462,15 @@ int intel_vgpu_submit_execlist(struct intel_vgpu *v=
gpu,
>  			       const struct intel_engine_cs *engine)
>  {
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> -	struct intel_vgpu_execlist *execlist =3D &s->execlist[engine->id];
> +	struct intel_vgpu_execlist *execlist;
>  	struct execlist_ctx_descriptor_format *desc[2];
>  	int i, ret;
> =20
> +	if (!engine || engine->id >=3D I915_NUM_ENGINES)
> +		return -EINVAL;
> +
> +	execlist =3D &s->execlist[engine->id];
> +
>  	desc[0] =3D get_desc_from_elsp_dwords(&execlist->elsp_dwords, 0);
>  	desc[1] =3D get_desc_from_elsp_dwords(&execlist->elsp_dwords, 1);
> =20
> @@ -503,11 +511,16 @@ static void init_vgpu_execlist(struct intel_vgpu *v=
gpu,
>  			       const struct intel_engine_cs *engine)
>  {
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> -	struct intel_vgpu_execlist *execlist =3D &s->execlist[engine->id];
> +	struct intel_vgpu_execlist *execlist;
>  	struct execlist_context_status_pointer_format ctx_status_ptr;
>  	u32 ctx_status_ptr_reg;
> =20
> -	memset(execlist, 0, sizeof(*execlist));
> +	if (!engine || engine->id >=3D I915_NUM_ENGINES)
> +		return;
> +
> +	execlist =3D &s->execlist[engine->id];
> +
> +	memset(execlist, 0, sizeof(struct intel_vgpu_execlist));
> =20
>  	execlist->vgpu =3D vgpu;
>  	execlist->engine =3D engine;
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 0182e2a5acff..f11908a28ce7 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1690,7 +1690,8 @@ static int elsp_mmio_write(struct intel_vgpu *vgpu,=
 unsigned int offset,
>  	u32 data =3D *(u32 *)p_data;
>  	int ret =3D 0;
> =20
> -	if (drm_WARN_ON(&i915->drm, !engine))
> +	if (drm_WARN_ON(&i915->drm, !engine) ||
> +		engine->id >=3D I915_NUM_ENGINES)
>  		return -EINVAL;
> =20
>  	execlist =3D &vgpu->submission.execlist[engine->id];
> @@ -1743,8 +1744,8 @@ static int ring_mode_mmio_write(struct intel_vgpu *=
vgpu, unsigned int offset,
>  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
>  		return 0;
>  	}
> -	if ((data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE))
> -			|| (data & _MASKED_BIT_DISABLE(GFX_RUN_LIST_ENABLE))) {
> +	if (engine && ((data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE))
> +		       || (data & _MASKED_BIT_DISABLE(GFX_RUN_LIST_ENABLE)))) {
>  		enable_execlist =3D !!(data & GFX_RUN_LIST_ENABLE);
> =20
>  		gvt_dbg_core("EXECLIST %s on ring %s\n",
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 1c95bf8cbed0..8436984cd1f6 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -232,13 +232,21 @@ static int shadow_context_status_change(struct noti=
fier_block *nb,
>  		unsigned long action, void *data)
>  {
>  	struct i915_request *rq =3D data;
> -	struct intel_gvt *gvt =3D container_of(nb, struct intel_gvt,
> -				shadow_ctx_notifier_block[rq->engine->id]);
> -	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
> -	enum intel_engine_id ring_id =3D rq->engine->id;
> +	struct intel_gvt *gvt;
> +	struct intel_gvt_workload_scheduler *scheduler;
> +	enum intel_engine_id ring_id;
>  	struct intel_vgpu_workload *workload;
>  	unsigned long flags;
> =20
> +	if (!rq || !rq->engine || rq->engine->id >=3D I915_NUM_ENGINES)
> +		return NOTIFY_OK;
> +
> +	ring_id =3D rq->engine->id;
> +
> +	gvt =3D container_of(nb, struct intel_gvt,
> +				shadow_ctx_notifier_block[rq->engine->id]);
> +	scheduler =3D &gvt->scheduler;
> +
>  	if (!is_gvt_request(rq)) {
>  		spin_lock_irqsave(&scheduler->mmio_context_lock, flags);
>  		if (action =3D=3D INTEL_CONTEXT_SCHEDULE_IN &&
> @@ -1586,6 +1594,9 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
>   */
>  void intel_vgpu_queue_workload(struct intel_vgpu_workload *workload)
>  {
> +	if (workload->engine->id >=3D I915_NUM_ENGINES)
> +		return;
> +
>  	list_add_tail(&workload->list,
>  		      workload_q_head(workload->vgpu, workload->engine));
>  	intel_gvt_kick_schedule(workload->vgpu->gvt);
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--3jK+0sHr6j/jwA0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnQ+RwAKCRCxBBozTXgY
J9e9AJ97NKGKtlmcjHEAhpcIsjXmhjwt+ACdHOA/vpuKnX8s8BIgednzz3ter9M=
=q/PI
-----END PGP SIGNATURE-----

--3jK+0sHr6j/jwA0V--

--===============1491987258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1491987258==--
