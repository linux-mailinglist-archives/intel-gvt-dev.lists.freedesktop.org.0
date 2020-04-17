Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B28D1AD604
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Apr 2020 08:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA266E101;
	Fri, 17 Apr 2020 06:21:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296CA6E101
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Apr 2020 06:21:53 +0000 (UTC)
IronPort-SDR: 5iaDg6WNAN/Wc1cVX9e1sG9PSjzx3X7u3zVEBCXS1dz/NF2ttM9AZPRD2NgCXn8LKZMqrs7QmM
 vvrZBCeZ0RSQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 23:21:52 -0700
IronPort-SDR: MI2u/xOcg3a5CYIYDheWb7Nw55wlvaKEYkePIXcAcGOcBNuip4anGDkRbKKiR4Iq3KoXzU4AhE
 E0Tttnr2pbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="244624321"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2020 23:21:36 -0700
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 23:21:36 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 23:21:35 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.214]) with mapi id 14.03.0439.000;
 Fri, 17 Apr 2020 14:21:33 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Subject: RE: [PATCH v5] drm/i915/gvt: skip populate shadow context if guest
 context not changed
Thread-Topic: [PATCH v5] drm/i915/gvt: skip populate shadow context if guest
 context not changed
Thread-Index: AQHWE7/zAR6uzGm3FUe5mYMw4cQKiKh8k7LA//+Iz4CAALzKQA==
Date: Fri, 17 Apr 2020 06:21:33 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D82446E@SHSMSX104.ccr.corp.intel.com>
References: <20200416071338.14847-1-yan.y.zhao@intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D824037@SHSMSX104.ccr.corp.intel.com>
 <20200417030533.GC16688@joy-OptiPlex-7040>
