Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9382340B5
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 09:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A602389791;
	Tue,  4 Jun 2019 07:52:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EAF893CB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 07:52:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 00:52:17 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2019 00:52:16 -0700
Date: Tue, 4 Jun 2019 15:50:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: optimization for save-inhibit context
Message-ID: <20190604075045.GP9684@zhen-hp.sh.intel.com>
References: <20190603045617.31011-1-yan.y.zhao@intel.com>
 <20190603045757.31090-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190603045757.31090-1-yan.y.zhao@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Weinan Li <weinan.z.li@intel.com>
Content-Type: multipart/mixed; boundary="===============0338182011=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0338182011==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vr2UxLU0KdcKBaxP"
Content-Disposition: inline


--Vr2UxLU0KdcKBaxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.03 00:57:57 -0400, Yan Zhao wrote:
> sometimes, linux guest would send preempt contexts which are both
> restore inhibit context and save inhibit context.
> E.g. glmark2 sends 30 preempt contexts every sec on average.
>=20
> For this kind of context,
> 1. no need to load mmios in save-restore list back to hardware
> 2. no need to copy context mmios back to guest
>=20
> Cc: Weinan Li <weinan.z.li@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/mmio_context.c |  8 ++++
>  drivers/gpu/drm/i915/gvt/mmio_context.h |  5 +++
>  drivers/gpu/drm/i915/gvt/scheduler.c    | 49 ++++++++++++++-----------
>  3 files changed, 41 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 0c3e2f21e28c..9b9630f4297b 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -445,6 +445,14 @@ bool is_restore_inhibit_context(struct intel_context=
 *ce)
>  	return IS_RESTORE_INHIBIT(reg_state[CTX_CONTEXT_CONTROL_VAL]);
>  }
> =20
> +bool is_save_inhibit_context(struct intel_context *ce)
> +{
> +	const u32 *reg_state =3D ce->lrc_reg_state;
> +
> +	return IS_SAVE_INHIBIT(reg_state[CTX_CONTEXT_CONTROL_VAL]);
> +}
> +
> +
>  /* Switch ring mmio values (context). */
>  static void switch_mmio(struct intel_vgpu *pre,
>  			struct intel_vgpu *next,
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.h b/drivers/gpu/drm/i9=
15/gvt/mmio_context.h
> index 08e3a775fae7..daffd2d3d023 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.h
> @@ -50,6 +50,7 @@ void intel_gvt_switch_mmio(struct intel_vgpu *pre,
>  void intel_gvt_init_engine_mmio_context(struct intel_gvt *gvt);
> =20
>  bool is_restore_inhibit_context(struct intel_context *ce);
> +bool is_save_inhibit_context(struct intel_context *ce);
> =20
>  int intel_vgpu_restore_inhibit_context(struct intel_vgpu *vgpu,
>  				       struct i915_request *req);
> @@ -57,4 +58,8 @@ int intel_vgpu_restore_inhibit_context(struct intel_vgp=
u *vgpu,
>  	(_MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) =3D=3D \
>  	((a) & _MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT)))
> =20
> +#define IS_SAVE_INHIBIT(a)	\
> +	(_MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT) =3D=3D \
> +	((a) & _MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT)))
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 5c2087600442..9fb69bf37bc1 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -313,7 +313,9 @@ static int copy_workload_to_ring_buffer(struct intel_=
vgpu_workload *workload)
>  	u32 *cs;
>  	int err;
> =20
> -	if (IS_GEN(req->i915, 9) && is_restore_inhibit_context(req->hw_context))
> +	if (IS_GEN(req->i915, 9) &&
> +			is_restore_inhibit_context(req->hw_context) &&
> +			!is_save_inhibit_context(req->hw_context))
>  		intel_vgpu_restore_inhibit_context(vgpu, req);
>

=46rom our discussion, even for save inhibit context we should still keep t=
o restore
mmio state in restore inhibit case, to make sure context submission is unde=
r expected
vGPU state. Others look fine to me.

>  	/*
> @@ -804,6 +806,31 @@ static void update_guest_context(struct intel_vgpu_w=
orkload *workload)
>  	gvt_dbg_sched("ring id %d workload lrca %x\n", rq->engine->id,
>  		      workload->ctx_desc.lrca);
> =20
> +	page =3D i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
> +	shadow_ring_context =3D kmap(page);
> +	if (IS_SAVE_INHIBIT(shadow_ring_context->ctx_ctrl.val)) {
> +		kunmap(page);
> +		return;
> +	}
> +
> +#define COPY_REG(name) \
> +	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa + \
> +		RING_CTX_OFF(name.val), &shadow_ring_context->name.val, 4)
> +
> +	COPY_REG(ctx_ctrl);
> +	COPY_REG(ctx_timestamp);
> +
> +#undef COPY_REG
> +
> +	intel_gvt_hypervisor_write_gpa(vgpu,
> +			workload->ring_context_gpa +
> +			sizeof(*shadow_ring_context),
> +			(void *)shadow_ring_context +
> +			sizeof(*shadow_ring_context),
> +			I915_GTT_PAGE_SIZE - sizeof(*shadow_ring_context));
> +
> +	kunmap(page);
> +
>  	context_page_num =3D rq->engine->context_size;
>  	context_page_num =3D context_page_num >> PAGE_SHIFT;
> =20
> @@ -832,26 +859,6 @@ static void update_guest_context(struct intel_vgpu_w=
orkload *workload)
>  	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
>  		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
> =20
> -	page =3D i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
> -	shadow_ring_context =3D kmap(page);
> -
> -#define COPY_REG(name) \
> -	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa + \
> -		RING_CTX_OFF(name.val), &shadow_ring_context->name.val, 4)
> -
> -	COPY_REG(ctx_ctrl);
> -	COPY_REG(ctx_timestamp);
> -
> -#undef COPY_REG
> -
> -	intel_gvt_hypervisor_write_gpa(vgpu,
> -			workload->ring_context_gpa +
> -			sizeof(*shadow_ring_context),
> -			(void *)shadow_ring_context +
> -			sizeof(*shadow_ring_context),
> -			I915_GTT_PAGE_SIZE - sizeof(*shadow_ring_context));
> -
> -	kunmap(page);
>  }
> =20
>  void intel_vgpu_clean_workloads(struct intel_vgpu *vgpu,
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

--Vr2UxLU0KdcKBaxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPYi1QAKCRCxBBozTXgY
JxjlAJ9uDU5P1txlzk6aBbfB1dH6ydXjBwCeLmJMIf77YoR/3B/w6bPENWs7RUc=
=1Mk1
-----END PGP SIGNATURE-----

--Vr2UxLU0KdcKBaxP--

--===============0338182011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0338182011==--
