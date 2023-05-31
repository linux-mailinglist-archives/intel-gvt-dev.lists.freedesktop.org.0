Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85683717BDA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 May 2023 11:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF02A10E4A2;
	Wed, 31 May 2023 09:27:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15E010E1C7;
 Wed, 31 May 2023 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685525237; x=1717061237;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0BkFncGuKbBjsyHlKU6yc44s8b/xzuGQ8DcI/EMXRlw=;
 b=auEsBUOuGDiIgkcNr+M5YKn0NYmDIMSKKmuElDSWTlMtGq31wxIW51hm
 JXvmUokqOnYp2QlDPk05zlt61nMKU0v2k7qmlfHxV26856z3aqeYc2LoO
 5H7OmcoWOyj13x/V/Jk33N5ed0+PT9sQWtsj9ZrZlOL/HINc5r1zYwPCA
 1J7wWrxPR7oGs0aUeptWHgSzNrnNlIkSagrWTpJtLc9mY2cu69ewol1Ay
 QXobgYcyuoJC7Y7rLyVeZpKdMUUDXwjnRPd04UodxdBBEJYHbYc4HYOZK
 QcGy2uC5hEGVdDhMBzeOgltB3IIs3tmGo+jRIWRj9uR5jhZEQfl9Jwxje A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383447146"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383447146"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 02:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="831154029"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="831154029"
Received: from eladcoh1-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.46.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 02:27:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH RESEND] drm/i915/gvt: remove unused variable gma_bottom
 in command parser
In-Reply-To: <ZHbdr8YdISKvFrWD@debian-scheme>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230531020411.18987-1-zhi.a.wang@intel.com>
 <ZHbdr8YdISKvFrWD@debian-scheme>
Date: Wed, 31 May 2023 12:27:11 +0300
Message-ID: <878rd4hmvk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 31 May 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> On 2023.05.31 02:04:11 +0000, Zhi Wang wrote:
>> Remove unused variable gma_bottom in scan_workload() and scan_wa_ctx().
>> commit be1da7070aea ("drm/i915/gvt: vGPU command scanner") introduces
>> gma_bottom in several functions to calculate the size of the command
>> buffer. However, some of them are set but actually unused.
>> 
>> When compiling the code with ccflags -Wunused-but-set-variable, gcc
>> throws warnings.
>> 
>> Remove unused variables to avoid the gcc warnings. Tested via compiling
>> the code with ccflags -Wunused-but-set-variable.
>> 
>> Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
>> Suggested-by: Jani Nikula <jani.nikula@intel.com>
>> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>> Cc: intel-gvt-dev@lists.freedesktop.org
>> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
>> ---
>
> Good with me. I think I also caught this before but never send the change..
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

I'd like to pick this up via drm-intel-next if that's all right.

BR,
Jani.

>
>>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> index 3c4ae1da0d41..05f9348b7a9d 100644
>> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> @@ -2833,7 +2833,7 @@ static int command_scan(struct parser_exec_state *s,
>>  
>>  static int scan_workload(struct intel_vgpu_workload *workload)
>>  {
>> -	unsigned long gma_head, gma_tail, gma_bottom;
>> +	unsigned long gma_head, gma_tail;
>>  	struct parser_exec_state s;
>>  	int ret = 0;
>>  
>> @@ -2843,7 +2843,6 @@ static int scan_workload(struct intel_vgpu_workload *workload)
>>  
>>  	gma_head = workload->rb_start + workload->rb_head;
>>  	gma_tail = workload->rb_start + workload->rb_tail;
>> -	gma_bottom = workload->rb_start +  _RING_CTL_BUF_SIZE(workload->rb_ctl);
>>  
>>  	s.buf_type = RING_BUFFER_INSTRUCTION;
>>  	s.buf_addr_type = GTT_BUFFER;
>> @@ -2874,7 +2873,7 @@ static int scan_workload(struct intel_vgpu_workload *workload)
>>  static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>>  {
>>  
>> -	unsigned long gma_head, gma_tail, gma_bottom, ring_size, ring_tail;
>> +	unsigned long gma_head, gma_tail, ring_size, ring_tail;
>>  	struct parser_exec_state s;
>>  	int ret = 0;
>>  	struct intel_vgpu_workload *workload = container_of(wa_ctx,
>> @@ -2891,7 +2890,6 @@ static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>>  			PAGE_SIZE);
>>  	gma_head = wa_ctx->indirect_ctx.guest_gma;
>>  	gma_tail = wa_ctx->indirect_ctx.guest_gma + ring_tail;
>> -	gma_bottom = wa_ctx->indirect_ctx.guest_gma + ring_size;
>>  
>>  	s.buf_type = RING_BUFFER_INSTRUCTION;
>>  	s.buf_addr_type = GTT_BUFFER;
>> -- 
>> 2.25.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
