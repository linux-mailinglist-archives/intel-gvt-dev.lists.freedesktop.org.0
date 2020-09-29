Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296A27CE5A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Sep 2020 15:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031E36E1BA;
	Tue, 29 Sep 2020 13:03:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7286C6E1BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Sep 2020 13:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
 bh=H/F5r71TZVxOMpsrkF6/NOIh7VNP29PfCDfyn0hc/JQ=; b=eIxFx39wSTp1bhw6/f4ezWv7eG
 NBozd3sc9CYPGgr2u7iT/ksC/Z5sIhtbifDfLX1RSl4QAp8BqmQ1iiGSQFblk9VNNheviPKx6VauD
 E6gSFRcjGiSnzHXq4q6M2Mn+nWtQPrmNXD1dowIO/RZsHvkN381f2vmaeO1s6d3BrRoR6MCAtWUjL
 nea4QmV67n2SjYZPvqstrVsL01RfFf5bMSPTfQKFN2d5Kum7NS3bVDdPankFqqgLJQWPG75p22+3r
 kedPamdYo0oEe0TFD6hG7FOH/RiwdBBVdSYKZZf3asxsZB9aSL3Zt8AnemXJ4AY3/iHbqSFQM5nc/
 Lp02Ak+g==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kNFI4-0006vu-7q; Tue, 29 Sep 2020 15:03:32 +0200
Received: from [81.201.150.231] (helo=localhost.localdomain)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kNFI4-000ML6-3E; Tue, 29 Sep 2020 15:03:32 +0200
Message-ID: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
Subject: GVT Scheduler
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Date: Tue, 29 Sep 2020 15:03:31 +0200
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25941/Mon Sep 28 15:55:11 2020)
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

Hello everyone!

I'm currently trying to understand the GVT scheduler (gvt/scheduler.c) better.
I'm specifically trying to understand how the shadow_context_status_change()
callback is synchronized with other code that modifies the current_workload
array. I would be very grateful, if someone has a couple of minutes to shed some
light here. :)

Can shadow_context_status_change[1] run concurrently with other code that
modifies scheduler->current_workload[ring_id]? I see other functions holding
gvt->sched_lock, but the callback does not.

If sched_lock is not required in the callback, what currently prevents
concurrent exection, e.g. with workload_thread()?

Thanks!
Julian

[1] 
https://elixir.bootlin.com/linux/v5.9-rc7/source/drivers/gpu/drm/i915/gvt/scheduler.c#L268


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
