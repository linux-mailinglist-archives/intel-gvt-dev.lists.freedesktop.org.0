Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A51E9BF6
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Jun 2020 05:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A1E89E7B;
	Mon,  1 Jun 2020 03:08:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD7889E7B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Jun 2020 03:08:53 +0000 (UTC)
IronPort-SDR: YR7Dd9qe9VvbRhV5o13Nj19PRccGXMT/+eozIS1U3haSau4Cm7Bl7U2kyl1Xw1HC9uYL5CzNaS
 EjDdMZ2u7z7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 20:08:53 -0700
IronPort-SDR: xfWHgoIcFl7soBjp9mQvdgL/LMLOma+D57hLuDreBn5nfi3zv5KbsL+fsratyvFy5QrmNCZ2Fq
 85IJoXM7s7hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="311828149"
Received: from unknown (HELO [10.239.160.113]) ([10.239.160.113])
 by FMSMGA003.fm.intel.com with ESMTP; 31 May 2020 20:08:52 -0700
Subject: Re: [PATCH V3] drm/gvt/i915: Fix two CFL MMIO handling caused by
 regression.
To: intel-gvt-dev@lists.freedesktop.org
References: <20200601030437.12916-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <1e5cd94f-3f52-9cd4-88d4-455a263e4979@intel.com>
Date: Mon, 1 Jun 2020 11:08:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200601030437.12916-1-colin.xu@intel.com>
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

Please ignore this one with a wrong title. Re-sending..

On 2020-06-01 11:04, Colin Xu wrote:
> Fixes: 43226e6fe798 (drm/i915/gvt: replaced register address with name)
>
> D_CFL was incorrectly removed for:
> GAMT_CHKN_BIT_REG
> GEN9_CTX_PREEMPT_REG
>
> V2: Update commit message.
> V3: Rebase and split Fixes and mis-handled MMIO.
>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index 3e88e3b5c43a..d2839cc036c1 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3131,8 +3131,8 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>   	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>   		 NULL, NULL);
>   
> -	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL);
> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_KBL | D_SKL);
> +	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
>   
>   	return 0;
>   }

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
