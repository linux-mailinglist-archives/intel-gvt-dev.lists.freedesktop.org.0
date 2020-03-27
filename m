Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E353C1950D8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Mar 2020 07:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9EF6E97F;
	Fri, 27 Mar 2020 06:08:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118E66E97F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 27 Mar 2020 06:08:25 +0000 (UTC)
IronPort-SDR: 4sLLqVD+pmrEcaKOwV7I4EcdKzwbG95X5RCu84FDE4Az+uaCluE8/ccEKZy6YjFFQDc7oqO6Qh
 Er2I4rEwBgDg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 23:08:25 -0700
IronPort-SDR: iamCm1pX//NGjKgZEJFWwJmNrGQRtbyfbGjgN1QqIcPzhDJi7N4MDA/4FrtGM2jJj3MfkccfJx
 Jzagh5qx2C5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
 d="asc'?scan'208";a="251044039"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 26 Mar 2020 23:08:24 -0700
Date: Fri, 27 Mar 2020 13:55:22 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Support guest sharing vm
Message-ID: <20200327055522.GG8880@zhen-hp.sh.intel.com>
References: <20200318135322.13788-1-tina.zhang@intel.com>
 <20200320034855.GA8880@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200320034855.GA8880@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0878358195=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0878358195==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AQDb5/OyJPRJL1y9"
Content-Disposition: inline


