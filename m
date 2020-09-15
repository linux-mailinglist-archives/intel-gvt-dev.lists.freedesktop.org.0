Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49026269C0E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Sep 2020 04:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8186E834;
	Tue, 15 Sep 2020 02:46:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8DE6E834
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Sep 2020 02:46:11 +0000 (UTC)
IronPort-SDR: CJWLvOGjlFO0Emvb9lUp/H/Ib2qUuJWmikOW9dSuaoTeF3H/t+TwMd/3u3W5CjUSL8UUQCjyP9
 vPHSQB3XWa6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146879795"
X-IronPort-AV: E=Sophos;i="5.76,428,1592895600"; d="scan'208";a="146879795"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 19:46:11 -0700
IronPort-SDR: otsIQRC1l/vGfqhPA2DQDE4GYcur1Ysbv3Pg75VQh8LrveZ86JiS3n/2gGPZm+yO1TncC/gRoM
 M6dDwb8G52Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,428,1592895600"; d="scan'208";a="506578307"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2020 19:46:10 -0700
Subject: Re: [PATCH v2 0/3] Fix ppgtt_mm destroy and pv_notified reset logic
 during vGPU D3->D0
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200709071002.247960-1-colin.xu@intel.com>
 <20200713075521.GJ27035@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <6f21475a-1bc5-6e9f-526a-643d1bdfd04e@intel.com>
Date: Tue, 15 Sep 2020 10:46:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200713075521.GJ27035@zhen-hp.sh.intel.com>
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


On 2020-07-13 15:55, Zhenyu Wang wrote:
> On 2020.07.09 15:09:55 +0800, Colin Xu wrote:
>> The patch set fix issues when vGPU transit D3->D0:
>> Do not invalidate & destroy ppgtt_mm in dmlr when D3->D0.
>> Do not reset pv_notified in dmlr when D3->D0.
>>
>> v2:
>> - Revise commit message to more accurate description. (Kevin)
>> - Split patch by logic. (Zhenyu)
>>
>> Colin Xu (3):
>>    drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
>>    drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0
Theses two are already merged.
>>    drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.
Seems this clean up patch doesn't get merged yet.
>>
>>   drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
>>   drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
>>   drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>>   drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
>>   5 files changed, 47 insertions(+), 23 deletions(-)
>>
> Looks fine to me.
>
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>
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
