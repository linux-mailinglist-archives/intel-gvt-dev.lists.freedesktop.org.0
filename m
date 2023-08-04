Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D076F646
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  4 Aug 2023 01:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCDE10E22C;
	Thu,  3 Aug 2023 23:50:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7910E22C;
 Thu,  3 Aug 2023 23:50:20 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686c06b806cso1092643b3a.2; 
 Thu, 03 Aug 2023 16:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691106620; x=1691711420;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OP8pAkGmqcoifyAHKkznCuAfpusO15WSf6dYYfXbnWE=;
 b=PgXXxzGzaAwUtIpzTTXbsZnBtS76iQFwC1R3DmeSTZdbZJKnoq6FG+qIJfa0ga1hl5
 TWCOeqIovBS4gZMFFwmjAb5gYwdZSBDwkKzMqBDZI6rZpTSnZjZhbM2sws+XtC3BQu16
 F3bEEb6TMl7dhdkyDVhVaBfbLf6FSsiDjbQd/gg4iQFuNf736eah9lWpOuFQ+Ftd1c6u
 rSRZI7+FyciRYDmW3pLArfl9uM9HecVmp5Qk84Vf0FnlTBDAL7G5t5EmeVy87oRkcDiW
 +4XQwEh9SShZN/bTn2OqthQfTWpjgWmkfz8CkoxAZG0yOqla4DJ66IppVflWDBg9kyyN
 UUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691106620; x=1691711420;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OP8pAkGmqcoifyAHKkznCuAfpusO15WSf6dYYfXbnWE=;
 b=EGyRSdEjXVgcOPr0yTubneXF5MD65q3g4LpWupD/dtbMcrkHq6uWjZy7ht0S/26a8b
 bQmLJFo+GuW5kte6NVuLRhJ8rMRk5J1E73KMWUFjpgHgvb2WK3umuw3iEHspikVxvgVK
 B4ZiF2QMk9Wl71F8UAjSfQ9ONPga98WU8gpl82jQfgr2cTCSywLl1r5TF9+kyps+PORw
 kksQtr9EgZJpaCtbUrHFAgXZtOpdRgfFel3iUpBp6uvTNxMw7FsLYGFEaDIJchKiIVHV
 uKwDGmsNVJ8DHrt+Wygranov93WO3n1yHWTXkMRNCuUjbysD8eAqgw3LPvpjI5I9v1iE
 tYew==
X-Gm-Message-State: AOJu0YziOPoy/muCcH2dICMLpHiROjoqOfAPpM4bA15V85X556usW/bF
 cq6JSTyzAvKLU4Qfk1ugL0k=
X-Google-Smtp-Source: AGHT+IEkK9m5UC0fjBbStPVpvGbMqyYkE8OIDUNZCnvuaRzMxzZJ52sAUlgCOO0Uch9UiRf+Mik+qw==
X-Received: by 2002:a05:6a00:14d5:b0:680:252d:da3e with SMTP id
 w21-20020a056a0014d500b00680252dda3emr208073pfu.5.1691106619663; 
 Thu, 03 Aug 2023 16:50:19 -0700 (PDT)
Received: from localhost ([192.55.55.51]) by smtp.gmail.com with ESMTPSA id
 c23-20020a62e817000000b0068783a2dfdasm367609pfi.104.2023.08.03.16.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 16:50:19 -0700 (PDT)
Date: Thu, 3 Aug 2023 16:50:17 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v4 12/29] KVM: x86/mmu: Move
 kvm_arch_flush_shadow_{all,memslot}() to mmu.c
Message-ID: <20230803235017.GA2257301@ls.amr.corp.intel.com>
References: <20230729013535.1070024-1-seanjc@google.com>
 <20230729013535.1070024-13-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230729013535.1070024-13-seanjc@google.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 isaku.yamahata@gmail.com, Ben Gardon <bgardon@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 06:35:18PM -0700,
Sean Christopherson <seanjc@google.com> wrote:

> Move x86's implementation of kvm_arch_flush_shadow_{all,memslot}() into
> mmu.c, and make kvm_mmu_zap_all() static as it was globally visible only
> for kvm_arch_flush_shadow_all().  This will allow refactoring
> kvm_arch_flush_shadow_memslot() to call kvm_mmu_zap_all() directly without
> having to expose kvm_mmu_zap_all_fast() outside of mmu.c.  Keeping
> everything in mmu.c will also likely simplify supporting TDX, which
> intends to do zap only relevant SPTEs on memslot updates.

Yes, it helps TDX code cleaner to move mmu related function under mmu.c.
Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>

Thanks,

> 
> No functional change intended.
> 
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  1 -
>  arch/x86/kvm/mmu/mmu.c          | 13 ++++++++++++-
>  arch/x86/kvm/x86.c              | 11 -----------
>  3 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 28bd38303d70..856ec22aceb6 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1832,7 +1832,6 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
>  				   const struct kvm_memory_slot *memslot);
>  void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
>  				   const struct kvm_memory_slot *memslot);
> -void kvm_mmu_zap_all(struct kvm *kvm);
>  void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen);
>  void kvm_mmu_change_mmu_pages(struct kvm *kvm, unsigned long kvm_nr_mmu_pages);
>  
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce..c6dee659d592 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6732,7 +6732,7 @@ void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
>  	 */
>  }
>  
> -void kvm_mmu_zap_all(struct kvm *kvm)
> +static void kvm_mmu_zap_all(struct kvm *kvm)
>  {
>  	struct kvm_mmu_page *sp, *node;
>  	LIST_HEAD(invalid_list);
> @@ -6757,6 +6757,17 @@ void kvm_mmu_zap_all(struct kvm *kvm)
>  	write_unlock(&kvm->mmu_lock);
>  }
>  
> +void kvm_arch_flush_shadow_all(struct kvm *kvm)
> +{
> +	kvm_mmu_zap_all(kvm);
> +}
> +
> +void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
> +				   struct kvm_memory_slot *slot)
> +{
> +	kvm_page_track_flush_slot(kvm, slot);
> +}
> +
>  void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen)
>  {
>  	WARN_ON(gen & KVM_MEMSLOT_GEN_UPDATE_IN_PROGRESS);
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index a6b9bea62fb8..059571d5abed 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12776,17 +12776,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>  		kvm_arch_free_memslot(kvm, old);
>  }
>  
> -void kvm_arch_flush_shadow_all(struct kvm *kvm)
> -{
> -	kvm_mmu_zap_all(kvm);
> -}
> -
> -void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
> -				   struct kvm_memory_slot *slot)
> -{
> -	kvm_page_track_flush_slot(kvm, slot);
> -}
> -
>  static inline bool kvm_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
>  {
>  	return (is_guest_mode(vcpu) &&
> -- 
> 2.41.0.487.g6d72f3e995-goog
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
