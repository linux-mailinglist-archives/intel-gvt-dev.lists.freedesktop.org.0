Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79522885F2
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Oct 2020 11:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2FB6EC20;
	Fri,  9 Oct 2020 09:26:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CAF6EC20
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Oct 2020 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=k4po4DbxhvXwLyNj42JoIjFMV+zmQxTgbWFkvCBPxRw=; b=FnbGV3l6mmoE6dVzgR0O+LDs0E
 TzJq+Oo3cWevbQhR8Tvg6h9v+J+ipHoPzujwpb2q+35BGfoVo3iSil+vi/+3RicCBQBf1oFTuMm8c
 tkTmjxKv0orYQFSbd+qtR7C/EPXPmsnJwZSEAlnIXR2ZF/5BhgyQTr84YA62bBTqzhep7J6gPmvYn
 zn6Yj7xjLHMoV1I831FmRhNpF2/W9bvE5vhPvcnIzaqS68OpNtxoM5Z7EbmI0zRE6ToIAWvlt+JIC
 wkgmxNNqXUJTlLg+YKoLmQ9ImihYvBDNq2J+7IU1fKXqe2Fa8QRR8tVfqf1quZYjr8SBK0XfyQ8gC
 hf2yrFJA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kQofB-0006VP-A0; Fri, 09 Oct 2020 11:26:09 +0200
Received: from [81.201.150.231] (helo=localhost.localdomain)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kQofB-000NXz-4K; Fri, 09 Oct 2020 11:26:09 +0200
Message-ID: <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
Subject: Re: GVT Scheduler
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Intel GVT Dev
 <intel-gvt-dev@lists.freedesktop.org>
Date: Fri, 09 Oct 2020 11:26:08 +0200
In-Reply-To: <e2d543701d3442f78aae7bc10b54487d@intel.com>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
 <e2d543701d3442f78aae7bc10b54487d@intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25951/Thu Oct  8 15:53:03 2020)
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

Hi Zhi,

your explanation is really helpful. Thank you! See my comments below.

On Thu, 2020-10-08 at 16:41 +0000, Wang, Zhi A wrote:
> Now let's see the timeline:
> 
> - GVT-g submits a workload to i915.
> - i915 append the breadcrumb to the workload
> - i915 submits the workload to HW.
> - GVT-g called i915_wait_request to wait for the GPU execution passed the
> breadcrumb. (But the context might not be switched out at this time)
> - GVT-g waits for the context to be switched out by the
> shadow_context_status_change. (Because GVT-g need to copy the content in the
> shadow context back to the guest context. The shadow context must be idle at
> this time.)
> - No one is going to touch the shadow context anymore and GVT-g call
> complete_current_workload. 
> 
> The race between shadow_context_status_change and complete_current_workload
> should be addressed in our design. So this problem might be caused by i915
> change, e.g. the timing of call shadow_context_status_change is changed. But
> we will double confirm in GVT-g as well.

We definitely see shadow_context_status_change being called for a workload that
has already passed beyond wait_event(workload->shadow_ctx_status_wq, ...); in
complete_current_workload.

> The patch you mentioned is for a corner case in GPU reset. But this shouldn't
> happen in a normal submission flow unless someone breaks the flow above.

The problem for us is that we can only reproduce this issue in a hardened Linux
build after many hours. So it's not exactly the most friendly issue to debug. :)

We are currently using a workaround that serializes the actual completion of the
workload against handling schedule out in shadow_context_status_change:
https://github.com/blitz/linux/commit/50a1cfd0695f7c141d16377c087a3642faee9b99

This is not pretty, but so far this has prevented the issue from popping up
again.

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
