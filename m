Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C272C977F
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 07:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC13C6E4AD;
	Tue,  1 Dec 2020 06:20:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EFD6E483
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 06:20:43 +0000 (UTC)
IronPort-SDR: /XWxzdlTYlZk7Vvmxfki+DVhxSG23QK/WdM6RgWKNtopDVizcBCV0CzNioD8rXAkOfIzwPL/pD
 75ZlEnB2BwRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="159827923"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="159827923"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:20:42 -0800
IronPort-SDR: 7gHy2CGMdZNgILvYGtbX+NsN7XFVFn/dAbPqbgILKIezMVcZ/G/1qUN3FbMckVMaP1FefB8CIf
 P0XjW+/oTzew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="364568685"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2020 22:20:40 -0800
Date: Tue, 1 Dec 2020 14:05:39 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 01/10] drm/i915/gvt: parse init context to update cmd
 accessible reg whitelist
Message-ID: <20201201060539.GS16939@zhen-hp.sh.intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
 <20201125003741.17857-1-yan.y.zhao@intel.com>
 <20201201054604.GQ16939@zhen-hp.sh.intel.com>
 <20201201060430.GA31495@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201201060430.GA31495@yzhao56-desk.sh.intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Wang Zhi <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1664271925=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1664271925==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x1F0m3RQhDZyj8sd"
Content-Disposition: inline


