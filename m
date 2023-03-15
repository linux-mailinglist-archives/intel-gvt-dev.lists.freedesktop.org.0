Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 957916BB7E0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Mar 2023 16:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0324010E8DE;
	Wed, 15 Mar 2023 15:32:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F0010EB28
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 15:32:52 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 e11-20020a5b004b000000b00b37118ce5a7so13475850ybp.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678894371;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3TNqbTHQHmb2xkVyzid8TSYw/6ySfy0Rm3ZyMjb8K6Q=;
 b=OndTXsXmttnpBFbJTuj797Wr6Hb4uuRGsMxUUd4ZPEwngST2tq9jgqAbWGLkyoc3UF
 RUhNZhfsUQkTDYDwqU0/dV6JxWw+2ynyRmSEyI9Bwl+jseJfVeeW8gwLYFAhBZkUi1BZ
 Rjj2jXSvFfBsYnidGAkG4GJa5P/xduE4cZra/84msBr8gC3W7KhT495aCnKxRRdA4IIK
 43oHM+cyZfvAjiOrOoUR5FIcSA7otu9nwtxqBXBgNK3Oo5TKpFRdN2xa7qP1kSKnHJFw
 Z1bOTZoSAkx8hsqeuessy3+j2lwr6e+TM98ortsV9xdt+nOgsmHrWRNygXFqTvbbzcTi
 wdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678894371;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3TNqbTHQHmb2xkVyzid8TSYw/6ySfy0Rm3ZyMjb8K6Q=;
 b=t7gBPHdbzgHz7ko9Hxf9HyZEujtv4rLfVBqeaw6V0aopeoEC8IH8ixhBvu/u+yeZuT
 pyyxufleAa188GKlpQyqj2QmQF8iBF3hKcrAT/lOqsBm1pT/qtW1jszdsomVx8Xmhf63
 C6m3Qq6IzovDHvzgiCPexW742ajWhLJPEWu7rWy3uLnkZVCwogXp/OsQ69/KlBJ4X63Y
 8MsYJ7eRpcc+1pTBBUaTsOdO9qi/7tvs9+z409WmIx7viy9Ontc1YTSmM1oTzncEY/29
 jXstHIn0lBleldmx/5sI4LIPkKjZ+8LahE2uzW74MYFf+JLKQa8oydeD93LBzDIuqNEn
 +zYQ==
X-Gm-Message-State: AO0yUKXxfk9rejZD5RedNmdT74CgaGQWyFrZNXalDHOc0oVg/zBI8DDn
 DUMBpOdB86yapHmG90fjoNuvx+gv1eo=
X-Google-Smtp-Source: AK7set/iYt7e9mDhQyRut6LZI+RQO0U18hEgJBTShOBJit1b59iuVZXxUV2vD+RNR86XdMZiKEiV0PP1XPI=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1205:b0:b3e:c715:c313 with SMTP id
 s5-20020a056902120500b00b3ec715c313mr2265866ybu.6.1678894371838; Wed, 15 Mar
 2023 08:32:51 -0700 (PDT)
Date: Wed, 15 Mar 2023 08:32:50 -0700
In-Reply-To: <ZBEanQaJTCkjcDOn@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-12-seanjc@google.com>
 <ZBEanQaJTCkjcDOn@yzhao56-desk.sh.intel.com>
Message-ID: <ZBHlIuhED8y3JIu1@google.com>
Subject: Re: [PATCH v2 11/27] KVM: x86/mmu: Don't rely on page-track mechanism
 to flush on memslot change
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
> On Fri, Mar 10, 2023 at 04:22:42PM -0800, Sean Christopherson wrote:
> ...
> > -static void kvm_mmu_invalidate_zap_pages_in_memslot(struct kvm *kvm,
> > -			struct kvm_memory_slot *slot,
> > -			struct kvm_page_track_notifier_node *node)
> > -{
> > -	kvm_mmu_zap_all_fast(kvm);
> > -}
> > -
> >  int kvm_mmu_init_vm(struct kvm *kvm)
> >  {
> >  	struct kvm_page_track_notifier_node *node = &kvm->arch.mmu_sp_tracker;
> > @@ -6110,7 +6103,6 @@ int kvm_mmu_init_vm(struct kvm *kvm)
> >  	}
> >  
> >  	node->track_write = kvm_mmu_pte_write;
> > -	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
> >  	kvm_page_track_register_notifier(kvm, node);
> >  
> >  	kvm->arch.split_page_header_cache.kmem_cache = mmu_page_header_cache;
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index f706621c35b8..29dd6c97d145 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12662,6 +12662,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
> >  void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
> >  				   struct kvm_memory_slot *slot)
> >  {
> > +	kvm_mmu_zap_all_fast(kvm);
> Could we still call kvm_mmu_invalidate_zap_pages_in_memslot() here?
> As I know, for TDX, its version of
> kvm_mmu_invalidate_zap_pages_in_memslot() is like
> 
> static void kvm_mmu_invalidate_zap_pages_in_memslot(struct kvm *kvm,
>                         struct kvm_memory_slot *slot,
>                         struct kvm_page_track_notifier_node *node)
> {
>         if (kvm_gfn_shared_mask(kvm))
>                 kvm_mmu_zap_memslot(kvm, slot);
>         else
>                 kvm_mmu_zap_all_fast(kvm);
> }
> 
> Maybe this kind of judegment is better to be confined in mmu.c?

Hmm, yeah, I agree.  The only reason I exposed kvm_mmu_zap_all_fast() is because
kvm_mmu_zap_all() is already exposed for kvm_arch_flush_shadow_all() and it felt
weird/wrong to split those.  But that's the only usage of kvm_mmu_zap_all(), so
a better approach to maintain consistency would be to move
kvm_arch_flush_shadow_{all,memslot}() into mmu.c.  I'll do that in the next version.
