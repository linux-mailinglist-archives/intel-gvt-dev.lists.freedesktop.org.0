Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A79DE3FF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 21 Oct 2019 07:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F66898C6;
	Mon, 21 Oct 2019 05:44:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B2B898C2;
 Mon, 21 Oct 2019 05:44:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 22:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,322,1566889200"; 
 d="asc'?scan'208";a="191002326"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 20 Oct 2019 22:44:10 -0700
Date: Mon, 21 Oct 2019 13:37:24 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Wean gvt off dev_priv->engine[]
Message-ID: <20191021053724.GB8745@zhen-hp.sh.intel.com>
References: <20191016183902.13614-1-chris@chris-wilson.co.uk>
 <20191016183902.13614-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
In-Reply-To: <20191016183902.13614-2-chris@chris-wilson.co.uk>
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
Cc: intel-gfx@lists.freedesktop.org,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0028249305=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0028249305==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.10.16 19:39:02 +0100, Chris Wilson wrote:
> Stop trying to escape out of the gvt layer to find the engine that we
> initially setup for use with gvt. Record the engines during initialisation
> and use them henceforth.
>=20
> add/remove: 1/4 grow/shrink: 22/28 up/down: 341/-1410 (-1069)
>=20
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---

Thanks for this cleanup! Quick review seems good to me, although it
looks pretty fine for me on ring_id replacement, this big one also
includes other changes like indent fix, debugfs item change, etc.
Could we split them for easier merge? Can have a gvt developer to
help on that.

