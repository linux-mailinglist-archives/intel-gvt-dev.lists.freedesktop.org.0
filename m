Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E586C6BB73D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Mar 2023 16:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E6210E8D5;
	Wed, 15 Mar 2023 15:13:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEBA10E8DE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 15:13:40 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 206-20020a2504d7000000b00b3511d10748so14399740ybe.20
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678893219;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=igb29Lv6teQ/KLxEPbILcI69WT+IeDSiIl02ryINK0U=;
 b=qwx+pwGWTkfuBIFZ8WJJIlE22H6OxlI4L+byyyu7CpI+6kNCjD5QcFUWkE849GJGnk
 w/QbXXS4/3a2Z7I0UKpf3OW6Mp4RexCo5T1LV3ot7X9oXXR/IDb4BIFmAgJ+lTukS4R9
 7I1yrA0w2HyUSHOds9PXcpR3yvpLs4jT+sFJ33OaBrYM0HyJfhySfiih3+jYblrp8joN
 EnbUrasj0tSqJborj2MP4+ejpZ9at2WQvxVZZpIYfe5+J7zUbW7v1bPjdoWmBMycNtHL
 z2zGhnR5fZfIQ7zvf98mHBmrSxUKlVpsbwoj3Yw+jZRk0IL2UOkNjDaBgWmgA9zQJNO1
 wliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678893219;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=igb29Lv6teQ/KLxEPbILcI69WT+IeDSiIl02ryINK0U=;
 b=r4QgEfnvFUSEC3jIp0LJ5J/G02UyKmjcUcC7qKEHwljweAwyuJpISpTcSHyQtNP5Yk
 Ndb6zg7CIFj0oSq0gDr9mecQZgnNrIM3/4qMgsogiV8MqLekYJEFHlCCuVZWmOmcSc/4
 07pdALWKLssHoudChICNaWMykU+a7peJE6DJ9lKg+6VjDkk1Lu44LumC4Y32jmJ3hy1X
 OzvtwHJMt7wK3styMSgHu1GUQ8Cmj3MoanRXpCCI00GpZxtZW4YhslYSgsxpjwmMpEZ6
 7trkUzfkwHizvpqRAA2Pz4tX2nXlD7SyjJUFNDUgMXF/87KwGmAGzw3wbq4clECetZ8r
 SCZA==
X-Gm-Message-State: AO0yUKUUn7fJ836MRye47/hwhvnU2HyGA8BFTKV57ru7NTWDyzLXio1q
 Nou7JSqI6plpa2pgyToB9cOhttR8zTw=
X-Google-Smtp-Source: AK7set92lEDFc7yP4SaEhv7nzCL2HlcwCZvuRQrW8ZqYLEa9wbXKpFtBlkwMtMCw7w58n3f+4HvOUaVGDM8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ca4f:0:b0:541:7237:6e6b with SMTP id
 y15-20020a81ca4f000000b0054172376e6bmr200343ywk.0.1678893219401; Wed, 15 Mar
 2023 08:13:39 -0700 (PDT)
Date: Wed, 15 Mar 2023 08:13:37 -0700
In-Reply-To: <ZBGFXrpSXpF5NUlV@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-20-seanjc@google.com>
 <ZBGFXrpSXpF5NUlV@yzhao56-desk.sh.intel.com>
Message-ID: <ZBHgoS/4R35KByOp@google.com>
Subject: Re: [PATCH v2 19/27] KVM: x86/mmu: Move KVM-only page-track
 declarations to internal header
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023, Yan Zhao wrote:
> On Fri, Mar 10, 2023 at 04:22:50PM -0800, Sean Christopherson wrote:
> > Bury the declaration of the page-track helpers that are intended only for
> > internal KVM use in a "private" header.  In addition to guarding against
> > unwanted usage of the internal-only helpers, dropping their definitions
> > avoids exposing other structures that should be KVM-internal, e.g. for
> > memslots.  This is a baby step toward making kvm_host.h a KVM-internal
> > header in the very distant future.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/kvm_page_track.h | 26 ++++-----------------
> >  arch/x86/kvm/mmu/mmu.c                |  3 ++-
> >  arch/x86/kvm/mmu/page_track.c         |  8 +------
> >  arch/x86/kvm/mmu/page_track.h         | 33 +++++++++++++++++++++++++++
> >  arch/x86/kvm/x86.c                    |  1 +
> >  5 files changed, 42 insertions(+), 29 deletions(-)
> >  create mode 100644 arch/x86/kvm/mmu/page_track.h
> > 
> > diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
> > index e5eb98ca4fce..deece45936a5 100644
> > --- a/arch/x86/include/asm/kvm_page_track.h
> > +++ b/arch/x86/include/asm/kvm_page_track.h
> 
> A curious question:
> are arch/x86/include/asm/kvm_*.h all expected to be external accessible?

Depends on what you mean by "expected".  Currently, yes, everything in there is
globally visible.  But the vast majority of structs, defines, functions, etc. aren't
intended for external non-KVM consumption, things ended up being globally visible
largely through carelessness and/or a lack of a forcing function.

E.g. there is absolutely no reason anything outside of KVM should need
arch/x86/include/asm/kvm-x86-ops.h, but it landed in asm/ because, at the time it
was added, nothing would be harmed by making kvm-x86-ops.h "public" and we didn't
scrutinize the patches well enough.

My primary motivation for this series is to (eventually) get to a state where only
select symbols/defines/etc. are exposed by KVM to the outside world, and everything
else is internal only.  The end goal of tightly restricting KVM's global API is to
allow concurrently loading multiple instances of kvm.ko so that userspace can
upgrade/rollback KVM without needed to move VMs off the host, i.e. by performing
intrahost migration between differenate instances of KVM on the same host.  To do
that safely, anything that is visible outside of KVM needs to be compatible across
different instances of KVM, e.g. if kvm_vcpu is "public" then a KVM upgrade/rollback
wouldn't be able to touch "struct kvm_vcpu" in any way.  We'll definitely want to be
able to modify things like the vCPU structures, thus the push to restrict the API.

But even if we never realize that end goal, IMO drastically reducing KVM's "public"
API surface is worthy goal in and of itself.
