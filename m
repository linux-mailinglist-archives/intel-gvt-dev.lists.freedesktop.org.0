Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D1124221
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2019 09:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020C06E260;
	Wed, 18 Dec 2019 08:45:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB8B6E260
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Dec 2019 08:45:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 00:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; d="scan'208";a="247800440"
Received: from henry-optiplex-7050.bj.intel.com (HELO [10.238.157.49])
 ([10.238.157.49])
 by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2019 00:45:26 -0800
Subject: Re: [RFC PATCH] drm/i915/gvt: split sched_policy for adding more
 policies
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <1576578763-12616-1-git-send-email-hang.yuan@linux.intel.com>
 <20191218024909.GX21662@zhen-hp.sh.intel.com>
 <0aac3d93-edf7-9cef-9c5c-7e45be3fb75d@linux.intel.com>
 <20191218054348.GB21662@zhen-hp.sh.intel.com>
 <a3e0358b-20e7-ee61-37ca-f4cc6a65c4cc@linux.intel.com>
 <20191218083213.GA25522@zhen-hp.sh.intel.com>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <d480258b-fcc8-bedc-adf3-063c1ea19b97@linux.intel.com>
Date: Wed, 18 Dec 2019 16:32:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218083213.GA25522@zhen-hp.sh.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 12/18/19 4:32 PM, Zhenyu Wang wrote:
> On 2019.12.18 15:07:40 +0800, Hang Yuan wrote:
>> On 12/18/19 1:43 PM, Zhenyu Wang wrote:
>>> On 2019.12.18 13:07:34 +0800, Hang Yuan wrote:
>>>> On 12/18/19 10:49 AM, Zhenyu Wang wrote:
>>>>> On 2019.12.17 18:32:43 +0800, hang.yuan@linux.intel.com wrote:
>>>>>> From: Hang Yuan <hang.yuan@linux.intel.com>
>>>>>>
>>>>>> Leave common policy codes in sched_policy.c and move time based
>>>>>> scheduling to new file sched_policy_weight.c. Add module parameter
>>>>>> "gvt_scheduler_policy" to choose one policy.
>>>>>>
>>>>>
>>>>> Before any plan to split scheduler, what's the requirement for new
>>>>> policy? What's the design? Would that be integrated with default
>>>>> weight for different type? Need to understand that first to decide
>>>>> whether or not we have to have seperate schedulers which I'm not favor
>>>>> of if can't be done by default..
>>>>>
>>>> The new policy is not mature yet. Just see one user scenario where there are
>>>> two vgpus, one is in foreground VM and another is in background VM. For some
>>>> reason, the background VM can't be paused but end user is not using it. So
>>>> its vgpu looks like not necessary to have fixed capacity as the scheduling
>>>> policy right now.
>>>
>>> True.
>>>
>>>> Instead, want to try best to serve foreground vgpu and
>>>> just avoid time out for gfx driver in background VM. Here are some rough
>>>> codes based on the previous patch to schedule vgpu on priority and use a
>>>> timer to increase vgpu's priority if it waits too long.
>>>
>>> yeah, current method for balance is still based on fixed weight for
>>> target vGPU type. I think you want fine-grained control of run
>>> timeslice over vGPU's activity? or you want fixed priority? I think
>>> the foreground or background could be switched, right?
>>>
>>> Could we apply vGPU activity statistics in current scheduler? vGPU
>>> type's weight is kind of static default allocation, we still use that
>>> as base indicator for vgpu timeslice, but we'd also dynamically update
>>> real execute timeslice based vgpu history. From that point of view, we
>>> don't need another scheduler.
>>>
>> Yes, VM can be switched between foreground and background. I think
>> fine-grained control may not fit this case because the "weight" is
>> determined by the switch action, not historical data.
>>
> 
> Or we can have a 'nice' value to set for each vGPU from sysfs which could
> be handled in current scheduler for that purpose?
> 
Yes, we can use sysfs to change weight in runtime for this case as well. 
Thanks for the comments.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
