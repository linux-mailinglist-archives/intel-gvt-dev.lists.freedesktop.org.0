Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AB829259D
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 12:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728576E90C;
	Mon, 19 Oct 2020 10:20:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D856E90B;
 Mon, 19 Oct 2020 10:20:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22755157-1500050 for multiple; Mon, 19 Oct 2020 11:20:41 +0100
MIME-Version: 1.0
In-Reply-To: <20201019095143.GT27141@zhen-hp.sh.intel.com>
References: <alpine.DEB.2.21.2010161716270.29164@manul.sfritsch.de>
 <20201019091909.GQ27141@zhen-hp.sh.intel.com>
 <160310145891.29774.10656325770923178249@build.alporthouse.com>
 <20201019095143.GT27141@zhen-hp.sh.intel.com>
Subject: Re: [Intel-gfx] drm/i915: Detecting Vt-d when running as guest os
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Mon, 19 Oct 2020 11:20:40 +0100
Message-ID: <160310284057.29774.9416801333378735419@build.alporthouse.com>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org, Stefan Fritsch <sf@sfritsch.de>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Quoting Zhenyu Wang (2020-10-19 10:51:44)
> On 2020.10.19 10:57:38 +0100, Chris Wilson wrote:
> > Quoting Zhenyu Wang (2020-10-19 10:19:09)
> > > On 2020.10.16 17:19:19 +0200, Stefan Fritsch wrote:
> > > > Hi,
> > > > 
> > > > if Linux is running as a guest and the host is doing igd-pass-thorugh with 
> > > > VT-d enabled, the i915 driver does not work all that great. The most 
> > > > obvious problem is that there are dozens of 'Fault errors on pipe A' 
> > > > errrors logged per second, but depending on the hardware there can be 
> > > > other issues, too. I will send a patch to rate-limit that message in a 
> > > > separate mail.
> > > > 
> > > > The i915 has various quirks for VT-d and these should be enabled even if 
> > > > Linux is running as a guest and does itself have iommu enabled. I have 
> > > > checked that making intel_vtd_active() form i915_drv.h return true makes 
> > > > the error messages go away.  How could Linux detect this situation? Maybe 
> > > > simply check the Hypervisor cpuid bit? Or would you prefer a module 
> > > > parameter, or a combination of both? Or is there another way to detect 
> > > > that VT-d is enabled for the igd device?
> > > > 
> > > 
> > > I think that's right, although I haven't tried to force intel_vtd_active()
> > > for guest, but I did see those fault errors on some machine. You can use
> > > hypervisor cpuid bit, and need to seperate case for GVT which is detected by
> > > intel_vgpu_active(), but I'm not sure if this should be taken in nested case,
> > > suppose those quirks should still work?
> > 
> > Do we need it for gvt since the guest has no access to HW, so the host
> > should be doing all the vt'd w/a. (In particular, the scanout overfetch
> > causing the problems here.) E.g. in gvt, the guest framebuffer is
> > transported via magics to the host, and the host creates a GGTT entry
> > for it.
> 
> GVT doesn't require vt-d at all. Current gvt display is fully virtualized,
> so if by any way that map guest framebuffer directly on host display, it
> should still be handled by i915 with possible vt-d workaround for alignment.
> And looks some other vt-d w/a just brings unnecessary actions for gvt guest.
> So I think we should stick with real vt-d case.

It's not too bad; we should only be applying the vtd workaround on
interacting with the HW. So for gvt running under a kvm hypervisor,
setting intel_vtd_active() should not impact us at all...
-Chris
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
