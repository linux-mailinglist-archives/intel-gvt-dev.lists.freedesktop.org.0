Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8194623864
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Nov 2022 01:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546C410E63B;
	Thu, 10 Nov 2022 00:47:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AC710E640
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 00:47:20 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id b185so328507pfb.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 09 Nov 2022 16:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/WlMTzzYxLCfbTrYSvZzFuANyhJT73VD3EJkrRg4loI=;
 b=H43n3VAOjOThipgQjnkLaVC2NH6hStQzzYEZkFgnAVSgHQZ/XRrMCy8iYICVF1elFF
 ld1pWZemM6Xu/SmOJKZpTFHkr8Y3ZF4npblbamNZAgdx/BxRxv7SX/SSgGQdo90gMVXn
 PpflD4DmpXDrmBjq6XcDllhoEDcre/5PR3IVINf508880Hkigw07fGEeRcHO52W0ZA8W
 p8zwfDuIH1ijSqpG3baI7xlnX/Rg5lHvF6dzoKqCbkj7Cqw6R07pHDmcX3D0+l324tk3
 pbj0p9vQ/IchwEjPKHH0uv1mbP6I+piaa2fvkwvszEtGE6iui1xZfkcLNWgTe6MCeZRt
 oKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WlMTzzYxLCfbTrYSvZzFuANyhJT73VD3EJkrRg4loI=;
 b=1zVXwW1ymGLTmapPUGQinDm6HIiujWO9G3kCBN2iZ2MjS2MGWCpyyHqXSlxBtk4B2n
 4Z8BEpmKe5fjSwmgTq5xiCcM7JBzKFFmOkVWE0gNiF4gDGeUrC/R+9Bc+ZhygQR/eRDL
 7jxJ3jpGR87rip/LPwylUr+esgBqKWagPhSq0kXj1wul/neuxwqkDMKEwC8BMPiR2DmF
 m4BcUIcba0laFWwt2CKs7L4vOAhzJfyQRQzuixwRZeCxvvcaFrFAQvVU9sXKJ/N93IIv
 PFr9kE35N4RlryF5i8boIdd9WeUFk4tGonoCkfEV58dSkD+mpxLtYIs1kapSCWHlGxZ/
 Cgjg==
X-Gm-Message-State: ACrzQf00WUIqQwLOEeLrlX6SxI4B6Lxfe6gZnf86a3bkxFOELLoKz1Dy
 i0NM8Zmr87uSdWCND5nPmEKmuQ==
X-Google-Smtp-Source: AMsMyM4b49fbS+pli3zniqFyqsTd1OixY35h1QeaEfJAF04Ul7am+lTaX/xiugrhDkeaV/6MBze22g==
X-Received: by 2002:a63:ea04:0:b0:43a:b17f:cd12 with SMTP id
 c4-20020a63ea04000000b0043ab17fcd12mr53258802pgi.109.1668041239351; 
 Wed, 09 Nov 2022 16:47:19 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 s10-20020a170902a50a00b0017f8094a52asm9724912plq.29.2022.11.09.16.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 16:47:18 -0800 (PST)
Date: Thu, 10 Nov 2022 00:47:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: Nested AVIC design (was:Re: [RFC PATCH v3 04/19] KVM: x86: mmu:
 allow to enable write tracking externally)
Message-ID: <Y2xKEgQOlQ3mVkUU@google.com>
References: <20220427200314.276673-5-mlevitsk@redhat.com>
 <YoZyWOh4NPA0uN5J@google.com>
 <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
 <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
 <Yt6/9V0S9of7dueW@google.com>
 <7c4cf32dca42ab84bdb427a9e4862dbf5509f961.camel@redhat.com>
 <YugLc5LLPJkt89z6@google.com>
 <fe76ea902a38a10e2d8078fd9e5a71a0c7724d84.camel@redhat.com>
 <YzYeTCsNfQWccKJ9@google.com>
 <a80e2f92b4a93b00ad29f16944f2748eadbdda76.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a80e2f92b4a93b00ad29f16944f2748eadbdda76.camel@redhat.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Sorry for the super slow reply, I don't have a good excuse other than I needed to
take break from AVIC code...

On Mon, Oct 03, 2022, Maxim Levitsky wrote:
> On Thu, 2022-09-29 at 22:38 +0000, Sean Christopherson wrote:
> > On Mon, Aug 08, 2022, Maxim Levitsky wrote:
> > > Hi Sean, Paolo, and everyone else who wants to review my nested AVIC work.
> > 
> > Before we dive deep into design details, I think we should first decide whether
> > or not nested AVIC is worth pursing/supporting.
> > 
> >   - Rome has a ucode/silicon bug with no known workaround and no anticipated fix[*];
> >     AMD's recommended "workaround" is to disable AVIC.
> >   - AVIC is not available in Milan, which may or may not be related to the
> >     aforementioned bug.
> >   - AVIC is making a comeback on Zen4, but Zen4 comes with x2AVIC.
> >   - x2APIC is likely going to become ubiquitous, e.g. Intel is effectively
> >     requiring x2APIC to fudge around xAPIC bugs.
> >   - It's actually quite realistic to effectively force the guest to use x2APIC,
> >     at least if it's a Linux guest.  E.g. turn x2APIC on in BIOS, which is often
> >     (always?) controlled by the host, and Linux will use x2APIC.
> > 
> > In other words, given that AVIC is well on its way to becoming a "legacy" feature,
> > IMO there needs to be a fairly strong use case to justify taking on this much code
> > and complexity.  ~1500 lines of code to support a feature that has historically
> > been buggy _without_ nested support is going to require a non-trivial amount of
> > effort to review, stabilize, and maintain.
> > 
> > [*] 1235 "Guest With AVIC (Advanced Virtual Interrupt Controller) Enabled May Fail
> >     to Process IPI (Inter-Processor Interrupt) Until Guest Is Re-Scheduled" in
> >     https://www.amd.com/system/files/TechDocs/56323-PUB_1.00.pdf
> > 
> 
> I am afraid that you mixed things up:
> 
> You mistake is that x2avic is just a minor addition to AVIC. It is still for
> all practical purposes the same feature.

...

> Physid tables, apic backing pages, doorbell emulation, 
> everything is pretty much unchanged.

Ya, it finally clicked for me that KVM would needs to shadow the physical ID
tables irrespective of x2APIC.

I'm still very hesitant to support full virtualization of nested (x2)AVIC.  The
complexity and amount of code is daunting, and nSVM has lower hanging fruit that
we should pick before going after full nested (x2)AVIC, e.g. SVM's TLB flushing
needs a serious overhaul.  And if we go through the pain for SVM, I think we'd
probably want to come up with a solution that can be at least shared shared with
VMX's IPI virtualization.

As an intermediate step, can we expose (x2)AVIC to L2 without any shadowing?
E.g. run all L2s with a single dummy physical ID table and emulate IPIs in KVM?

If that works, that seems like a logical first step even if we want to eventually
support nested IPI virtualization.
