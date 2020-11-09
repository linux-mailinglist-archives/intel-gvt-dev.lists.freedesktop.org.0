Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD62ABF21
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Nov 2020 15:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9888992E;
	Mon,  9 Nov 2020 14:47:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AD48992E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  9 Nov 2020 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ZBulGXcwRBmompxrc5nBfHNh8Ldfq7SHGCUOjjJCcCw=; b=MHL4pMmbGS7h9WfS/HbCGTpcuk
 QjyrcEHgH0wKd/mgkYXaiJrPf1140thc0ezP2AjR6s5OlsdJHllmQqIULcn0qSSXOi/kL8K/s8RUN
 quLWQFIG0R3hZ7MokhnkjcG1MBaYziYKiNOwxgjMib2uMadejaILMYeu/PItXrRqoFFXAcYk3oerP
 gEjOQC6qsJfWcfZofls5+qQt/QU1FSk5h0cs8fTIY2jw2Terl63pdz6DWIvTq7w9N28VcCAAjMutP
 wyYrElN7hrunlDMdq4RQK7SDJ8sb9Tap9X6hhjSw7xfUhaQdXfqfOpk82Wtqh3wDzAWwm2PaTzMKc
 rNsXOBWw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kc8Rn-0007DU-HA; Mon, 09 Nov 2020 15:47:07 +0100
Received: from [2001:16b8:5047:300:fca5:115a:e711:24f4] (helo=linux.fritz.box)
 by sslproxy03.your-server.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kc8Rn-000Vkf-88; Mon, 09 Nov 2020 15:47:07 +0100
Message-ID: <06ccf18ee1ea548a0d8fbe33d3f2890c885a8ea7.camel@cyberus-technology.de>
Subject: Re: GVT Scheduler
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Mon, 09 Nov 2020 15:47:04 +0100
In-Reply-To: <20201103033336.GA27141@zhen-hp.sh.intel.com>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
 <e2d543701d3442f78aae7bc10b54487d@intel.com>
 <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
 <5a74d2abdd034a61a336944148b9d40c@intel.com>
 <9286d367b5f95b4b819f5f41b7654e5a79e40328.camel@cyberus-technology.de>
 <1de9f44bf6c7766a2afc089395984192995be2ec.camel@cyberus-technology.de>
 <20201103033336.GA27141@zhen-hp.sh.intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25983/Mon Nov  9 14:20:27 2020)
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Stefan Hertrampf <stefan.hertrampf@cyberus-technology.de>,
 Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 2020-11-03 at 11:33 +0800, Zhenyu Wang wrote:
> Hmm, looks one i915 change removed check of actual request preempted for
> status...
> I'm not sure if that's relevant, but maybe you could try like:
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c
> b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index d0be98b67138..f1a16d4b6e6a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1439,7 +1439,9 @@ __execlists_schedule_out(struct i915_request *rq,
>  
>         intel_context_update_runtime(ce);
>         intel_engine_context_out(engine);
> -       execlists_context_status_change(rq, INTEL_CONTEXT_SCHEDULE_OUT);
> +       execlists_context_status_change(rq, i915_request_completed(rq) ?
> +                                       INTEL_CONTEXT_SCHEDULE_OUT:
> +                                       INTEL_CONTEXT_SCHEDULE_PREEMPTED);
>         if (engine->fw_domain && !atomic_dec_return(&engine->fw_active))
>                 intel_uncore_forcewake_put(engine->uncore, engine->fw_domain);
>         intel_gt_pm_put_async(engine->gt);

That looks interesting. The check was removed in this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=22b7a426bbe1ebe1520f92da4cd1617d1e1b5fc4
From 22b7a426bbe1ebe1520f92da4cd1617d1e1b5fc4 Mon Sep 17 00:00:00 2001
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Jun 2019 15:20:51 +0100 
Subject: drm/i915/execlists: Preempt-to-busy

With all the synchronization that was changed there, I'm not sure whether the
check is still needed, but we are currently testing whether the change you
propose improves the situation and allows us to remove our workaround. I'm crossing my fingers.

Btw, we are currently using this workaround on 5.4, which results in a stable
system for us:
https://github.com/blitz/linux/commit/7b5850067f535763624ccb2a41db631ddae5291f

Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
