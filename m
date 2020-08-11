Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E9241831
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 10:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A6D89E5B;
	Tue, 11 Aug 2020 08:26:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD21C89E5B;
 Tue, 11 Aug 2020 08:26:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22092435-1500050 for multiple; Tue, 11 Aug 2020 09:26:13 +0100
MIME-Version: 1.0
In-Reply-To: <20200811030209.21058-1-yan.y.zhao@intel.com>
References: <20200811030209.21058-1-yan.y.zhao@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt:fix raw-wakeref not held
 calltrace in vGPU
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Yan Zhao <yan.y.zhao@intel.com>, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com
Date: Tue, 11 Aug 2020 09:26:11 +0100
Message-ID: <159713437103.2955.4439985576665396417@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gvt-dev@lists.freedesktop.org, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Quoting Yan Zhao (2020-08-11 04:02:09)
> UNCORE_HAS_FORCEWAKE is not turned on when intel_vgpu_active() returns
> true, so the guest mmio writes go to gen2_write32().

The vgpu writes are just memory traps, the device wakeref should not be
required. It seems like we've accidentally added the assert to the wrong
io accessors.
-Chris
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
