Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0F1EF0FA
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Jun 2020 07:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818486E840;
	Fri,  5 Jun 2020 05:53:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3836E840
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Jun 2020 05:53:19 +0000 (UTC)
IronPort-SDR: 0KtwzVEzm1Qa4DtrE1fE8jwdkVqavcFCX7usjbbpzMgMIVpHhlZfQOX3OkttNKtPNg1kNoPrXX
 Eoe7pPst1EVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 22:53:19 -0700
IronPort-SDR: r3AoCThm6g/YeAx+axcDTEY0/0VjHvM7qUuSZj62m1ozvQJFkLi8ziYP4HNZh8v1iVJCtCx0so
 xVBFY3MV9K+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; d="scan'208";a="417165992"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by orsmga004.jf.intel.com with ESMTP; 04 Jun 2020 22:53:18 -0700
Subject: Re: [PATCH V3] drm/i915/gvt: Fix two CFL MMIO handling caused by
 regression.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200601030638.16002-1-colin.xu@intel.com>
 <20200605043638.GO5687@zhen-hp.sh.intel.com>
 <20200605044134.GQ5687@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <c11b45f5-b9dd-6ca5-fa9e-3f08e8634def@intel.com>
Date: Fri, 5 Jun 2020 13:53:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605044134.GQ5687@zhen-hp.sh.intel.com>
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


On 2020-06-05 12:41, Zhenyu Wang wrote:
> On 2020.06.05 12:36:38 +0800, Zhenyu Wang wrote:
>> On 2020.06.01 11:06:38 +0800, Colin Xu wrote:
>>> Fixes: 43226e6fe798 (drm/i915/gvt: replaced register address with name)
>>>
>> Normally Fixes tag is put after description with s-o-b line.
>>
>>> D_CFL was incorrectly removed for:
>>> GAMT_CHKN_BIT_REG
>>> GEN9_CTX_PREEMPT_REG
>>>
>>> V2: Update commit message.
>>> V3: Rebase and split Fixes and mis-handled MMIO.
>>>
>>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>>> index 3e88e3b5c43a..d2839cc036c1 100644
>>> --- a/drivers/gpu/drm/i915/gvt/handlers.c
>>> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>>> @@ -3131,8 +3131,8 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>>>   	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>>   		 NULL, NULL);
>>>   
>>> -	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL);
>>> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_KBL | D_SKL);
>>> +	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
>>> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
>>>
>> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>>
>> Thanks!
>>
>>>   	return 0;
> Btw, what kind of regression this would trigger? Do we need to pick for stable kernel?
No actual error found yet. However these MMIOs are carefully reviewed 
during GVT-g enablement on CFL, removing D_CFL in a clean up patch is a 
mistake instead of due to some technical reason. So it's better keep as 
latest GVT-g on CFL status, unless we found CFL doesn't need them.
> Thanks
>
-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
