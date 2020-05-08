Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFB1CA102
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 May 2020 04:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A226E129;
	Fri,  8 May 2020 02:44:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810F96E129
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 May 2020 02:44:58 +0000 (UTC)
IronPort-SDR: LRwHL7TOBFV35YA0Kk6tKMDknRjFT3V/+z+ErO5C4znrdzOg6BlU3Qq4A/4XTjmYcxPUzK3X1P
 Z7Q0OYPOpxaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 19:44:57 -0700
IronPort-SDR: g4oDPMv66jIVJN489kviS9jCXnLPgeW4MtEqcCKyu9aVBzDi/a1zxkRvNo/XmiZOIqzreLJZOf
 BmrsXNahU4WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="251697893"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga008.fm.intel.com with ESMTP; 07 May 2020 19:44:57 -0700
Date: Thu, 7 May 2020 22:35:10 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 1/2] drm/i915/gvt: move workload destroy out of
 execlist complete
Message-ID: <20200508023510.GA26056@joy-OptiPlex-7040>
References: <20200318135322.13788-1-tina.zhang@intel.com>
 <20200506094318.105604-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506094318.105604-1-zhenyuw@linux.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
On Wed, May 06, 2020 at 05:43:17PM +0800, Zhenyu Wang wrote:
> To let execlist.c only handle execlist handling and keep other
> workload cleanup function in scheduler.c to align with other
> workload specific handling there. This doesn't change current
> code behavior.
> 
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/execlist.c  | 2 --
>  drivers/gpu/drm/i915/gvt/scheduler.c | 3 +++
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
> index dd25c3024370..158873f269b1 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.c
> +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> @@ -424,8 +424,6 @@ static int complete_execlist_workload(struct intel_vgpu_workload *workload)
>  
>  	ret = emulate_execlist_ctx_schedule_out(execlist, &workload->ctx_desc);
>  out:
> -	intel_vgpu_unpin_mm(workload->shadow_mm);
> -	intel_vgpu_destroy_workload(workload);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
> index 35ad540622ac..6e59c7d61397 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -1013,6 +1013,9 @@ static void complete_current_workload(struct intel_gvt *gvt, int ring_id)
>  
>  	workload->complete(workload);
>  
> +	intel_vgpu_unpin_mm(workload->shadow_mm);
> +	intel_vgpu_destroy_workload(workload);
> +
>  	atomic_dec(&s->running_workload_num);
>  	wake_up(&scheduler->workload_complete_wq);
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
