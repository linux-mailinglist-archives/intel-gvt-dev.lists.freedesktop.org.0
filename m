Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0952DAB1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 May 2022 18:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DEB11A5AB;
	Thu, 19 May 2022 16:55:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD411A59E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 16:55:22 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id x12so5580499pgj.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fbRv1nP7pTqnBz+sNfZ4tvpe8QTnEEoJ7rGEyN4925Q=;
 b=NlEMnrL1wW3fdyUxfE79H9YKA08o4qU+R83BNF4EgYN1cw3zLCwLQRh0UUNy8jsgaW
 lh5GqvoVBqk+o21K5cK+qXjAuNRBqngjQJpCjNtE0H22z4d7gNLw9px10kbPevPTCOZo
 cm+d0+5Tl4z0B20qtEo97MXoLONED9j4gMp06GLYi8IioDmsnUosJWwH3R2UXeI50B+Y
 Dfz9rAnYpYkgl9qP8KnBJnRgCxNPwNbXvT5v7eDKy4noIKvXGL5S6mBSB33tJTkWiaIL
 eywS3+VPl8lSdoz2EXE2fdPxXfmOKy58HyUzW2znCkVQe921F9Kzhs0rUpz/ac4b69yM
 G7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fbRv1nP7pTqnBz+sNfZ4tvpe8QTnEEoJ7rGEyN4925Q=;
 b=xAugsbrROcZbRuaYHPRGucsmD+XZ1GZD5nGikmdVnRYexxonunbxslBUplbQUYnzU7
 aw5WruBHN0uoWyy+5BqGDkUZnKvGV+lbMZXoSHGDRVErXkqVGtfLiX+XTqNvB7KOsE9p
 Ak8Gr6+wH+naDtXo7tD9rf0xki2qSLLjdb6HnZdZh8NZfh8+9wLCkLo9e+Jx+1YnMlhc
 t4WF96nlnQEFRnZ/MUX0NJlqrVCRiQJej51z/B6Pwxerm7p/Dw9GnKubc4+xql+ZgteA
 X25HQ4DES30Veygy5Fmf2MDNCVfYtASgeyXsa0gwuS9rW7MKLA/4k+6GVDPr6K9BNrdi
 Wwsg==
X-Gm-Message-State: AOAM531Tf3nMBnocpsIyB+HLtc88b9cbsZEwmO0DDeS5BSwV6WeX+bG2
 aSIaqV0kb9bxDxPyusAQCitvzw==
X-Google-Smtp-Source: ABdhPJxhTLHIK7S/JfndVkiqYIReuohqOcVCUwV7I1Rl2NWw0SBdey4MuXGnvj/UoimJME0mze89Mg==
X-Received: by 2002:a63:1347:0:b0:3f2:8963:ca0a with SMTP id
 7-20020a631347000000b003f28963ca0amr4750270pgt.424.1652979321995; 
 Thu, 19 May 2022 09:55:21 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 t9-20020aa79389000000b0051829b1595dsm4262274pfe.130.2022.05.19.09.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:55:21 -0700 (PDT)
Date: Thu, 19 May 2022 16:55:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 14/19] KVM: x86: rename .set_apic_access_page_addr
 to reload_apic_access_page
Message-ID: <YoZ2dh+ZujErT5nk@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-15-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-15-mlevitsk@redhat.com>
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

On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> This will be used on SVM to reload shadow page of the AVIC physid table
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index d2f73ce87a1e3..ad744ab99734c 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9949,12 +9949,12 @@ void kvm_arch_mmu_notifier_invalidate_range(struct kvm *kvm,
>  		kvm_make_all_cpus_request(kvm, KVM_REQ_APIC_PAGE_RELOAD);
>  }
>  
> -static void kvm_vcpu_reload_apic_access_page(struct kvm_vcpu *vcpu)
> +static void kvm_vcpu_reload_apic_pages(struct kvm_vcpu *vcpu)
>  {
>  	if (!lapic_in_kernel(vcpu))
>  		return;
>  
> -	static_call_cond(kvm_x86_set_apic_access_page_addr)(vcpu);
> +	static_call_cond(kvm_x86_reload_apic_pages)(vcpu);
>  }
>  
>  void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu)
> @@ -10071,7 +10071,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  		if (kvm_check_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu))
>  			vcpu_load_eoi_exitmap(vcpu);
>  		if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
> -			kvm_vcpu_reload_apic_access_page(vcpu);
> +			kvm_vcpu_reload_apic_pages(vcpu);

My vote is to add a new request and new kvm_x86_ops hook instead of piggybacking
KVM_REQ_APIC_PAGE_RELOAD.  The usage in kvm_arch_mmu_notifier_invalidate_range()
very subtlies relies on the memslot and vma being allocated/controlled by KVM.

The use in avic_physid_shadow_table_flush_memslot() is too similar in that it
also deals with memslot changes, but at the same time is _very_ different in that
it's dealing with user controlled memslots.
