Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EABB262562
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Sep 2020 04:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF81F6E91B;
	Wed,  9 Sep 2020 02:52:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342E189F63;
 Wed,  9 Sep 2020 02:52:20 +0000 (UTC)
IronPort-SDR: OA/Z3/NAUq09PG5eWTTshNHEXi7TrhqA0GFQgEmh2oMJBh4tpU8na/+EODjRehQpuLEEq1HNkx
 ozRhMscNuOrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="176319279"
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="176319279"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 19:52:19 -0700
IronPort-SDR: wiMrYNVcGjrL2dTT6hIT1HU87d02bmwLvN2FE8yTxnnsyfMT97531tkXrfD3f/PGIejLwLNXzX
 zXpqOFIQQ8oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="449034928"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2020 19:52:17 -0700
Subject: Re: [PATCH] drm/i915/gvt: Introduce per object locking in GVT
 scheduler.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200907200203.535-1-zhi.a.wang@intel.com>
 <8e0f7bf0-ce43-7a29-6766-24836e60326f@intel.com>
 <20200909020658.GF28614@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <1a4099a3-ea29-a535-8427-d2a368ca26c8@intel.com>
Date: Wed, 9 Sep 2020 10:52:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909020658.GF28614@zhen-hp.sh.intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 2020-09-09 10:06, Zhenyu Wang wrote:
> On 2020.09.09 09:43:21 +0800, Colin Xu wrote:
>> I tested this patch on the suspend/resume case with vGPU created (no need
>> really activate), can still observer the system freeze issue as mentioned in
>> another patch I sent. So I suppose we still need decouple context pin/unpin
>> with submission setup/clean, but move to workload create/destroy?
>>
> yeah, I observed that conflict too. How about merging Zhi's ww lock fix first
> then next for left suspend/resume fixes? And better if you could pack all fixes
> in one series.
>
> Thanks
No problem at all. And I would like to hear more comments if moving the 
context pin/unpin to workload lifecycle is reasonable.
>
>> After made similar changes based on this one, plus the suspend/resume
>> support patch, below tests can pass:
>>
>> - Create vGPU then suspend/resume.
>>
>> - Run VM w/ vGPU then suspend/resume.
>>
>> https://lists.freedesktop.org/archives/intel-gvt-dev/2020-September/007061.html
>>
>> On 2020-09-08 04:02, Zhi Wang wrote:
>>> To support ww locking and per-object implemented in i915, GVT scheduler needs
>>> to be refined. Most of the changes are located in shadow batch buffer, shadow
>>> wa context in GVT-g, where use quite a lot of i915 gem object APIs.
>>>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>>> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gvt/scheduler.c | 68 ++++++++++++++++++++++++++++++------
>>>    1 file changed, 57 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
>>> index 1570eb8..fe7ee10 100644
>>> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
>>> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
>>> @@ -396,7 +396,9 @@ static void release_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>>>    	if (!wa_ctx->indirect_ctx.obj)
>>>    		return;
>>> +	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, NULL);
>>>    	i915_gem_object_unpin_map(wa_ctx->indirect_ctx.obj);
>>> +	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
>>>    	i915_gem_object_put(wa_ctx->indirect_ctx.obj);
>>>    	wa_ctx->indirect_ctx.obj = NULL;
>>> @@ -504,6 +506,7 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
>>>    	struct intel_gvt *gvt = workload->vgpu->gvt;
>>>    	const int gmadr_bytes = gvt->device_info.gmadr_bytes_in_cmd;
>>>    	struct intel_vgpu_shadow_bb *bb;
>>> +	struct i915_gem_ww_ctx ww;
>>>    	int ret;
>>>    	list_for_each_entry(bb, &workload->shadow_bb, list) {
>>> @@ -528,10 +531,19 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
>>>    		 * directly
>>>    		 */
>>>    		if (!bb->ppgtt) {
>>> -			bb->vma = i915_gem_object_ggtt_pin(bb->obj,
>>> -							   NULL, 0, 0, 0);
>>> +			i915_gem_ww_ctx_init(&ww, false);
>>> +retry:
>>> +			i915_gem_object_lock(bb->obj, &ww);
>>> +
>>> +			bb->vma = i915_gem_object_ggtt_pin_ww(bb->obj, &ww,
>>> +							      NULL, 0, 0, 0);
>>>    			if (IS_ERR(bb->vma)) {
>>>    				ret = PTR_ERR(bb->vma);
>>> +				if (ret == -EDEADLK) {
>>> +					ret = i915_gem_ww_ctx_backoff(&ww);
>>> +					if (!ret)
>>> +						goto retry;
>>> +				}
>>>    				goto err;
>>>    			}
>>> @@ -545,13 +557,18 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
>>>    						      0);
>>>    			if (ret)
>>>    				goto err;
>>> +
>>> +			/* No one is going to touch shadow bb from now on. */
>>> +			i915_gem_object_flush_map(bb->obj);
>>> +
>>> +			i915_gem_object_unlock(bb->obj);
>>> +			i915_gem_ww_ctx_fini(&ww);
>>>    		}
>>> -		/* No one is going to touch shadow bb from now on. */
>>> -		i915_gem_object_flush_map(bb->obj);
>>>    	}
>>>    	return 0;
>>>    err:
>>> +	i915_gem_ww_ctx_fini(&ww);
>>>    	release_shadow_batch_buffer(workload);
>>>    	return ret;
>>>    }
>>> @@ -578,14 +595,30 @@ static int prepare_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>>>    	unsigned char *per_ctx_va =
>>>    		(unsigned char *)wa_ctx->indirect_ctx.shadow_va +
>>>    		wa_ctx->indirect_ctx.size;
>>> +	struct i915_gem_ww_ctx ww;
>>> +	int ret;
>>>    	if (wa_ctx->indirect_ctx.size == 0)
>>>    		return 0;
>>> -	vma = i915_gem_object_ggtt_pin(wa_ctx->indirect_ctx.obj, NULL,
>>> -				       0, CACHELINE_BYTES, 0);
>>> -	if (IS_ERR(vma))
>>> -		return PTR_ERR(vma);
>>> +	i915_gem_ww_ctx_init(&ww, false);
>>> +retry:
>>> +	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, &ww);
>>> +
>>> +	vma = i915_gem_object_ggtt_pin_ww(wa_ctx->indirect_ctx.obj, &ww, NULL,
>>> +					  0, CACHELINE_BYTES, 0);
>>> +	if (IS_ERR(vma)) {
>>> +		ret = PTR_ERR(vma);
>>> +		if (ret == -EDEADLK) {
>>> +			ret = i915_gem_ww_ctx_backoff(&ww);
>>> +			if (!ret)
>>> +				goto retry;
>>> +		}
>>> +		return ret;
>>> +	}
>>> +
>>> +	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
>>> +	i915_gem_ww_ctx_fini(&ww);
>>>    	/* FIXME: we are not tracking our pinned VMA leaving it
>>>    	 * up to the core to fix up the stray pin_count upon
>>> @@ -619,12 +652,14 @@ static void release_shadow_batch_buffer(struct intel_vgpu_workload *workload)
>>>    	list_for_each_entry_safe(bb, pos, &workload->shadow_bb, list) {
>>>    		if (bb->obj) {
>>> +			i915_gem_object_lock(bb->obj, NULL);
>>>    			if (bb->va && !IS_ERR(bb->va))
>>>    				i915_gem_object_unpin_map(bb->obj);
>>>    			if (bb->vma && !IS_ERR(bb->vma))
>>>    				i915_vma_unpin(bb->vma);
>>> +			i915_gem_object_unlock(bb->obj);
>>>    			i915_gem_object_put(bb->obj);
>>>    		}
>>>    		list_del(&bb->list);
>>> @@ -1337,6 +1372,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
>>>    	struct intel_vgpu_submission *s = &vgpu->submission;
>>>    	struct intel_engine_cs *engine;
>>>    	struct i915_ppgtt *ppgtt;
>>> +	struct i915_gem_ww_ctx ww;
>>>    	enum intel_engine_id i;
>>>    	int ret;
>>> @@ -1368,11 +1404,20 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
>>>    			ce->ring = __intel_context_ring_size(ring_size);
>>>    		}
>> Cut here
>>> +		i915_gem_ww_ctx_init(&ww, false);
>>> +retry:
>>> +		ret = intel_context_pin_ww(ce, &ww);
>>> +		if (ret) {
>>> +			if (ret == -EDEADLK) {
>>> +				ret = i915_gem_ww_ctx_backoff(&ww);
>>> +				if (!ret)
>>> +					goto retry;
>>> +			}
>>> +			goto out_shadow_ctx;
>>> +		}
>> I move the piece to create_workload. Similar to the change I made in my
>> patch sent.
>>> -		ret = intel_context_pin(ce);
>>>    		intel_context_put(ce);
>>> -		if (ret)
>>> -			goto out_shadow_ctx;
>>> +		i915_gem_ww_ctx_fini(&ww);
>>>    		s->shadow[i] = ce;
>>>    	}
>>> @@ -1400,6 +1445,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
>>>    	return 0;
>>>    out_shadow_ctx:
>>> +	i915_gem_ww_ctx_fini(&ww);
>>>    	i915_context_ppgtt_root_restore(s, ppgtt);
>>>    	for_each_engine(engine, vgpu->gvt->gt, i) {
>>>    		if (IS_ERR(s->shadow[i]))
>> -- 
>> Best Regards,
>> Colin Xu
>>
-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
