Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19A53154A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 May 2022 19:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFAD10FC32;
	Mon, 23 May 2022 17:31:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589610FC3C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 May 2022 17:31:09 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id c22so14280524pgu.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 May 2022 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oCNJML7eA2j9L8f72NkyeKZiPIyN20wsxD5r9Tzx9cA=;
 b=VQuspDaagiDbr8zDGAJevmwHk6IYCwXe0OQNbOee7Tu2IHo33cYxokGiFfbrhTIFD6
 62hu7cw8t4yvx3aEBc40atCX/ZCXQYPABJD3A7WMv5dpWaPn1sujmMA8KBgCJG/jH4eb
 Smd147syr5WmIcn7pwELo2ONgSQiNPsmRFuoyQ1Iuk1z/gxUK17CLFKinM4+1W81nEFo
 hEWLTqC7ODI5yO9MfnJOT+geXR0KYCSJNoxov70DOAkLXuLYrQlTnAq0q3/2sT9qy69d
 B46Q3eeaiIlELv+ptqM+emBDuE/X1ivWqBecmrCvvRl7jwiPmbCsJ3mCYHkXRYTX9XnL
 9ZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oCNJML7eA2j9L8f72NkyeKZiPIyN20wsxD5r9Tzx9cA=;
 b=08K/jTFWJG8hnLAAlSyve4JK2O46kj2e8Oi5/tHeeO+nn+55uqvnvlqYxNA47NN4d6
 03e5ucjlOGVaIbabOjA0eoveA91ADnww5xNdGkdM75fdmHVwD2OvoW/cL5VpbTLxDR04
 nxWS5/ba98NsQydV0bCUJkA5isG5MpABAV8xt4tIofaQw5+ck5oPoQXzXslTA32TL/wS
 K6Z9wg/ML2VhT5mM3EhvbVLhuxIchKOnMWG64lu6+DMqZFeym3GuQBGDtBMVBi2Ruq/v
 2fI5mkYVv4+S22/BHkl1acmLbKOVRnrtYpq1Q+UERCtGpDOZDepWOq0dSVHnrZ8iyaBp
 ZvFA==
X-Gm-Message-State: AOAM533uYKbCZBUsYqEJPzRlZV16Z9MWB5fyWpHiU8Ly4coTXhA+3tXJ
 a7BL+QrEqsUU/A82cfz6DfBjlg==
X-Google-Smtp-Source: ABdhPJyVqMoEcjNxptyUgqa9Zdq5WQzejBZ0z6wMNkkE4awFtw8fhM9i8OBMVMolSAtdF+aG4aq6XQ==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id
 l10-20020a056a00140a00b004e054d50d01mr24742544pfu.20.1653327068687; 
 Mon, 23 May 2022 10:31:08 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 ru13-20020a17090b2bcd00b001df4a0e9357sm7512221pjb.12.2022.05.23.10.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 10:31:08 -0700 (PDT)
Date: Mon, 23 May 2022 17:31:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
Message-ID: <YovE2A67XobRyHc/@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <YoZrG3n5fgMp4LQl@google.com>
 <e32f6c904c92e9e9efabcc697917a232f5e88881.camel@redhat.com>
 <CALMp9eSVji2CPW1AjFoSbWZ_b-r3y67HyatgdqXEqSyUaD1_BQ@mail.gmail.com>
 <65991ac329a32cf4128400b643d5b5ccf3918cfe.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65991ac329a32cf4128400b643d5b5ccf3918cfe.camel@redhat.com>
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

On Mon, May 23, 2022, Maxim Levitsky wrote:
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

IMO, it's worse than doing nothing.  Us developers become desensitized to the
kernel message due to running tests, the existence of these message propagates
the notion that they are a good thing (and we keep rehashing these discussions...),
users may not realize it's a _once() printk and so think they _aren't_ affected
when re-running a workload, etc...

And in this case, "APIC ID change is unsupported by KVM" is partly wrong.  KVM
fully models Intel's behavior where the ID change isn't carried across x2APIC
enabling, the only unsupported behavior is that the guest will lose APICv
acceleration.

> About KVM_EXIT_WARNING, this is IMHO a very good idea, probably combined
> with some form of taint flag, which could be read by qemu and then shown
> over hmp/qmp interfaces.