>  drivers/gpu/drm/i915/gvt/cmd_parser.c   | 204 +++++++++-----------
>  drivers/gpu/drm/i915/gvt/debugfs.c      |  36 +---
>  drivers/gpu/drm/i915/gvt/execlist.c     |  99 +++++-----
>  drivers/gpu/drm/i915/gvt/execlist.h     |   5 +-
>  drivers/gpu/drm/i915/gvt/handlers.c     |  90 +++++----
>  drivers/gpu/drm/i915/gvt/mmio.h         |   4 +-
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 108 ++++++-----
>  drivers/gpu/drm/i915/gvt/mmio_context.h |   5 +-
>  drivers/gpu/drm/i915/gvt/sched_policy.c |  13 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c    | 238 +++++++++++-------------
>  drivers/gpu/drm/i915/gvt/scheduler.h    |   9 +-
>  11 files changed, 364 insertions(+), 447 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index e753b1e706e2..9f4be5ff7fe1 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -460,7 +460,7 @@ enum {
> =20
>  struct parser_exec_state {
>  	struct intel_vgpu *vgpu;
> -	int ring_id;
> +	const struct intel_engine_cs *engine;
> =20
>  	int buf_type;
> =20
> @@ -633,39 +633,42 @@ static const struct decode_info *ring_decode_info[I=
915_NUM_ENGINES][8] =3D {
>  	},
>  };
> =20
> -static inline u32 get_opcode(u32 cmd, int ring_id)
> +static inline u32 get_opcode(u32 cmd, const struct intel_engine_cs *engi=
ne)
>  {
>  	const struct decode_info *d_info;
> =20
> -	d_info =3D ring_decode_info[ring_id][CMD_TYPE(cmd)];
> +	d_info =3D ring_decode_info[engine->id][CMD_TYPE(cmd)];
>  	if (d_info =3D=3D NULL)
>  		return INVALID_OP;
> =20
>  	return cmd >> (32 - d_info->op_len);
>  }
> =20
> -static inline const struct cmd_info *find_cmd_entry(struct intel_gvt *gv=
t,
> -		unsigned int opcode, int ring_id)
> +static inline const struct cmd_info *
> +find_cmd_entry(struct intel_gvt *gvt, unsigned int opcode,
> +	       const struct intel_engine_cs *engine)
>  {
>  	struct cmd_entry *e;
> =20
>  	hash_for_each_possible(gvt->cmd_table, e, hlist, opcode) {
> -		if (opcode =3D=3D e->info->opcode && e->info->rings & BIT(ring_id))
> +		if (opcode =3D=3D e->info->opcode &&
> +		    e->info->rings & engine->mask)
>  			return e->info;
>  	}
>  	return NULL;
>  }
> =20
> -static inline const struct cmd_info *get_cmd_info(struct intel_gvt *gvt,
> -		u32 cmd, int ring_id)
> +static inline const struct cmd_info *
> +get_cmd_info(struct intel_gvt *gvt, u32 cmd,
> +	     const struct intel_engine_cs *engine)
>  {
>  	u32 opcode;
> =20
> -	opcode =3D get_opcode(cmd, ring_id);
> +	opcode =3D get_opcode(cmd, engine);
>  	if (opcode =3D=3D INVALID_OP)
>  		return NULL;
> =20
> -	return find_cmd_entry(gvt, opcode, ring_id);
> +	return find_cmd_entry(gvt, opcode, engine);
>  }
> =20
>  static inline u32 sub_op_val(u32 cmd, u32 hi, u32 low)
> @@ -673,12 +676,12 @@ static inline u32 sub_op_val(u32 cmd, u32 hi, u32 l=
ow)
>  	return (cmd >> low) & ((1U << (hi - low + 1)) - 1);
>  }
> =20
> -static inline void print_opcode(u32 cmd, int ring_id)
> +static inline void print_opcode(u32 cmd, const struct intel_engine_cs *e=
ngine)
>  {
>  	const struct decode_info *d_info;
>  	int i;
> =20
> -	d_info =3D ring_decode_info[ring_id][CMD_TYPE(cmd)];
> +	d_info =3D ring_decode_info[engine->id][CMD_TYPE(cmd)];
>  	if (d_info =3D=3D NULL)
>  		return;
> =20
> @@ -707,10 +710,11 @@ static void parser_exec_state_dump(struct parser_ex=
ec_state *s)
>  	int cnt =3D 0;
>  	int i;
> =20
> -	gvt_dbg_cmd("  vgpu%d RING%d: ring_start(%08lx) ring_end(%08lx)"
> -			" ring_head(%08lx) ring_tail(%08lx)\n", s->vgpu->id,
> -			s->ring_id, s->ring_start, s->ring_start + s->ring_size,
> -			s->ring_head, s->ring_tail);
> +	gvt_dbg_cmd("  vgpu%d RING%s: ring_start(%08lx) ring_end(%08lx)"
> +		    " ring_head(%08lx) ring_tail(%08lx)\n",
> +		    s->vgpu->id, s->engine->name,
> +		    s->ring_start, s->ring_start + s->ring_size,
> +		    s->ring_head, s->ring_tail);
> =20
>  	gvt_dbg_cmd("  %s %s ip_gma(%08lx) ",
>  			s->buf_type =3D=3D RING_BUFFER_INSTRUCTION ?
> @@ -727,7 +731,7 @@ static void parser_exec_state_dump(struct parser_exec=
_state *s)
>  			s->ip_va, cmd_val(s, 0), cmd_val(s, 1),
>  			cmd_val(s, 2), cmd_val(s, 3));
> =20
> -	print_opcode(cmd_val(s, 0), s->ring_id);
> +	print_opcode(cmd_val(s, 0), s->engine);
> =20
>  	s->ip_va =3D (u32 *)((((u64)s->ip_va) >> 12) << 12);
> =20
> @@ -838,7 +842,6 @@ static int force_nonpriv_reg_handler(struct parser_ex=
ec_state *s,
>  	unsigned int data;
>  	u32 ring_base;
>  	u32 nopid;
> -	struct drm_i915_private *dev_priv =3D s->vgpu->gvt->dev_priv;
> =20
>  	if (!strcmp(cmd, "lri"))
>  		data =3D cmd_val(s, index + 1);
> @@ -848,7 +851,7 @@ static int force_nonpriv_reg_handler(struct parser_ex=
ec_state *s,
>  		return -EINVAL;
>  	}
> =20
> -	ring_base =3D dev_priv->engine[s->ring_id]->mmio_base;
> +	ring_base =3D s->engine->mmio_base;
>  	nopid =3D i915_mmio_reg_offset(RING_NOPID(ring_base));
> =20
>  	if (!intel_gvt_in_force_nonpriv_whitelist(gvt, data) &&
> @@ -924,9 +927,9 @@ static int cmd_reg_handler(struct parser_exec_state *=
s,
>  	 * update reg values in it into vregs, so LRIs in workload with
>  	 * inhibit context will restore with correct values
>  	 */
> -	if (IS_GEN(gvt->dev_priv, 9) &&
> -			intel_gvt_mmio_is_in_ctx(gvt, offset) &&
> -			!strncmp(cmd, "lri", 3)) {
> +	if (IS_GEN(s->engine->i915, 9) &&
> +	    intel_gvt_mmio_is_in_ctx(gvt, offset) &&
> +	    !strncmp(cmd, "lri", 3)) {
>  		intel_gvt_hypervisor_read_gpa(s->vgpu,
>  			s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);
>  		/* check inhibit context */
> @@ -962,7 +965,6 @@ static int cmd_handler_lri(struct parser_exec_state *=
s)
>  {
>  	int i, ret =3D 0;
>  	int cmd_len =3D cmd_length(s);
> -	struct intel_gvt *gvt =3D s->vgpu->gvt;
>  	u32 valid_len =3D CMD_LEN(1);
> =20
>  	/*
> @@ -977,8 +979,8 @@ static int cmd_handler_lri(struct parser_exec_state *=
s)
>  	}
> =20
>  	for (i =3D 1; i < cmd_len; i +=3D 2) {
> -		if (IS_BROADWELL(gvt->dev_priv) && s->ring_id !=3D RCS0) {
> -			if (s->ring_id =3D=3D BCS0 &&
> +		if (IS_BROADWELL(s->engine->i915) && s->engine->id !=3D RCS0) {
> +			if (s->engine->id =3D=3D BCS0 &&
>  			    cmd_reg(s, i) =3D=3D i915_mmio_reg_offset(DERRMR))
>  				ret |=3D 0;
>  			else
> @@ -999,9 +1001,9 @@ static int cmd_handler_lrr(struct parser_exec_state =
*s)
>  	int cmd_len =3D cmd_length(s);
> =20
>  	for (i =3D 1; i < cmd_len; i +=3D 2) {
> -		if (IS_BROADWELL(s->vgpu->gvt->dev_priv))
> +		if (IS_BROADWELL(s->engine->i915))
>  			ret |=3D ((cmd_reg_inhibit(s, i) ||
> -					(cmd_reg_inhibit(s, i + 1)))) ?
> +				 (cmd_reg_inhibit(s, i + 1)))) ?
>  				-EBADRQC : 0;
>  		if (ret)
>  			break;
> @@ -1027,7 +1029,7 @@ static int cmd_handler_lrm(struct parser_exec_state=
 *s)
>  	int cmd_len =3D cmd_length(s);
> =20
>  	for (i =3D 1; i < cmd_len;) {
> -		if (IS_BROADWELL(gvt->dev_priv))
> +		if (IS_BROADWELL(s->engine->i915))
>  			ret |=3D (cmd_reg_inhibit(s, i)) ? -EBADRQC : 0;
>  		if (ret)
>  			break;
> @@ -1139,7 +1141,7 @@ static int cmd_handler_pipe_control(struct parser_e=
xec_state *s)
>  				if (ret)
>  					return ret;
>  				if (index_mode) {
> -					hws_pga =3D s->vgpu->hws_pga[s->ring_id];
> +					hws_pga =3D s->vgpu->hws_pga[s->engine->id];
>  					gma =3D hws_pga + gma;
>  					patch_value(s, cmd_ptr(s, 2), gma);
>  					val =3D cmd_val(s, 1) & (~(1 << 21));
> @@ -1153,15 +1155,15 @@ static int cmd_handler_pipe_control(struct parser=
_exec_state *s)
>  		return ret;
> =20
>  	if (cmd_val(s, 1) & PIPE_CONTROL_NOTIFY)
> -		set_bit(cmd_interrupt_events[s->ring_id].pipe_control_notify,
> -				s->workload->pending_events);
> +		set_bit(cmd_interrupt_events[s->engine->id].pipe_control_notify,
> +			s->workload->pending_events);
>  	return 0;
>  }
> =20
>  static int cmd_handler_mi_user_interrupt(struct parser_exec_state *s)
>  {
> -	set_bit(cmd_interrupt_events[s->ring_id].mi_user_interrupt,
> -			s->workload->pending_events);
> +	set_bit(cmd_interrupt_events[s->engine->id].mi_user_interrupt,
> +		s->workload->pending_events);
>  	patch_value(s, cmd_ptr(s, 0), MI_NOOP);
>  	return 0;
>  }
> @@ -1211,7 +1213,7 @@ struct plane_code_mapping {
>  static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
>  		struct mi_display_flip_command_info *info)
>  {
> -	struct drm_i915_private *dev_priv =3D s->vgpu->gvt->dev_priv;
> +	struct drm_i915_private *dev_priv =3D s->engine->i915;
>  	struct plane_code_mapping gen8_plane_code[] =3D {
>  		[0] =3D {PIPE_A, PLANE_A, PRIMARY_A_FLIP_DONE},
>  		[1] =3D {PIPE_B, PLANE_A, PRIMARY_B_FLIP_DONE},
> @@ -1257,7 +1259,7 @@ static int gen8_decode_mi_display_flip(struct parse=
r_exec_state *s,
>  static int skl_decode_mi_display_flip(struct parser_exec_state *s,
>  		struct mi_display_flip_command_info *info)
>  {
> -	struct drm_i915_private *dev_priv =3D s->vgpu->gvt->dev_priv;
> +	struct drm_i915_private *dev_priv =3D s->engine->i915;
>  	struct intel_vgpu *vgpu =3D s->vgpu;
>  	u32 dword0 =3D cmd_val(s, 0);
>  	u32 dword1 =3D cmd_val(s, 1);
> @@ -1316,13 +1318,12 @@ static int skl_decode_mi_display_flip(struct pars=
er_exec_state *s,
>  static int gen8_check_mi_display_flip(struct parser_exec_state *s,
>  		struct mi_display_flip_command_info *info)
>  {
> -	struct drm_i915_private *dev_priv =3D s->vgpu->gvt->dev_priv;
>  	u32 stride, tile;
> =20
>  	if (!info->async_flip)
>  		return 0;
> =20
> -	if (INTEL_GEN(dev_priv) >=3D 9) {
> +	if (INTEL_GEN(s->engine->i915) >=3D 9) {
>  		stride =3D vgpu_vreg_t(s->vgpu, info->stride_reg) & GENMASK(9, 0);
>  		tile =3D (vgpu_vreg_t(s->vgpu, info->ctrl_reg) &
>  				GENMASK(12, 10)) >> 10;
> @@ -1345,7 +1346,7 @@ static int gen8_update_plane_mmio_from_mi_display_f=
lip(
>  		struct parser_exec_state *s,
>  		struct mi_display_flip_command_info *info)
>  {
> -	struct drm_i915_private *dev_priv =3D s->vgpu->gvt->dev_priv;
> +	struct drm_i915_private *dev_priv =3D s->engine->i915;
>  	struct intel_vgpu *vgpu =3D s->vgpu;
> =20
>  	set_mask_bits(&vgpu_vreg_t(vgpu, info->surf_reg), GENMASK(31, 12),
> @@ -1376,11 +1377,9 @@ static int gen8_update_plane_mmio_from_mi_display_=
flip(
>  static int decode_mi_display_flip(struct parser_exec_state *s,
>  		struct mi_display_flip_command_info *info)
>  {
> -	struct drm_i915_private *dev_priv =3D s->vgpu->gvt->dev_priv;
> -
> -	if (IS_BROADWELL(dev_priv))
> +	if (IS_BROADWELL(s->engine->i915))
>  		return gen8_decode_mi_display_flip(s, info);
> -	if (INTEL_GEN(dev_priv) >=3D 9)
> +	if (INTEL_GEN(s->engine->i915) >=3D 9)
>  		return skl_decode_mi_display_flip(s, info);
> =20
>  	return -ENODEV;
> @@ -1665,7 +1664,7 @@ static int cmd_handler_mi_flush_dw(struct parser_ex=
ec_state *s)
>  		if (ret)
>  			return ret;
>  		if (index_mode) {
> -			hws_pga =3D s->vgpu->hws_pga[s->ring_id];
> +			hws_pga =3D s->vgpu->hws_pga[s->engine->id];
>  			gma =3D hws_pga + gma;
>  			patch_value(s, cmd_ptr(s, 1), gma);
>  			val =3D cmd_val(s, 0) & (~(1 << 21));
> @@ -1674,8 +1673,8 @@ static int cmd_handler_mi_flush_dw(struct parser_ex=
ec_state *s)
>  	}
>  	/* Check notify bit */
>  	if ((cmd_val(s, 0) & (1 << 8)))
> -		set_bit(cmd_interrupt_events[s->ring_id].mi_flush_dw,
> -				s->workload->pending_events);
> +		set_bit(cmd_interrupt_events[s->engine->id].mi_flush_dw,
> +			s->workload->pending_events);
>  	return ret;
>  }
> =20
> @@ -1723,12 +1722,18 @@ static int copy_gma_to_hva(struct intel_vgpu *vgp=
u, struct intel_vgpu_mm *mm,
>  static int batch_buffer_needs_scan(struct parser_exec_state *s)
>  {
>  	/* Decide privilege based on address space */
> -	if (cmd_val(s, 0) & (1 << 8) &&
> -			!(s->vgpu->scan_nonprivbb & (1 << s->ring_id)))
> +	if (cmd_val(s, 0) & BIT(8) &&
> +	    !(s->vgpu->scan_nonprivbb & s->engine->mask))
>  		return 0;
> +
>  	return 1;
>  }
> =20
> +static const char *repr_addr_type(unsigned int type)
> +{
> +	return type =3D=3D PPGTT_BUFFER ? "ppgtt" : "ggtt";
> +}
> +
>  static int find_bb_size(struct parser_exec_state *s,
>  			unsigned long *bb_size,
>  			unsigned long *bb_end_cmd_offset)
> @@ -1751,24 +1756,24 @@ static int find_bb_size(struct parser_exec_state =
*s,
>  		return -EFAULT;
> =20
>  	cmd =3D cmd_val(s, 0);
> -	info =3D get_cmd_info(s->vgpu->gvt, cmd, s->ring_id);
> +	info =3D get_cmd_info(s->vgpu->gvt, cmd, s->engine);
>  	if (info =3D=3D NULL) {
> -		gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %d=
, workload=3D%p\n",
> -				cmd, get_opcode(cmd, s->ring_id),
> -				(s->buf_addr_type =3D=3D PPGTT_BUFFER) ?
> -				"ppgtt" : "ggtt", s->ring_id, s->workload);
> +		gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %s=
, workload=3D%p\n",
> +			     cmd, get_opcode(cmd, s->engine),
> +			     repr_addr_type(s->buf_addr_type),
> +			     s->engine->name, s->workload);
>  		return -EBADRQC;
>  	}
>  	do {
>  		if (copy_gma_to_hva(s->vgpu, mm,
> -				gma, gma + 4, &cmd) < 0)
> +				    gma, gma + 4, &cmd) < 0)
>  			return -EFAULT;
> -		info =3D get_cmd_info(s->vgpu->gvt, cmd, s->ring_id);
> +		info =3D get_cmd_info(s->vgpu->gvt, cmd, s->engine);
>  		if (info =3D=3D NULL) {
> -			gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %=
d, workload=3D%p\n",
> -				cmd, get_opcode(cmd, s->ring_id),
> -				(s->buf_addr_type =3D=3D PPGTT_BUFFER) ?
> -				"ppgtt" : "ggtt", s->ring_id, s->workload);
> +			gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %=
s, workload=3D%p\n",
> +				     cmd, get_opcode(cmd, s->engine),
> +				     repr_addr_type(s->buf_addr_type),
> +				     s->engine->name, s->workload);
>  			return -EBADRQC;
>  		}
> =20
> @@ -1797,12 +1802,12 @@ static int audit_bb_end(struct parser_exec_state =
*s, void *va)
>  	u32 cmd =3D *(u32 *)va;
>  	const struct cmd_info *info;
> =20
> -	info =3D get_cmd_info(s->vgpu->gvt, cmd, s->ring_id);
> +	info =3D get_cmd_info(s->vgpu->gvt, cmd, s->engine);
>  	if (info =3D=3D NULL) {
> -		gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %d=
, workload=3D%p\n",
> -			cmd, get_opcode(cmd, s->ring_id),
> -			(s->buf_addr_type =3D=3D PPGTT_BUFFER) ?
> -			"ppgtt" : "ggtt", s->ring_id, s->workload);
> +		gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %s=
, workload=3D%p\n",
> +			     cmd, get_opcode(cmd, s->engine),
> +			     repr_addr_type(s->buf_addr_type),
> +			     s->engine->name, s->workload);
>  		return -EBADRQC;
>  	}
> =20
> @@ -1855,7 +1860,7 @@ static int perform_bb_shadow(struct parser_exec_sta=
te *s)
>  	if (bb->ppgtt)
>  		start_offset =3D gma & ~I915_GTT_PAGE_MASK;
> =20
> -	bb->obj =3D i915_gem_object_create_shmem(s->vgpu->gvt->dev_priv,
> +	bb->obj =3D i915_gem_object_create_shmem(s->engine->i915,
>  					       round_up(bb_size + start_offset,
>  							PAGE_SIZE));
>  	if (IS_ERR(bb->obj)) {
> @@ -2664,25 +2669,25 @@ static int cmd_parser_exec(struct parser_exec_sta=
te *s)
>  	if (cmd =3D=3D MI_NOOP)
>  		info =3D &cmd_info[mi_noop_index];
>  	else
> -		info =3D get_cmd_info(s->vgpu->gvt, cmd, s->ring_id);
> +		info =3D get_cmd_info(s->vgpu->gvt, cmd, s->engine);
> =20
>  	if (info =3D=3D NULL) {
> -		gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %d=
, workload=3D%p\n",
> -				cmd, get_opcode(cmd, s->ring_id),
> -				(s->buf_addr_type =3D=3D PPGTT_BUFFER) ?
> -				"ppgtt" : "ggtt", s->ring_id, s->workload);
> +		gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring %s=
, workload=3D%p\n",
> +			     cmd, get_opcode(cmd, s->engine),
> +			     repr_addr_type(s->buf_addr_type),
> +			     s->engine->name, s->workload);
>  		return -EBADRQC;
>  	}
> =20
>  	s->info =3D info;
> =20
> -	trace_gvt_command(vgpu->id, s->ring_id, s->ip_gma, s->ip_va,
> +	trace_gvt_command(vgpu->id, s->engine->id, s->ip_gma, s->ip_va,
>  			  cmd_length(s), s->buf_type, s->buf_addr_type,
>  			  s->workload, info->name);
> =20
>  	if ((info->flag & F_LEN_MASK) =3D=3D F_LEN_VAR_FIXED) {
>  		ret =3D gvt_check_valid_cmd_length(cmd_length(s),
> -			info->valid_len);
> +						 info->valid_len);
>  		if (ret)
>  			return ret;
>  	}
> @@ -2779,7 +2784,7 @@ static int scan_workload(struct intel_vgpu_workload=
 *workload)
>  	s.buf_type =3D RING_BUFFER_INSTRUCTION;
>  	s.buf_addr_type =3D GTT_BUFFER;
>  	s.vgpu =3D workload->vgpu;
> -	s.ring_id =3D workload->ring_id;
> +	s.engine =3D workload->engine;
>  	s.ring_start =3D workload->rb_start;
>  	s.ring_size =3D _RING_CTL_BUF_SIZE(workload->rb_ctl);
>  	s.ring_head =3D gma_head;
> @@ -2788,8 +2793,7 @@ static int scan_workload(struct intel_vgpu_workload=
 *workload)
>  	s.workload =3D workload;
>  	s.is_ctx_wa =3D false;
> =20
> -	if ((bypass_scan_mask & (1 << workload->ring_id)) ||
> -		gma_head =3D=3D gma_tail)
> +	if (bypass_scan_mask & workload->engine->mask || gma_head =3D=3D gma_ta=
il)
>  		return 0;
> =20
>  	ret =3D ip_gma_set(&s, gma_head);
> @@ -2828,7 +2832,7 @@ static int scan_wa_ctx(struct intel_shadow_wa_ctx *=
wa_ctx)
>  	s.buf_type =3D RING_BUFFER_INSTRUCTION;
>  	s.buf_addr_type =3D GTT_BUFFER;
>  	s.vgpu =3D workload->vgpu;
> -	s.ring_id =3D workload->ring_id;
> +	s.engine =3D workload->engine;
>  	s.ring_start =3D wa_ctx->indirect_ctx.guest_gma;
>  	s.ring_size =3D ring_size;
>  	s.ring_head =3D gma_head;
> @@ -2853,7 +2857,6 @@ static int shadow_workload_ring_buffer(struct intel=
_vgpu_workload *workload)
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	unsigned long gma_head, gma_tail, gma_top, guest_rb_size;
>  	void *shadow_ring_buffer_va;
> -	int ring_id =3D workload->ring_id;
>  	int ret;
> =20
>  	guest_rb_size =3D _RING_CTL_BUF_SIZE(workload->rb_ctl);
> @@ -2866,21 +2869,21 @@ static int shadow_workload_ring_buffer(struct int=
el_vgpu_workload *workload)
>  	gma_tail =3D workload->rb_start + workload->rb_tail;
>  	gma_top =3D workload->rb_start + guest_rb_size;
> =20
> -	if (workload->rb_len > s->ring_scan_buffer_size[ring_id]) {
> +	if (workload->rb_len > s->ring_scan_buffer_size[workload->engine->id]) {
>  		void *p;
> =20
>  		/* realloc the new ring buffer if needed */
> -		p =3D krealloc(s->ring_scan_buffer[ring_id], workload->rb_len,
> -				GFP_KERNEL);
> +		p =3D krealloc(s->ring_scan_buffer[workload->engine->id],
> +			     workload->rb_len, GFP_KERNEL);
>  		if (!p) {
>  			gvt_vgpu_err("fail to re-alloc ring scan buffer\n");
>  			return -ENOMEM;
>  		}
> -		s->ring_scan_buffer[ring_id] =3D p;
> -		s->ring_scan_buffer_size[ring_id] =3D workload->rb_len;
> +		s->ring_scan_buffer[workload->engine->id] =3D p;
> +		s->ring_scan_buffer_size[workload->engine->id] =3D workload->rb_len;
>  	}
> =20
> -	shadow_ring_buffer_va =3D s->ring_scan_buffer[ring_id];
> +	shadow_ring_buffer_va =3D s->ring_scan_buffer[workload->engine->id];
> =20
>  	/* get shadow ring buffer va */
>  	workload->shadow_ring_buffer_va =3D shadow_ring_buffer_va;
> @@ -2938,7 +2941,7 @@ static int shadow_indirect_ctx(struct intel_shadow_=
wa_ctx *wa_ctx)
>  	int ret =3D 0;
>  	void *map;
> =20
> -	obj =3D i915_gem_object_create_shmem(workload->vgpu->gvt->dev_priv,
> +	obj =3D i915_gem_object_create_shmem(workload->engine->i915,
>  					   roundup(ctx_size + CACHELINE_BYTES,
>  						   PAGE_SIZE));
>  	if (IS_ERR(obj))
> @@ -3027,30 +3030,14 @@ int intel_gvt_scan_and_shadow_wa_ctx(struct intel=
_shadow_wa_ctx *wa_ctx)
>  	return 0;
>  }
> =20
> -static const struct cmd_info *find_cmd_entry_any_ring(struct intel_gvt *=
gvt,
> -		unsigned int opcode, unsigned long rings)
> -{
> -	const struct cmd_info *info =3D NULL;
> -	unsigned int ring;
> -
> -	for_each_set_bit(ring, &rings, I915_NUM_ENGINES) {
> -		info =3D find_cmd_entry(gvt, opcode, ring);
> -		if (info)
> -			break;
> -	}
> -	return info;
> -}
> -
>  static int init_cmd_table(struct intel_gvt *gvt)
>  {
> +	unsigned int gen_type =3D intel_gvt_get_device_type(gvt);
>  	int i;
> -	struct cmd_entry *e;
> -	const struct cmd_info *info;
> -	unsigned int gen_type;
> -
> -	gen_type =3D intel_gvt_get_device_type(gvt);
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(cmd_info); i++) {
> +		struct cmd_entry *e;
> +
>  		if (!(cmd_info[i].devices & gen_type))
>  			continue;
> =20
> @@ -3059,23 +3046,16 @@ static int init_cmd_table(struct intel_gvt *gvt)
>  			return -ENOMEM;
> =20
>  		e->info =3D &cmd_info[i];
> -		info =3D find_cmd_entry_any_ring(gvt,
> -				e->info->opcode, e->info->rings);
> -		if (info) {
> -			gvt_err("%s %s duplicated\n", e->info->name,
> -					info->name);
> -			kfree(e);
> -			return -EEXIST;
> -		}
>  		if (cmd_info[i].opcode =3D=3D OP_MI_NOOP)
>  			mi_noop_index =3D i;
> =20
>  		INIT_HLIST_NODE(&e->hlist);
>  		add_cmd_entry(gvt, e);
>  		gvt_dbg_cmd("add %-30s op %04x flag %x devs %02x rings %02x\n",
> -				e->info->name, e->info->opcode, e->info->flag,
> -				e->info->devices, e->info->rings);
> +			    e->info->name, e->info->opcode, e->info->flag,
> +			    e->info->devices, e->info->rings);
>  	}
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gv=
t/debugfs.c
> index 285f6011a537..874ee1de6b49 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -128,6 +128,7 @@ static int
>  vgpu_scan_nonprivbb_get(void *data, u64 *val)
>  {
>  	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)data;
> +
>  	*val =3D vgpu->scan_nonprivbb;
>  	return 0;
>  }
> @@ -142,42 +143,7 @@ static int
>  vgpu_scan_nonprivbb_set(void *data, u64 val)
>  {
>  	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)data;
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	enum intel_engine_id id;
> -	char buf[128], *s;
> -	int len;
> -
> -	val &=3D (1 << I915_NUM_ENGINES) - 1;
> -
> -	if (vgpu->scan_nonprivbb =3D=3D val)
> -		return 0;
> -
> -	if (!val)
> -		goto done;
> -
> -	len =3D sprintf(buf,
> -		"gvt: vgpu %d turns on non-privileged batch buffers scanning on Engine=
s:",
> -		vgpu->id);
> -
> -	s =3D buf + len;
> -
> -	for (id =3D 0; id < I915_NUM_ENGINES; id++) {
> -		struct intel_engine_cs *engine;
> -
> -		engine =3D dev_priv->engine[id];
> -		if (engine && (val & (1 << id))) {
> -			len =3D snprintf(s, 4, "%d, ", engine->id);
> -			s +=3D len;
> -		} else
> -			val &=3D  ~(1 << id);
> -	}
> -
> -	if (val)
> -		sprintf(s, "low performance expected.");
> -
> -	pr_warn("%s\n", buf);
> =20
> -done:
>  	vgpu->scan_nonprivbb =3D val;
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/g=
vt/execlist.c
> index f21b8fb5b37e..a447462d8701 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.c
> +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> @@ -39,8 +39,7 @@
>  #define _EL_OFFSET_STATUS_BUF   0x370
>  #define _EL_OFFSET_STATUS_PTR   0x3A0
> =20
> -#define execlist_ring_mmio(gvt, ring_id, offset) \
> -	(gvt->dev_priv->engine[ring_id]->mmio_base + (offset))
> +#define execlist_ring_mmio(e, offset) ((e)->mmio_base + (offset))
> =20
>  #define valid_context(ctx) ((ctx)->valid)
>  #define same_context(a, b) (((a)->context_id =3D=3D (b)->context_id) && \
> @@ -54,12 +53,12 @@ static int context_switch_events[] =3D {
>  	[VECS0] =3D VECS_AS_CONTEXT_SWITCH,
>  };
> =20
> -static int ring_id_to_context_switch_event(unsigned int ring_id)
> +static int to_context_switch_event(const struct intel_engine_cs *engine)
>  {
> -	if (WARN_ON(ring_id >=3D ARRAY_SIZE(context_switch_events)))
> +	if (WARN_ON(engine->id >=3D ARRAY_SIZE(context_switch_events)))
>  		return -EINVAL;
> =20
> -	return context_switch_events[ring_id];
> +	return context_switch_events[engine->id];
>  }
> =20
>  static void switch_virtual_execlist_slot(struct intel_vgpu_execlist *exe=
clist)
> @@ -93,9 +92,8 @@ static void emulate_execlist_status(struct intel_vgpu_e=
xeclist *execlist)
>  	struct execlist_ctx_descriptor_format *desc =3D execlist->running_conte=
xt;
>  	struct intel_vgpu *vgpu =3D execlist->vgpu;
>  	struct execlist_status_format status;
> -	int ring_id =3D execlist->ring_id;
> -	u32 status_reg =3D execlist_ring_mmio(vgpu->gvt,
> -			ring_id, _EL_OFFSET_STATUS);
> +	u32 status_reg =3D
> +		execlist_ring_mmio(execlist->engine, _EL_OFFSET_STATUS);
> =20
>  	status.ldw =3D vgpu_vreg(vgpu, status_reg);
>  	status.udw =3D vgpu_vreg(vgpu, status_reg + 4);
> @@ -124,21 +122,19 @@ static void emulate_execlist_status(struct intel_vg=
pu_execlist *execlist)
>  }
> =20
>  static void emulate_csb_update(struct intel_vgpu_execlist *execlist,
> -		struct execlist_context_status_format *status,
> -		bool trigger_interrupt_later)
> +			       struct execlist_context_status_format *status,
> +			       bool trigger_interrupt_later)
>  {
>  	struct intel_vgpu *vgpu =3D execlist->vgpu;
> -	int ring_id =3D execlist->ring_id;
>  	struct execlist_context_status_pointer_format ctx_status_ptr;
>  	u32 write_pointer;
>  	u32 ctx_status_ptr_reg, ctx_status_buf_reg, offset;
>  	unsigned long hwsp_gpa;
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> =20
> -	ctx_status_ptr_reg =3D execlist_ring_mmio(vgpu->gvt, ring_id,
> -			_EL_OFFSET_STATUS_PTR);
> -	ctx_status_buf_reg =3D execlist_ring_mmio(vgpu->gvt, ring_id,
> -			_EL_OFFSET_STATUS_BUF);
> +	ctx_status_ptr_reg =3D
> +		execlist_ring_mmio(execlist->engine, _EL_OFFSET_STATUS_PTR);
> +	ctx_status_buf_reg =3D
> +		execlist_ring_mmio(execlist->engine, _EL_OFFSET_STATUS_BUF);
> =20
>  	ctx_status_ptr.dw =3D vgpu_vreg(vgpu, ctx_status_ptr_reg);
> =20
> @@ -161,26 +157,24 @@ static void emulate_csb_update(struct intel_vgpu_ex=
eclist *execlist,
> =20
>  	/* Update the CSB and CSB write pointer in HWSP */
>  	hwsp_gpa =3D intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
> -					 vgpu->hws_pga[ring_id]);
> +					 vgpu->hws_pga[execlist->engine->id]);
>  	if (hwsp_gpa !=3D INTEL_GVT_INVALID_ADDR) {
>  		intel_gvt_hypervisor_write_gpa(vgpu,
> -			hwsp_gpa + I915_HWS_CSB_BUF0_INDEX * 4 +
> -			write_pointer * 8,
> -			status, 8);
> +					       hwsp_gpa + I915_HWS_CSB_BUF0_INDEX * 4 + write_pointer * 8,
> +					       status, 8);
>  		intel_gvt_hypervisor_write_gpa(vgpu,
> -			hwsp_gpa +
> -			intel_hws_csb_write_index(dev_priv) * 4,
> -			&write_pointer, 4);
> +					       hwsp_gpa + intel_hws_csb_write_index(execlist->engine->i915)=
 * 4,
