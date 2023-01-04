Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3F65CB19
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Jan 2023 01:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D97110E41E;
	Wed,  4 Jan 2023 00:50:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6779E10E2A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Jan 2023 00:50:38 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so32801600pjj.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 03 Jan 2023 16:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qiXxV2Hfa6NF/4ylZM+g7WvF4+7PZbuEwjwOszBrON4=;
 b=X1gfDcjSYLcBbE0MBBhwhK7htLKCvb7xiAhW84JJ8aR2Pj4C/Pqyu1xYLrpco24N6I
 C9J4IiYkw3j/UaqXUUFDvfYuxTV/W1PEByDZO0nLhXVDhQBEEYbkWvAc/QrdgV/sWe9p
 yd8EukT4278a/13eUsqTspQqTK+PO/lrb3dgkeuFP/Ggm6iHdv5OIvhBRaqiDmz+DT6m
 G5aOcyJFapCbF7bqQlrlr6MLuKYN3wDADKSYL+m4fAeRxOZiGuwWYXVA3rpzpNcqEhgh
 G851VezyQ+DuRZMMfEVjF8ForgLRPohL1fV6h73KcisSwFQS0nRBEESKvhxtVc2Sx9vL
 9xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiXxV2Hfa6NF/4ylZM+g7WvF4+7PZbuEwjwOszBrON4=;
 b=3MfLun330upU2Ini3JNZA8+6KM8QANaknpJh68pN1KoW71KkMfSHFFouvO13U2v8hO
 4tjr5yL6UcCkiJTM0X8ZNSPfi3SfoJFNG1Lj6WpZkz3C+T4AteAz2M6K8OIQqcprLq4k
 eBhRuaWRtfkaEhuA4ttgeFfxsdjKAsumFNaTra5EmmKB4Y8+Ncgv6A6aJfY80JKnKq08
 3GeDCz0vX1oOfd34Vp+AuVNGmBDsH5sNow768h7HHKc8KBry6tcPH2valDkiPpwV/FJ4
 BPXQCeJ9CtUxe52KJWKAHvaAsAFOgjiIThtoc2UEh0OoPtg/1MQm8H/h2gvLnBkw5nQN
 1j/Q==
X-Gm-Message-State: AFqh2kp1ROFZm0W9R1vNyB0avMGra29uNcE0MD27mMmQaq/KzgStcDeh
 0s+kQVIARv0xVGIPh2Ee9+o9WA==
X-Google-Smtp-Source: AMrXdXvtFqhaSn3Tw9QYHWUPgyOXDjo3XDFOrsnNrIE80F2Yb82IIBW1/ye7zb7YefnrkcgKD3AD/w==
X-Received: by 2002:a17:90a:8b8c:b0:219:c2f2:f83c with SMTP id
 z12-20020a17090a8b8c00b00219c2f2f83cmr3726315pjn.2.1672793437914; 
 Tue, 03 Jan 2023 16:50:37 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 mt2-20020a17090b230200b00225dfb6e8b3sm16083571pjb.11.2023.01.03.16.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 16:50:37 -0800 (PST)
Date: Wed, 4 Jan 2023 00:50:33 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 19/27] KVM: x86/mmu: Use page-track notifiers iff there
 are external users
Message-ID: <Y7TNWYaJ9PA6HZL0@google.com>
References: <20221223005739.1295925-1-seanjc@google.com>
 <20221223005739.1295925-20-seanjc@google.com>
 <Y6vogAvkktOPLwK9@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6vogAvkktOPLwK9@yzhao56-desk.sh.intel.com>
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

On Wed, Dec 28, 2022, Yan Zhao wrote:
> On Fri, Dec 23, 2022 at 12:57:31AM +0000, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> > index 2b302fd2c5dd..f932909aa9b5 100644
> > --- a/arch/x86/kvm/mmu/page_track.c
> > +++ b/arch/x86/kvm/mmu/page_track.c
> > @@ -193,6 +193,7 @@ bool kvm_slot_page_track_is_active(struct kvm *kvm,
> >  	return !!READ_ONCE(slot->arch.gfn_track[mode][index]);
> >  }
> >  
> > +#ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
> >  void kvm_page_track_cleanup(struct kvm *kvm)
> >  {
> >  	struct kvm_page_track_notifier_head *head;
> > @@ -208,6 +209,7 @@ int kvm_page_track_init(struct kvm *kvm)
> >  	head = &kvm->arch.track_notifier_head;
> >  	INIT_HLIST_HEAD(&head->track_notifier_list);
> >  	return init_srcu_struct(&head->track_srcu);
> > +	return 0;
> Double "return"s.

Huh, I'm surprised this didn't throw a warning.  I'm pretty sure I screwed up a
refactoring, I originally had the "return 0" in an #else branch.

> > +#endif /* CONFIG_KVM_EXTERNAL_WRITE_TRACKING */
> > +
> > +static inline void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
> > +					const u8 *new, int bytes)
> > +{
> > +	__kvm_page_track_write(vcpu, gpa, new, bytes);
> > +
> Why not convert "vcpu" to "kvm" in __kvm_page_track_write() ?

No reason, I just overlooked the opportunistic cleanup.  I'll do this in the next
version.

Thanks much for the reviews!
