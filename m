Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D498E260BE8
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 09:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C2C6E542;
	Tue,  8 Sep 2020 07:25:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9C26E542
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Sep 2020 07:25:36 +0000 (UTC)
IronPort-SDR: B44Lh5NaiIJQtV05N28lq78+ZXFTodo3E54J3aZxFpdB+lnQ3F+gpCYam6M/FBZW5IlaHemXUZ
 NCXwFTyGUjjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145808818"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="145808818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 00:25:35 -0700
IronPort-SDR: f53pNyCZspTs3Ws2mlPklCMt5zZItZWjB/DXsITpxOvrRaRGl+jIIpd2swDee20efFXQ5w8JE4
 VUf9zYDXwxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="285792070"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2020 00:25:34 -0700
Subject: Re: [PATCH] drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO
 access
To: intel-gvt-dev@lists.freedesktop.org
References: <20200819010801.53411-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <0afb4950-13e2-5556-825f-514b82c49748@intel.com>
Date: Tue, 8 Sep 2020 15:25:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200819010801.53411-1-colin.xu@intel.com>
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

On 2020-08-19 09:08, Colin Xu wrote:
> Without F_CMD_ACCESS, guest LRI cmd will fail due to "access to
> non-render register" when init below WAs:
> WaDisableDynamicCreditSharing: GAMT_CHKN_BIT_REG
> WaCompressedResourceSamplerPbeMediaNewHashMode: MMCD_MISC_CTRL
>
> So add F_CMD_ACCESS to the two MMIO.
>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index d55cb43c9bd4..840572add2d4 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -2922,7 +2922,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>   	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>   	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>   	MMIO_DFH(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DH(MMCD_MISC_CTRL, D_SKL_PLUS, NULL, NULL);
> +	MMIO_DFH(MMCD_MISC_CTRL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>   	MMIO_DH(CHICKEN_PAR1_1, D_SKL_PLUS, NULL, NULL);
>   	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
>   	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
> @@ -3138,7 +3138,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>   	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>   		 NULL, NULL);
>   
> -	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
> +	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
>   	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
>   
>   	return 0;

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
