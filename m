Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A0580272
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 25 Jul 2022 18:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DEEC0C0D;
	Mon, 25 Jul 2022 16:08:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FC6C0C07
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Jul 2022 16:08:27 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id ru18so5030737pjb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Jul 2022 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FjmoqdU5kj6rAICx3+QzM5MmmkfRNlf/iMQ4fGtplDA=;
 b=qPSXGfwvhrycsBQOp8iY52tnh1KgXSyBQB+dY2Cc2tVNhSXPKkg6St7J8kQhqlxsEa
 03/RDkLPFIsTansQAXIAeanSealDnebMm5Rkdeor7AxexibjsXRGN73FxGe+80khHHPT
 v8xnWy3f4sCauZhKga5d0yRHZMfto0sAsNxbMkAfxHPvxIQ0QMx7qXI5Yd72cemfFpCD
 ub1xtP7DT0g4876OlkgQbiBkH+IA9KU4VYPyvaX+x4qSh+CKsdH1qu+6TICYYOcHbB97
 U52lm5UEl9xUZTAXBGfNfpUs+Njp6xwD/4d+nSIA1+bpzWLsFtNt7MCE6xDG67zmiVWT
 cQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FjmoqdU5kj6rAICx3+QzM5MmmkfRNlf/iMQ4fGtplDA=;
 b=6w+DYvWpb6OmC9+jB/qAIVCBhyyvOdt0GmC0nqUL1kkAAO+4cwEOXsNGn18EaGcoik
 lB/NpaVCHBhuIujSKiwQpq4GfWtiOkH2tgGN25eWXs1JfMHhdca1YVfVygFhtpl2N1zk
 q74Oc0azcmvt545SxRE/V+I6jOzvdoRIrmEJPHe+E2bdbdz+roLbkaUldhVLOEUqO+CW
 5KcQHMyUAV9XZ7hgED5kJBzaDXR+Qm+tnrqGF8aBQFAt3STaip3jgioB2IHpg47y4fsI
 uwtRdg+b4PG3LFOV5SWcWleXY5YcDDbkAZjykfUy9BOSSfHYyHZB/cqKoyuClKA0NE9i
 LbQg==
X-Gm-Message-State: AJIora+BXH2OdVNVsR8BTh3DHFWx2QiHtJxxXwgPkB1EI/+RiH+SEYCa
 zVcA0mlNxWmmP82Is3K//6KmFQ==
X-Google-Smtp-Source: AGRyM1unzHQqb8zVBUKEs6rrq19O/McmbA2bTcyfP51716abdNtaluRuKhI7j88I4xjSdpuIYIqcpg==
X-Received: by 2002:a17:90b:4a12:b0:1ef:a8bb:b475 with SMTP id
 kk18-20020a17090b4a1200b001efa8bbb475mr15047889pjb.124.1658765306524; 
 Mon, 25 Jul 2022 09:08:26 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 e7-20020a17090301c700b0016bf2dc1724sm9463154plh.247.2022.07.25.09.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 09:08:25 -0700 (PDT)
Date: Mon, 25 Jul 2022 16:08:21 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write
 tracking externally
Message-ID: <Yt6/9V0S9of7dueW@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com>
 <YoZyWOh4NPA0uN5J@google.com>
 <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
 <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
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

On Wed, Jul 20, 2022, Maxim Levitsky wrote:
> On Sun, 2022-05-22 at 13:22 +0300, Maxim Levitsky wrote:
> > On Thu, 2022-05-19 at 16:37 +0000, Sean Christopherson wrote:
> > > On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > > > @@ -5753,6 +5752,10 @@ int kvm_mmu_init_vm(struct kvm *kvm)
> Now for nested AVIC, this is what I would like to do:
>  
> - just like mmu, I prefer to register the write tracking notifier, when the
>   VM is created.
>
> - just like mmu, write tracking should only be enabled when nested AVIC is
>   actually used first time, so that write tracking is not always enabled when
>   you just boot a VM with nested avic supported, since the VM might not use
>   nested at all.
>  
> Thus I either need to use the __kvm_page_track_register_notifier too for AVIC
> (and thus need to export it) or I need to have a boolean
> (nested_avic_was_used_once) and register the write tracking notifier only
> when false and do it not on VM creation but on first attempt to use nested
> AVIC.
>  
> Do you think this is worth it? I mean there is some value of registering the
> notifier only when needed (this way it is not called for nothing) but it does
> complicate things a bit.

Compared to everything else that you're doing in the nested AVIC code, refcounting
the shared kvm_page_track_notifier_node object is a trivial amount of complexity.

And on that topic, do you have performance numbers to justify using a single
shared node?  E.g. if every table instance has its own notifier, then no additional
refcounting is needed.  It's not obvious that a shared node will provide better
performance, e.g. if there are only a handful of AVIC tables being shadowed, then
a linear walk of all nodes is likely fast enough, and doesn't bring the risk of
a write potentially being stalled due to having to acquire a VM-scoped mutex.

> I can also stash this boolean (like 'bool registered;') into the 'struct
> kvm_page_track_notifier_node',  and thus allow the
> kvm_page_track_register_notifier to be called more that once -  then I can
> also get rid of __kvm_page_track_register_notifier. 

No, allowing redundant registration without proper refcounting leads to pain,
e.g. X registers, Y registers, X unregisters, kaboom.
