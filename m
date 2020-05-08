Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7B1CA638
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 May 2020 10:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952816EA9F;
	Fri,  8 May 2020 08:39:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26C96E1F2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 May 2020 08:39:53 +0000 (UTC)
IronPort-SDR: Nbday1tmp7vLE+eP4zWuV8MSevO2L+B/CKNgHzQ06ICv39dic2xMp1ifaR5jKN1iGlNzdE5a4N
 +6LSKZfK2zUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 01:39:52 -0700
IronPort-SDR: ZlUGzPGQZfYWdnWFYCnFpJMFZlK95wmOl3VNWw83mumlk5LT00MqgSPosIRxZEmzIiXZ4A4Lg+
 NOFL/aOYElqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; d="scan'208";a="264228423"
Received: from unknown (HELO [10.239.160.118]) ([10.239.160.118])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2020 01:39:51 -0700
Subject: Re: [PATCH] drm/i915/gvt: Init DPLL/DDI vreg for virtual display
 instead of inheritance.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200508060506.216250-1-colin.xu@intel.com>
 <20200508062424.GA18545@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <1f074a8a-5f9d-057c-eec7-43341f614e61@intel.com>
Date: Fri, 8 May 2020 16:39:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508062424.GA18545@zhen-hp.sh.intel.com>
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


On 2020-05-08 14:24, Zhenyu Wang wrote:
> On 2020.05.08 14:05:06 +0800, Colin Xu wrote:
>> Init value of some display vregs rea inherited from host pregs. When
>> host display in different status, i.e. all monitors unpluged, different
>> display configurations, etc., GVT virtual display setup don't consistent
>> thus may lead to guest driver consider display goes malfunctional.
>>
>> The added init vreg values are based on PRMs and fixed by calcuation
>> from current configuration (only PIPE_A) and the virtual EDID.
>>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/display.c | 49 +++++++++++++++++++++++++++---
>>   1 file changed, 44 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
>> index a83df2f84eb9..a1696e9ce4b6 100644
>> --- a/drivers/gpu/drm/i915/gvt/display.c
>> +++ b/drivers/gpu/drm/i915/gvt/display.c
>> @@ -208,14 +208,41 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>>   				SKL_FUSE_PG_DIST_STATUS(SKL_PG0) |
>>   				SKL_FUSE_PG_DIST_STATUS(SKL_PG1) |
>>   				SKL_FUSE_PG_DIST_STATUS(SKL_PG2);
>> -		vgpu_vreg_t(vgpu, LCPLL1_CTL) |=
>> -				LCPLL_PLL_ENABLE |
>> -				LCPLL_PLL_LOCK;
>> -		vgpu_vreg_t(vgpu, LCPLL2_CTL) |= LCPLL_PLL_ENABLE;
> Is this not required?

Based on PRM display chapter, LCPLL2_CTL is for DPLL1. GVT virtual 
display only simulate one path on PIPE_A and could use PORT_B or PORT_D 
based on the caller. Since DPLL0 can be bind to any PORT so in single 
display case it should be enough to use DPLL0(LCPLL1_CTL) only. When 
setting up different PORT, the patch will turn on the CLK for the 
selected DDI/PORT by setting DPLL_CTRL2.

In future if multiple displays are supported, we can see if use shared 
DPLL or assign different DPLL to different DDI/PORT.

>> -
>> +		/*
>> +		 * Only 1 PIPE enabled in current vGPU display and PIPE_A is
>> +		 *  tied to TRANSCODER_A in HW, so it's safe to assume PIPE_A,
>> +		 *   TRANSCODER_A can be enabled. PORT_x depends on the input of
>> +		 *   setup_virtual_dp_monitor, we can bind DPLL0 to any PORT_x
>> +		 *   so we fixed to DPLL0 here.
>> +		 * Setup DPLL0: DP link clk 1620 MHz, non SSC, DP Mode
>> +		 */
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL1) =
>> +			DPLL_CTRL1_OVERRIDE(DPLL_ID_SKL_DPLL0);
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL1) |=
>> +			DPLL_CTRL1_LINK_RATE(DPLL_CTRL1_LINK_RATE_1620, DPLL_ID_SKL_DPLL0);
>> +		vgpu_vreg_t(vgpu, LCPLL1_CTL) =
>> +			LCPLL_PLL_ENABLE | LCPLL_PLL_LOCK;
>> +		vgpu_vreg_t(vgpu, DPLL_STATUS) = DPLL_LOCK(DPLL_ID_SKL_DPLL0);
>> +		/*
>> +		 * Golden M/N are calculated based on:
>> +		 *   24 bpp, 4 lanes, 154000 pixel clk (from virtual EDID),
>> +		 *   DP link clk 1620 MHz and non-constant_n.
>> +		 * TODO: calculate DP link symbol clk and stream clk m/n.
>> +		 */
>> +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) = 63 << TU_SIZE_SHIFT;
>> +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) |= 0x5b425e;
>> +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) = 0x800000;
>> +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) = 0x3cd6e;
>> +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) = 0x80000;
>>   	}
>>   
>>   	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
>> +			~DPLL_CTRL2_DDI_CLK_OFF(PORT_B);
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
>> +			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_B);
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
>> +			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_B);
>>   		vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIB_DETECTED;
>>   		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
>>   			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>> @@ -236,6 +263,12 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>>   	}
>>   
>>   	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
>> +			~DPLL_CTRL2_DDI_CLK_OFF(PORT_C);
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
>> +			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_C);
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
>> +			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_C);
>>   		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTC_HOTPLUG_CPT;
>>   		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
>>   			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>> @@ -256,6 +289,12 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>>   	}
>>   
>>   	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) {
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
>> +			~DPLL_CTRL2_DDI_CLK_OFF(PORT_D);
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
>> +			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_D);
>> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
>> +			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_D);
>>   		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTD_HOTPLUG_CPT;
>>   		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
>>   			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>> -- 
>> 2.26.2
>>
>> _______________________________________________
>> intel-gvt-dev mailing list
>> intel-gvt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
