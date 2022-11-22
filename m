Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9331633685
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Nov 2022 09:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6801B10E397;
	Tue, 22 Nov 2022 08:02:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3B410E397;
 Tue, 22 Nov 2022 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669104149; x=1700640149;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jmEGBQ5ghzcfY+CKMUOq2cfmIkCgen+eNqz1dZmKyH8=;
 b=QkfxTDPMIlTXWtUAOhsgbIGalkttUKAjOgeZL0nctRzZRfwRR1uyOsz7
 jsq0KF0rDiKLML7qWHr6OYhVJlrDTaCcHrqHRzCr1gTxBeD+NlQklFDT3
 MDQNLsuZC4cVJYVlux4/2bfh8aYzCo6ZQOZLNbo0hSj45he7xygzCRAfL
 vi3jiwUFgiFmSpcE80CkJXTIAiPH9dpSKqJWUjbztGlAU7AUBJh3sDctJ
 cT1IirR3fDgmisID+Mp2sIGBKSYf9r/f+GCeX8yfJHUt8GDCv+EfxAqho
 4zzbj40hkOUa1PjQrICelam7Gg0fnZq4x4jORQN9tRdCHWfKBWH1aOfcb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="301308107"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="301308107"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 00:02:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="635462678"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="635462678"
Received: from camorino-mobl.ger.corp.intel.com (HELO [10.213.209.233])
 ([10.213.209.233])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 00:02:26 -0800
Message-ID: <180fbf43-cd63-e06b-ccb9-970e478c05e2@linux.intel.com>
Date: Tue, 22 Nov 2022 08:02:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL] gvt-fixes
Content-Language: en-US
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
References: <20221111090208.GQ30028@zhen-hp.sh.intel.com>
 <20221122051111.GU30028@zhen-hp.sh.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221122051111.GU30028@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 22/11/2022 05:11, Zhenyu Wang wrote:
> 
> ping for this fix pull...

I missed it sorry, pulled now. Will go out this week.

Regards,

Tvrtko

> On 2022.11.11 17:02:08 +0800, Zhenyu Wang wrote:
>> Hi,
>>
>> Here's two fixes from Sean for 6.1 kernel, which is to fix kvm
>> reference in gvt. No regression found in our test.
>>
>> Thanks!
>> ---
>> The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:
>>
>>    Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-11-11
>>
>> for you to fetch changes up to 3c9fd44b9330adc5006653566f3d386784b2080e:
>>
>>    drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU (2022-11-11 13:21:52 +0800)
>>
>> ----------------------------------------------------------------
>> gvt-fixes-2022-11-11
>>
>> - kvm reference fix from Sean
>>
>> ----------------------------------------------------------------
>> Sean Christopherson (2):
>>        drm/i915/gvt: Get reference to KVM iff attachment to VM is successful
>>        drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU
>>
>>   drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
> 
> 
