Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B329225A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 08:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1E76E156;
	Mon, 19 Oct 2020 06:11:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D9B6E156
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 19 Oct 2020 06:11:53 +0000 (UTC)
IronPort-SDR: 1e8Thc38PTp/5eSlOSuSwcl0Yfe+YASTWe6Z4X/RWFNtPNZHyB3tvUbU0EXvffDsAXwf3DEui1
 Gx3/Ptnuevkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="163487009"
X-IronPort-AV: E=Sophos;i="5.77,393,1596524400"; d="scan'208";a="163487009"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2020 23:11:45 -0700
IronPort-SDR: QgHeMn5cAo0Pk1An/kjcGsuyf2O3Ry8qV1yqGc+BGjIyGHucox6rLFKnScFSSw0+ND1oZclano
 GXlqzRL7Rzsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,393,1596524400"; d="scan'208";a="320158017"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by orsmga006.jf.intel.com with ESMTP; 18 Oct 2020 23:11:44 -0700
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 19 Oct 2020 07:11:43 +0100
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Mon, 19 Oct 2020 07:11:43 +0100
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>, Intel GVT Dev
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: GVT Scheduler
Thread-Topic: GVT Scheduler
Thread-Index: AQHWlmD7vRQ0WUIfx0qW6wyUpKsGnqmA/C6AgAz24HCAAQvcAIAPj57w
Date: Mon, 19 Oct 2020 06:11:43 +0000
Message-ID: <5a74d2abdd034a61a336944148b9d40c@intel.com>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
 <e2d543701d3442f78aae7bc10b54487d@intel.com>
 <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
In-Reply-To: <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [163.33.253.164]
MIME-Version: 1.0
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Julian:

According to the discussion last time, I reviewed all the code paths of execlist context schedule-in and schedule-out in your code repo. According to our assumption, there might be extra execlist schedule-out status notification. Is it possible that you can open the tracepoint in execlist_context_schedule_in and execlist_context_schedule_out in intel_lrc.c? so that we can check if there are unpair schedule_in and schedule_out events. Also, better move the trace_i915_request_in to __execlists_schedule_in as there is a seqlock like sync try_cmpxchg around.

-----Original Message-----
From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf Of Julian Stecklina
Sent: Friday, October 9, 2020 12:26 PM
To: Wang, Zhi A <zhi.a.wang@intel.com>; Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Subject: Re: GVT Scheduler

Hi Zhi,

your explanation is really helpful. Thank you! See my comments below.

On Thu, 2020-10-08 at 16:41 +0000, Wang, Zhi A wrote:
> Now let's see the timeline:
> 
> - GVT-g submits a workload to i915.
> - i915 append the breadcrumb to the workload
> - i915 submits the workload to HW.
> - GVT-g called i915_wait_request to wait for the GPU execution passed 
> the breadcrumb. (But the context might not be switched out at this 
> time)
> - GVT-g waits for the context to be switched out by the 
> shadow_context_status_change. (Because GVT-g need to copy the content 
> in the shadow context back to the guest context. The shadow context 
> must be idle at this time.)
> - No one is going to touch the shadow context anymore and GVT-g call 
> complete_current_workload.
> 
> The race between shadow_context_status_change and 
> complete_current_workload should be addressed in our design. So this 
> problem might be caused by i915 change, e.g. the timing of call 
> shadow_context_status_change is changed. But we will double confirm in GVT-g as well.

We definitely see shadow_context_status_change being called for a workload that has already passed beyond wait_event(workload->shadow_ctx_status_wq, ...); in complete_current_workload.

> The patch you mentioned is for a corner case in GPU reset. But this 
> shouldn't happen in a normal submission flow unless someone breaks the flow above.

The problem for us is that we can only reproduce this issue in a hardened Linux build after many hours. So it's not exactly the most friendly issue to debug. :)

We are currently using a workaround that serializes the actual completion of the workload against handling schedule out in shadow_context_status_change:
https://github.com/blitz/linux/commit/50a1cfd0695f7c141d16377c087a3642faee9b99

This is not pretty, but so far this has prevented the issue from popping up again.

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
