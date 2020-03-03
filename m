Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A2176E24
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  3 Mar 2020 05:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4BA6E977;
	Tue,  3 Mar 2020 04:45:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970286E977
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  3 Mar 2020 04:45:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 20:45:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,510,1574150400"; d="scan'208";a="412608623"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.52])
 ([10.239.160.52])
 by orsmga005.jf.intel.com with ESMTP; 02 Mar 2020 20:45:01 -0800
Subject: Re: [PATCH] drm/i915/gvt: Fix unnecessary schedule timer when no vGPU
 exits
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org
References: <20200229055445.31481-1-zhenyuw@linux.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <5e6958d6-4850-e167-348c-fa718938f4f5@intel.com>
Date: Tue, 3 Mar 2020 12:45:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200229055445.31481-1-zhenyuw@linux.intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Yes vgpu_lock is acquired after gvt->lock and vgpu_idr is in gvt domain 
so removing

it doesn't need vgpu_lock but need gvt->lock. And remove idr first can 
guarantee

that when vgpu destroy is on-going, other vgpu acquiring can exit asap 
so that no

race-condition with the cleanup tasks.

Thanks a lot for the fix!

Acked-by: Colin Xu <colin.xu@intel.com>

On 2020-02-29 13:54, Zhenyu Wang wrote:
>  From commit f25a49ab8ab9 ("drm/i915/gvt: Use vgpu_lock to protect per
> vgpu access") the vgpu idr destroy is moved later than vgpu resource
> destroy, then it would fail to stop timer for schedule policy clean
> which to check vgpu idr for any left vGPU. So this trys to destroy
> vgpu idr earlier.
>
> Cc: Colin Xu <colin.xu@intel.com>
> Fixes: f25a49ab8ab9 ("drm/i915/gvt: Use vgpu_lock to protect per vgpu access")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/vgpu.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> index 76fa0493228f..9213b64450c3 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -274,10 +274,17 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
>   	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
>   	struct intel_gvt *gvt = vgpu->gvt;
>   
> -	mutex_lock(&vgpu->vgpu_lock);
> -
>   	drm_WARN(&i915->drm, vgpu->active, "vGPU is still active!\n");
>   
> +	/*
> +	 * remove idr first so later clean can judge if need to stop
> +	 * service if no active vgpu.
> +	 */
> +	mutex_lock(&gvt->lock);
> +	idr_remove(&gvt->vgpu_idr, vgpu->id);
> +	mutex_unlock(&gvt->lock);
> +
> +	mutex_lock(&vgpu->vgpu_lock);
>   	intel_gvt_debugfs_remove_vgpu(vgpu);
>   	intel_vgpu_clean_sched_policy(vgpu);
>   	intel_vgpu_clean_submission(vgpu);
> @@ -292,7 +299,6 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
>   	mutex_unlock(&vgpu->vgpu_lock);
>   
>   	mutex_lock(&gvt->lock);
> -	idr_remove(&gvt->vgpu_idr, vgpu->id);
>   	if (idr_is_empty(&gvt->vgpu_idr))
>   		intel_gvt_clean_irq(gvt);
>   	intel_gvt_update_vgpu_types(gvt);

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
