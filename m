Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0CC2659A0
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Sep 2020 08:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74AA6E2E9;
	Fri, 11 Sep 2020 06:51:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C7F6E2E9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Sep 2020 06:51:49 +0000 (UTC)
IronPort-SDR: IvKIEorgTSZIvLnuk+0eU3bJ8GsCPzw9VOvhL8wdyxkQC6rYHBmlpWs7DJOx9LSwuB1WXQdQXV
 qcEsuymmsMVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="156156986"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="156156986"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 23:51:48 -0700
IronPort-SDR: D5Co7c+yW7vqpqORgvcfEg/2beMBHvFYCO0FJLu2Vv+10oPw1dMV9FG0y/bmBpuvNAkV8kwSPg
 HZC3x9PXb9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="344550566"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by orsmga007.jf.intel.com with ESMTP; 10 Sep 2020 23:51:47 -0700
Subject: Re: [PATCH V2] drm/i915/gvt: Skip writing 0 to HWSP during D3 resume
To: zhenyuw@linux.intel.com
References: <20200911064749.145502-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <f58411a0-4e5b-84c5-035e-d0b688674ebf@intel.com>
Date: Fri, 11 Sep 2020 14:51:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911064749.145502-1-colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Forgot to change title. Will re-send.

On 2020-09-11 14:47, Colin Xu wrote:
> Guest driver may reset HWSP to 0 as init value during D3->D0:
> The full sequence is:
>   - Boot ->D0
>   - Update HWSP
>   - D0->D3
>   - ...In D3 state...
>   - D3->D0
>   - DMLR reset.
>   - Set engine HWSP to 0.
>   - Set engine ring mode to 0.
>   - Set engine HWSP to correct value.
>   - Set engine ring mode to correct value.
> Ring mode is masked register so set 0 won't take effect.
> However HWPS addr 0 is considered as invalid GGTT address which will
> report error like:
> gvt: vgpu 1: write invalid HWSP address, reg:0x2080, value:0x0
> gvt: vgpu 1: fail to emulate MMIO write 00002080 len 4
> Detected your guest driver doesn't support GVT-g.
> Now vgpu 2 will enter failsafe mode.
>
> Zero out HWSP addr is considered as a valid setting from device driver
> so don't treat it as invalid HWSP addr.
>
> V2:
> Treat HWSP addr 0 as valid. (zhenyu)
>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/handlers.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index 3be37e6fe33d..809429a35ec2 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1489,7 +1489,8 @@ static int hws_pga_write(struct intel_vgpu *vgpu, unsigned int offset,
>   	const struct intel_engine_cs *engine =
>   		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
>   
> -	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
> +	if (value != 0 &&
> +	    !intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
>   		gvt_vgpu_err("write invalid HWSP address, reg:0x%x, value:0x%x\n",
>   			      offset, value);
>   		return -EINVAL;

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
