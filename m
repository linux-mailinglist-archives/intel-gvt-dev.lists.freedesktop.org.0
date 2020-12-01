Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789CC2C9778
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 07:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2A6E483;
	Tue,  1 Dec 2020 06:17:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696816E483
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 06:17:07 +0000 (UTC)
IronPort-SDR: yR1pwqmBJ9eVzhUc4IfNXnkYRmqdshnpt3ziWCmIw/QxhpoF41maBVlxshoBuvNoeR2cS7qL+s
 rUVxXlFwLuuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="170207842"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="170207842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:17:06 -0800
IronPort-SDR: 5zrSEHfT0s4nI+zDYTP5+FdzFHDEusTL7f+mwcIUHM48yhp0QZO21o7KsvX1JJ1RQb8/LMOYzj
 TDIHnFs6QcaQ==
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="480963185"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:17:05 -0800
Date: Tue, 1 Dec 2020 14:04:30 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 01/10] drm/i915/gvt: parse init context to update cmd
 accessible reg whitelist
Message-ID: <20201201060430.GA31495@yzhao56-desk.sh.intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
 <20201125003741.17857-1-yan.y.zhao@intel.com>
 <20201201054604.GQ16939@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201054604.GQ16939@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Wang Zhi <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 01:46:04PM +0800, Zhenyu Wang wrote:
