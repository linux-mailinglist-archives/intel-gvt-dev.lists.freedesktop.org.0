Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3207F28C896
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Oct 2020 08:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AA16E872;
	Tue, 13 Oct 2020 06:19:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC546E872
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Oct 2020 06:19:14 +0000 (UTC)
IronPort-SDR: r8CGCOiJoPNePKXiAmnY2eX3ydfnVdLRQ0YDOP2KnJb7b0RO37TzeeZ58bBq6GHBi1d3PRIdok
 0RwV+aJ3ywew==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="165968840"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; d="scan'208";a="165968840"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 23:19:14 -0700
IronPort-SDR: n+52loWHmyEoLZpPp159hH49+uGwKcV8EcdoET+CVSRAs/nvfZk+Y+J88SS42BlC549owST/fe
 E6sPWmIKJuzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; d="scan'208";a="313693578"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2020 23:19:13 -0700
Subject: Re: [PATCH] drm/i915/gvt: Fix virtual display setup for BXT/APL
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20201012045159.226106-1-colin.xu@intel.com>
 <20201013021845.GP27141@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <82e218e3-c8ea-3cc7-0633-1b4756810eab@intel.com>
Date: Tue, 13 Oct 2020 14:19:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013021845.GP27141@zhen-hp.sh.intel.com>
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


