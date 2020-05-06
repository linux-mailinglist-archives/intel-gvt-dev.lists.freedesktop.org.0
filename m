Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF71C6F14
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 May 2020 13:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B516E85B;
	Wed,  6 May 2020 11:14:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F396E85B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 May 2020 11:14:05 +0000 (UTC)
IronPort-SDR: gZcBsmZOafZeu20ym0qYxL2xSaXXAsGWsBEgd3l7EupfDJa/atAWQ5zuU/2M4LFJsDSrTnHK9P
 js4EkZ9Z4RoQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 04:14:04 -0700
IronPort-SDR: s0fYoQqPeQ3MlE8XARqFBCQcb+5lRQq+Tk9fz8im1jGRJgmRtqzHgEYBKXaClozqMAH53VQ3vH
 YPVg0Fw02OCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="251175977"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga008.fm.intel.com with ESMTP; 06 May 2020 04:14:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 6 May 2020 04:14:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 May 2020 04:14:03 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 6 May 2020 04:14:02 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.38]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.181]) with mapi id 14.03.0439.000;
 Wed, 6 May 2020 19:14:01 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: use context lrc_reg_state for shadow
 ppgtt override
Thread-Topic: [PATCH] drm/i915/gvt: use context lrc_reg_state for shadow
 ppgtt override
Thread-Index: AQHWI40Wcuz0oyVnJUiWe9dQFDJn6aia56bA
Date: Wed, 6 May 2020 11:14:00 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4C50C0AD@shsmsx102.ccr.corp.intel.com>
References: <20200506095948.124979-1-zhenyuw@linux.intel.com>
In-Reply-To: <20200506095948.124979-1-zhenyuw@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>

> -----Original Message-----
> From: Zhenyu Wang <zhenyuw@linux.intel.com>
> Sent: Wednesday, May 6, 2020 6:00 PM
> To: intel-gvt-dev@lists.freedesktop.org
> Cc: Zhao, Yan Y <yan.y.zhao@intel.com>
> Subject: [PATCH] drm/i915/gvt: use context lrc_reg_state for shadow ppgtt
> override
> 
> We can replace kmap by using context's lrc_reg_state directly for shadow
> ppgtt table override.
> 
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> b/drivers/gpu/drm/i915/gvt/scheduler.c
> index 6ab1d95c1fae..52a1ff3b4ac7 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -58,10 +58,8 @@ static void set_context_pdp_root_pointer(
> 
>  static void update_shadow_pdps(struct intel_vgpu_workload *workload)  {
> -	struct drm_i915_gem_object *ctx_obj =
> -		workload->req->context->state->obj;
>  	struct execlist_ring_context *shadow_ring_context;
> -	struct page *page;
> +	struct intel_context *ctx = workload->req->context;
> 
>  	if (WARN_ON(!workload->shadow_mm))
>  		return;
> @@ -69,11 +67,9 @@ static void update_shadow_pdps(struct
> intel_vgpu_workload *workload)
>  	if (WARN_ON(!atomic_read(&workload->shadow_mm->pincount)))
>  		return;
> 
> -	page = i915_gem_object_get_page(ctx_obj, LRC_STATE_PN);
> -	shadow_ring_context = kmap(page);
> +	shadow_ring_context = (struct execlist_ring_context
> +*)ctx->lrc_reg_state;
>  	set_context_pdp_root_pointer(shadow_ring_context,
>  			(void *)workload->shadow_mm-
> >ppgtt_mm.shadow_pdps);
> -	kunmap(page);
>  }
> 
>  /*
> --
> 2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
