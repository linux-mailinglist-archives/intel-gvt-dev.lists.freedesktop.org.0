Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE8531538
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 May 2022 19:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488B510F5A5;
	Mon, 23 May 2022 17:22:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C7F10F5A5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 May 2022 17:22:21 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 f2-20020a4a8f42000000b0035e74942d42so2840344ool.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 May 2022 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jyra7hAVNbxUBiQeSeny3J1iXMJn4cpxNxDSkBqSwwc=;
 b=VHi49t2yJ8XZt3l4544whGRcgSG9/chQbJzw/Wb+5ioQ+fsmX3cRpBx6OQxRGk/Ap+
 wPsNDHmdeGfiSYG4yhVoaP8kdesRh7Z3VHHegl8q1JSEQj0W1/AxEFXVJe2KlCYoWN13
 25ePZeus2t/0M9W2csYI07b8jnWviHlnRWgHzXP6/J5XohAxHvEmdaxSNcoc7lfQnDsr
 8T4k7IU1HI2NNx9aZZvGD+J0Egdg5hSd6Pb1Fq4vl+wFkF6Jrauch0gNhrXAGtT7m/+u
 B9nF1ndDN2ey4SNsqLm4DJPsUNy/pqBr0mrYuds8wBJOa6h5x0I5D1XD3LaQVxke7Z+C
 zY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jyra7hAVNbxUBiQeSeny3J1iXMJn4cpxNxDSkBqSwwc=;
 b=4G9hvj7TwrVTugB6NyzeahZjoS9D/zEp2wMvv+g+Eu1ijDx2MB/9LUPvll4VnT0WP+
 q0KBe5bUxnjP0qFxiEQbMTG8A/xmVyVHpx6H62eQscX8uZ+/P+PP0o+O2BSnHWB7sHuA
 UV3wARCUmUjGIuXdYIIW47jUyxFi/JntT1NhT8DGpglQ+AYoWu9ctMYxifx1jWlWFTTh
 GcUXuG52hF5E8ugyCo4GnCIKxltbxv14F8UgfmF0qmsKZU95ZNaZ6PFQyawMhlFon7Y1
 KsyQPNyAicu+a/5Tw6EgM5/WfGLCa1u7KV3gynoeqM6XA1yPzqh+BXvJb4QLUswpZE5b
 cE0w==
X-Gm-Message-State: AOAM531O2IXcrtvcX41cN8Z7H26mUYg2ark/TQK3A5vYxCVhPaWZa8Lo
 K+s50DRdrn8gjzW9Dp/4zwgtdZd177PmQ9UvN2HRVw==
X-Google-Smtp-Source: ABdhPJzHh/9qmSDYM9XAg5E0fgrqqHi95efq7cL0KZAg+w4CMPYF3qt7r4C+naxClkSjib2q5Q/h0H1EBI7lu9EI0tU=
X-Received: by 2002:a4a:c90a:0:b0:40e:95bf:268d with SMTP id
 v10-20020a4ac90a000000b0040e95bf268dmr1156358ooq.85.1653326540061; Mon, 23
 May 2022 10:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <YoZrG3n5fgMp4LQl@google.com>
 <e32f6c904c92e9e9efabcc697917a232f5e88881.camel@redhat.com>
 <CALMp9eSVji2CPW1AjFoSbWZ_b-r3y67HyatgdqXEqSyUaD1_BQ@mail.gmail.com>
 <65991ac329a32cf4128400b643d5b5ccf3918cfe.camel@redhat.com>
In-Reply-To: <65991ac329a32cf4128400b643d5b5ccf3918cfe.camel@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 23 May 2022 10:22:09 -0700
Message-ID: <CALMp9eTS4MZPh4fwTPkNxnWgjT-xiqpxhMyVfdP8TZD0x81CMg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
To: Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
 intel-gvt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sun, May 22, 2022 at 11:50 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> On Sun, 2022-05-22 at 07:47 -0700, Jim Mattson wrote:
> > On Sun, May 22, 2022 at 2:03 AM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > > On Thu, 2022-05-19 at 16:06 +0000, Sean Christopherson wrote:
> > > > On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > > > > Neither of these settings should be changed by the guest and it is
> > > > > a burden to support it in the acceleration code, so just inhibit
> > > > > it instead.
> > > > >
> > > > > Also add a boolean 'apic_id_changed' to indicate if apic id ever changed.
> > > > >
> > > > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > > ---
> > > > > +           return;
> > > > > +
> > > > > +   pr_warn_once("APIC ID change is unsupported by KVM");
> > > >
> > > > It's supported (modulo x2APIC shenanigans), otherwise KVM wouldn't need to disable
> > > > APICv.
> > >
> > > Here, as I said, it would be nice to see that warning if someone complains.
> > > Fact is that AVIC code was totally broken in this regard, and there are probably more,
> > > so it would be nice to see if anybody complains.
> > >
> > > If you insist, I'll remove this warning.
> >
> > This may be fine for a hobbyist, but it's a terrible API in an
> > enterprise environment. To be honest, I have no way of propagating
> > this warning from /var/log/messages on a particular host to a
> > potentially impacted customer. Worse, if they're not the first
> > impacted customer since the last host reboot, there's no warning to
> > propagate. I suppose I could just tell every later customer, "Your VM
> > was scheduled to run on a host that previously reported, 'APIC ID
> > change is unsupported by KVM.' If you notice any unusual behavior,
> > that might be the reason for it," but that isn't going to inspire
> > confidence. I could schedule a drain and reboot of the host, but that
> > defeats the whole point of the "_once" suffix.
>
> Mostly agree, and I read alrady few discussions about exactly this,
> those warnings are mostly useless, but they are used in the
> cases where we don't have the courage to just exit with KVM_EXIT_INTERNAL_ERROR.
>
> I do not thing though that the warning is completely useless,
> as we often have the kernel log of the target machine when things go wrong,
> so *we* can notice it.
> In other words a kernel warning is mostly useless but better that nothing.

I don't know how this works for you, but *we* are rarely involved when
things go wrong. :-(

> About KVM_EXIT_WARNING, this is IMHO a very good idea, probably combined
> with some form of taint flag, which could be read by qemu and then shown
> over hmp/qmp interfaces.
>
> Best regards,
>         Maxim levitsky
>
>
> >
> > I know that there's a long history of doing this in KVM, but I'd like
> > to ask that we:
> > a) stop piling on
> > b) start fixing the existing uses
> >
> > If KVM cannot emulate a perfectly valid operation, an exit to
> > userspace with KVM_EXIT_INTERNAL_ERROR is warranted. Perhaps for
> > operations that we suspect KVM might get wrong, we should have a new
> > userspace exit: KVM_EXIT_WARNING?
> >
> > I'm not saying that you should remove the warning. I'm just asking
> > that it be augmented with a direct signal to userspace that KVM may no
> > longer be reliable.
> >
>
>