--x1F0m3RQhDZyj8sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.12.01 14:04:30 +0800, Yan Zhao wrote:
> On Tue, Dec 01, 2020 at 01:46:04PM +0800, Zhenyu Wang wrote:
> > On 2020.11.25 08:37:41 +0800, Yan Zhao wrote:
> > > Logical Context is actually a big batch buffer consisting of multiple
> > > LRI commands + saved registers. It comprises Ring Context (the first
> > > 0x50 dwords) and Engine Context. The registers defined in Engine Cont=
ext
> > > are command accessible, and safe to execute in VM Context.
> > > However, not all of them are currently tracked in existing register
> > > whitelist. Here we kick hardware to generate a dummy Engine Context a=
nd
> > > then scan the dummy Engine context to update whitelist dynamically. B=
ased
> > > on updated list, later patches will audit future VM Engine Contexts to
> > > disallow undesired LRIs (if out of what hardware generates).
> > >=20
> > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > Signed-off-by: Wang Zhi <zhi.a.wang@intel.com>
> > > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 153 ++++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/i915/gvt/cmd_parser.h |   2 +
> > >  drivers/gpu/drm/i915/gvt/gvt.h        |   4 +
> > >  drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
> > >  4 files changed, 159 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/=
i915/gvt/cmd_parser.c
> > > index 16b582cb97ed..b1e508471c40 100644
> > > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > @@ -38,10 +38,15 @@
> > > =20
> > >  #include "i915_drv.h"
> > >  #include "gt/intel_ring.h"
> > > +#include "gt/intel_gt_requests.h"
> > >  #include "gvt.h"
> > >  #include "i915_pvinfo.h"
> > >  #include "trace.h"
> > > =20
> > > +#include "gem/i915_gem_context.h"
> > > +#include "gem/i915_gem_pm.h"
> > > +#include "gt/intel_context.h"
> > > +
> > >  #define INVALID_OP    (~0U)
> > > =20
> > >  #define OP_LEN_MI           9
> > > @@ -454,6 +459,7 @@ enum {
> > >  	RING_BUFFER_INSTRUCTION,
> > >  	BATCH_BUFFER_INSTRUCTION,
> > >  	BATCH_BUFFER_2ND_LEVEL,
> > > +	RING_BUFFER_CTX,
> > >  };
> > > =20
> > >  enum {
> > > @@ -495,6 +501,7 @@ struct parser_exec_state {
> > >  	 */
> > >  	int saved_buf_addr_type;
> > >  	bool is_ctx_wa;
> > > +	bool is_init_ctx;
> > > =20
> > >  	const struct cmd_info *info;
> > > =20
> > > @@ -708,6 +715,11 @@ static inline u32 cmd_val(struct parser_exec_sta=
te *s, int index)
> > >  	return *cmd_ptr(s, index);
> > >  }
> > > =20
> > > +static inline bool is_init_ctx(struct parser_exec_state *s)
> > > +{
> > > +	return (s->buf_type =3D=3D RING_BUFFER_CTX && s->is_init_ctx);
> > > +}
> > > +
> > >  static void parser_exec_state_dump(struct parser_exec_state *s)
> > >  {
> > >  	int cnt =3D 0;
> > > @@ -721,7 +733,8 @@ static void parser_exec_state_dump(struct parser_=
exec_state *s)
> > > =20
> > >  	gvt_dbg_cmd("  %s %s ip_gma(%08lx) ",
> > >  			s->buf_type =3D=3D RING_BUFFER_INSTRUCTION ?
> > > -			"RING_BUFFER" : "BATCH_BUFFER",
> > > +			"RING_BUFFER" : ((s->buf_type =3D=3D RING_BUFFER_CTX) ?
> > > +				"CTX_BUFFER" : "BATCH_BUFFER"),
> > >  			s->buf_addr_type =3D=3D GTT_BUFFER ?
> > >  			"GTT" : "PPGTT", s->ip_gma);
> > > =20
> > > @@ -756,7 +769,8 @@ static inline void update_ip_va(struct parser_exe=
c_state *s)
> > >  	if (WARN_ON(s->ring_head =3D=3D s->ring_tail))
> > >  		return;
> > > =20
> > > -	if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION) {
> > > +	if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION ||
> > > +			s->buf_type =3D=3D RING_BUFFER_CTX) {
> > >  		unsigned long ring_top =3D s->ring_start + s->ring_size;
> > > =20
> > >  		if (s->ring_head > s->ring_tail) {
> > > @@ -936,6 +950,11 @@ static int cmd_reg_handler(struct parser_exec_st=
ate *s,
> > >  		return -EFAULT;
> > >  	}
> > > =20
> > > +	if (is_init_ctx(s)) {
> > > +		intel_gvt_mmio_set_cmd_accessible(gvt, offset);
> > > +		return 0;
> > > +	}
> > > +
> > >  	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
> > >  		gvt_vgpu_err("%s access to non-render register (%x)\n",
> > >  				cmd, offset);
> > > @@ -1215,6 +1234,8 @@ static int cmd_handler_mi_batch_buffer_end(stru=
ct parser_exec_state *s)
> > >  		s->buf_type =3D BATCH_BUFFER_INSTRUCTION;
> > >  		ret =3D ip_gma_set(s, s->ret_ip_gma_bb);
> > >  		s->buf_addr_type =3D s->saved_buf_addr_type;
> > > +	} else if (s->buf_type =3D=3D RING_BUFFER_CTX) {
> > > +		ret =3D ip_gma_set(s, s->ring_tail);
> > >  	} else {
> > >  		s->buf_type =3D RING_BUFFER_INSTRUCTION;
> > >  		s->buf_addr_type =3D GTT_BUFFER;
> > > @@ -2763,7 +2784,8 @@ static int command_scan(struct parser_exec_stat=
e *s,
> > >  	gma_bottom =3D rb_start +  rb_len;
> > > =20
> > >  	while (s->ip_gma !=3D gma_tail) {
> > > -		if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION) {
> > > +		if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION ||
> > > +				s->buf_type =3D=3D RING_BUFFER_CTX) {
> > >  			if (!(s->ip_gma >=3D rb_start) ||
> > >  				!(s->ip_gma < gma_bottom)) {
> > >  				gvt_vgpu_err("ip_gma %lx out of ring scope."
> > > @@ -3056,6 +3078,131 @@ int intel_gvt_scan_and_shadow_wa_ctx(struct i=
ntel_shadow_wa_ctx *wa_ctx)
> > >  	return 0;
> > >  }
> > > =20
> > > +/* generate dummy contexts by sending empty requests to HW, and let
> > > + * the HW to fill Engine Contexts. This dummy contexts are used for
> > > + * initialization purpose (update reg whitelist), so referred to as
> > > + * init context here
> > > + */
> > > +void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
> > > +{
> > > +	struct intel_gvt *gvt =3D vgpu->gvt;
> > > +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
> > > +	struct intel_engine_cs *engine;
> > > +	enum intel_engine_id id;
> > > +	struct drm_i915_gem_object *ctx_obj[I915_NUM_ENGINES] =3D {};
> > > +	const unsigned long start =3D LRC_STATE_PN * PAGE_SIZE;
> > > +	struct i915_request *rq;
> > > +	struct intel_vgpu_submission *s =3D &vgpu->submission;
> > > +	struct i915_request *requests[I915_NUM_ENGINES] =3D {};
> > > +	bool is_ctx_pinned[I915_NUM_ENGINES] =3D {};
> > > +	int ret;
> > > +
> > > +	if (gvt->is_reg_whitelist_updated)
> > > +		return;
> > > +
> > > +	for_each_engine(engine, &dev_priv->gt, id) {
> > > +		ret =3D intel_context_pin(s->shadow[id]);
> > > +		if (ret) {
> > > +			gvt_vgpu_err("fail to pin shadow ctx\n");
> > > +			goto out;
> > > +		}
> > > +		is_ctx_pinned[id] =3D true;
> > > +	}
> > > +
> > > +	for_each_engine(engine, &dev_priv->gt, id) {
> > > +		rq =3D i915_request_create(s->shadow[id]);
> > > +		if (IS_ERR(rq)) {
> > > +			gvt_vgpu_err("fail to alloc default request\n");
> > > +			ret =3D -EIO;
> > > +			goto out;
> > > +		}
> > > +		requests[id] =3D i915_request_get(rq);
> > > +		i915_request_add(rq);
> > > +	}
> >=20
> > Why split this in different iteration?
> yes, the two iterations can be combined into one.
> will combine them.
>=20
> >=20
> > > +
> > > +	if (intel_gt_wait_for_idle(&dev_priv->gt,
> > > +				I915_GEM_IDLE_TIMEOUT) =3D=3D -ETIME) {
> > > +		ret =3D -EIO;
> > > +		goto out;
> > > +	}
> > > +
> > > +	for_each_engine(engine, &dev_priv->gt, id) {
> > > +		struct i915_request *rq;
> > > +
> > > +		rq =3D requests[id];
> > > +		GEM_BUG_ON(!i915_request_completed(rq));
> > > +		GEM_BUG_ON(!intel_context_is_pinned(rq->context));
> > > +		ctx_obj[id] =3D rq->context->state->obj;
> > > +	}
> > > +
> >=20
> > and these two iterations?
> This iteration cannot be combined with previous one because there's only
> one intel_gt_wait_for_idle for all rings.
>

yeah, I mean above this and below which handles for each engine's ctx,
should be in one, right?

> >=20
> > > +	/* scan init ctx to update cmd accessible list */
> > > +	for_each_engine(engine, &dev_priv->gt, id) {
> > > +		int size =3D engine->context_size - PAGE_SIZE;
> > > +		void *vaddr;
> > > +		struct parser_exec_state s;
> > > +		struct drm_i915_gem_object *obj;
> > > +
> > > +		if (!ctx_obj[id]) {
> > > +			ret =3D -EIO;
> > > +			goto out;
> > > +		}
> > > +
> > > +		obj =3D ctx_obj[id];
> > > +
> > > +		i915_gem_object_set_cache_coherency(obj,
> > > +						    I915_CACHE_LLC);
> > > +
> > > +		vaddr =3D i915_gem_object_pin_map(obj, I915_MAP_WB);
> > > +		if (IS_ERR(vaddr)) {
> > > +			gvt_err("failed to pin init ctx obj, ring=3D%d, err=3D%lx\n",
> > > +				id, PTR_ERR(vaddr));
> > > +			goto out;
> > > +		}
> > > +
> > > +		s.buf_type =3D RING_BUFFER_CTX;
> > > +		s.buf_addr_type =3D GTT_BUFFER;
> > > +		s.vgpu =3D vgpu;
> > > +		s.engine =3D engine;
> > > +		s.ring_start =3D 0;
> > > +		s.ring_size =3D size;
> > > +		s.ring_head =3D 0;
> > > +		s.ring_tail =3D size;
> > > +		s.rb_va =3D vaddr + start;
> > > +		s.workload =3D NULL;
> > > +		s.is_ctx_wa =3D false;
> > > +		s.is_init_ctx =3D true;
> > > +
> > > +		/* skipping the first RING_CTX_SIZE(0x50) dwords */
> > > +		ret =3D ip_gma_set(&s, RING_CTX_SIZE);
> > > +		if (ret) {
> > > +			i915_gem_object_unpin_map(obj);
> > > +			goto out;
> > > +		}
> > > +
> > > +		ret =3D command_scan(&s, 0, size, 0, size);
> > > +		if (ret)
> > > +			gvt_err("Scan init ctx error\n");
> > > +
> > > +		i915_gem_object_unpin_map(obj);
> > > +	}
> > > +
> > > +out:
> > > +	if (!ret)
> > > +		gvt->is_reg_whitelist_updated =3D true;
> > > +
> > > +	for (id =3D 0; id < ARRAY_SIZE(requests); id++) {
> > > +		if (!requests[id])
> > > +			continue;
> > > +		i915_request_put(requests[id]);
> > > +	}
> > > +
> > > +	for_each_engine(engine, &dev_priv->gt, id) {
> > > +		if (!is_ctx_pinned[id])
> > > +			continue;
> > > +		intel_context_unpin(s->shadow[id]);
> > > +	}
> > > +}
> > > +
> > >  static int init_cmd_table(struct intel_gvt *gvt)
> > >  {
> > >  	unsigned int gen_type =3D intel_gvt_get_device_type(gvt);
> > > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.h b/drivers/gpu/drm/=
i915/gvt/cmd_parser.h
> > > index ab25d151932a..09ca2b8a63c8 100644
> > > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.h
> > > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.h
> > > @@ -50,4 +50,6 @@ int intel_gvt_scan_and_shadow_ringbuffer(struct int=
el_vgpu_workload *workload);
> > > =20
> > >  int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_=
ctx);
> > > =20
> > > +void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu);
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gv=
t/gvt.h
> > > index a81cf0f01e78..c470e185bc00 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > > @@ -327,6 +327,7 @@ struct intel_gvt {
> > >  		u32 *mocs_mmio_offset_list;
> > >  		u32 mocs_mmio_offset_list_cnt;
> > >  	} engine_mmio_list;
> > > +	bool is_reg_whitelist_updated;
> > > =20
> > >  	struct dentry *debugfs_root;
> > >  };
> > > @@ -410,6 +411,9 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt=
);
> > >  #define vgpu_fence_base(vgpu) (vgpu->fence.base)
> > >  #define vgpu_fence_sz(vgpu) (vgpu->fence.size)
> > > =20
> > > +/* ring context size i.e. the first 0x50 dwords*/
> > > +#define RING_CTX_SIZE 320
> > > +
> > >  struct intel_vgpu_creation_params {
> > >  	__u64 handle;
> > >  	__u64 low_gm_sz;  /* in MB */
> > > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/g=
vt/vgpu.c
> > > index f6d7e33c7099..7fc4a3e9a560 100644
> > > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > @@ -499,9 +499,11 @@ struct intel_vgpu *intel_gvt_create_vgpu(struct =
intel_gvt *gvt,
> > > =20
> > >  	mutex_lock(&gvt->lock);
> > >  	vgpu =3D __intel_gvt_create_vgpu(gvt, &param);
> > > -	if (!IS_ERR(vgpu))
> > > +	if (!IS_ERR(vgpu)) {
> > >  		/* calculate left instance change for types */
> > >  		intel_gvt_update_vgpu_types(gvt);
> > > +		intel_gvt_update_reg_whitelist(vgpu);
> >=20
> > Do we need to generate for vgpu create everytime? Suppose on same HW,
> > init ctx should be same right?=20
> >
> intel_gvt_update_vgpu_types() are called after each vgpu creation but it
> will return immediately if gvt->is_reg_whitelist_updated is true.
>=20
> Thanks
> Yan
>=20
>=20
> > > +	}
> > >  	mutex_unlock(&gvt->lock);
> > > =20
> > >  	return vgpu;
> > > --=20
> > > 2.17.1
> > >=20
> > > _______________________________________________
> > > intel-gvt-dev mailing list
> > > intel-gvt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> >=20
> > --=20
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>=20
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--x1F0m3RQhDZyj8sd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8XdMwAKCRCxBBozTXgY
J8yrAKCCxMvK8eO4BEk6iEo1oL/GFNQP/gCfeRJ3laUrprMaaItIDCFxl4olosI=
=EXRD
-----END PGP SIGNATURE-----

--x1F0m3RQhDZyj8sd--

--===============1664271925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1664271925==--
