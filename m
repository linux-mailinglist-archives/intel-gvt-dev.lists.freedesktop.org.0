Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9B4B0BA6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Feb 2022 12:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1FB10E7F2;
	Thu, 10 Feb 2022 11:01:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3DE10E7EE;
 Thu, 10 Feb 2022 11:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644490889; x=1676026889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nl0LtoOGGAs+Flmr7TqeTAvqS6rDGDMsUx4Fr/FurO0=;
 b=TK2Ny9nxut8NjSeVGylhLFlaDOpg0w2dRBlidkUZ8oAofr4UxBUV3NAv
 bNZrdoVu/Q7ay7hBL3OSxt4CU3W23SFHA/wQDh0GJ279p3n25wd3utBrq
 cV33JjN3yhX3TdarNbY4b2HG8jHdkYGxGHAIkZKD9F6C/GXoWju1uzRK6
 /Ua69EMe8NQBFwD+rA91Q1ccW/b67vrGzGSr1k3pU8gb431kgxEoVodsU
 7051LRkvK4EY4mWKLurPuE7WoIEpfs3SZFOfuQsZBKJR7YyLdPVD0sz+P
 fkMRBi1AfEyNFpz0AAuiFaCyuswQRPTQuZZSnwg1LLi3hODMrlUhn4h8E w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="247048542"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="247048542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 03:01:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="485642767"
Received: from scurtin-mobl1.ger.corp.intel.com (HELO [10.213.201.86])
 ([10.213.201.86])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 03:01:27 -0800
Message-ID: <251ca664-c88f-4a6b-4ae8-d05f7816e034@linux.intel.com>
Date: Thu, 10 Feb 2022 11:01:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [GVT PULL] gvt-fixes for drm-intel-fixes
Content-Language: en-US
To: "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
References: <1f619581-e3da-3899-09ac-f714d954a580@gmail.com>
 <DM4PR11MB5549FFC6FF4AA53549199770CA2E9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <87mtiz85pa.fsf@intel.com> <2aab060f-a7a5-04c1-03c4-2c401f4088d1@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <2aab060f-a7a5-04c1-03c4-2c401f4088d1@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 10/02/2022 10:14, Wang, Zhi A wrote:
> Feel free to let me know if I need to re-base on the newest tag since it has been quite some time.

Sorry I did not see this. I will pull it next Monday. If you can extra 
remind me it would be appreciated.

Current base for fixes is 5.17-rc3 but given how little you have in 
there I don't think there should be a problem with your base.

Regards,

Tvrtko

> On 2/10/22 8:51 AM, Jani Nikula wrote:
>>
>> +Tvrtko
>>
>> On Wed, 09 Feb 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>>> Hi folks:
>>>
>>> Ping. This pull seems not got merged.
>>>
>>> Thanks,
>>> Zhi.
>>>
>>> -----Original Message-----
>>> From: Zhi Wang <zhi.wang.linux@gmail.com>
>>> Sent: Saturday, January 15, 2022 12:46 PM
>>> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com
>>> Cc: intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Wang, Zhi A <zhi.a.wang@intel.com>
>>> Subject: [GVT PULL] gvt-fixes for drm-intel-fixes
>>>
>>> Hi folks:
>>>
>>> Here is the gvt-fixes pull for drm-intel-fixes. It contains:
>>>
>>> - Make DRM_I915_GVT depend on X86 (Siva Mullati)
>>> - Clean kernel doc in gtt.c (Randy Dunlap)
>>>
>>> This pull has been tested by: dim apply-pull drm-intel-fixes < this_email.eml
>>>
>>> Zhi.
>>>
>>> The following changes since commit d46f329a3f6048e04736e86cb13c880645048792:
>>>
>>>    drm/i915: Increment composite fence seqno (2021-12-27 11:33:40 +0200)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-01-13
>>>
>>> for you to fetch changes up to d72d69abfdb6e0375981cfdda8eb45143f12c77d:
>>>
>>>    drm/i915/gvt: Make DRM_I915_GVT depend on X86 (2022-01-13 18:13:12 +0000)
>>>
>>> ----------------------------------------------------------------
>>> gvt-fixes-2022-01-13
>>>
>>> - Make DRM_I915_GVT depend on X86 (Siva Mullati)
>>> - Clean kernel doc in gtt.c (Randy Dunlap)
>>>
>>> ----------------------------------------------------------------
>>> Randy Dunlap (1):
>>>        drm/i915/gvt: clean up kernel-doc in gtt.c
>>>
>>> Siva Mullati (1):
>>>        drm/i915/gvt: Make DRM_I915_GVT depend on X86
>>>
>>>   drivers/gpu/drm/i915/Kconfig   | 1 +
>>>   drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
> 
