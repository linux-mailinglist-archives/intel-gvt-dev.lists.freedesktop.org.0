Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DCB2E05CC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Dec 2020 06:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505976E0D2;
	Tue, 22 Dec 2020 05:39:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FCE6E0D2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Dec 2020 05:39:12 +0000 (UTC)
IronPort-SDR: 3kXQCkTeBtaYOfLiF4PVcAlzX4ghKe2hKzo5waMV2y8+dL4RiW2uZqH9S/aY4qDuFWvi3VDwtZ
 SOSe94OU4jQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="260554922"
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
 d="asc'?scan'208";a="260554922"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 21:39:11 -0800
IronPort-SDR: Vu6k/UmmHA5awSXWTk5A68hmguRZeKbgMp7sZgp9SAmPZyBEia+9mnmjYTtExwBIt6sVjFcHpt
 bLnno3PwdfHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
 d="asc'?scan'208";a="389791540"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2020 21:39:10 -0800
Date: Tue, 22 Dec 2020 13:23:22 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 01/11] drm/i915/gvt: parse init context to update cmd
 accessible reg whitelist
Message-ID: <20201222052322.GZ16939@zhen-hp.sh.intel.com>
References: <20201209043949.2454-1-yan.y.zhao@intel.com>
 <20201209044029.2525-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201209044029.2525-1-yan.y.zhao@intel.com>
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
 Wang Zhi <zhi.a.wang@intel.com>, zhenyuw@linux.intel.com
Content-Type: multipart/mixed; boundary="===============0234848120=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0234848120==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yZxAaITavNk3ADw/"
Content-Disposition: inline