--AQDb5/OyJPRJL1y9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.20 11:48:55 +0800, Zhenyu Wang wrote:
> On 2020.03.18 21:53:22 +0800, Tina Zhang wrote:
> > The vm in context image can be overridden by lri cmd with a shared vm
> > pdps. In such case, the shared vm is used instead of the one in the
> > context image. This feature is used by guest IGD driver to share vm
> > between different contexts.
> >=20
> > This patch enables the feature support on vGPU.
> >=20
> > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 84 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/gvt/execlist.c   |  2 +
> >  drivers/gpu/drm/i915/gvt/handlers.c   |  2 +-
> >  drivers/gpu/drm/i915/gvt/scheduler.c  | 26 +++++++++
> >  drivers/gpu/drm/i915/gvt/scheduler.h  |  1 +
> >  5 files changed, 114 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i9=
15/gvt/cmd_parser.c
> > index 9e065ad0658f..4c702b604884 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -881,6 +881,86 @@ static int mocs_cmd_reg_handler(struct parser_exec=
_state *s,
> >  	return 0;
> >  }
> > =20
> > +#define IS_PDP_UDW_MMIO(offset, base, num)	\
> > +	((offset) =3D=3D ((base) + 0x274 + (num) * 8))
> > +
> > +static int is_cmd_update_pdps(unsigned int offset,
> > +			      struct parser_exec_state *s)
> > +{
> > +	return IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, 0) ||
> > +		IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, 3);
> > +}
> > +static int cmd_pdp_mmio_update_handler(struct parser_exec_state *s,
> > +				       unsigned int offset, unsigned int index)
> > +{
> > +	struct intel_vgpu *vgpu =3D s->vgpu;
> > +	struct intel_vgpu_mm *shadow_mm =3D s->workload->shadow_mm;
> > +	struct intel_vgpu_mm *shared_shadow_mm =3D s->workload->shared_shadow=
_mm;
> > +	struct intel_vgpu_mm *mm;
> > +	u64 pdps[GEN8_3LVL_PDPES];
> > +
> > +	if (shadow_mm->ppgtt_mm.root_entry_type =3D=3D
> > +	    GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
> > +		pdps[0] =3D (u64)cmd_val(s, 2) << 32;
> > +		pdps[0] |=3D cmd_val(s, 4);
> > +
> > +		mm =3D intel_vgpu_find_ppgtt_mm(vgpu, pdps);
> > +		if (!mm) {
> > +			gvt_vgpu_err("failed to get the shadow vm\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (mm !=3D shadow_mm) {
> > +			if (mm !=3D shared_shadow_mm) {
> > +				if (shared_shadow_mm)
> > +					intel_vgpu_mm_put(shared_shadow_mm);
> > +				intel_vgpu_mm_get(mm);
> > +				s->workload->shared_shadow_mm =3D mm;
> > +			}

While I look deeper on this, realize there could be case that in one
ring buffer, multiple ppgtt update exists, e.g for different batch
buffers. We shouldn't limit it for one ppgtt update just for current
test case.

> > +			*cmd_ptr(s, 2) =3D
> > +				upper_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
> > +			*cmd_ptr(s, 4) =3D
> > +				lower_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
> > +		}
> > +	} else if (shadow_mm->ppgtt_mm.root_entry_type =3D=3D
> > +		   GTT_TYPE_PPGTT_ROOT_L3_ENTRY) {
> > +		int i, j;
> > +
> > +		for (i =3D GEN8_3LVL_PDPES, j =3D 2; i--; ) {
> > +			pdps[i] =3D (u64)cmd_val(s, j) << 32;
> > +			pdps[i] |=3D cmd_val(s, j+2);
> > +			j +=3D 4;
> > +		}
> > +
> > +		mm =3D intel_vgpu_find_ppgtt_mm(vgpu, pdps);
> > +		if (!mm) {
> > +			gvt_vgpu_err("failed to get the shadow vm\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (mm !=3D shadow_mm) {
> > +			if (mm !=3D shared_shadow_mm) {
> > +				if (shared_shadow_mm)
> > +					intel_vgpu_mm_put(shared_shadow_mm);
> > +				intel_vgpu_mm_get(mm);
> > +				s->workload->shared_shadow_mm =3D mm;
> > +			}
> > +			for (i =3D GEN8_3LVL_PDPES, j =3D 2; i--; ) {
> > +				*cmd_ptr(s, j) =3D
> > +					upper_32_bits(
> > +						mm->ppgtt_mm.shadow_pdps[i]);
> > +				*cmd_ptr(s, j + 2) =3D
> > +					lower_32_bits(
> > +						mm->ppgtt_mm.shadow_pdps[i]);
> > +				j +=3D 4;
> > +			}
> > +		}
> > +	} else {
> > +		gvt_vgpu_err("invalid shared shadow vm type\n");
>=20
> We need sanity check for new ppgtt table, not just with same type as
> old mm, might check further that new mm should match guest context
> descriptor setting for 3-level or 4-level mapping. If they don't
> match, then should bail off guest.
>=20
> And I think maybe we can just put workload shadow_mm setup after cmd
> parsing, so if in this load PML/PDP case, we can already get target
> shadow_mm from cmd paser instead of from context desc. Then you don't
> need this shared_shadow_mm hack, and also we can handle guest ctx
> update after execution without change, that code should be simpler.
>

Looks delay original shadow_mm initialization isn't important here,
we need to track all ppgtt update with shadow override and handling
references fine would be enough.

>=20
> > +	}
> > +	return 0;
> > +}
> > +
> >  static int cmd_reg_handler(struct parser_exec_state *s,
> >  	unsigned int offset, unsigned int index, char *cmd)
> >  {
> > @@ -919,6 +999,10 @@ static int cmd_reg_handler(struct parser_exec_stat=
e *s,
> >  		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
> >  	}
> > =20
> > +	if (is_cmd_update_pdps(offset, s) &&
> > +	    cmd_pdp_mmio_update_handler(s, offset, index))
> > +		return -EINVAL;
> > +
> >  	/* TODO
> >  	 * In order to let workload with inhibit context to generate
> >  	 * correct image data into memory, vregs values will be loaded to
> > diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915=
/gvt/execlist.c
> > index dd25c3024370..7f7087258d8b 100644
> > --- a/drivers/gpu/drm/i915/gvt/execlist.c
> > +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> > @@ -424,6 +424,8 @@ static int complete_execlist_workload(struct intel_=
vgpu_workload *workload)
> > =20
> >  	ret =3D emulate_execlist_ctx_schedule_out(execlist, &workload->ctx_de=
sc);
> >  out:
> > +	if (workload->shared_shadow_mm)
> > +		intel_vgpu_unpin_mm(workload->shared_shadow_mm);
> >  	intel_vgpu_unpin_mm(workload->shadow_mm);
> >  	intel_vgpu_destroy_workload(workload);
> >  	return ret;
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915=
/gvt/handlers.c
> > index 0182e2a5acff..23a3193a6654 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -2808,7 +2808,7 @@ static int init_bdw_mmio_info(struct intel_gvt *g=
vt)
> >  	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
> > =20
> >  #define RING_REG(base) _MMIO((base) + 0x270)
> > -	MMIO_RING_F(RING_REG, 32, 0, 0, 0, D_BDW_PLUS, NULL, NULL);
> > +	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
> >  #undef RING_REG
> > =20
> >  	MMIO_RING_GM_RDR(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i91=
5/gvt/scheduler.c
> > index 1c95bf8cbed0..16a9af130d10 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -612,6 +612,9 @@ static int prepare_workload(struct intel_vgpu_workl=
oad *workload)
> >  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> >  	int ret =3D 0;
> > =20
> > +	if (workload->shared_shadow_mm)
> > +		intel_vgpu_pin_mm(workload->shared_shadow_mm);
> > +
> >  	ret =3D intel_vgpu_pin_mm(workload->shadow_mm);
> >  	if (ret) {
> >  		gvt_vgpu_err("fail to vgpu pin mm\n");
> > @@ -671,6 +674,8 @@ static int prepare_workload(struct intel_vgpu_workl=
oad *workload)
> >  	release_shadow_batch_buffer(workload);
> >  err_unpin_mm:
> >  	intel_vgpu_unpin_mm(workload->shadow_mm);
> > +	if (workload->shared_shadow_mm)
> > +		intel_vgpu_unpin_mm(workload->shared_shadow_mm);
> >  	return ret;
> >  }
> > =20
> > @@ -780,12 +785,27 @@ pick_next_workload(struct intel_gvt *gvt, struct =
intel_engine_cs *engine)
> >  	return workload;
> >  }
> > =20
> > +static void update_guest_pdps(struct intel_vgpu *vgpu,
> > +		u64 ring_context_gpa, u32 pdp[8])
> > +{
> > +	u64 gpa;
> > +	int i;
> > +
> > +	gpa =3D ring_context_gpa + RING_CTX_OFF(pdps[0].val);
> > +
> > +	for (i =3D 0; i < 8; i++)
> > +		intel_gvt_hypervisor_write_gpa(vgpu,
> > +				gpa + i * 8, &pdp[7 - i], 4);
> > +}
> > +
> > +
> >  static void update_guest_context(struct intel_vgpu_workload *workload)
> >  {
> >  	struct i915_request *rq =3D workload->req;
> >  	struct intel_vgpu *vgpu =3D workload->vgpu;
> >  	struct drm_i915_gem_object *ctx_obj =3D rq->context->state->obj;
> >  	struct execlist_ring_context *shadow_ring_context;
> > +	struct intel_vgpu_mm *shared_mm =3D workload->shared_shadow_mm;
> >  	struct page *page;
> >  	void *src;
> >  	unsigned long context_gpa, context_page_num;
> > @@ -842,6 +862,10 @@ static void update_guest_context(struct intel_vgpu=
_workload *workload)
> >  	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
> >  		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
> > =20
> > +	if (shared_mm)
> > +		update_guest_pdps(vgpu, workload->ring_context_gpa,
> > +				  (void *)shared_mm->ppgtt_mm.guest_pdps);
> > +
> >  	page =3D i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
> >  	shadow_ring_context =3D kmap(page);
> > =20
> > @@ -1346,6 +1370,8 @@ void intel_vgpu_destroy_workload(struct intel_vgp=
u_workload *workload)
> >  	release_shadow_batch_buffer(workload);
> >  	release_shadow_wa_ctx(&workload->wa_ctx);
> > =20
> > +	if (workload->shared_shadow_mm)
> > +		intel_vgpu_mm_put(workload->shared_shadow_mm);
> >  	if (workload->shadow_mm)
> >  		intel_vgpu_mm_put(workload->shadow_mm);
> > =20
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/drm/i91=
5/gvt/scheduler.h
> > index bf7fc0ca4cb1..6a7d5a7e1c0e 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.h
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.h
> > @@ -87,6 +87,7 @@ struct intel_vgpu_workload {
> >  	int status;
> > =20
> >  	struct intel_vgpu_mm *shadow_mm;
> > +	struct intel_vgpu_mm *shared_shadow_mm;
> > =20
> >  	/* different submission model may need different handler */
> >  	int (*prepare)(struct intel_vgpu_workload *);
> > --=20
> > 2.17.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>=20
> --=20
> Open Source Technology Center, Intel ltd.
>=20
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827



> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--AQDb5/OyJPRJL1y9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXn2VSgAKCRCxBBozTXgY
Jyv1AJ9MXvYP4jqyIoDe7suKQMbNpo9y0QCdHrFKTA+6tcE3ka8gz8PfNF1533E=
=BsGS
-----END PGP SIGNATURE-----

--AQDb5/OyJPRJL1y9--

--===============0878358195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0878358195==--
