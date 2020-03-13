Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CF1843AB
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Mar 2020 10:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CB66EBA4;
	Fri, 13 Mar 2020 09:32:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791326EBA4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Mar 2020 09:32:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 02:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,548,1574150400"; d="scan'208";a="246644917"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga006.jf.intel.com with ESMTP; 13 Mar 2020 02:32:29 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 13 Mar 2020 02:32:29 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 13 Mar 2020 02:32:29 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.50]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.96]) with mapi id 14.03.0439.000;
 Fri, 13 Mar 2020 17:32:26 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/2] drm/i915/gvt: optimization of context shadowing
Thread-Topic: [PATCH v3 1/2] drm/i915/gvt: optimization of context shadowing
Thread-Index: AQHV+Ri0r3d3bOl1aUu6us2tgeP3H6hFu74AgACGc+A=
Date: Fri, 13 Mar 2020 09:32:26 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4C479099@shsmsx102.ccr.corp.intel.com>
References: <20200313091104.32323-1-yan.y.zhao@intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7CE079@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7CE079@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US, zh-CN
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
Cc: "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Friday, March 13, 2020 5:30 PM
> To: Zhao, Yan Y <yan.y.zhao@intel.com>; intel-gvt-dev@lists.freedesktop.org
> Cc: Zhao, Yan Y <yan.y.zhao@intel.com>; zhenyuw@linux.intel.com
> Subject: RE: [PATCH v3 1/2] drm/i915/gvt: optimization of context shadowing
> 
> > From: Yan Zhao
> > Sent: Friday, March 13, 2020 5:11 PM
> >
> > Software is not expected to populate engine context except when using
> > restore inhibit bit or golden state to initialize it for the first time.
> >
> > Therefore, if a newly submitted guest context is the same as the last
> > shadowed one, no need to populate its engine context from guest again.
> >
> > Currently using lrca + ring_context_gpa to identify whether two guest
> > contexts are the same.
> >
> > The reason of why context id is not included as an identifier is that
> > i915 recently changed the code and context id is only unique for a
> > context when OA is enabled. And when OA is on, context id is generated
> > based on lrca. Therefore, in that case, if two contexts are of the
> > same lrca, they have identical context ids as well.
> >
> > This patch also works with old guest kernel like 4.20.
> 
> given that this patch only works correctly together with 1/2, please enable
> the optimization only at the last step, i.e. with 1/3 to simply create/update
> the the cached information, 2/3 to invalidate the cached info due to GGTT
> change, and then 3/3 to finally enable the optimization by skipping matched
> context. otherwise 1/2 alone may lead to undesired behavior when doing
> bisect later.
> 
Got it!
Thanks!

> >
> > v3: updated commit message to describe engine context and context id
> > clearly (Kevin Tian)
> > v2: rebased to 5.6.0-rc4+
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/gvt.h       |  4 ++++
> >  drivers/gpu/drm/i915/gvt/scheduler.c | 25 ++++++++++++++++++++-----
> >  2 files changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h
> > b/drivers/gpu/drm/i915/gvt/gvt.h index 58c2c7932e3f..e2d7ffd84457
> > 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -163,6 +163,10 @@ struct intel_vgpu_submission {
> >  	const struct intel_vgpu_submission_ops *ops;
> >  	int virtual_submission_interface;
> >  	bool active;
> > +	struct {
> > +		u32 lrca;
> > +		u64 ring_context_gpa;
> > +	} last_ctx[I915_NUM_ENGINES];
> >  };
> >
> >  struct intel_vgpu {
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > index 1c95bf8cbed0..a66050a3d65a 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -134,7 +134,10 @@ static int populate_shadow_context(struct
> > intel_vgpu_workload *workload)
> >  	struct page *page;
> >  	void *dst;
> >  	unsigned long context_gpa, context_page_num;
> > +	struct intel_vgpu_submission *s = &vgpu->submission;
> >  	int i;
> > +	bool skip = false;
> > +	int ring_id = workload->engine->id;
> >
> >  	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
> >  	shadow_ring_context = kmap(page);
> > @@ -171,12 +174,22 @@ static int populate_shadow_context(struct
> > intel_vgpu_workload *workload)
> >  	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
> >  	kunmap(page);
> >
> > -	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
> > -		return 0;
> > +	gvt_dbg_sched("ring %s workload lrca %x, ctx_id %x, ctx gpa %llx",
> > +			workload->engine->name, workload->ctx_desc.lrca,
> > +			workload->ctx_desc.context_id,
> > +			workload->ring_context_gpa);
> >
> > -	gvt_dbg_sched("ring %s workload lrca %x",
> > -		      workload->engine->name,
> > -		      workload->ctx_desc.lrca);
> > +	if ((s->last_ctx[ring_id].lrca ==
> > +				workload->ctx_desc.lrca) &&
> > +			(s->last_ctx[ring_id].ring_context_gpa ==
> > +				workload->ring_context_gpa))
> > +		skip = true;
> > +
> > +	s->last_ctx[ring_id].lrca = workload->ctx_desc.lrca;
> > +	s->last_ctx[ring_id].ring_context_gpa = workload->ring_context_gpa;
> > +
> > +	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
> > +		return 0;
> >
> >  	context_page_num = workload->engine->context_size;
> >  	context_page_num = context_page_num >> PAGE_SHIFT; @@ -
> 1260,6
> > +1273,8 @@ int intel_vgpu_setup_submission(struct intel_vgpu
> > *vgpu)
> >  	atomic_set(&s->running_workload_num, 0);
> >  	bitmap_zero(s->tlb_handle_pending, I915_NUM_ENGINES);
> >
> > +	memset(s->last_ctx, 0, sizeof(s->last_ctx));
> > +
> >  	i915_vm_put(&ppgtt->vm);
> >  	return 0;
> >
> > --
> > 2.17.1
> >
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