On 2020-10-13 10:18, Zhenyu Wang wrote:
> On 2020.10.12 12:51:59 +0800, Colin Xu wrote:
>> Program display related vregs to proper value at initialization, setup
>> virtual monitor and hotplug.
>>
> What does this fix? Does it fix virtual display probe or make vfio edid
> work properly or others? Pls describe more in details.
Without these changes, vGPU DDI/PLL state maybe inconsistent during each 
VM boot and in some configurations (i.e. host doesn't have display 
connected, or host connect a monitor on PORT_A or PORT_C instead of 
PORT_B), guest driver won't initialize display correctly thus leads to 
no guest desktop.
I'll revise the commit message.
>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/display.c | 183 ++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/i915/gvt/mmio.c    |   5 +
>>   2 files changed, 185 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
>> index 7ba16ddfe75f..f69e23b6218d 100644
>> --- a/drivers/gpu/drm/i915/gvt/display.c
>> +++ b/drivers/gpu/drm/i915/gvt/display.c
>> @@ -173,21 +173,162 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>>   	int pipe;
>>   
>>   	if (IS_BROXTON(dev_priv)) {
>> -		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &= ~(BXT_DE_PORT_HP_DDIA |
>> -			BXT_DE_PORT_HP_DDIB |
>> -			BXT_DE_PORT_HP_DDIC);
>> +		enum transcoder trans;
>> +		enum port port;
>> +
>> +		/* Clear PIPE, DDI, PHY, HPD before setting new */
>> +		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
>> +			~(BXT_DE_PORT_HP_DDIA |
>> +			  BXT_DE_PORT_HP_DDIB |
>> +			  BXT_DE_PORT_HP_DDIC);
>> +
>> +		for_each_pipe(dev_priv, pipe) {
>> +			vgpu_vreg_t(vgpu, PIPECONF(pipe)) &=
>> +				~(PIPECONF_ENABLE | I965_PIPECONF_ACTIVE);
>> +			vgpu_vreg_t(vgpu, DSPCNTR(pipe)) &= ~DISPLAY_PLANE_ENABLE;
>> +			vgpu_vreg_t(vgpu, SPRCTL(pipe)) &= ~SPRITE_ENABLE;
>> +			vgpu_vreg_t(vgpu, CURCNTR(pipe)) &= ~MCURSOR_MODE;
>> +			vgpu_vreg_t(vgpu, CURCNTR(pipe)) |= MCURSOR_MODE_DISABLE;
>> +		}
>> +
>> +		for (trans = TRANSCODER_A; trans <= TRANSCODER_EDP; trans++) {
>> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(trans)) &=
>> +				~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>> +				  TRANS_DDI_PORT_MASK | TRANS_DDI_FUNC_ENABLE);
>> +		}
>> +		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
>> +			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>> +			  TRANS_DDI_PORT_MASK);
>> +
>> +		for (port = PORT_A; port <= PORT_C; port++) {
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(port)) &=
>> +				~BXT_PHY_LANE_ENABLED;
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(port)) |=
>> +				(BXT_PHY_CMNLANE_POWERDOWN_ACK |
>> +				 BXT_PHY_LANE_POWERDOWN_ACK);
>> +
>> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(port)) &=
>> +				~(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
>> +				  PORT_PLL_REF_SEL | PORT_PLL_LOCK |
>> +				  PORT_PLL_ENABLE);
>> +
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) &=
>> +				~(DDI_INIT_DISPLAY_DETECTED |
>> +				  DDI_BUF_CTL_ENABLE);
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) |= DDI_BUF_IS_IDLE;
>> +		}
>> +
>> +		vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &= ~(BIT(0) | BIT(1));
>> +		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) &=
>> +			~PHY_POWER_GOOD;
>> +		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY1)) &=
>> +			~PHY_POWER_GOOD;
>> +		vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) &= ~BIT(30);
>> +		vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY1)) &= ~BIT(30);
>> +
>> +		vgpu_vreg_t(vgpu, SFUSE_STRAP) &= ~SFUSE_STRAP_DDIB_DETECTED;
>> +		vgpu_vreg_t(vgpu, SFUSE_STRAP) &= ~SFUSE_STRAP_DDIC_DETECTED;
>> +
>> +		/*
>> +		 * Only 1 PIPE enabled in current vGPU display and PIPE_A is
>> +		 *  tied to TRANSCODER_A in HW, so it's safe to assume PIPE_A,
>> +		 *   TRANSCODER_A can be enabled. PORT_x depends on the input of
>> +		 *   setup_virtual_dp_monitor.
>> +		 */
>> +		vgpu_vreg_t(vgpu, PIPECONF(PIPE_A)) |= PIPECONF_ENABLE;
>> +		vgpu_vreg_t(vgpu, PIPECONF(PIPE_A)) |= I965_PIPECONF_ACTIVE;
>>   
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
>> +
>> +		/* Enable per-DDI/PORT vreg */
>>   		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
>> +			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |= BIT(1);
>> +			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY1)) |=
>> +				PHY_POWER_GOOD;
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY1)) |=
>> +				BIT(30);
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_A)) |=
>> +				BXT_PHY_LANE_ENABLED;
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_A)) &=
>> +				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
>> +				  BXT_PHY_LANE_POWERDOWN_ACK);
>> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_A)) |=
>> +				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
>> +				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
>> +				 PORT_PLL_ENABLE);
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_A)) |=
>> +				(DDI_BUF_CTL_ENABLE | DDI_INIT_DISPLAY_DETECTED);
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_A)) &=
>> +				~DDI_BUF_IS_IDLE;
>> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=
>> +				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>> +				 TRANS_DDI_FUNC_ENABLE);
>>   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>>   				BXT_DE_PORT_HP_DDIA;
>>   		}
>>   
>>   		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
>> +			vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIB_DETECTED;
>> +			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |= BIT(0);
>> +			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) |=
>> +				PHY_POWER_GOOD;
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) |=
>> +				BIT(30);
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_B)) |=
>> +				BXT_PHY_LANE_ENABLED;
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_B)) &=
>> +				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
>> +				  BXT_PHY_LANE_POWERDOWN_ACK);
>> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_B)) |=
>> +				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
>> +				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
>> +				 PORT_PLL_ENABLE);
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |=
>> +				DDI_BUF_CTL_ENABLE;
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &=
>> +				~DDI_BUF_IS_IDLE;
>> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
>> +				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>> +				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
>> +				 TRANS_DDI_FUNC_ENABLE);
>>   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>>   				BXT_DE_PORT_HP_DDIB;
>>   		}
>>   
>>   		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
>> +			vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIC_DETECTED;
>> +			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |= BIT(0);
>> +			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) |=
>> +				PHY_POWER_GOOD;
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) |=
>> +				BIT(30);
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) |=
>> +				BXT_PHY_LANE_ENABLED;
>> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) &=
>> +				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
>> +				  BXT_PHY_LANE_POWERDOWN_ACK);
>> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_C)) |=
>> +				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
>> +				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
>> +				 PORT_PLL_ENABLE);
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |=
>> +				DDI_BUF_CTL_ENABLE;
>> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &=
>> +				~DDI_BUF_IS_IDLE;
>> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
>> +				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>> +				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
>> +				 TRANS_DDI_FUNC_ENABLE);
>>   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>>   				BXT_DE_PORT_HP_DDIC;
>>   		}
>> @@ -519,6 +660,42 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *vgpu, bool connected)
>>   		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
>>   				PORTD_HOTPLUG_STATUS_MASK;
>>   		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
>> +	} else if (IS_BROXTON(i915)) {
>> +		if (connected) {
>> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
>> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>> +					BXT_DE_PORT_HP_DDIA;
>> +			}
>> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
>> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
>> +					SFUSE_STRAP_DDIB_DETECTED;
>> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>> +					BXT_DE_PORT_HP_DDIB;
>> +			}
>> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
>> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
>> +					SFUSE_STRAP_DDIC_DETECTED;
>> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>> +					BXT_DE_PORT_HP_DDIC;
>> +			}
>> +		} else {
>> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
>> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
>> +					~BXT_DE_PORT_HP_DDIA;
>> +			}
>> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
>> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
>> +					~SFUSE_STRAP_DDIB_DETECTED;
>> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
>> +					~BXT_DE_PORT_HP_DDIB;
>> +			}
>> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
>> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
>> +					~SFUSE_STRAP_DDIC_DETECTED;
>> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
>> +					~BXT_DE_PORT_HP_DDIC;
>> +			}
>> +		}
>>   	}
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
>> index b6811f6a230d..24210b1eaec5 100644
>> --- a/drivers/gpu/drm/i915/gvt/mmio.c
>> +++ b/drivers/gpu/drm/i915/gvt/mmio.c
>> @@ -280,6 +280,11 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu, bool dmlr)
>>   			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) |=
>>   				    BXT_PHY_CMNLANE_POWERDOWN_ACK |
>>   				    BXT_PHY_LANE_POWERDOWN_ACK;
>> +			vgpu_vreg_t(vgpu, SKL_FUSE_STATUS) |=
>> +				SKL_FUSE_DOWNLOAD_STATUS |
>> +				SKL_FUSE_PG_DIST_STATUS(SKL_PG0) |
>> +				SKL_FUSE_PG_DIST_STATUS(SKL_PG1) |
>> +				SKL_FUSE_PG_DIST_STATUS(SKL_PG2);
>>   		}
>>   	} else {
>>   #define GVT_GEN8_MMIO_RESET_OFFSET		(0x44200)
>> -- 
>> 2.28.0
>>
>> _______________________________________________
>> intel-gvt-dev mailing list
>> intel-gvt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
