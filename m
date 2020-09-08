Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BB8260BEC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA93F6E051;
	Tue,  8 Sep 2020 07:27:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D856E051
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Sep 2020 07:26:59 +0000 (UTC)
IronPort-SDR: uEv27Tckao6p2y0I84Psz2QiXM164yn4rT016dAx3yI5Qlr+B1YdcpduvFdM61QBrkEzPsUriH
 VLnnIPynlRbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145796925"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="145796925"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 00:26:58 -0700
IronPort-SDR: jXINBiSU4Wt72nnbJhaBOhhIQQZiTL7jNy30o4urTAQ38iJR5TqNHAsI0iwyGmXsfnn5vUJ5lG
 80onGK9qkReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="285792395"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2020 00:26:57 -0700
Subject: Re: [PATCH] drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET
To: intel-gvt-dev@lists.freedesktop.org
References: <20200819010900.54598-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <c02d98d1-206c-806e-7155-67ee76b9043e@intel.com>
Date: Tue, 8 Sep 2020 15:26:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200819010900.54598-1-colin.xu@intel.com>
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

Pin for review.

On 2020-08-19 09:09, Colin Xu wrote:
> Although GVT doesnt' support guest GuC, MIA core is still expected
> to be GS_MIA_IN_RESET after uc HW reset.
>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/mmio.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
> index 291993615af9..b6811f6a230d 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio.c
> @@ -251,6 +251,9 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu, bool dmlr)
>   		/* set the bit 0:2(Core C-State ) to C0 */
>   		vgpu_vreg_t(vgpu, GEN6_GT_CORE_STATUS) = 0;
>   
> +		/* uc reset hw expect GS_MIA_IN_RESET */
> +		vgpu_vreg_t(vgpu, GUC_STATUS) |= GS_MIA_IN_RESET;
> +
>   		if (IS_BROXTON(vgpu->gvt->gt->i915)) {
>   			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &=
>   				    ~(BIT(0) | BIT(1));

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
