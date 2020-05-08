Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A11CA953
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 May 2020 13:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344A96EB0E;
	Fri,  8 May 2020 11:14:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709796EB0E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 May 2020 11:14:06 +0000 (UTC)
IronPort-SDR: CPjhKSWw40aVU91zVUfLHTCodm13A6w+HDqUKUrXw8V8DANmOpXznqkVucGhvJ8yqLsn5IN4Qx
 IbDqtq2dUGVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 04:14:05 -0700
IronPort-SDR: VDuCIgQ6N0V24WzDtT7no/lmAYjc/wwgCCAvz3h5c1imeKYE2Q3TOzxe5UpedMTdBbfkFe0RnL
 Voic29zdtxaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; d="scan'208";a="339686070"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2020 04:14:05 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 8 May 2020 04:13:47 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 8 May 2020 04:13:47 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.210]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id 14.03.0439.000;
 Fri, 8 May 2020 19:13:39 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
Thread-Topic: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
Thread-Index: AQHWI40QN1fxKiNhjkOqerANxdQWF6id+YkQ
Date: Fri, 8 May 2020 11:13:38 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC2798C4AE@SHSMSX104.ccr.corp.intel.com>
References: <20200506095918.124913-1-zhenyuw@linux.intel.com>
In-Reply-To: <20200506095918.124913-1-zhenyuw@linux.intel.com>
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf
> Of Zhenyu Wang
> Sent: Wednesday, May 6, 2020 5:59 PM
> To: intel-gvt-dev@lists.freedesktop.org
> Subject: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
> 
> As i915 won't allocate extra PDP for current default PML4 table, so for 3-level
> ppgtt guest, we would hit kernel pointer access failure on extra PDP pointers.
> So this trys to bypass that now.
> It won't impact real shadow PPGTT setup, so guest context still works.
> 
> This is verified on 4.15 guest kernel with i915.enable_ppgtt=1 to force on old
> aliasing ppgtt behavior.
> 
> Fixes: 4f15665ccbba ("drm/i915: Add ppgtt to GVT GEM context")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> b/drivers/gpu/drm/i915/gvt/scheduler.c
> index 9c3558489d17..6ab1d95c1fae 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -420,7 +420,11 @@ static void set_context_ppgtt_from_shadow(struct
> intel_vgpu_workload *workload,
>  		for (i = 0; i < GVT_RING_CTX_NR_PDPS; i++) {
>  			struct i915_page_directory * const pd =
>  				i915_pd_entry(ppgtt->pd, i);
> -
> +			/* skip now as current i915 ppgtt alloc won't allocate
> +			   top level pdp for non 4-level table, won't impact
> +			   shadow ppgtt. */
> +			if (!pd)
> +				break;
[Zhang, Xiong Y]  does it  exist in older kernel only ?  current staging code allocate 4 pdp for non 4-level table.
I915_context_ppgtt_root_restore()  have the same issue, it should be modified also.
thanks
>  			px_dma(pd) = mm->ppgtt_mm.shadow_pdps[i];
>  		}
>  	}
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