> On 2020.11.25 08:37:41 +0800, Yan Zhao wrote:
> > Logical Context is actually a big batch buffer consisting of multiple
> > LRI commands + saved registers. It comprises Ring Context (the first
> > 0x50 dwords) and Engine Context. The registers defined in Engine Context
> > are command accessible, and safe to execute in VM Context.
> > However, not all of them are currently tracked in existing register
> > whitelist. Here we kick hardware to generate a dummy Engine Context and
> > then scan the dummy Engine context to update whitelist dynamically. Based
> > on updated list, later patches will audit future VM Engine Contexts to
> > disallow undesired LRIs (if out of what hardware generates).
> > 
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Wang Zhi <zhi.a.wang@intel.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 153 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/i915/gvt/cmd_parser.h |   2 +
> >  drivers/gpu/drm/i915/gvt/gvt.h        |   4 +
> >  drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
> >  4 files changed, 159 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > index 16b582cb97ed..b1e508471c40 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -38,10 +38,15 @@
> >  
> >  #include "i915_drv.h"
> >  #include "gt/intel_ring.h"
> > +#include "gt/intel_gt_requests.h"
> >  #include "gvt.h"
> >  #include "i915_pvinfo.h"
> >  #include "trace.h"
> >  
> > +#include "gem/i915_gem_context.h"
> > +#include "gem/i915_gem_pm.h"
> > +#include "gt/intel_context.h"
> > +
> >  #define INVALID_OP    (~0U)
> >  
> >  #define OP_LEN_MI           9
> > @@ -454,6 +459,7 @@ enum {
> >  	RING_BUFFER_INSTRUCTION,
> >  	BATCH_BUFFER_INSTRUCTION,
> >  	BATCH_BUFFER_2ND_LEVEL,
> > +	RING_BUFFER_CTX,
> >  };
> >  
> >  enum {
> > @@ -495,6 +501,7 @@ struct parser_exec_state {
> >  	 */
> >  	int saved_buf_addr_type;
> >  	bool is_ctx_wa;
> > +	bool is_init_ctx;
> >  
> >  	const struct cmd_info *info;
> >  
> > @@ -708,6 +715,11 @@ static inline u32 cmd_val(struct parser_exec_state *s, int index)
> >  	return *cmd_ptr(s, index);
> >  }
> >  
> > +static inline bool is_init_ctx(struct parser_exec_state *s)
> > +{
> > +	return (s->buf_type == RING_BUFFER_CTX && s->is_init_ctx);
> > +}
> > +
> >  static void parser_exec_state_dump(struct parser_exec_state *s)
> >  {
> >  	int cnt = 0;
> > @@ -721,7 +733,8 @@ static void parser_exec_state_dump(struct parser_exec_state *s)
> >  
> >  	gvt_dbg_cmd("  %s %s ip_gma(%08lx) ",
> >  			s->buf_type == RING_BUFFER_INSTRUCTION ?
> > -			"RING_BUFFER" : "BATCH_BUFFER",
> > +			"RING_BUFFER" : ((s->buf_type == RING_BUFFER_CTX) ?
> > +				"CTX_BUFFER" : "BATCH_BUFFER"),
> >  			s->buf_addr_type == GTT_BUFFER ?
> >  			"GTT" : "PPGTT", s->ip_gma);
> >  
> > @@ -756,7 +769,8 @@ static inline void update_ip_va(struct parser_exec_state *s)
> >  	if (WARN_ON(s->ring_head == s->ring_tail))
> >  		return;
> >  
> > -	if (s->buf_type == RING_BUFFER_INSTRUCTION) {
> > +	if (s->buf_type == RING_BUFFER_INSTRUCTION ||
> > +			s->buf_type == RING_BUFFER_CTX) {
> >  		unsigned long ring_top = s->ring_start + s->ring_size;
> >  
> >  		if (s->ring_head > s->ring_tail) {
> > @@ -936,6 +950,11 @@ static int cmd_reg_handler(struct parser_exec_state *s,
> >  		return -EFAULT;
> >  	}
> >  
> > +	if (is_init_ctx(s)) {
> > +		intel_gvt_mmio_set_cmd_accessible(gvt, offset);
> > +		return 0;
> > +	}
> > +
> >  	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
> >  		gvt_vgpu_err("%s access to non-render register (%x)\n",
> >  				cmd, offset);
> > @@ -1215,6 +1234,8 @@ static int cmd_handler_mi_batch_buffer_end(struct parser_exec_state *s)
> >  		s->buf_type = BATCH_BUFFER_INSTRUCTION;
> >  		ret = ip_gma_set(s, s->ret_ip_gma_bb);
> >  		s->buf_addr_type = s->saved_buf_addr_type;
> > +	} else if (s->buf_type == RING_BUFFER_CTX) {
> > +		ret = ip_gma_set(s, s->ring_tail);
> >  	} else {
> >  		s->buf_type = RING_BUFFER_INSTRUCTION;
> >  		s->buf_addr_type = GTT_BUFFER;
> > @@ -2763,7 +2784,8 @@ static int command_scan(struct parser_exec_state *s,
> >  	gma_bottom = rb_start +  rb_len;
> >  
> >  	while (s->ip_gma != gma_tail) {
> > -		if (s->buf_type == RING_BUFFER_INSTRUCTION) {
> > +		if (s->buf_type == RING_BUFFER_INSTRUCTION ||
> > +				s->buf_type == RING_BUFFER_CTX) {
> >  			if (!(s->ip_gma >= rb_start) ||
> >  				!(s->ip_gma < gma_bottom)) {
> >  				gvt_vgpu_err("ip_gma %lx out of ring scope."
> > @@ -3056,6 +3078,131 @@ int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
> >  	return 0;
> >  }
> >  
> > +/* generate dummy contexts by sending empty requests to HW, and let
> > + * the HW to fill Engine Contexts. This dummy contexts are used for
> > + * initialization purpose (update reg whitelist), so referred to as
> > + * init context here
> > + */
> > +void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
> > +{
> > +	struct intel_gvt *gvt = vgpu->gvt;
> > +	struct drm_i915_private *dev_priv = gvt->gt->i915;
> > +	struct intel_engine_cs *engine;
> > +	enum intel_engine_id id;
> > +	struct drm_i915_gem_object *ctx_obj[I915_NUM_ENGINES] = {};
> > +	const unsigned long start = LRC_STATE_PN * PAGE_SIZE;
> > +	struct i915_request *rq;
> > +	struct intel_vgpu_submission *s = &vgpu->submission;
> > +	struct i915_request *requests[I915_NUM_ENGINES] = {};
> > +	bool is_ctx_pinned[I915_NUM_ENGINES] = {};
> > +	int ret;
> > +
> > +	if (gvt->is_reg_whitelist_updated)
> > +		return;
> > +
> > +	for_each_engine(engine, &dev_priv->gt, id) {
> > +		ret = intel_context_pin(s->shadow[id]);
> > +		if (ret) {
> > +			gvt_vgpu_err("fail to pin shadow ctx\n");
> > +			goto out;
> > +		}
> > +		is_ctx_pinned[id] = true;
> > +	}
> > +
> > +	for_each_engine(engine, &dev_priv->gt, id) {
> > +		rq = i915_request_create(s->shadow[id]);
> > +		if (IS_ERR(rq)) {
> > +			gvt_vgpu_err("fail to alloc default request\n");
> > +			ret = -EIO;
> > +			goto out;
> > +		}
> > +		requests[id] = i915_request_get(rq);
> > +		i915_request_add(rq);
> > +	}
> 
> Why split this in different iteration?
yes, the two iterations can be combined into one.
will combine them.

> 
> > +
> > +	if (intel_gt_wait_for_idle(&dev_priv->gt,
> > +				I915_GEM_IDLE_TIMEOUT) == -ETIME) {
> > +		ret = -EIO;
> > +		goto out;
> > +	}
> > +
> > +	for_each_engine(engine, &dev_priv->gt, id) {
> > +		struct i915_request *rq;
> > +
> > +		rq = requests[id];
> > +		GEM_BUG_ON(!i915_request_completed(rq));
> > +		GEM_BUG_ON(!intel_context_is_pinned(rq->context));
> > +		ctx_obj[id] = rq->context->state->obj;
> > +	}
> > +
> 
> and these two iterations?
This iteration cannot be combined with previous one because there's only
one intel_gt_wait_for_idle for all rings.

> 
> > +	/* scan init ctx to update cmd accessible list */
> > +	for_each_engine(engine, &dev_priv->gt, id) {
> > +		int size = engine->context_size - PAGE_SIZE;
> > +		void *vaddr;
> > +		struct parser_exec_state s;
> > +		struct drm_i915_gem_object *obj;
> > +
> > +		if (!ctx_obj[id]) {
> > +			ret = -EIO;
> > +			goto out;
> > +		}
> > +
> > +		obj = ctx_obj[id];
> > +
> > +		i915_gem_object_set_cache_coherency(obj,
> > +						    I915_CACHE_LLC);
> > +
> > +		vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
> > +		if (IS_ERR(vaddr)) {
> > +			gvt_err("failed to pin init ctx obj, ring=%d, err=%lx\n",
> > +				id, PTR_ERR(vaddr));
> > +			goto out;
> > +		}
> > +
> > +		s.buf_type = RING_BUFFER_CTX;
> > +		s.buf_addr_type = GTT_BUFFER;
> > +		s.vgpu = vgpu;
> > +		s.engine = engine;
> > +		s.ring_start = 0;
> > +		s.ring_size = size;
> > +		s.ring_head = 0;
> > +		s.ring_tail = size;
> > +		s.rb_va = vaddr + start;
> > +		s.workload = NULL;
> > +		s.is_ctx_wa = false;
> > +		s.is_init_ctx = true;
> > +
> > +		/* skipping the first RING_CTX_SIZE(0x50) dwords */
> > +		ret = ip_gma_set(&s, RING_CTX_SIZE);
> > +		if (ret) {
> > +			i915_gem_object_unpin_map(obj);
> > +			goto out;
> > +		}
> > +
> > +		ret = command_scan(&s, 0, size, 0, size);
> > +		if (ret)
> > +			gvt_err("Scan init ctx error\n");
> > +
> > +		i915_gem_object_unpin_map(obj);
> > +	}
> > +
> > +out:
> > +	if (!ret)
> > +		gvt->is_reg_whitelist_updated = true;
> > +
> > +	for (id = 0; id < ARRAY_SIZE(requests); id++) {
> > +		if (!requests[id])
> > +			continue;
> > +		i915_request_put(requests[id]);
> > +	}
> > +
> > +	for_each_engine(engine, &dev_priv->gt, id) {
> > +		if (!is_ctx_pinned[id])
> > +			continue;
> > +		intel_context_unpin(s->shadow[id]);
> > +	}
> > +}
> > +
> >  static int init_cmd_table(struct intel_gvt *gvt)
> >  {
> >  	unsigned int gen_type = intel_gvt_get_device_type(gvt);
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.h b/drivers/gpu/drm/i915/gvt/cmd_parser.h
> > index ab25d151932a..09ca2b8a63c8 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.h
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.h
> > @@ -50,4 +50,6 @@ int intel_gvt_scan_and_shadow_ringbuffer(struct intel_vgpu_workload *workload);
> >  
> >  int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx);
> >  
> > +void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> > index a81cf0f01e78..c470e185bc00 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -327,6 +327,7 @@ struct intel_gvt {
> >  		u32 *mocs_mmio_offset_list;
> >  		u32 mocs_mmio_offset_list_cnt;
> >  	} engine_mmio_list;
> > +	bool is_reg_whitelist_updated;
> >  
> >  	struct dentry *debugfs_root;
> >  };
> > @@ -410,6 +411,9 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
> >  #define vgpu_fence_base(vgpu) (vgpu->fence.base)
> >  #define vgpu_fence_sz(vgpu) (vgpu->fence.size)
> >  
> > +/* ring context size i.e. the first 0x50 dwords*/
> > +#define RING_CTX_SIZE 320
> > +
> >  struct intel_vgpu_creation_params {
> >  	__u64 handle;
> >  	__u64 low_gm_sz;  /* in MB */
> > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> > index f6d7e33c7099..7fc4a3e9a560 100644
> > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > @@ -499,9 +499,11 @@ struct intel_vgpu *intel_gvt_create_vgpu(struct intel_gvt *gvt,
> >  
> >  	mutex_lock(&gvt->lock);
> >  	vgpu = __intel_gvt_create_vgpu(gvt, &param);
> > -	if (!IS_ERR(vgpu))
> > +	if (!IS_ERR(vgpu)) {
> >  		/* calculate left instance change for types */
> >  		intel_gvt_update_vgpu_types(gvt);
> > +		intel_gvt_update_reg_whitelist(vgpu);
> 
> Do we need to generate for vgpu create everytime? Suppose on same HW,
> init ctx should be same right? 
>
intel_gvt_update_vgpu_types() are called after each vgpu creation but it
will return immediately if gvt->is_reg_whitelist_updated is true.

Thanks
Yan


> > +	}
> >  	mutex_unlock(&gvt->lock);
> >  
> >  	return vgpu;
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
