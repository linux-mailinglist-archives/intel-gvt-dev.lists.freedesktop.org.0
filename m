Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A528FD6B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 06:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BBE6E1CE;
	Fri, 16 Oct 2020 04:48:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762056E1CE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Oct 2020 04:48:08 +0000 (UTC)
IronPort-SDR: U5nwOdXOUPEv/PKfC4H7ipcV8mkT8r5GQIBogrx0jmN/ngMsyFC6JJwvdVg+HSe9KxK5vGwfpo
 VDWeRYD94fCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="251219583"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="251219583"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 21:48:07 -0700
IronPort-SDR: c7hyRNNenIN26OZSfXyFJuDgD4dMDBl/WIpDMlTyyDrJnvDnkbnoBaLpHjWPLmbbCfZurN7ca7
 TyCg+4X1pPBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="464560743"
Received: from unknown (HELO [10.239.160.24]) ([10.239.160.24])
 by orsmga004.jf.intel.com with ESMTP; 15 Oct 2020 21:48:07 -0700
Subject: Re: [PATCH v2] drm/i915/gvt: Fix mmio handler break on BXT/APL.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20201014011816.11926-1-colin.xu@intel.com>
 <20201016041601.GF27141@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <1c9c5721-5aab-388b-ad95-4978ff47ac05@intel.com>
Date: Fri, 16 Oct 2020 12:48:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201016041601.GF27141@zhen-hp.sh.intel.com>
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


On 2020-10-16 12:16, Zhenyu Wang wrote:
> On 2020.10.14 09:18:16 +0800, Colin Xu wrote:
>> - Remove dup mmio handler for BXT/APL. Otherwise mmio handler will fail
>>    to init.
>> - Add engine GPR with F_CMD_ACCESS since BXT/APL will load them via
>>    LRI. Otherwise, guest will enter failsafe mode.
>>
>> V2:
>> Use RCS/BCS GPR macros instead of offset.
>> Revise comment.
>>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/handlers.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>> index 0031e7c43ea8..2691ae841971 100644
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
>> +	MMIO_F(HSW_CS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>> +	MMIO_F(_MMIO(0x12600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>> +	MMIO_F(BCS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>> +	MMIO_F(_MMIO(0x2a600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
> Should be like GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), etc.
Emmm it's much better. Thanks!
>
>>   
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
