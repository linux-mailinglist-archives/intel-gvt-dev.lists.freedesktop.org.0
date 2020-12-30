Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D202E779C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Dec 2020 11:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25C0891DB;
	Wed, 30 Dec 2020 10:01:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A633A891DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Dec 2020 10:01:53 +0000 (UTC)
IronPort-SDR: q8AiXAuW5MpkCBjkIySnrLFcp/cXn1AzChD7pPQBj/36+2QD3E9tq702Acv5ctSCxl4JokaJHO
 yDuWe+FVoGVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="164302421"
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; d="scan'208";a="164302421"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2020 02:01:51 -0800
IronPort-SDR: iLH1hg/prhZG3EgsW7a08zyonsWfdZ8ElV/Ma/wphMRI0E3dNqdxhNRa5SwQWOqHNrgx4PjPvn
 ng9VRYqB2LXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; d="scan'208";a="347790111"
Received: from unknown (HELO [10.239.160.33]) ([10.239.160.33])
 by fmsmga008.fm.intel.com with ESMTP; 30 Dec 2020 02:01:48 -0800
Subject: Re: [PATCH V2] drm/i915/gvt: Fix vfio_edid issue for BXT/APL
To: intel-gvt-dev@lists.freedesktop.org
References: <20201201060329.142375-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <d73213b0-2ccf-d1a7-b89f-c96d8f95ea60@intel.com>
Date: Wed, 30 Dec 2020 18:01:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201201060329.142375-1-colin.xu@intel.com>
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

Ping. Seems we missed this reviewed patch in gvt-staging.

On 12/1/20 2:03 PM, Colin Xu wrote:
> BXT/APL has different isr/irr/hpd regs compared with other GEN9. If not
> setting these regs bits correctly according to the emulated monitor
> (currently a DP on PORT_B), although gvt still triggers a virtual HPD
> event, the guest driver won't detect a valid HPD pulse thus no full
> display detection will be executed to read the updated EDID.
>
> With this patch, the vfio_edid is enabled again on BXT/APL, which is
> previously disabled:
> Fixes: 642403e3599e (drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL)
>
> V2:
> Use Fixes tag.
>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/display.c | 81 +++++++++++++++++++++---------
>   drivers/gpu/drm/i915/gvt/vgpu.c    |  5 +-
>   2 files changed, 59 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
> index a15f87539657..62a5b0dd2003 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -217,6 +217,15 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>   				  DDI_BUF_CTL_ENABLE);
>   			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) |= DDI_BUF_IS_IDLE;
>   		}
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
> +			~(PORTA_HOTPLUG_ENABLE | PORTA_HOTPLUG_STATUS_MASK);
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
> +			~(PORTB_HOTPLUG_ENABLE | PORTB_HOTPLUG_STATUS_MASK);
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
> +			~(PORTC_HOTPLUG_ENABLE | PORTC_HOTPLUG_STATUS_MASK);
> +		/* No hpd_invert set in vgpu vbt, need to clear invert mask */
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &= ~BXT_DDI_HPD_INVERT_MASK;
> +		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &= ~BXT_DE_PORT_HOTPLUG_MASK;
>   
>   		vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &= ~(BIT(0) | BIT(1));
>   		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) &=
> @@ -273,6 +282,8 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>   			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=
>   				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>   				 TRANS_DDI_FUNC_ENABLE);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
> +				PORTA_HOTPLUG_ENABLE;
>   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>   				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
>   		}
> @@ -301,6 +312,8 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>   				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>   				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
>   				 TRANS_DDI_FUNC_ENABLE);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
> +				PORTB_HOTPLUG_ENABLE;
>   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>   				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
>   		}
> @@ -329,6 +342,8 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>   				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>   				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
>   				 TRANS_DDI_FUNC_ENABLE);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
> +				PORTC_HOTPLUG_ENABLE;
>   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>   				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
>   		}
> @@ -661,44 +676,62 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *vgpu, bool connected)
>   				PORTD_HOTPLUG_STATUS_MASK;
>   		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
>   	} else if (IS_BROXTON(i915)) {
> -		if (connected) {
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +			if (connected) {
>   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>   					GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> +			} else {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
> +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
>   			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> -				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
> -					SFUSE_STRAP_DDIB_DETECTED;
> +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
> +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
> +				~PORTA_HOTPLUG_STATUS_MASK;
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
> +				PORTA_HOTPLUG_LONG_DETECT;
> +			intel_vgpu_trigger_virtual_event(vgpu, DP_A_HOTPLUG);
> +		}
> +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +			if (connected) {
>   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
>   					GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> -			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
>   				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
> -					SFUSE_STRAP_DDIC_DETECTED;
> -				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
> -					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> -			}
> -		} else {
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +					SFUSE_STRAP_DDIB_DETECTED;
> +			} else {
>   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
> -					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> -			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
>   				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
>   					~SFUSE_STRAP_DDIB_DETECTED;
> -				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
> -					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
>   			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> -				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
> -					~SFUSE_STRAP_DDIC_DETECTED;
> +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
> +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
> +				~PORTB_HOTPLUG_STATUS_MASK;
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
> +				PORTB_HOTPLUG_LONG_DETECT;
> +			intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
> +		}
> +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +			if (connected) {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=
> +					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
> +					SFUSE_STRAP_DDIC_DETECTED;
> +			} else {
>   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=
>   					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=
> +					~SFUSE_STRAP_DDIC_DETECTED;
>   			}
> +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=
> +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=
> +				~PORTC_HOTPLUG_STATUS_MASK;
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
> +				PORTC_HOTPLUG_LONG_DETECT;
> +			intel_vgpu_trigger_virtual_event(vgpu, DP_C_HOTPLUG);
>   		}
> -		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=
> -			PORTB_HOTPLUG_STATUS_MASK;
> -		intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> index e49944fde333..cbe5931906e0 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -437,10 +437,9 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
>   	if (ret)
>   		goto out_clean_sched_policy;
>   
> -	if (IS_BROADWELL(dev_priv))
> +	if (IS_BROADWELL(dev_priv) || IS_BROXTON(dev_priv))
>   		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
> -	/* FixMe: Re-enable APL/BXT once vfio_edid enabled */
> -	else if (!IS_BROXTON(dev_priv))
> +	else
>   		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
>   	if (ret)
>   		goto out_clean_sched_policy;

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
