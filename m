Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15E0140CF6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Jan 2020 15:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805BB6F5C2;
	Fri, 17 Jan 2020 14:47:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0267E6F5C0;
 Fri, 17 Jan 2020 14:47:18 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19917666-1500050 for multiple; Fri, 17 Jan 2020 14:47:15 +0000
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87k15qgnf9.fsf@intel.com>
References: <cover.1575302334.git.jani.nikula@intel.com>
 <bdd0c16b8e2a37589a67e43c70a507001e0e5d27.1575302334.git.jani.nikula@intel.com>
 <157530277477.27263.6028188613442603598@skylake-alporthouse-com>
 <87k15qgnf9.fsf@intel.com>
Message-ID: <157927243314.2389.10934965628435405825@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 01/10] drm/i915/gvt: use intel uncore
 functions for forcewake register access
Date: Fri, 17 Jan 2020 14:47:13 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Quoting Jani Nikula (2020-01-17 14:36:26)
> On Mon, 02 Dec 2019, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Jani Nikula (2019-12-02 16:00:49)
> >> Move away from I915_READ_FW() and I915_WRITE_FW() and switch to using
> >> intel_uncore_read_fw() and intel_uncore_write_fw(), respectively.
> >
> > I've a patch to switch gvt over to using gt->uncore, gt->engines etc.
> 
> Have you posted this?

A few months ago,
https://patchwork.freedesktop.org/patch/336201/?series=68117&rev=1
-Chris
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