--yZxAaITavNk3ADw/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.12.09 12:40:29 +0800, Yan Zhao wrote:
> Logical Context is actually a big batch buffer consisting of multiple
> LRI commands + saved registers. It comprises Ring Context (the first
> 0x50 dwords) and Engine Context. The registers defined in Engine Context
> are command accessible, and safe to execute in VM Context.
> However, not all of them are currently tracked in existing register
> whitelist. Here we kick hardware to generate a dummy Engine Context and
> then scan the dummy Engine context to update whitelist dynamically. Based
> on updated list, later patches will audit future VM Engine Contexts to
> disallow undesired LRIs (if out of what hardware generates).
>=20
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Wang Zhi <zhi.a.wang@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 143 +++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/gvt/cmd_parser.h |   2 +
>  drivers/gpu/drm/i915/gvt/gvt.h        |   4 +
>  drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
>  4 files changed, 149 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 16b582cb97ed..9d2fdaca92bd 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -38,10 +38,15 @@
> =20
>  #include "i915_drv.h"
>  #include "gt/intel_ring.h"
> +#include "gt/intel_gt_requests.h"
>  #include "gvt.h"
>  #include "i915_pvinfo.h"
>  #include "trace.h"
> =20
> +#include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_pm.h"
> +#include "gt/intel_context.h"
> +
>  #define INVALID_OP    (~0U)
> =20
>  #define OP_LEN_MI           9
> @@ -454,6 +459,7 @@ enum {
>  	RING_BUFFER_INSTRUCTION,
>  	BATCH_BUFFER_INSTRUCTION,
>  	BATCH_BUFFER_2ND_LEVEL,
> +	RING_BUFFER_CTX,
>  };
> =20
>  enum {
> @@ -495,6 +501,7 @@ struct parser_exec_state {
>  	 */
>  	int saved_buf_addr_type;
>  	bool is_ctx_wa;
> +	bool is_init_ctx;
> =20
>  	const struct cmd_info *info;
> =20
> @@ -708,6 +715,11 @@ static inline u32 cmd_val(struct parser_exec_state *=
s, int index)
>  	return *cmd_ptr(s, index);
>  }
> =20
> +static inline bool is_init_ctx(struct parser_exec_state *s)
> +{
> +	return (s->buf_type =3D=3D RING_BUFFER_CTX && s->is_init_ctx);
> +}
> +
>  static void parser_exec_state_dump(struct parser_exec_state *s)
>  {
>  	int cnt =3D 0;
> @@ -721,7 +733,8 @@ static void parser_exec_state_dump(struct parser_exec=
_state *s)
> =20
>  	gvt_dbg_cmd("  %s %s ip_gma(%08lx) ",
>  			s->buf_type =3D=3D RING_BUFFER_INSTRUCTION ?
> -			"RING_BUFFER" : "BATCH_BUFFER",
> +			"RING_BUFFER" : ((s->buf_type =3D=3D RING_BUFFER_CTX) ?
> +				"CTX_BUFFER" : "BATCH_BUFFER"),
>  			s->buf_addr_type =3D=3D GTT_BUFFER ?
>  			"GTT" : "PPGTT", s->ip_gma);
> =20
> @@ -756,7 +769,8 @@ static inline void update_ip_va(struct parser_exec_st=
ate *s)
>  	if (WARN_ON(s->ring_head =3D=3D s->ring_tail))
>  		return;
> =20
> -	if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION) {
> +	if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION ||
> +			s->buf_type =3D=3D RING_BUFFER_CTX) {
>  		unsigned long ring_top =3D s->ring_start + s->ring_size;
> =20
>  		if (s->ring_head > s->ring_tail) {
> @@ -936,6 +950,11 @@ static int cmd_reg_handler(struct parser_exec_state =
*s,
>  		return -EFAULT;
>  	}
> =20
> +	if (is_init_ctx(s)) {
> +		intel_gvt_mmio_set_cmd_accessible(gvt, offset);
> +		return 0;
> +	}
> +
>  	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
>  		gvt_vgpu_err("%s access to non-render register (%x)\n",
>  				cmd, offset);
> @@ -1215,6 +1234,8 @@ static int cmd_handler_mi_batch_buffer_end(struct p=
arser_exec_state *s)
>  		s->buf_type =3D BATCH_BUFFER_INSTRUCTION;
>  		ret =3D ip_gma_set(s, s->ret_ip_gma_bb);
>  		s->buf_addr_type =3D s->saved_buf_addr_type;
> +	} else if (s->buf_type =3D=3D RING_BUFFER_CTX) {
> +		ret =3D ip_gma_set(s, s->ring_tail);
>  	} else {
>  		s->buf_type =3D RING_BUFFER_INSTRUCTION;
>  		s->buf_addr_type =3D GTT_BUFFER;
> @@ -2763,7 +2784,8 @@ static int command_scan(struct parser_exec_state *s,
>  	gma_bottom =3D rb_start +  rb_len;
> =20
>  	while (s->ip_gma !=3D gma_tail) {
> -		if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION) {
> +		if (s->buf_type =3D=3D RING_BUFFER_INSTRUCTION ||
> +				s->buf_type =3D=3D RING_BUFFER_CTX) {
>  			if (!(s->ip_gma >=3D rb_start) ||
>  				!(s->ip_gma < gma_bottom)) {
>  				gvt_vgpu_err("ip_gma %lx out of ring scope."
> @@ -3056,6 +3078,121 @@ int intel_gvt_scan_and_shadow_wa_ctx(struct intel=
_shadow_wa_ctx *wa_ctx)
>  	return 0;
>  }
> =20
> +/* generate dummy contexts by sending empty requests to HW, and let
> + * the HW to fill Engine Contexts. This dummy contexts are used for
> + * initialization purpose (update reg whitelist), so referred to as
> + * init context here
> + */
> +void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
> +{
> +	struct intel_gvt *gvt =3D vgpu->gvt;
> +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +	const unsigned long start =3D LRC_STATE_PN * PAGE_SIZE;
> +	struct i915_request *rq;
> +	struct intel_vgpu_submission *s =3D &vgpu->submission;
> +	struct i915_request *requests[I915_NUM_ENGINES] =3D {};
> +	bool is_ctx_pinned[I915_NUM_ENGINES] =3D {};
> +	int ret;
> +
> +	if (gvt->is_reg_whitelist_updated)
> +		return;
> +
> +	for_each_engine(engine, &dev_priv->gt, id) {
> +		ret =3D intel_context_pin(s->shadow[id]);
> +		if (ret) {
> +			gvt_vgpu_err("fail to pin shadow ctx\n");
> +			goto out;
> +		}
> +		is_ctx_pinned[id] =3D true;
> +
> +		rq =3D i915_request_create(s->shadow[id]);
> +		if (IS_ERR(rq)) {
> +			gvt_vgpu_err("fail to alloc default request\n");
> +			ret =3D -EIO;
> +			goto out;
> +		}
> +		requests[id] =3D i915_request_get(rq);
> +		i915_request_add(rq);
> +	}
> +
> +	if (intel_gt_wait_for_idle(&dev_priv->gt,
> +				I915_GEM_IDLE_TIMEOUT) =3D=3D -ETIME) {
> +		ret =3D -EIO;
> +		goto out;
> +	}
> +
> +	/* scan init ctx to update cmd accessible list */
> +	for_each_engine(engine, &dev_priv->gt, id) {
> +		int size =3D engine->context_size - PAGE_SIZE;
> +		void *vaddr;
> +		struct parser_exec_state s;
> +		struct drm_i915_gem_object *obj;
> +		struct i915_request *rq;
> +
> +		rq =3D requests[id];
> +		GEM_BUG_ON(!i915_request_completed(rq));
> +		GEM_BUG_ON(!intel_context_is_pinned(rq->context));
> +		obj =3D rq->context->state->obj;
> +
> +		if (!obj) {
> +			ret =3D -EIO;
> +			goto out;
> +		}
> +
> +		i915_gem_object_set_cache_coherency(obj,
> +						    I915_CACHE_LLC);
> +
> +		vaddr =3D i915_gem_object_pin_map(obj, I915_MAP_WB);
> +		if (IS_ERR(vaddr)) {
> +			gvt_err("failed to pin init ctx obj, ring=3D%d, err=3D%lx\n",
> +				id, PTR_ERR(vaddr));
> +			goto out;
> +		}
> +
> +		s.buf_type =3D RING_BUFFER_CTX;
> +		s.buf_addr_type =3D GTT_BUFFER;
> +		s.vgpu =3D vgpu;
> +		s.engine =3D engine;
> +		s.ring_start =3D 0;
> +		s.ring_size =3D size;
> +		s.ring_head =3D 0;
> +		s.ring_tail =3D size;
> +		s.rb_va =3D vaddr + start;
> +		s.workload =3D NULL;
> +		s.is_ctx_wa =3D false;
> +		s.is_init_ctx =3D true;
> +
> +		/* skipping the first RING_CTX_SIZE(0x50) dwords */
> +		ret =3D ip_gma_set(&s, RING_CTX_SIZE);
> +		if (ret) {
> +			i915_gem_object_unpin_map(obj);
> +			goto out;
> +		}
> +
> +		ret =3D command_scan(&s, 0, size, 0, size);
> +		if (ret)
> +			gvt_err("Scan init ctx error\n");
> +
> +		i915_gem_object_unpin_map(obj);
> +	}
> +
> +out:
> +	if (!ret)
> +		gvt->is_reg_whitelist_updated =3D true;
> +
> +	for (id =3D 0; id < I915_NUM_ENGINES ; id++) {
> +		if (!requests[id])
> +			continue;
> +		i915_request_put(requests[id]);
> +
> +		if (!is_ctx_pinned[id])
> +			continue;
> +		intel_context_unpin(s->shadow[id]);

In error path, these two steps looks inconsistent which could skip ctx unpi=
n...

> +	}
> +}
> +
>  static int init_cmd_table(struct intel_gvt *gvt)
>  {
>  	unsigned int gen_type =3D intel_gvt_get_device_type(gvt);
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.h b/drivers/gpu/drm/i915=
/gvt/cmd_parser.h
> index ab25d151932a..09ca2b8a63c8 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.h
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.h
> @@ -50,4 +50,6 @@ int intel_gvt_scan_and_shadow_ringbuffer(struct intel_v=
gpu_workload *workload);
> =20
>  int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx);
> =20
> +void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index cf3578e3f4dd..fad412d19f9c 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -329,6 +329,7 @@ struct intel_gvt {
>  		u32 *mocs_mmio_offset_list;
>  		u32 mocs_mmio_offset_list_cnt;
>  	} engine_mmio_list;
> +	bool is_reg_whitelist_updated;
> =20
>  	struct dentry *debugfs_root;
>  };
> @@ -412,6 +413,9 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
>  #define vgpu_fence_base(vgpu) (vgpu->fence.base)
>  #define vgpu_fence_sz(vgpu) (vgpu->fence.size)
> =20
> +/* ring context size i.e. the first 0x50 dwords*/
> +#define RING_CTX_SIZE 320
> +
>  struct intel_vgpu_creation_params {
>  	__u64 handle;
>  	__u64 low_gm_sz;  /* in MB */
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index e49944fde333..5a7226339cf4 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -500,9 +500,11 @@ struct intel_vgpu *intel_gvt_create_vgpu(struct inte=
l_gvt *gvt,
> =20
>  	mutex_lock(&gvt->lock);
>  	vgpu =3D __intel_gvt_create_vgpu(gvt, &param);
> -	if (!IS_ERR(vgpu))
> +	if (!IS_ERR(vgpu)) {
>  		/* calculate left instance change for types */
>  		intel_gvt_update_vgpu_types(gvt);
> +		intel_gvt_update_reg_whitelist(vgpu);
> +	}
>  	mutex_unlock(&gvt->lock);
> =20
>  	return vgpu;
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--yZxAaITavNk3ADw/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX+GCygAKCRCxBBozTXgY
J+l1AJ9bGlqV7NY3ohDHnwV9w3I8iS2/lgCfaMHLPo8HxuoCHUUnZuVxYmObNik=
=m1mc
-----END PGP SIGNATURE-----

--yZxAaITavNk3ADw/--

--===============0234848120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0234848120==--
