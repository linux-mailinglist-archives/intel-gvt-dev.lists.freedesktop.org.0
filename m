Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04A18C636
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Mar 2020 05:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C046EA2F;
	Fri, 20 Mar 2020 04:01:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07A86EA2F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Mar 2020 04:01:42 +0000 (UTC)
IronPort-SDR: uG32qVNDB9kxQuExp8Mr64kgOj4XHoGk/e/mlP9ooKWHtejWpa62Okf3FE+kwF3YgLnGPY1Cvk
 ZxwHNyXVzYAQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 21:01:42 -0700
IronPort-SDR: 0/V9epFpaTMTdgCRncIqfhRNnUlrAKAbXCfVLHqSb6CpAZvlKeWJRgmrrJRtXFHJSD0HXCNlmK
 2PbQCKfmox5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; 
 d="asc'?scan'208";a="444834401"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2020 21:01:41 -0700
Date: Fri, 20 Mar 2020 11:48:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Support guest sharing vm
Message-ID: <20200320034855.GA8880@zhen-hp.sh.intel.com>
References: <20200318135322.13788-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200318135322.13788-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0448113709=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0448113709==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qgEfXXHyyarqcYJd"
Content-Disposition: inline


--qgEfXXHyyarqcYJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.18 21:53:22 +0800, Tina Zhang wrote:
> The vm in context image can be overridden by lri cmd with a shared vm
> pdps. In such case, the shared vm is used instead of the one in the
> context image. This feature is used by guest IGD driver to share vm
> between different contexts.
>=20
> This patch enables the feature support on vGPU.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 84 +++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/execlist.c   |  2 +
>  drivers/gpu/drm/i915/gvt/handlers.c   |  2 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c  | 26 +++++++++
>  drivers/gpu/drm/i915/gvt/scheduler.h  |  1 +
>  5 files changed, 114 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 9e065ad0658f..4c702b604884 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -881,6 +881,86 @@ static int mocs_cmd_reg_handler(struct parser_exec_s=
tate *s,
>  	return 0;
>  }
> =20
> +#define IS_PDP_UDW_MMIO(offset, base, num)	\
> +	((offset) =3D=3D ((base) + 0x274 + (num) * 8))
> +
> +static int is_cmd_update_pdps(unsigned int offset,
> +			      struct parser_exec_state *s)
> +{
> +	return IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, 0) ||
> +		IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, 3);
> +}
> +static int cmd_pdp_mmio_update_handler(struct parser_exec_state *s,
> +				       unsigned int offset, unsigned int index)
> +{
> +	struct intel_vgpu *vgpu =3D s->vgpu;
> +	struct intel_vgpu_mm *shadow_mm =3D s->workload->shadow_mm;
> +	struct intel_vgpu_mm *shared_shadow_mm =3D s->workload->shared_shadow_m=
m;
> +	struct intel_vgpu_mm *mm;
> +	u64 pdps[GEN8_3LVL_PDPES];
> +
> +	if (shadow_mm->ppgtt_mm.root_entry_type =3D=3D
> +	    GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
> +		pdps[0] =3D (u64)cmd_val(s, 2) << 32;
> +		pdps[0] |=3D cmd_val(s, 4);
> +
> +		mm =3D intel_vgpu_find_ppgtt_mm(vgpu, pdps);
> +		if (!mm) {
> +			gvt_vgpu_err("failed to get the shadow vm\n");
> +			return -EINVAL;
> +		}
> +
> +		if (mm !=3D shadow_mm) {
> +			if (mm !=3D shared_shadow_mm) {
> +				if (shared_shadow_mm)
> +					intel_vgpu_mm_put(shared_shadow_mm);
> +				intel_vgpu_mm_get(mm);
> +				s->workload->shared_shadow_mm =3D mm;
> +			}
> +			*cmd_ptr(s, 2) =3D
> +				upper_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
> +			*cmd_ptr(s, 4) =3D
> +				lower_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
> +		}
> +	} else if (shadow_mm->ppgtt_mm.root_entry_type =3D=3D
> +		   GTT_TYPE_PPGTT_ROOT_L3_ENTRY) {
> +		int i, j;
> +
> +		for (i =3D GEN8_3LVL_PDPES, j =3D 2; i--; ) {
> +			pdps[i] =3D (u64)cmd_val(s, j) << 32;
> +			pdps[i] |=3D cmd_val(s, j+2);
> +			j +=3D 4;
> +		}
> +
> +		mm =3D intel_vgpu_find_ppgtt_mm(vgpu, pdps);
> +		if (!mm) {
> +			gvt_vgpu_err("failed to get the shadow vm\n");
> +			return -EINVAL;
> +		}
> +
> +		if (mm !=3D shadow_mm) {
> +			if (mm !=3D shared_shadow_mm) {
> +				if (shared_shadow_mm)
> +					intel_vgpu_mm_put(shared_shadow_mm);
> +				intel_vgpu_mm_get(mm);
> +				s->workload->shared_shadow_mm =3D mm;
> +			}
> +			for (i =3D GEN8_3LVL_PDPES, j =3D 2; i--; ) {
> +				*cmd_ptr(s, j) =3D
> +					upper_32_bits(
> +						mm->ppgtt_mm.shadow_pdps[i]);
> +				*cmd_ptr(s, j + 2) =3D
> +					lower_32_bits(
> +						mm->ppgtt_mm.shadow_pdps[i]);
> +				j +=3D 4;
> +			}
> +		}
> +	} else {
> +		gvt_vgpu_err("invalid shared shadow vm type\n");

We need sanity check for new ppgtt table, not just with same type as
old mm, might check further that new mm should match guest context
descriptor setting for 3-level or 4-level mapping. If they don't
match, then should bail off guest.

And I think maybe we can just put workload shadow_mm setup after cmd
parsing, so if in this load PML/PDP case, we can already get target
shadow_mm from cmd paser instead of from context desc. Then you don't
need this shared_shadow_mm hack, and also we can handle guest ctx
update after execution without change, that code should be simpler.


> +	}
> +	return 0;
> +}
> +
>  static int cmd_reg_handler(struct parser_exec_state *s,
>  	unsigned int offset, unsigned int index, char *cmd)
>  {
> @@ -919,6 +999,10 @@ static int cmd_reg_handler(struct parser_exec_state =
*s,
>  		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
>  	}
> =20
> +	if (is_cmd_update_pdps(offset, s) &&
> +	    cmd_pdp_mmio_update_handler(s, offset, index))
> +		return -EINVAL;
> +
>  	/* TODO
>  	 * In order to let workload with inhibit context to generate
>  	 * correct image data into memory, vregs values will be loaded to
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/g=
vt/execlist.c
> index dd25c3024370..7f7087258d8b 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.c
> +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> @@ -424,6 +424,8 @@ static int complete_execlist_workload(struct intel_vg=
pu_workload *workload)
> =20
>  	ret =3D emulate_execlist_ctx_schedule_out(execlist, &workload->ctx_desc=
);
>  out:
> +	if (workload->shared_shadow_mm)
> +		intel_vgpu_unpin_mm(workload->shared_shadow_mm);
>  	intel_vgpu_unpin_mm(workload->shadow_mm);
>  	intel_vgpu_destroy_workload(workload);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 0182e2a5acff..23a3193a6654 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -2808,7 +2808,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
>  	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
> =20
>  #define RING_REG(base) _MMIO((base) + 0x270)
> -	MMIO_RING_F(RING_REG, 32, 0, 0, 0, D_BDW_PLUS, NULL, NULL);
> +	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
>  #undef RING_REG
> =20
>  	MMIO_RING_GM_RDR(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 1c95bf8cbed0..16a9af130d10 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -612,6 +612,9 @@ static int prepare_workload(struct intel_vgpu_workloa=
d *workload)
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	int ret =3D 0;
> =20
> +	if (workload->shared_shadow_mm)
> +		intel_vgpu_pin_mm(workload->shared_shadow_mm);
> +
>  	ret =3D intel_vgpu_pin_mm(workload->shadow_mm);
>  	if (ret) {
>  		gvt_vgpu_err("fail to vgpu pin mm\n");
> @@ -671,6 +674,8 @@ static int prepare_workload(struct intel_vgpu_workloa=
d *workload)
>  	release_shadow_batch_buffer(workload);
>  err_unpin_mm:
>  	intel_vgpu_unpin_mm(workload->shadow_mm);
> +	if (workload->shared_shadow_mm)
> +		intel_vgpu_unpin_mm(workload->shared_shadow_mm);
>  	return ret;
>  }
> =20
> @@ -780,12 +785,27 @@ pick_next_workload(struct intel_gvt *gvt, struct in=
tel_engine_cs *engine)
>  	return workload;
>  }
> =20
> +static void update_guest_pdps(struct intel_vgpu *vgpu,
> +		u64 ring_context_gpa, u32 pdp[8])
> +{
> +	u64 gpa;
> +	int i;
> +
> +	gpa =3D ring_context_gpa + RING_CTX_OFF(pdps[0].val);
> +
> +	for (i =3D 0; i < 8; i++)
> +		intel_gvt_hypervisor_write_gpa(vgpu,
> +				gpa + i * 8, &pdp[7 - i], 4);
> +}
> +
> +
>  static void update_guest_context(struct intel_vgpu_workload *workload)
>  {
>  	struct i915_request *rq =3D workload->req;
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
>  	struct drm_i915_gem_object *ctx_obj =3D rq->context->state->obj;
>  	struct execlist_ring_context *shadow_ring_context;
> +	struct intel_vgpu_mm *shared_mm =3D workload->shared_shadow_mm;
>  	struct page *page;
>  	void *src;
>  	unsigned long context_gpa, context_page_num;
> @@ -842,6 +862,10 @@ static void update_guest_context(struct intel_vgpu_w=
orkload *workload)
>  	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
>  		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
> =20
> +	if (shared_mm)
> +		update_guest_pdps(vgpu, workload->ring_context_gpa,
> +				  (void *)shared_mm->ppgtt_mm.guest_pdps);
> +
>  	page =3D i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
>  	shadow_ring_context =3D kmap(page);
> =20
> @@ -1346,6 +1370,8 @@ void intel_vgpu_destroy_workload(struct intel_vgpu_=
workload *workload)
>  	release_shadow_batch_buffer(workload);
>  	release_shadow_wa_ctx(&workload->wa_ctx);
> =20
> +	if (workload->shared_shadow_mm)
> +		intel_vgpu_mm_put(workload->shared_shadow_mm);
>  	if (workload->shadow_mm)
>  		intel_vgpu_mm_put(workload->shadow_mm);
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/drm/i915/=
gvt/scheduler.h
> index bf7fc0ca4cb1..6a7d5a7e1c0e 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.h
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.h
> @@ -87,6 +87,7 @@ struct intel_vgpu_workload {
>  	int status;
> =20
>  	struct intel_vgpu_mm *shadow_mm;
> +	struct intel_vgpu_mm *shared_shadow_mm;
> =20
>  	/* different submission model may need different handler */
>  	int (*prepare)(struct intel_vgpu_workload *);
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

--qgEfXXHyyarqcYJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnQ9JwAKCRCxBBozTXgY
J60YAKCEcJaDa/6YdXkpaOuLMqWu1bSNhQCgmEkV6hnD0oXfvwoFW3QHCYG77Do=
=WZct
-----END PGP SIGNATURE-----

--qgEfXXHyyarqcYJd--

--===============0448113709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0448113709==--