> +					       &write_pointer, 4);
>  	}
> =20
>  	gvt_dbg_el("vgpu%d: w pointer %u reg %x csb l %x csb h %x\n",
> -		vgpu->id, write_pointer, offset, status->ldw, status->udw);
> +		   vgpu->id, write_pointer, offset, status->ldw, status->udw);
> =20
>  	if (trigger_interrupt_later)
>  		return;
> =20
>  	intel_vgpu_trigger_virtual_event(vgpu,
> -			ring_id_to_context_switch_event(execlist->ring_id));
> +					 to_context_switch_event(execlist->engine));
>  }
> =20
>  static int emulate_execlist_ctx_schedule_out(
> @@ -261,9 +255,8 @@ static struct intel_vgpu_execlist_slot *get_next_exec=
list_slot(
>  		struct intel_vgpu_execlist *execlist)
>  {
>  	struct intel_vgpu *vgpu =3D execlist->vgpu;
> -	int ring_id =3D execlist->ring_id;
> -	u32 status_reg =3D execlist_ring_mmio(vgpu->gvt, ring_id,
> -			_EL_OFFSET_STATUS);
> +	u32 status_reg =3D
> +		execlist_ring_mmio(execlist->engine, _EL_OFFSET_STATUS);
>  	struct execlist_status_format status;
> =20
>  	status.ldw =3D vgpu_vreg(vgpu, status_reg);
> @@ -379,7 +372,6 @@ static int prepare_execlist_workload(struct intel_vgp=
u_workload *workload)
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	struct execlist_ctx_descriptor_format ctx[2];
> -	int ring_id =3D workload->ring_id;
>  	int ret;
> =20
>  	if (!workload->emulate_schedule_in)
> @@ -388,7 +380,8 @@ static int prepare_execlist_workload(struct intel_vgp=
u_workload *workload)
>  	ctx[0] =3D *get_desc_from_elsp_dwords(&workload->elsp_dwords, 0);
>  	ctx[1] =3D *get_desc_from_elsp_dwords(&workload->elsp_dwords, 1);
> =20
> -	ret =3D emulate_execlist_schedule_in(&s->execlist[ring_id], ctx);
> +	ret =3D emulate_execlist_schedule_in(&s->execlist[workload->engine->id],
> +					   ctx);
>  	if (ret) {
>  		gvt_vgpu_err("fail to emulate execlist schedule in\n");
>  		return ret;
> @@ -399,21 +392,21 @@ static int prepare_execlist_workload(struct intel_v=
gpu_workload *workload)
>  static int complete_execlist_workload(struct intel_vgpu_workload *worklo=
ad)
>  {
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
> -	int ring_id =3D workload->ring_id;
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> -	struct intel_vgpu_execlist *execlist =3D &s->execlist[ring_id];
> +	struct intel_vgpu_execlist *execlist =3D
> +		&s->execlist[workload->engine->id];
>  	struct intel_vgpu_workload *next_workload;
> -	struct list_head *next =3D workload_q_head(vgpu, ring_id)->next;
> +	struct list_head *next =3D workload_q_head(vgpu, workload->engine)->nex=
t;
>  	bool lite_restore =3D false;
>  	int ret =3D 0;
> =20
> -	gvt_dbg_el("complete workload %p status %d\n", workload,
> -			workload->status);
> +	gvt_dbg_el("complete workload %p status %d\n",
> +		   workload, workload->status);
> =20
> -	if (workload->status || (vgpu->resetting_eng & BIT(ring_id)))
> +	if (workload->status || vgpu->resetting_eng & workload->engine->mask)
>  		goto out;
> =20
> -	if (!list_empty(workload_q_head(vgpu, ring_id))) {
> +	if (!list_empty(workload_q_head(vgpu, workload->engine))) {
>  		struct execlist_ctx_descriptor_format *this_desc, *next_desc;
> =20
>  		next_workload =3D container_of(next,
> @@ -436,14 +429,15 @@ static int complete_execlist_workload(struct intel_=
vgpu_workload *workload)
>  	return ret;
>  }
> =20
> -static int submit_context(struct intel_vgpu *vgpu, int ring_id,
> -		struct execlist_ctx_descriptor_format *desc,
> -		bool emulate_schedule_in)
> +static int submit_context(struct intel_vgpu *vgpu,
> +			  const struct intel_engine_cs *engine,
> +			  struct execlist_ctx_descriptor_format *desc,
> +			  bool emulate_schedule_in)
>  {
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	struct intel_vgpu_workload *workload =3D NULL;
> =20
> -	workload =3D intel_vgpu_create_workload(vgpu, ring_id, desc);
> +	workload =3D intel_vgpu_create_workload(vgpu, engine, desc);
>  	if (IS_ERR(workload))
>  		return PTR_ERR(workload);
> =20
> @@ -452,19 +446,20 @@ static int submit_context(struct intel_vgpu *vgpu, =
int ring_id,
>  	workload->emulate_schedule_in =3D emulate_schedule_in;
> =20
>  	if (emulate_schedule_in)
> -		workload->elsp_dwords =3D s->execlist[ring_id].elsp_dwords;
> +		workload->elsp_dwords =3D s->execlist[engine->id].elsp_dwords;
> =20
>  	gvt_dbg_el("workload %p emulate schedule_in %d\n", workload,
> -			emulate_schedule_in);
> +		   emulate_schedule_in);
> =20
>  	intel_vgpu_queue_workload(workload);
>  	return 0;
>  }
> =20
> -int intel_vgpu_submit_execlist(struct intel_vgpu *vgpu, int ring_id)
> +int intel_vgpu_submit_execlist(struct intel_vgpu *vgpu,
> +			       const struct intel_engine_cs *engine)
>  {
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> -	struct intel_vgpu_execlist *execlist =3D &s->execlist[ring_id];
> +	struct intel_vgpu_execlist *execlist =3D &s->execlist[engine->id];
>  	struct execlist_ctx_descriptor_format *desc[2];
>  	int i, ret;
> =20
> @@ -489,7 +484,7 @@ int intel_vgpu_submit_execlist(struct intel_vgpu *vgp=
u, int ring_id)
>  	for (i =3D 0; i < ARRAY_SIZE(desc); i++) {
>  		if (!desc[i]->valid)
>  			continue;
> -		ret =3D submit_context(vgpu, ring_id, desc[i], i =3D=3D 0);
> +		ret =3D submit_context(vgpu, engine, desc[i], i =3D=3D 0);
>  		if (ret) {
>  			gvt_vgpu_err("failed to submit desc %d\n", i);
>  			return ret;
> @@ -504,22 +499,22 @@ int intel_vgpu_submit_execlist(struct intel_vgpu *v=
gpu, int ring_id)
>  	return -EINVAL;
>  }
> =20
> -static void init_vgpu_execlist(struct intel_vgpu *vgpu, int ring_id)
> +static void init_vgpu_execlist(struct intel_vgpu *vgpu,
> +			       const struct intel_engine_cs *engine)
>  {
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> -	struct intel_vgpu_execlist *execlist =3D &s->execlist[ring_id];
> +	struct intel_vgpu_execlist *execlist =3D &s->execlist[engine->id];
>  	struct execlist_context_status_pointer_format ctx_status_ptr;
>  	u32 ctx_status_ptr_reg;
> =20
>  	memset(execlist, 0, sizeof(*execlist));
> =20
>  	execlist->vgpu =3D vgpu;
> -	execlist->ring_id =3D ring_id;
> +	execlist->engine =3D engine;
>  	execlist->slot[0].index =3D 0;
>  	execlist->slot[1].index =3D 1;
> =20
> -	ctx_status_ptr_reg =3D execlist_ring_mmio(vgpu->gvt, ring_id,
> -			_EL_OFFSET_STATUS_PTR);
> +	ctx_status_ptr_reg =3D execlist_ring_mmio(engine, _EL_OFFSET_STATUS_PTR=
);
>  	ctx_status_ptr.dw =3D vgpu_vreg(vgpu, ctx_status_ptr_reg);
>  	ctx_status_ptr.read_ptr =3D 0;
>  	ctx_status_ptr.write_ptr =3D 0x7;
> @@ -549,7 +544,7 @@ static void reset_execlist(struct intel_vgpu *vgpu,
>  	intel_engine_mask_t tmp;
> =20
>  	for_each_engine_masked(engine, dev_priv, engine_mask, tmp)
> -		init_vgpu_execlist(vgpu, engine->id);
> +		init_vgpu_execlist(vgpu, engine);
>  }
> =20
>  static int init_execlist(struct intel_vgpu *vgpu,
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.h b/drivers/gpu/drm/i915/g=
vt/execlist.h
> index 5ccc2c695848..e8972e05140f 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.h
> +++ b/drivers/gpu/drm/i915/gvt/execlist.h
> @@ -168,16 +168,17 @@ struct intel_vgpu_execlist {
>  	struct intel_vgpu_execlist_slot *running_slot;
>  	struct intel_vgpu_execlist_slot *pending_slot;
>  	struct execlist_ctx_descriptor_format *running_context;
> -	int ring_id;
>  	struct intel_vgpu *vgpu;
>  	struct intel_vgpu_elsp_dwords elsp_dwords;
> +	const struct intel_engine_cs *engine;
>  };
> =20
>  void intel_vgpu_clean_execlist(struct intel_vgpu *vgpu);
> =20
>  int intel_vgpu_init_execlist(struct intel_vgpu *vgpu);
> =20
> -int intel_vgpu_submit_execlist(struct intel_vgpu *vgpu, int ring_id);
> +int intel_vgpu_submit_execlist(struct intel_vgpu *vgpu,
> +			       const struct intel_engine_cs *engine);
> =20
>  void intel_vgpu_reset_execlist(struct intel_vgpu *vgpu,
>  			       intel_engine_mask_t engine_mask);
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 45a9124e53b6..70ec5d939375 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -142,25 +142,25 @@ static int new_mmio_info(struct intel_gvt *gvt,
>  }
> =20
>  /**
> - * intel_gvt_render_mmio_to_ring_id - convert a mmio offset into ring id
> + * intel_gvt_render_mmio_to_engine - convert a mmio offset into the engi=
ne
>   * @gvt: a GVT device
>   * @offset: register offset
>   *
>   * Returns:
> - * Ring ID on success, negative error code if failed.
> + * The engine containing the offset within its mmio page.
>   */
> -int intel_gvt_render_mmio_to_ring_id(struct intel_gvt *gvt,
> -		unsigned int offset)
> +const struct intel_engine_cs *
> +intel_gvt_render_mmio_to_engine(struct intel_gvt *gvt, unsigned int offs=
et)
>  {
>  	enum intel_engine_id id;
>  	struct intel_engine_cs *engine;
> =20
>  	offset &=3D ~GENMASK(11, 0);
> -	for_each_engine(engine, gvt->dev_priv, id) {
> +	for_each_engine(engine, gvt->dev_priv, id)
>  		if (engine->mmio_base =3D=3D offset)
> -			return id;
> -	}
> -	return -ENODEV;
> +			return engine;
> +
> +	return NULL;
>  }
> =20
>  #define offset_to_fence_num(offset) \
> @@ -509,28 +509,23 @@ static int force_nonpriv_write(struct intel_vgpu *v=
gpu,
>  	unsigned int offset, void *p_data, unsigned int bytes)
>  {
>  	u32 reg_nonpriv =3D *(u32 *)p_data;
> -	int ring_id =3D intel_gvt_render_mmio_to_ring_id(vgpu->gvt, offset);
> -	u32 ring_base;
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	int ret =3D -EINVAL;
> +	const struct intel_engine_cs *engine =3D
> +		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
> =20
> -	if ((bytes !=3D 4) || ((offset & (bytes - 1)) !=3D 0) || ring_id < 0) {
> -		gvt_err("vgpu(%d) ring %d Invalid FORCE_NONPRIV offset %x(%dB)\n",
> -			vgpu->id, ring_id, offset, bytes);
> -		return ret;
> +	if (bytes !=3D 4 || !IS_ALIGNED(offset, bytes) || !engine) {
> +		gvt_err("vgpu(%d) Invalid FORCE_NONPRIV offset %x(%dB)\n",
> +			vgpu->id, offset, bytes);
> +		return -EINVAL;
>  	}
> =20
> -	ring_base =3D dev_priv->engine[ring_id]->mmio_base;
> -
> -	if (in_whitelist(reg_nonpriv) ||
> -		reg_nonpriv =3D=3D i915_mmio_reg_offset(RING_NOPID(ring_base))) {
> -		ret =3D intel_vgpu_default_mmio_write(vgpu, offset, p_data,
> -			bytes);
> -	} else
> +	if (!in_whitelist(reg_nonpriv) ||
> +	    reg_nonpriv !=3D i915_mmio_reg_offset(RING_NOPID(engine->mmio_base)=
)) {
>  		gvt_err("vgpu(%d) Invalid FORCE_NONPRIV write %x at offset %x\n",
>  			vgpu->id, reg_nonpriv, offset);
> +		return -EINVAL;
> +	}
> =20
> -	return 0;
> +	return intel_vgpu_default_mmio_write(vgpu, offset, p_data, bytes);
>  }
> =20
>  static int ddi_buf_ctl_mmio_write(struct intel_vgpu *vgpu, unsigned int =
offset,
> @@ -1470,7 +1465,8 @@ static int hws_pga_write(struct intel_vgpu *vgpu, u=
nsigned int offset,
>  		void *p_data, unsigned int bytes)
>  {
>  	u32 value =3D *(u32 *)p_data;
> -	int ring_id =3D intel_gvt_render_mmio_to_ring_id(vgpu->gvt, offset);
> +	const struct intel_engine_cs *engine =3D
> +		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
> =20
>  	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
>  		gvt_vgpu_err("write invalid HWSP address, reg:0x%x, value:0x%x\n",
> @@ -1482,12 +1478,12 @@ static int hws_pga_write(struct intel_vgpu *vgpu,=
 unsigned int offset,
>  	 * update the VM CSB status correctly. Here listed registers can
>  	 * support BDW, SKL or other platforms with same HWSP registers.
>  	 */
> -	if (unlikely(ring_id < 0 || ring_id >=3D I915_NUM_ENGINES)) {
> +	if (unlikely(!engine)) {
>  		gvt_vgpu_err("access unknown hardware status page register:0x%x\n",
>  			     offset);
>  		return -EINVAL;
>  	}
> -	vgpu->hws_pga[ring_id] =3D value;
> +	vgpu->hws_pga[engine->id] =3D value;
>  	gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: 0x%x\n",
>  		     vgpu->id, value, offset);
> =20
> @@ -1637,22 +1633,20 @@ static int mmio_read_from_hw(struct intel_vgpu *v=
gpu,
>  {
>  	struct intel_gvt *gvt =3D vgpu->gvt;
>  	struct drm_i915_private *dev_priv =3D gvt->dev_priv;
> -	int ring_id;
> -	u32 ring_base;
> +	const struct intel_engine_cs *engine =3D
> +		intel_gvt_render_mmio_to_engine(gvt, offset);
> =20
> -	ring_id =3D intel_gvt_render_mmio_to_ring_id(gvt, offset);
>  	/**
>  	 * Read HW reg in following case
>  	 * a. the offset isn't a ring mmio
>  	 * b. the offset's ring is running on hw.
>  	 * c. the offset is ring time stamp mmio
>  	 */
> -	if (ring_id >=3D 0)
> -		ring_base =3D dev_priv->engine[ring_id]->mmio_base;
> =20
> -	if (ring_id < 0 || vgpu  =3D=3D gvt->scheduler.engine_owner[ring_id] ||
> -	    offset =3D=3D i915_mmio_reg_offset(RING_TIMESTAMP(ring_base)) ||
> -	    offset =3D=3D i915_mmio_reg_offset(RING_TIMESTAMP_UDW(ring_base))) {
> +	if (!engine ||
> +	    vgpu =3D=3D gvt->scheduler.engine_owner[engine->id] ||
> +	    offset =3D=3D i915_mmio_reg_offset(RING_TIMESTAMP(engine->mmio_base=
)) ||
> +	    offset =3D=3D i915_mmio_reg_offset(RING_TIMESTAMP_UDW(engine->mmio_=
base))) {
>  		mmio_hw_access_pre(dev_priv);
>  		vgpu_vreg(vgpu, offset) =3D I915_READ(_MMIO(offset));
>  		mmio_hw_access_post(dev_priv);
> @@ -1664,22 +1658,23 @@ static int mmio_read_from_hw(struct intel_vgpu *v=
gpu,
>  static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
>  		void *p_data, unsigned int bytes)
>  {
> -	int ring_id =3D intel_gvt_render_mmio_to_ring_id(vgpu->gvt, offset);
> +	const struct intel_engine_cs *engine =3D
> +		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
>  	struct intel_vgpu_execlist *execlist;
>  	u32 data =3D *(u32 *)p_data;
>  	int ret =3D 0;
> =20
> -	if (WARN_ON(ring_id < 0 || ring_id >=3D I915_NUM_ENGINES))
> +	if (WARN_ON(!engine))
>  		return -EINVAL;
> =20
> -	execlist =3D &vgpu->submission.execlist[ring_id];
> +	execlist =3D &vgpu->submission.execlist[engine->id];
> =20
>  	execlist->elsp_dwords.data[3 - execlist->elsp_dwords.index] =3D data;
>  	if (execlist->elsp_dwords.index =3D=3D 3) {
> -		ret =3D intel_vgpu_submit_execlist(vgpu, ring_id);
> +		ret =3D intel_vgpu_submit_execlist(vgpu, engine);
>  		if(ret)
> -			gvt_vgpu_err("fail submit workload on ring %d\n",
> -				ring_id);
> +			gvt_vgpu_err("fail submit workload on ring %s\n",
> +				     engine->name);
>  	}
> =20
>  	++execlist->elsp_dwords.index;
> @@ -1691,7 +1686,8 @@ static int ring_mode_mmio_write(struct intel_vgpu *=
vgpu, unsigned int offset,
>  		void *p_data, unsigned int bytes)
>  {
>  	u32 data =3D *(u32 *)p_data;
> -	int ring_id =3D intel_gvt_render_mmio_to_ring_id(vgpu->gvt, offset);
> +	const struct intel_engine_cs *engine =3D
> +		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
>  	bool enable_execlist;
>  	int ret;
> =20
> @@ -1725,16 +1721,16 @@ static int ring_mode_mmio_write(struct intel_vgpu=
 *vgpu, unsigned int offset,
>  			|| (data & _MASKED_BIT_DISABLE(GFX_RUN_LIST_ENABLE))) {
>  		enable_execlist =3D !!(data & GFX_RUN_LIST_ENABLE);
> =20
> -		gvt_dbg_core("EXECLIST %s on ring %d\n",
> -				(enable_execlist ? "enabling" : "disabling"),
> -				ring_id);
> +		gvt_dbg_core("EXECLIST %s on ring %s\n",
> +			     (enable_execlist ? "enabling" : "disabling"),
> +			     engine->name);
> =20
>  		if (!enable_execlist)
>  			return 0;
> =20
>  		ret =3D intel_vgpu_select_submission_ops(vgpu,
> -			       BIT(ring_id),
> -			       INTEL_VGPU_EXECLIST_SUBMISSION);
> +						       engine->mask,
> +						       INTEL_VGPU_EXECLIST_SUBMISSION);
>  		if (ret)
>  			return ret;
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/m=
mio.h
> index 5874f1cb4306..48866cf2bfb6 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio.h
> @@ -67,8 +67,8 @@ struct intel_gvt_mmio_info {
>  	struct hlist_node node;
>  };
> =20
> -int intel_gvt_render_mmio_to_ring_id(struct intel_gvt *gvt,
> -		unsigned int reg);
> +const struct intel_engine_cs *
> +intel_gvt_render_mmio_to_engine(struct intel_gvt *gvt, unsigned int reg);
>  unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
>  bool intel_gvt_match_device(struct intel_gvt *gvt, unsigned long device);
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 4208e40445b1..e7f61585ea02 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -213,13 +213,11 @@ restore_context_mmio_for_inhibit(struct intel_vgpu =
*vgpu,
>  	*cs++ =3D MI_LOAD_REGISTER_IMM(count);
>  	for (mmio =3D gvt->engine_mmio_list.mmio;
>  	     i915_mmio_reg_valid(mmio->reg); mmio++) {
> -		if (mmio->ring_id !=3D ring_id ||
> -		    !mmio->in_context)
> +		if (mmio->id !=3D ring_id || !mmio->in_context)
>  			continue;
> =20
>  		*cs++ =3D i915_mmio_reg_offset(mmio->reg);
> -		*cs++ =3D vgpu_vreg_t(vgpu, mmio->reg) |
> -				(mmio->mask << 16);
> +		*cs++ =3D vgpu_vreg_t(vgpu, mmio->reg) | (mmio->mask << 16);
>  		gvt_dbg_core("add lri reg pair 0x%x:0x%x in inhibit ctx, vgpu:%d, rind=
_id:%d\n",
>  			      *(cs-2), *(cs-1), vgpu->id, ring_id);
>  	}
> @@ -343,10 +341,10 @@ static u32 gen8_tlb_mmio_offset_list[] =3D {
>  	[VECS0] =3D 0x4270,
>  };
> =20
> -static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_i=
d)
> +static void handle_tlb_pending_event(struct intel_vgpu *vgpu,
> +				     const struct intel_engine_cs *engine)
>  {
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	struct intel_uncore *uncore =3D &dev_priv->uncore;
> +	struct intel_uncore *uncore =3D engine->uncore;
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	u32 *regs =3D vgpu->gvt->engine_mmio_list.tlb_mmio_offset_list;
>  	u32 cnt =3D vgpu->gvt->engine_mmio_list.tlb_mmio_offset_list_cnt;
> @@ -356,13 +354,13 @@ static void handle_tlb_pending_event(struct intel_v=
gpu *vgpu, int ring_id)
>  	if (!regs)
>  		return;
> =20
> -	if (WARN_ON(ring_id >=3D cnt))
> +	if (WARN_ON(engine->id >=3D cnt))
>  		return;
> =20
> -	if (!test_and_clear_bit(ring_id, (void *)s->tlb_handle_pending))
> +	if (!test_and_clear_bit(engine->id, (void *)s->tlb_handle_pending))
>  		return;
> =20
> -	reg =3D _MMIO(regs[ring_id]);
> +	reg =3D _MMIO(regs[engine->id]);
> =20
>  	/* WaForceWakeRenderDuringMmioTLBInvalidate:skl
>  	 * we need to put a forcewake when invalidating RCS TLB caches,
> @@ -371,30 +369,27 @@ static void handle_tlb_pending_event(struct intel_v=
gpu *vgpu, int ring_id)
>  	 */
>  	fw =3D intel_uncore_forcewake_for_reg(uncore, reg,
>  					    FW_REG_READ | FW_REG_WRITE);
> -	if (ring_id =3D=3D RCS0 && INTEL_GEN(dev_priv) >=3D 9)
> +	if (engine->id =3D=3D RCS0 && INTEL_GEN(engine->i915) >=3D 9)
>  		fw |=3D FORCEWAKE_RENDER;
> =20
>  	intel_uncore_forcewake_get(uncore, fw);
> =20
>  	intel_uncore_write_fw(uncore, reg, 0x1);
> =20
> -	if (wait_for_atomic((intel_uncore_read_fw(uncore, reg) =3D=3D 0), 50))
> -		gvt_vgpu_err("timeout in invalidate ring (%d) tlb\n", ring_id);
> +	if (wait_for_atomic(intel_uncore_read_fw(uncore, reg) =3D=3D 0, 50))
> +		gvt_vgpu_err("timeout in invalidate ring %s tlb\n",
> +			     engine->name);
>  	else
>  		vgpu_vreg_t(vgpu, reg) =3D 0;
> =20
>  	intel_uncore_forcewake_put(uncore, fw);
> =20
> -	gvt_dbg_core("invalidate TLB for ring %d\n", ring_id);
> +	gvt_dbg_core("invalidate TLB for ring %s\n", engine->name);
>  }
> =20
>  static void switch_mocs(struct intel_vgpu *pre, struct intel_vgpu *next,
> -			int ring_id)
> +			const struct intel_engine_cs *engine)
>  {
> -	struct drm_i915_private *dev_priv;
> -	i915_reg_t offset, l3_offset;
> -	u32 old_v, new_v;
> -
>  	u32 regs[] =3D {
>  		[RCS0]  =3D 0xc800,
>  		[VCS0]  =3D 0xc900,
> @@ -402,36 +397,38 @@ static void switch_mocs(struct intel_vgpu *pre, str=
uct intel_vgpu *next,
>  		[BCS0]  =3D 0xcc00,
>  		[VECS0] =3D 0xcb00,
>  	};
> +	struct intel_uncore *uncore =3D engine->uncore;
> +	i915_reg_t offset, l3_offset;
> +	u32 old_v, new_v;
>  	int i;
> =20
> -	dev_priv =3D pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
> -	if (WARN_ON(ring_id >=3D ARRAY_SIZE(regs)))
> +	if (WARN_ON(engine->id >=3D ARRAY_SIZE(regs)))
>  		return;
> =20
> -	if (ring_id =3D=3D RCS0 && IS_GEN(dev_priv, 9))
> +	if (engine->id =3D=3D RCS0 && IS_GEN(engine->i915, 9))
>  		return;
> =20
>  	if (!pre && !gen9_render_mocs.initialized)
> -		load_render_mocs(dev_priv);
> +		load_render_mocs(engine->i915);
> =20
> -	offset.reg =3D regs[ring_id];
> +	offset.reg =3D regs[engine->id];
>  	for (i =3D 0; i < GEN9_MOCS_SIZE; i++) {
>  		if (pre)
>  			old_v =3D vgpu_vreg_t(pre, offset);
>  		else
> -			old_v =3D gen9_render_mocs.control_table[ring_id][i];
> +			old_v =3D gen9_render_mocs.control_table[engine->id][i];
>  		if (next)
>  			new_v =3D vgpu_vreg_t(next, offset);
>  		else
> -			new_v =3D gen9_render_mocs.control_table[ring_id][i];
> +			new_v =3D gen9_render_mocs.control_table[engine->id][i];
> =20
>  		if (old_v !=3D new_v)
> -			I915_WRITE_FW(offset, new_v);
> +			intel_uncore_write_fw(uncore, offset, new_v);
> =20
>  		offset.reg +=3D 4;
>  	}
> =20
> -	if (ring_id =3D=3D RCS0) {
> +	if (engine->id =3D=3D RCS0) {
>  		l3_offset.reg =3D 0xb020;
>  		for (i =3D 0; i < GEN9_MOCS_SIZE / 2; i++) {
>  			if (pre)
> @@ -444,7 +441,7 @@ static void switch_mocs(struct intel_vgpu *pre, struc=
t intel_vgpu *next,
>  				new_v =3D gen9_render_mocs.l3cc_table[i];
> =20
>  			if (old_v !=3D new_v)
> -				I915_WRITE_FW(l3_offset, new_v);
> +				intel_uncore_write_fw(uncore, l3_offset, new_v);
> =20
>  			l3_offset.reg +=3D 4;
>  		}
> @@ -466,38 +463,40 @@ bool is_inhibit_context(struct intel_context *ce)
>  /* Switch ring mmio values (context). */
>  static void switch_mmio(struct intel_vgpu *pre,
>  			struct intel_vgpu *next,
> -			int ring_id)
> +			const struct intel_engine_cs *engine)
>  {
> -	struct drm_i915_private *dev_priv;
> +	struct intel_uncore *uncore =3D engine->uncore;
>  	struct intel_vgpu_submission *s;
>  	struct engine_mmio *mmio;
>  	u32 old_v, new_v;
> =20
> -	dev_priv =3D pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
> -	if (INTEL_GEN(dev_priv) >=3D 9)
> -		switch_mocs(pre, next, ring_id);
> +	if (INTEL_GEN(engine->i915) >=3D 9)
> +		switch_mocs(pre, next, engine);
> =20
> -	for (mmio =3D dev_priv->gvt->engine_mmio_list.mmio;
> +	for (mmio =3D engine->i915->gvt->engine_mmio_list.mmio;
>  	     i915_mmio_reg_valid(mmio->reg); mmio++) {
> -		if (mmio->ring_id !=3D ring_id)
> +		if (mmio->id !=3D engine->id)
>  			continue;
>  		/*
>  		 * No need to do save or restore of the mmio which is in context
>  		 * state image on gen9, it's initialized by lri command and
>  		 * save or restore with context together.
>  		 */
> -		if (IS_GEN(dev_priv, 9) && mmio->in_context)
> +		if (IS_GEN(engine->i915, 9) && mmio->in_context)
>  			continue;
> =20
>  		// save
>  		if (pre) {
> -			vgpu_vreg_t(pre, mmio->reg) =3D I915_READ_FW(mmio->reg);
> +			vgpu_vreg_t(pre, mmio->reg) =3D
> +				intel_uncore_read_fw(uncore, mmio->reg);
>  			if (mmio->mask)
>  				vgpu_vreg_t(pre, mmio->reg) &=3D
> -						~(mmio->mask << 16);
> +					~(mmio->mask << 16);
>  			old_v =3D vgpu_vreg_t(pre, mmio->reg);
> -		} else
> -			old_v =3D mmio->value =3D I915_READ_FW(mmio->reg);
> +		} else {
> +			old_v =3D mmio->value =3D
> +				intel_uncore_read_fw(uncore, mmio->reg);
> +		}
> =20
>  		// restore
>  		if (next) {
> @@ -508,12 +507,12 @@ static void switch_mmio(struct intel_vgpu *pre,
>  			 * itself.
>  			 */
>  			if (mmio->in_context &&
> -			    !is_inhibit_context(s->shadow[ring_id]))
> +			    !is_inhibit_context(s->shadow[engine->id]))
>  				continue;
> =20
>  			if (mmio->mask)
>  				new_v =3D vgpu_vreg_t(next, mmio->reg) |
> -							(mmio->mask << 16);
> +					(mmio->mask << 16);
>  			else
>  				new_v =3D vgpu_vreg_t(next, mmio->reg);
>  		} else {
> @@ -525,7 +524,7 @@ static void switch_mmio(struct intel_vgpu *pre,
>  				new_v =3D mmio->value;
>  		}
> =20
> -		I915_WRITE_FW(mmio->reg, new_v);
> +		intel_uncore_write_fw(uncore, mmio->reg, new_v);
> =20
>  		trace_render_mmio(pre ? pre->id : 0,
>  				  next ? next->id : 0,
> @@ -535,39 +534,36 @@ static void switch_mmio(struct intel_vgpu *pre,
>  	}
> =20
>  	if (next)
> -		handle_tlb_pending_event(next, ring_id);
> +		handle_tlb_pending_event(next, engine);
>  }
> =20
>  /**
>   * intel_gvt_switch_render_mmio - switch mmio context of specific engine
>   * @pre: the last vGPU that own the engine
>   * @next: the vGPU to switch to
> - * @ring_id: specify the engine
> + * @engine: the engine
>   *
>   * If pre is null indicates that host own the engine. If next is null
>   * indicates that we are switching to host workload.
>   */
>  void intel_gvt_switch_mmio(struct intel_vgpu *pre,
> -			   struct intel_vgpu *next, int ring_id)
> +			   struct intel_vgpu *next,
> +			   const struct intel_engine_cs *engine)
>  {
> -	struct drm_i915_private *dev_priv;
> -
>  	if (WARN_ON(!pre && !next))
>  		return;
> =20
> -	gvt_dbg_render("switch ring %d from %s to %s\n", ring_id,
> +	gvt_dbg_render("switch ring %s from %s to %s\n", engine->name,
>  		       pre ? "vGPU" : "host", next ? "vGPU" : "HOST");
> =20
> -	dev_priv =3D pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
> -
>  	/**
>  	 * We are using raw mmio access wrapper to improve the
>  	 * performace for batch mmio read/write, so we need
>  	 * handle forcewake mannually.
>  	 */
> -	intel_uncore_forcewake_get(&dev_priv->uncore, FORCEWAKE_ALL);
> -	switch_mmio(pre, next, ring_id);
> -	intel_uncore_forcewake_put(&dev_priv->uncore, FORCEWAKE_ALL);
> +	intel_uncore_forcewake_get(engine->uncore, FORCEWAKE_ALL);
> +	switch_mmio(pre, next, engine);
> +	intel_uncore_forcewake_put(engine->uncore, FORCEWAKE_ALL);
>  }
> =20
>  /**
> @@ -594,7 +590,7 @@ void intel_gvt_init_engine_mmio_context(struct intel_=
gvt *gvt)
>  	for (mmio =3D gvt->engine_mmio_list.mmio;
>  	     i915_mmio_reg_valid(mmio->reg); mmio++) {
>  		if (mmio->in_context) {
> -			gvt->engine_mmio_list.ctx_mmio_count[mmio->ring_id]++;
> +			gvt->engine_mmio_list.ctx_mmio_count[mmio->id]++;
>  			intel_gvt_mmio_set_in_ctx(gvt, mmio->reg.reg);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.h b/drivers/gpu/drm/i9=
15/gvt/mmio_context.h
> index f7eaa442403f..970704b18f23 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.h
> @@ -37,7 +37,7 @@
>  #define __GVT_RENDER_H__
> =20
>  struct engine_mmio {
> -	int ring_id;
> +	enum intel_engine_id id;
>  	i915_reg_t reg;
>  	u32 mask;
>  	bool in_context;
> @@ -45,7 +45,8 @@ struct engine_mmio {
>  };
> =20
>  void intel_gvt_switch_mmio(struct intel_vgpu *pre,
> -			   struct intel_vgpu *next, int ring_id);
> +			   struct intel_vgpu *next,
> +			   const struct intel_engine_cs *engine);
> =20
>  void intel_gvt_init_engine_mmio_context(struct intel_gvt *gvt);
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.c b/drivers/gpu/drm/i9=
15/gvt/sched_policy.c
> index 2369d4a9af94..9c4eccd0cfeb 100644
> --- a/drivers/gpu/drm/i915/gvt/sched_policy.c
> +++ b/drivers/gpu/drm/i915/gvt/sched_policy.c
> @@ -40,7 +40,7 @@ static bool vgpu_has_pending_workload(struct intel_vgpu=
 *vgpu)
>  	struct intel_engine_cs *engine;
> =20
>  	for_each_engine(engine, vgpu->gvt->dev_priv, i) {
> -		if (!list_empty(workload_q_head(vgpu, i)))
> +		if (!list_empty(workload_q_head(vgpu, engine)))
>  			return true;
>  	}
> =20
> @@ -444,9 +444,10 @@ void intel_vgpu_stop_schedule(struct intel_vgpu *vgp=
u)
>  {
>  	struct intel_gvt_workload_scheduler *scheduler =3D
>  		&vgpu->gvt->scheduler;
> -	int ring_id;
>  	struct vgpu_sched_data *vgpu_data =3D vgpu->sched_data;
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> =20
>  	if (!vgpu_data->active)
>  		return;
> @@ -467,10 +468,10 @@ void intel_vgpu_stop_schedule(struct intel_vgpu *vg=
pu)
> =20
>  	intel_runtime_pm_get(&dev_priv->runtime_pm);
>  	spin_lock_bh(&scheduler->mmio_context_lock);
> -	for (ring_id =3D 0; ring_id < I915_NUM_ENGINES; ring_id++) {
> -		if (scheduler->engine_owner[ring_id] =3D=3D vgpu) {
> -			intel_gvt_switch_mmio(vgpu, NULL, ring_id);
> -			scheduler->engine_owner[ring_id] =3D NULL;
> +	for_each_engine(engine, dev_priv, id) {
> +		if (scheduler->engine_owner[engine->id] =3D=3D vgpu) {
> +			intel_gvt_switch_mmio(vgpu, NULL, engine);
> +			scheduler->engine_owner[engine->id] =3D NULL;
>  		}
>  	}
>  	spin_unlock_bh(&scheduler->mmio_context_lock);
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index ae3e56247576..df5b525fece0 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -97,7 +97,7 @@ static void sr_oa_regs(struct intel_vgpu_workload *work=
load,
>  		i915_mmio_reg_offset(EU_PERF_CNTL6),
>  	};
> =20
> -	if (workload->ring_id !=3D RCS0)
> +	if (workload->engine->id !=3D RCS0)
>  		return;
> =20
>  	if (save) {
> @@ -127,7 +127,6 @@ static int populate_shadow_context(struct intel_vgpu_=
workload *workload)
>  {
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
>  	struct intel_gvt *gvt =3D vgpu->gvt;
> -	int ring_id =3D workload->ring_id;
>  	struct drm_i915_gem_object *ctx_obj =3D
>  		workload->req->hw_context->state->obj;
>  	struct execlist_ring_context *shadow_ring_context;
> @@ -153,7 +152,7 @@ static int populate_shadow_context(struct intel_vgpu_=
workload *workload)
>  	COPY_REG_MASKED(ctx_ctrl);
>  	COPY_REG(ctx_timestamp);
> =20
> -	if (ring_id =3D=3D RCS0) {
> +	if (workload->engine->id =3D=3D RCS0) {
>  		COPY_REG(bb_per_ctx_ptr);
>  		COPY_REG(rcs_indirect_ctx);
>  		COPY_REG(rcs_indirect_ctx_offset);
> @@ -174,14 +173,14 @@ static int populate_shadow_context(struct intel_vgp=
u_workload *workload)
>  	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
>  		return 0;
> =20
> -	gvt_dbg_sched("ring id %d workload lrca %x", ring_id,
> -			workload->ctx_desc.lrca);
> -
> -	context_page_num =3D gvt->dev_priv->engine[ring_id]->context_size;
> +	gvt_dbg_sched("ring %s workload lrca %x",
> +		      workload->engine->name,
> +		      workload->ctx_desc.lrca);
> =20
> +	context_page_num =3D workload->engine->context_size;
>  	context_page_num =3D context_page_num >> PAGE_SHIFT;
> =20
> -	if (IS_BROADWELL(gvt->dev_priv) && ring_id =3D=3D RCS0)
> +	if (IS_BROADWELL(gvt->dev_priv) && workload->engine->id =3D=3D RCS0)
>  		context_page_num =3D 19;
> =20
>  	i =3D 2;
> @@ -209,38 +208,43 @@ static inline bool is_gvt_request(struct i915_reque=
st *req)
>  	return i915_gem_context_force_single_submission(req->gem_context);
>  }
> =20
> -static void save_ring_hw_state(struct intel_vgpu *vgpu, int ring_id)
> +static void save_ring_hw_state(struct intel_vgpu *vgpu,
> +			       const struct intel_engine_cs *engine)
>  {
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	u32 ring_base =3D dev_priv->engine[ring_id]->mmio_base;
> +	struct intel_uncore *uncore =3D engine->uncore;
>  	i915_reg_t reg;
> =20
> -	reg =3D RING_INSTDONE(ring_base);
> -	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D I915_READ_FW(reg);
> -	reg =3D RING_ACTHD(ring_base);
> -	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D I915_READ_FW(reg);
> -	reg =3D RING_ACTHD_UDW(ring_base);
> -	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D I915_READ_FW(reg);
> +	reg =3D RING_INSTDONE(engine->mmio_base);
> +	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D
> +		intel_uncore_read(uncore, reg);
> +
> +	reg =3D RING_ACTHD(engine->mmio_base);
> +	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D
> +		intel_uncore_read(uncore, reg);
> +
> +	reg =3D RING_ACTHD_UDW(engine->mmio_base);
> +	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D
> +		intel_uncore_read(uncore, reg);
>  }
> =20
>  static int shadow_context_status_change(struct notifier_block *nb,
>  		unsigned long action, void *data)
>  {
> -	struct i915_request *req =3D data;
> +	struct i915_request *rq =3D data;
>  	struct intel_gvt *gvt =3D container_of(nb, struct intel_gvt,
> -				shadow_ctx_notifier_block[req->engine->id]);
> +				shadow_ctx_notifier_block[rq->engine->id]);
>  	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
> -	enum intel_engine_id ring_id =3D req->engine->id;
> +	enum intel_engine_id ring_id =3D rq->engine->id;
>  	struct intel_vgpu_workload *workload;
>  	unsigned long flags;
> =20
> -	if (!is_gvt_request(req)) {
> +	if (!is_gvt_request(rq)) {
>  		spin_lock_irqsave(&scheduler->mmio_context_lock, flags);
>  		if (action =3D=3D INTEL_CONTEXT_SCHEDULE_IN &&
>  		    scheduler->engine_owner[ring_id]) {
>  			/* Switch ring from vGPU to host. */
>  			intel_gvt_switch_mmio(scheduler->engine_owner[ring_id],
> -					      NULL, ring_id);
> +					      NULL, rq->engine);
>  			scheduler->engine_owner[ring_id] =3D NULL;
>  		}
>  		spin_unlock_irqrestore(&scheduler->mmio_context_lock, flags);
> @@ -258,7 +262,7 @@ static int shadow_context_status_change(struct notifi=
er_block *nb,
>  		if (workload->vgpu !=3D scheduler->engine_owner[ring_id]) {
>  			/* Switch ring from host to vGPU or vGPU to vGPU. */
>  			intel_gvt_switch_mmio(scheduler->engine_owner[ring_id],
> -					      workload->vgpu, ring_id);
> +					      workload->vgpu, rq->engine);
>  			scheduler->engine_owner[ring_id] =3D workload->vgpu;
>  		} else
>  			gvt_dbg_sched("skip ring %d mmio switch for vgpu%d\n",
> @@ -267,11 +271,11 @@ static int shadow_context_status_change(struct noti=
fier_block *nb,
>  		atomic_set(&workload->shadow_ctx_active, 1);
>  		break;
>  	case INTEL_CONTEXT_SCHEDULE_OUT:
> -		save_ring_hw_state(workload->vgpu, ring_id);
> +		save_ring_hw_state(workload->vgpu, rq->engine);
>  		atomic_set(&workload->shadow_ctx_active, 0);
>  		break;
>  	case INTEL_CONTEXT_SCHEDULE_PREEMPTED:
> -		save_ring_hw_state(workload->vgpu, ring_id);
> +		save_ring_hw_state(workload->vgpu, rq->engine);
>  		break;
>  	default:
>  		WARN_ON(1);
> @@ -362,11 +366,10 @@ static void release_shadow_wa_ctx(struct intel_shad=
ow_wa_ctx *wa_ctx)
>  }
> =20
>  static void set_context_ppgtt_from_shadow(struct intel_vgpu_workload *wo=
rkload,
> -					  struct i915_gem_context *ctx)
> +					  struct intel_context *ce)
>  {
>  	struct intel_vgpu_mm *mm =3D workload->shadow_mm;
> -	struct i915_ppgtt *ppgtt =3D
> -		i915_vm_to_ppgtt(i915_gem_context_get_vm_rcu(ctx));
> +	struct i915_ppgtt *ppgtt =3D i915_vm_to_ppgtt(ce->vm);
>  	int i =3D 0;
> =20
>  	if (mm->ppgtt_mm.root_entry_type =3D=3D GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
> @@ -379,8 +382,6 @@ static void set_context_ppgtt_from_shadow(struct inte=
l_vgpu_workload *workload,
>  			px_dma(pd) =3D mm->ppgtt_mm.shadow_pdps[i];
>  		}
>  	}
> -
> -	i915_vm_put(&ppgtt->vm);
>  }
> =20
>  static int
> @@ -393,7 +394,7 @@ intel_gvt_workload_req_alloc(struct intel_vgpu_worklo=
ad *workload)
>  	if (workload->req)
>  		return 0;
> =20
> -	rq =3D i915_request_create(s->shadow[workload->ring_id]);
> +	rq =3D i915_request_create(s->shadow[workload->engine->id]);
>  	if (IS_ERR(rq)) {
>  		gvt_vgpu_err("fail to allocate gem request\n");
>  		return PTR_ERR(rq);
> @@ -422,15 +423,16 @@ int intel_gvt_scan_and_shadow_workload(struct intel=
_vgpu_workload *workload)
>  	if (workload->shadow)
>  		return 0;
> =20
> -	if (!test_and_set_bit(workload->ring_id, s->shadow_ctx_desc_updated))
> -		shadow_context_descriptor_update(s->shadow[workload->ring_id],
> +	if (!test_and_set_bit(workload->engine->id, s->shadow_ctx_desc_updated))
> +		shadow_context_descriptor_update(s->shadow[workload->engine->id],
>  						 workload);
> =20
>  	ret =3D intel_gvt_scan_and_shadow_ringbuffer(workload);
>  	if (ret)
>  		return ret;
> =20
> -	if (workload->ring_id =3D=3D RCS0 && workload->wa_ctx.indirect_ctx.size=
) {
> +	if (workload->engine->id =3D=3D RCS0 &&
> +	    workload->wa_ctx.indirect_ctx.size) {
>  		ret =3D intel_gvt_scan_and_shadow_wa_ctx(&workload->wa_ctx);
>  		if (ret)
>  			goto err_shadow;
> @@ -438,6 +440,7 @@ int intel_gvt_scan_and_shadow_workload(struct intel_v=
gpu_workload *workload)
> =20
>  	workload->shadow =3D true;
>  	return 0;
> +
>  err_shadow:
>  	release_shadow_wa_ctx(&workload->wa_ctx);
>  	return ret;
> @@ -569,12 +572,8 @@ static int prepare_shadow_wa_ctx(struct intel_shadow=
_wa_ctx *wa_ctx)
> =20
>  static void update_vreg_in_ctx(struct intel_vgpu_workload *workload)
>  {
> -	struct intel_vgpu *vgpu =3D workload->vgpu;
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	u32 ring_base;
> -
> -	ring_base =3D dev_priv->engine[workload->ring_id]->mmio_base;
> -	vgpu_vreg_t(vgpu, RING_START(ring_base)) =3D workload->rb_start;
> +	vgpu_vreg_t(workload->vgpu, RING_START(workload->engine->mmio_base)) =3D
> +		workload->rb_start;
>  }
> =20
>  static void release_shadow_batch_buffer(struct intel_vgpu_workload *work=
load)
> @@ -610,7 +609,6 @@ static int prepare_workload(struct intel_vgpu_workloa=
d *workload)
>  {
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> -	int ring =3D workload->ring_id;
>  	int ret =3D 0;
> =20
>  	ret =3D intel_vgpu_pin_mm(workload->shadow_mm);
> @@ -627,7 +625,7 @@ static int prepare_workload(struct intel_vgpu_workloa=
d *workload)
> =20
>  	update_shadow_pdps(workload);
> =20
> -	set_context_ppgtt_from_shadow(workload, s->shadow[ring]->gem_context);
> +	set_context_ppgtt_from_shadow(workload, s->shadow[workload->engine->id]=
);
> =20
>  	ret =3D intel_vgpu_sync_oos_pages(workload->vgpu);
>  	if (ret) {
> @@ -679,11 +677,10 @@ static int dispatch_workload(struct intel_vgpu_work=
load *workload)
>  {
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
>  	struct i915_request *rq;
> -	int ring_id =3D workload->ring_id;
>  	int ret;
> =20
> -	gvt_dbg_sched("ring id %d prepare to dispatch workload %p\n",
> -		ring_id, workload);
> +	gvt_dbg_sched("ring id %s prepare to dispatch workload %p\n",
> +		      workload->engine->name, workload);
> =20
>  	mutex_lock(&vgpu->vgpu_lock);
> =20
> @@ -712,8 +709,8 @@ static int dispatch_workload(struct intel_vgpu_worklo=
ad *workload)
>  	}
> =20
>  	if (!IS_ERR_OR_NULL(workload->req)) {
> -		gvt_dbg_sched("ring id %d submit workload to i915 %p\n",
> -				ring_id, workload->req);
> +		gvt_dbg_sched("ring id %s submit workload to i915 %p\n",
> +			      workload->engine->name, workload->req);
>  		i915_request_add(workload->req);
>  		workload->dispatched =3D true;
>  	}
> @@ -724,8 +721,8 @@ static int dispatch_workload(struct intel_vgpu_worklo=
ad *workload)
>  	return ret;
>  }
> =20
> -static struct intel_vgpu_workload *pick_next_workload(
> -		struct intel_gvt *gvt, int ring_id)
> +static struct intel_vgpu_workload *
> +pick_next_workload(struct intel_gvt *gvt, struct intel_engine_cs *engine)
>  {
>  	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
>  	struct intel_vgpu_workload *workload =3D NULL;
> @@ -737,27 +734,27 @@ static struct intel_vgpu_workload *pick_next_worklo=
ad(
>  	 * bail out
>  	 */
>  	if (!scheduler->current_vgpu) {
> -		gvt_dbg_sched("ring id %d stop - no current vgpu\n", ring_id);
> +		gvt_dbg_sched("ring %s stop - no current vgpu\n", engine->name);
>  		goto out;
>  	}
> =20
>  	if (scheduler->need_reschedule) {
> -		gvt_dbg_sched("ring id %d stop - will reschedule\n", ring_id);
> +		gvt_dbg_sched("ring %s stop - will reschedule\n", engine->name);
>  		goto out;
>  	}
> =20
>  	if (!scheduler->current_vgpu->active ||
> -	    list_empty(workload_q_head(scheduler->current_vgpu, ring_id)))
> +	    list_empty(workload_q_head(scheduler->current_vgpu, engine)))
>  		goto out;
> =20
>  	/*
>  	 * still have current workload, maybe the workload disptacher
>  	 * fail to submit it for some reason, resubmit it.
>  	 */
> -	if (scheduler->current_workload[ring_id]) {
> -		workload =3D scheduler->current_workload[ring_id];
> -		gvt_dbg_sched("ring id %d still have current workload %p\n",
> -				ring_id, workload);
> +	if (scheduler->current_workload[engine->id]) {
> +		workload =3D scheduler->current_workload[engine->id];
> +		gvt_dbg_sched("ring %s still have current workload %p\n",
> +			      engine->name, workload);
>  		goto out;
>  	}
> =20
> @@ -767,13 +764,14 @@ static struct intel_vgpu_workload *pick_next_worklo=
ad(
>  	 * will wait the current workload is finished when trying to
>  	 * schedule out a vgpu.
>  	 */
> -	scheduler->current_workload[ring_id] =3D container_of(
> -			workload_q_head(scheduler->current_vgpu, ring_id)->next,
> -			struct intel_vgpu_workload, list);
> +	scheduler->current_workload[engine->id] =3D
> +		list_first_entry(workload_q_head(scheduler->current_vgpu,
> +						 engine),
> +				 struct intel_vgpu_workload, list);
> =20
> -	workload =3D scheduler->current_workload[ring_id];
> +	workload =3D scheduler->current_workload[engine->id];
> =20
> -	gvt_dbg_sched("ring id %d pick new workload %p\n", ring_id, workload);
> +	gvt_dbg_sched("ring %s pick new workload %p\n", engine->name, workload);
> =20
>  	atomic_inc(&workload->vgpu->submission.running_workload_num);
>  out:
> @@ -785,14 +783,12 @@ static void update_guest_context(struct intel_vgpu_=
workload *workload)
>  {
>  	struct i915_request *rq =3D workload->req;
>  	struct intel_vgpu *vgpu =3D workload->vgpu;
> -	struct intel_gvt *gvt =3D vgpu->gvt;
>  	struct drm_i915_gem_object *ctx_obj =3D rq->hw_context->state->obj;
>  	struct execlist_ring_context *shadow_ring_context;
>  	struct page *page;
>  	void *src;
>  	unsigned long context_gpa, context_page_num;
>  	int i;
> -	struct drm_i915_private *dev_priv =3D gvt->dev_priv;
>  	u32 ring_base;
>  	u32 head, tail;
>  	u16 wrap_count;
> @@ -813,14 +809,14 @@ static void update_guest_context(struct intel_vgpu_=
workload *workload)
> =20
>  	head =3D (wrap_count << RB_HEAD_WRAP_CNT_OFF) | tail;
> =20
> -	ring_base =3D dev_priv->engine[workload->ring_id]->mmio_base;
> +	ring_base =3D rq->engine->mmio_base;
>  	vgpu_vreg_t(vgpu, RING_TAIL(ring_base)) =3D tail;
>  	vgpu_vreg_t(vgpu, RING_HEAD(ring_base)) =3D head;
> =20
>  	context_page_num =3D rq->engine->context_size;
>  	context_page_num =3D context_page_num >> PAGE_SHIFT;
> =20
> -	if (IS_BROADWELL(gvt->dev_priv) && rq->engine->id =3D=3D RCS0)
> +	if (IS_BROADWELL(rq->i915) && rq->engine->id =3D=3D RCS0)
>  		context_page_num =3D 19;
> =20
>  	i =3D 2;
> @@ -968,54 +964,47 @@ static void complete_current_workload(struct intel_=
gvt *gvt, int ring_id)
>  	mutex_unlock(&vgpu->vgpu_lock);
>  }
> =20
> -struct workload_thread_param {
> -	struct intel_gvt *gvt;
> -	int ring_id;
> -};
> -
> -static int workload_thread(void *priv)
> +static int workload_thread(void *arg)
>  {
> -	struct workload_thread_param *p =3D (struct workload_thread_param *)pri=
v;
> -	struct intel_gvt *gvt =3D p->gvt;
> -	int ring_id =3D p->ring_id;
> +	struct intel_engine_cs *engine =3D arg;
> +	const bool need_force_wake =3D INTEL_GEN(engine->i915) >=3D 9;
> +	struct intel_gvt *gvt =3D engine->i915->gvt;
>  	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
>  	struct intel_vgpu_workload *workload =3D NULL;
>  	struct intel_vgpu *vgpu =3D NULL;
>  	int ret;
> -	bool need_force_wake =3D (INTEL_GEN(gvt->dev_priv) >=3D 9);
>  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
> -	struct intel_runtime_pm *rpm =3D &gvt->dev_priv->runtime_pm;
> -
> -	kfree(p);
> =20
> -	gvt_dbg_core("workload thread for ring %d started\n", ring_id);
> +	gvt_dbg_core("workload thread for ring %s started\n", engine->name);
> =20
>  	while (!kthread_should_stop()) {
> -		add_wait_queue(&scheduler->waitq[ring_id], &wait);
> +		intel_wakeref_t wakeref;
> +
> +		add_wait_queue(&scheduler->waitq[engine->id], &wait);
>  		do {
> -			workload =3D pick_next_workload(gvt, ring_id);
> +			workload =3D pick_next_workload(gvt, engine);
>  			if (workload)
>  				break;
>  			wait_woken(&wait, TASK_INTERRUPTIBLE,
>  				   MAX_SCHEDULE_TIMEOUT);
>  		} while (!kthread_should_stop());
> -		remove_wait_queue(&scheduler->waitq[ring_id], &wait);
> +		remove_wait_queue(&scheduler->waitq[engine->id], &wait);
> =20
>  		if (!workload)
>  			break;
> =20
> -		gvt_dbg_sched("ring id %d next workload %p vgpu %d\n",
> -				workload->ring_id, workload,
> -				workload->vgpu->id);
> +		gvt_dbg_sched("ring %s next workload %p vgpu %d\n",
> +			      engine->name, workload,
> +			      workload->vgpu->id);
> =20
> -		intel_runtime_pm_get(rpm);
> +		wakeref =3D intel_runtime_pm_get(engine->uncore->rpm);
> =20
> -		gvt_dbg_sched("ring id %d will dispatch workload %p\n",
> -				workload->ring_id, workload);
> +		gvt_dbg_sched("ring %s will dispatch workload %p\n",
> +			      engine->name, workload);
> =20
>  		if (need_force_wake)
> -			intel_uncore_forcewake_get(&gvt->dev_priv->uncore,
> -					FORCEWAKE_ALL);
> +			intel_uncore_forcewake_get(engine->uncore,
> +						   FORCEWAKE_ALL);
>  		/*
>  		 * Update the vReg of the vGPU which submitted this
>  		 * workload. The vGPU may use these registers for checking
> @@ -1032,21 +1021,21 @@ static int workload_thread(void *priv)
>  			goto complete;
>  		}
> =20
> -		gvt_dbg_sched("ring id %d wait workload %p\n",
> -				workload->ring_id, workload);
> +		gvt_dbg_sched("ring %s wait workload %p\n",
> +			      engine->name, workload);
>  		i915_request_wait(workload->req, 0, MAX_SCHEDULE_TIMEOUT);
> =20
>  complete:
>  		gvt_dbg_sched("will complete workload %p, status: %d\n",
> -				workload, workload->status);
> +			      workload, workload->status);
> =20
> -		complete_current_workload(gvt, ring_id);
> +		complete_current_workload(gvt, engine->id);
> =20
>  		if (need_force_wake)
> -			intel_uncore_forcewake_put(&gvt->dev_priv->uncore,
> -					FORCEWAKE_ALL);
> +			intel_uncore_forcewake_put(engine->uncore,
> +						   FORCEWAKE_ALL);
> =20
> -		intel_runtime_pm_put_unchecked(rpm);
> +		intel_runtime_pm_put(engine->uncore->rpm, wakeref);
>  		if (ret && (vgpu_is_vm_unhealthy(ret)))
>  			enter_failsafe_mode(vgpu, GVT_FAILSAFE_GUEST_ERR);
>  	}
> @@ -1086,7 +1075,6 @@ void intel_gvt_clean_workload_scheduler(struct inte=
l_gvt *gvt)
>  int intel_gvt_init_workload_scheduler(struct intel_gvt *gvt)
>  {
>  	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
> -	struct workload_thread_param *param =3D NULL;
>  	struct intel_engine_cs *engine;
>  	enum intel_engine_id i;
>  	int ret;
> @@ -1098,17 +1086,8 @@ int intel_gvt_init_workload_scheduler(struct intel=
_gvt *gvt)
>  	for_each_engine(engine, gvt->dev_priv, i) {
>  		init_waitqueue_head(&scheduler->waitq[i]);
> =20
> -		param =3D kzalloc(sizeof(*param), GFP_KERNEL);
> -		if (!param) {
> -			ret =3D -ENOMEM;
> -			goto err;
> -		}
> -
> -		param->gvt =3D gvt;
> -		param->ring_id =3D i;
> -
> -		scheduler->thread[i] =3D kthread_run(workload_thread, param,
> -			"gvt workload %d", i);
> +		scheduler->thread[i] =3D kthread_run(workload_thread, engine,
> +						   "gvt:%s", engine->name);
>  		if (IS_ERR(scheduler->thread[i])) {
>  			gvt_err("fail to create workload thread\n");
>  			ret =3D PTR_ERR(scheduler->thread[i]);
> @@ -1120,11 +1099,11 @@ int intel_gvt_init_workload_scheduler(struct inte=
l_gvt *gvt)
>  		atomic_notifier_chain_register(&engine->context_status_notifier,
>  					&gvt->shadow_ctx_notifier_block[i]);
>  	}
> +
>  	return 0;
> +
>  err:
>  	intel_gvt_clean_workload_scheduler(gvt);
> -	kfree(param);
> -	param =3D NULL;
>  	return ret;
>  }
> =20
> @@ -1445,7 +1424,7 @@ static int prepare_mm(struct intel_vgpu_workload *w=
orkload)
>  /**
>   * intel_vgpu_create_workload - create a vGPU workload
>   * @vgpu: a vGPU
> - * @ring_id: ring index
> + * @engine: the engine
>   * @desc: a guest context descriptor
>   *
>   * This function is called when creating a vGPU workload.
> @@ -1456,14 +1435,14 @@ static int prepare_mm(struct intel_vgpu_workload =
*workload)
>   *
>   */
>  struct intel_vgpu_workload *
> -intel_vgpu_create_workload(struct intel_vgpu *vgpu, int ring_id,
> +intel_vgpu_create_workload(struct intel_vgpu *vgpu,
> +			   const struct intel_engine_cs *engine,
>  			   struct execlist_ctx_descriptor_format *desc)
>  {
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> -	struct list_head *q =3D workload_q_head(vgpu, ring_id);
> +	struct list_head *q =3D workload_q_head(vgpu, engine);
>  	struct intel_vgpu_workload *last_workload =3D NULL;
>  	struct intel_vgpu_workload *workload =3D NULL;
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
>  	u64 ring_context_gpa;
>  	u32 head, tail, start, ctl, ctx_ctl, per_ctx, indirect_ctx;
>  	u32 guest_head;
> @@ -1490,10 +1469,10 @@ intel_vgpu_create_workload(struct intel_vgpu *vgp=
u, int ring_id,
>  	list_for_each_entry_reverse(last_workload, q, list) {
> =20
>  		if (same_context(&last_workload->ctx_desc, desc)) {
> -			gvt_dbg_el("ring id %d cur workload =3D=3D last\n",
> -					ring_id);
> +			gvt_dbg_el("ring %s cur workload =3D=3D last\n",
> +				   engine->name);
>  			gvt_dbg_el("ctx head %x real head %lx\n", head,
> -					last_workload->rb_tail);
> +				   last_workload->rb_tail);
>  			/*
>  			 * cannot use guest context head pointer here,
>  			 * as it might not be updated at this time
> @@ -1503,7 +1482,7 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,=
 int ring_id,
>  		}
>  	}
> =20
> -	gvt_dbg_el("ring id %d begin a new workload\n", ring_id);
> +	gvt_dbg_el("ring %s begin a new workload\n", engine->name);
> =20
>  	/* record some ring buffer register values for scan and shadow */
>  	intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
> @@ -1523,7 +1502,7 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,=
 int ring_id,
>  	if (IS_ERR(workload))
>  		return workload;
> =20
> -	workload->ring_id =3D ring_id;
> +	workload->engine =3D engine;
>  	workload->ctx_desc =3D *desc;
>  	workload->ring_context_gpa =3D ring_context_gpa;
>  	workload->rb_head =3D head;
> @@ -1532,7 +1511,7 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,=
 int ring_id,
>  	workload->rb_start =3D start;
>  	workload->rb_ctl =3D ctl;
> =20
> -	if (ring_id =3D=3D RCS0) {
> +	if (engine->id =3D=3D RCS0) {
>  		intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
>  			RING_CTX_OFF(bb_per_ctx_ptr.val), &per_ctx, 4);
>  		intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
> @@ -1570,8 +1549,8 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,=
 int ring_id,
>  		}
>  	}
> =20
> -	gvt_dbg_el("workload %p ring id %d head %x tail %x start %x ctl %x\n",
> -			workload, ring_id, head, tail, start, ctl);
> +	gvt_dbg_el("workload %p ring %s head %x tail %x start %x ctl %x\n",
> +		   workload, engine->name, head, tail, start, ctl);
> =20
>  	ret =3D prepare_mm(workload);
>  	if (ret) {
> @@ -1582,12 +1561,13 @@ intel_vgpu_create_workload(struct intel_vgpu *vgp=
u, int ring_id,
>  	/* Only scan and shadow the first workload in the queue
>  	 * as there is only one pre-allocated buf-obj for shadow.
>  	 */
> -	if (list_empty(workload_q_head(vgpu, ring_id))) {
> -		intel_runtime_pm_get(&dev_priv->runtime_pm);
> +	if (list_empty(workload_q_head(vgpu, engine))) {
> +		intel_wakeref_t wakeref;
> +
>  		mutex_lock(&vgpu->vgpu_lock);
> -		ret =3D intel_gvt_scan_and_shadow_workload(workload);
> +		with_intel_runtime_pm(engine->gt->uncore->rpm, wakeref)
> +			ret =3D intel_gvt_scan_and_shadow_workload(workload);
>  		mutex_unlock(&vgpu->vgpu_lock);
> -		intel_runtime_pm_put_unchecked(&dev_priv->runtime_pm);
>  	}
> =20
>  	if (ret) {
> @@ -1607,7 +1587,7 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,=
 int ring_id,
>  void intel_vgpu_queue_workload(struct intel_vgpu_workload *workload)
>  {
>  	list_add_tail(&workload->list,
> -		workload_q_head(workload->vgpu, workload->ring_id));
> +		      workload_q_head(workload->vgpu, workload->engine));
>  	intel_gvt_kick_schedule(workload->vgpu->gvt);
> -	wake_up(&workload->vgpu->gvt->scheduler.waitq[workload->ring_id]);
> +	wake_up(&workload->vgpu->gvt->scheduler.waitq[workload->engine->id]);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/drm/i915/=
gvt/scheduler.h
> index c50d14a9ce85..bf7fc0ca4cb1 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.h
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.h
> @@ -79,7 +79,7 @@ struct intel_shadow_wa_ctx {
> =20
>  struct intel_vgpu_workload {
>  	struct intel_vgpu *vgpu;
> -	int ring_id;
> +	const struct intel_engine_cs *engine;
>  	struct i915_request *req;
>  	/* if this workload has been dispatched to i915? */
>  	bool dispatched;
> @@ -129,8 +129,8 @@ struct intel_vgpu_shadow_bb {
>  	bool ppgtt;
>  };
> =20
> -#define workload_q_head(vgpu, ring_id) \
> -	(&(vgpu->submission.workload_q_head[ring_id]))
> +#define workload_q_head(vgpu, e) \
> +	(&(vgpu)->submission.workload_q_head[(e)->id])
> =20
>  void intel_vgpu_queue_workload(struct intel_vgpu_workload *workload);
> =20
> @@ -155,7 +155,8 @@ extern const struct intel_vgpu_submission_ops
>  intel_vgpu_execlist_submission_ops;
> =20
>  struct intel_vgpu_workload *
> -intel_vgpu_create_workload(struct intel_vgpu *vgpu, int ring_id,
> +intel_vgpu_create_workload(struct intel_vgpu *vgpu,
> +			   const struct intel_engine_cs *engine,
>  			   struct execlist_ctx_descriptor_format *desc);
> =20
>  void intel_vgpu_destroy_workload(struct intel_vgpu_workload *workload);
> --=20
> 2.23.0
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXa1EFAAKCRCxBBozTXgY
J/arAKCbXQI0UZNgPtVKrItbqrdnzZ5OKwCfbLiibm+WibUdioXTks3lxuKjTLs=
=/ofC
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--

--===============0028249305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0028249305==--
