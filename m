Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EE228C893
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Oct 2020 08:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D086E872;
	Tue, 13 Oct 2020 06:17:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C6E6E872
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Oct 2020 06:17:03 +0000 (UTC)
IronPort-SDR: 1MrOnZz6Y7ZQYJMgAslNOxBkLob2gAwyMC2rTQMNbWtGCZfbMidHGXM8D/p6qUmN/Ofy2LRJZ3
 zxlqCt4QW01Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250552980"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; d="scan'208";a="250552980"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 23:17:02 -0700
IronPort-SDR: 28FGr88NnrXm/73Ndf4ieZt/oCcgNbQoH5zD/KQpKkuGT+0uKpFzD+ZxXkMSGs11KUQyxNQJqu
 E766QUB/+GSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; d="scan'208";a="313693070"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2020 23:17:01 -0700
Subject: Re: [PATCH] drm/i915/gvt: Fix mmio handler break on BXT/APL.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20201012045140.225466-1-colin.xu@intel.com>
 <20201013021453.GO27141@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <06815d3c-9d3e-6d59-c725-018a8ac2fdf4@intel.com>
Date: Tue, 13 Oct 2020 14:17:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013021453.GO27141@zhen-hp.sh.intel.com>
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


On 2020-10-13 10:14, Zhenyu Wang wrote:
> On 2020.10.12 12:51:40 +0800, Colin Xu wrote:
>> - Remove dup mmio handler for BXT/APL.
>> - Add more with F_CMD_ACCESS.
>>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/handlers.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>> index 809429a35ec2..9891501da064 100644
>> --- a/drivers/gpu/drm/i915/gvt/handlers.c
>> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>> @@ -3140,7 +3140,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>>   		 NULL, NULL);
>>   
>>   	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
>> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
>> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
>>   
>>   	return 0;
>>   }
>> @@ -3314,6 +3314,12 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
>>   	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
>>   	MMIO_D(GEN6_GFXPAUSE, D_BXT);
>>   	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
>> +	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
>> +	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
>> +	MMIO_F(_MMIO(0x2658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>> +	MMIO_F(_MMIO(0x12658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>> +	MMIO_F(_MMIO(0x22658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>> +	MMIO_F(_MMIO(0x2a658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>>
> Those should be GPR register with define in i915_reg.h, so pls use name for them.
>
> And I'm not sure what's specific break this fixes? better elaborate or provide Fixes: tag.

LRI command will load these registers, if not handle with F_CMD_ACCESS, 
guest will enter failsafe mode.

And yes RCS and BCS has defines for GPR, however it looks like write in 
this way is more clean than loop HSW_CS_GPR/HSW_CS_GPR_UDW and 
BCS_GPR/BCS_GPR_UDW.

Some mistake here:

+	MMIO_F(_MMIO(0x2600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x12600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x22600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x2a600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);

>
>>   	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
>>   
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