In-Reply-To: <20200417030533.GC16688@joy-OptiPlex-7040>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Zhao, Yan Y <yan.y.zhao@intel.com>
> Sent: Friday, April 17, 2020 11:06 AM
> 
> On Fri, Apr 17, 2020 at 10:20:08AM +0800, Tian, Kevin wrote:
> > > From: Zhao, Yan Y <yan.y.zhao@intel.com>
> > > Sent: Thursday, April 16, 2020 3:14 PM
> > >
> > > Software is not expected to populate engine context except when using
> > > restore inhibit bit or golden state to initialize it for the first time.
> > >
> > > Therefore, if a newly submitted guest context is the same as the last
> > > shadowed one, no need to populate its engine context from guest again.
> > >
> > > Currently using lrca + ring_context_gpa to identify whether two guest
> > > contexts are the same.
> > >
> > > The reason of why context id is not included as an identifier is that
> > > i915 recently changed the code and context id is only unique for a
> > > context when OA is enabled. And when OA is on, context id is generated
> > > based on lrca. Therefore, in that case, if two contexts are of the same
> > > lrca, they have identical context ids as well.
> > > (This patch also works with old guest kernel like 4.20.)
> > >
> > > for guest context, if its ggtt entry is modified after last context
> > > shadowing, it is also deemed as not the same context as last shadowed
> one.
> > >
> > > v5:
> > > merge all 3 patches into one patch  (Zhenyu Wang)
> > >
> > > v4:
> > > - split the series into 3 patches.
> > > - don't turn on optimization until last patch in this series (Kevin Tian)
> > > - define lrca to be atomic in this patch rather than update its type in
> > > the second patch (Kevin Tian)
> > >
> > > v3: updated commit message to describe engine context and context id
> > > clearly (Kevin Tian)
> > > v2: rebased to 5.6.0-rc4+Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > >
> > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/gtt.c       | 17 ++++++++++++++
> > >  drivers/gpu/drm/i915/gvt/gvt.h       |  5 ++++
> > >  drivers/gpu/drm/i915/gvt/scheduler.c | 35 ++++++++++++++++++++++++-
> ---
> > >  3 files changed, 52 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c
> b/drivers/gpu/drm/i915/gvt/gtt.c
> > > index 2a4b23f8aa74..128b24fe9a3b 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > @@ -2341,12 +2341,29 @@ int
> intel_vgpu_emulate_ggtt_mmio_write(struct
> > > intel_vgpu *vgpu,
> > >  {
> > >  	const struct intel_gvt_device_info *info = &vgpu->gvt->device_info;
> > >  	int ret;
> > > +	struct intel_vgpu_submission *s = &vgpu->submission;
> > > +	struct intel_engine_cs *engine;
> > > +	int i;
> > >
> > >  	if (bytes != 4 && bytes != 8)
> > >  		return -EINVAL;
> > >
> > >  	off -= info->gtt_start_offset;
> > >  	ret = emulate_ggtt_mmio_write(vgpu, off, p_data, bytes);
> > > +
> > > +	/* if ggtt of last submitted context is written,
> > > +	 * that context is probably got unpinned.
> > > +	 * Set last shadowed ctx to invalid.
> > > +	 */
> > > +	for_each_engine(engine, vgpu->gvt->gt, i) {
> > > +		if (!s->last_ctx[i].valid)
> > > +			continue;
> > > +
> > > +		if (atomic_read(&s->last_ctx[i].lrca) ==
> > > +				off >> info->gtt_entry_size_shift) {
> > > +			s->last_ctx[i].valid = false;
> > > +		}
> > > +	}
> > >  	return ret;
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h
> b/drivers/gpu/drm/i915/gvt/gvt.h
> > > index 58c2c7932e3f..b342d7be741f 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > > @@ -163,6 +163,11 @@ struct intel_vgpu_submission {
> > >  	const struct intel_vgpu_submission_ops *ops;
> > >  	int virtual_submission_interface;
> > >  	bool active;
> > > +	struct {
> > > +		atomic_t lrca;
> > > +		bool valid;
> > > +		u64 ring_context_gpa;
> >
> > Is there a reason why lrca is atomic_t while gpa is u64? From the
> > code they are always checked/updated together...
> >
> hi Kevin,
> currently this lrca can be updated in two places:
> 
> intel_vgpu_emulate_mmio_write
> 	|->mutex_lock(&vgpu->vgpu_lock);
> 	|->intel_vgpu_emulate_ggtt_mmio_write
> 	|	|->read s->last_ctx[i].lrca
> 	|->mutex_unlock(&vgpu->vgpu_lock);
> 
> 
> workload_thread
> 	|->dispatch_workload
> 		|->mutex_lock(&vgpu->vgpu_lock);
> 		|->populate_shadow_context
> 		|	|->read/write s->last_ctx[i].lrca
> 		|->mutex_unlock(&vgpu->vgpu_lock);
> 
> actually, now it's safe to be u64 with the vgpu_lock.
> (gpa currently is only accessed in workload_thread).
> 
> so, change to to u64?

I would think so.

> 
> 
> > > +	} last_ctx[I915_NUM_ENGINES];
> > >  };
> > >
> > >  struct intel_vgpu {
> > > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > index f939ec3be39e..1f0b15b9a846 100644
> > > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > @@ -135,7 +135,11 @@ static int populate_shadow_context(struct
> > > intel_vgpu_workload *workload)
> > >  	unsigned long context_gpa, context_page_num;
> > >  	unsigned long gpa_base; /* first gpa of consecutive GPAs */
> > >  	unsigned long gpa_size; /* size of consecutive GPAs */
> > > +	struct intel_vgpu_submission *s = &vgpu->submission;
> > >  	int i;
> > > +	bool skip = false;
> > > +	int ring_id = workload->engine->id;
> > > +	bool valid;
> > >
> > >  	GEM_BUG_ON(!intel_context_is_pinned(ctx));
> > >
> > > @@ -175,12 +179,29 @@ static int populate_shadow_context(struct
> > > intel_vgpu_workload *workload)
> > >
> > >  	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
> > >
> > > -	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
> > > -		return 0;
> > > +	gvt_dbg_sched("ring %s workload lrca %x, ctx_id %x, ctx gpa %llx",
> > > +			workload->engine->name, workload->ctx_desc.lrca,
> > > +			workload->ctx_desc.context_id,
> > > +			workload->ring_context_gpa);
> > >
> > > -	gvt_dbg_sched("ring %s workload lrca %x",
> > > -		      workload->engine->name,
> > > -		      workload->ctx_desc.lrca);
> > > +	/* only need to ensure this context is not pinned/unpinned during
> > > the
> > > +	 * period from last submission to this this submission.
> > > +	 * Upon reaching this function, the currently submitted context is not
> > > +	 * supposed to get unpinned. If a misbehaving guest driver ever does
> > > +	 * this, it would corrupt itself.
> > > +	 */
> > > +	valid = s->last_ctx[ring_id].valid;
> > > +	if (valid && (atomic_read(&s->last_ctx[ring_id].lrca) ==
> > > +				workload->ctx_desc.lrca) &&
> > > +			(s->last_ctx[ring_id].ring_context_gpa ==
> > > +				workload->ring_context_gpa))
> > > +		skip = true;
> > > +
> > > +	atomic_set(&s->last_ctx[ring_id].lrca, workload->ctx_desc.lrca);
> > > +	s->last_ctx[ring_id].ring_context_gpa = workload->ring_context_gpa;
> > > +
> > > +	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
> > > +		return 0;
> > >
> > >  	context_page_num = workload->engine->context_size;
> > >  	context_page_num = context_page_num >> PAGE_SHIFT;
> > > @@ -220,6 +241,8 @@ static int populate_shadow_context(struct
> > > intel_vgpu_workload *workload)
> > >  		gpa_size = I915_GTT_PAGE_SIZE;
> > >  		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
> > >  	}
> >
> > You missed one thing. There could be error captured when copying the
> > guest context:
> >
> >                 if (context_gpa == INTEL_GVT_INVALID_ADDR) {
> >                         gvt_vgpu_err("Invalid guest context descriptor\n");
> >                         return -EFAULT;
> >                 }
> >
> > In that case we should clear the valid bit in case that it is already
> > valid recording a different lrca before this submission.
> >
> 
> right. I did miss it...sorry.
> Thanks a lot!
> 
> > > +	if (!valid)
> > > +		s->last_ctx[ring_id].valid = true;
> > >  	return 0;
> > >  }
> > >
> > > @@ -1297,6 +1320,8 @@ int intel_vgpu_setup_submission(struct
> intel_vgpu
> > > *vgpu)
> > >  	atomic_set(&s->running_workload_num, 0);
> > >  	bitmap_zero(s->tlb_handle_pending, I915_NUM_ENGINES);
> > >
> > > +	memset(s->last_ctx, 0, sizeof(s->last_ctx));
> > > +
> > >  	i915_vm_put(&ppgtt->vm);
> > >  	return 0;
> > >
> > > --
> > > 2.17.1
> >
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
