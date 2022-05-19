Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7C452DA5A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 May 2022 18:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC512113E41;
	Thu, 19 May 2022 16:37:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8A6113E69
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 16:37:49 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id h186so5551274pgc.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F28DbulQ0jEkQGLikm8EqDCBfoSZOeUw515EvhneCFA=;
 b=mIZhrXQ4iFDgPsYFsZ60+OFftLbzg2tZW+uB4Ooe2VBWkW8cBXZysVagXo2RHoj2JB
 lB5PsP+r0vtw5PFYL7B5Y3KWrKTQz5GQdLa12HpSuDW1l8BJQScklN/B+swR9iP2becL
 eRKAYpFxwRMcG0SHKNoGGPgJxYRV9lyd62T7ErM9+iqtrSjZUFBFRxMcnzUY3VZ88IEl
 dM/9ug6NofL/hobVN6loSHRaQ19j9XqB1sHW50BI4yWVP3eobgOMPogH4GixJA/neC7R
 4W7l6Z6XIGmCOCHUYVm1JJfgNgrAyb903+W2X5UumWnHyOF6RUtPiBKwafzpWnNSbDqk
 JieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F28DbulQ0jEkQGLikm8EqDCBfoSZOeUw515EvhneCFA=;
 b=g2v+TuUT+EflM+3+bqjSbm9hg3plrBsE6+k7CKO0jcAozHBywl/MeqEcXrtC1LMfBA
 IFR5Ay4tg1efu2fRYl/oUqkEs9y5rf/E83nBFpYEYBACgfaWF4F7Jb787YFA57IpnQlk
 +ciAz7rnP4mRBYxLqP9O6BgDsoAMl9tI4XOFsN0PpacJ4gB6LeOan+8pC6JBRuAdagjO
 FOeRtJ4IGxJYdTjpYmjWZwvC3d0RArq9Nt2F4Ubl/hR/yB3TNGnyr5q7sl1GJyR1WL6h
 anIqw0m6zc7PeintFLRoMdMyG3Cqepf/kKm86D4zD6Y91F5+VG0+udS7QIOGB4trnVDq
 bGzA==
X-Gm-Message-State: AOAM532F0tD5RIp/GrSLe4jwiRvVbgisEfzVx1qKnJ3OPZ/mpd/B+dkV
 BWK6BfRhGaA6ZzStqFaEDxtdCg==
X-Google-Smtp-Source: ABdhPJx1nKZBsvM/1s0Knp+K6VPSacbbVwoq4r4yMLooMeqC6xBtrejZP6toBWYuM4j+VwQpyBM+WQ==
X-Received: by 2002:a63:d611:0:b0:3c6:afdf:819b with SMTP id
 q17-20020a63d611000000b003c6afdf819bmr4622740pgg.513.1652978269170; 
 Thu, 19 May 2022 09:37:49 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170902780600b0015e8d4eb24dsm4023212pll.151.2022.05.19.09.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:37:48 -0700 (PDT)
Date: Thu, 19 May 2022 16:37:44 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write
 tracking externally
Message-ID: <YoZyWOh4NPA0uN5J@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-5-mlevitsk@redhat.com>
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
> @@ -5753,6 +5752,10 @@ int kvm_mmu_init_vm(struct kvm *kvm)
>  	node->track_write = kvm_mmu_pte_write;
>  	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
>  	kvm_page_track_register_notifier(kvm, node);

Can you add a patch to move this call to kvm_page_track_register_notifier() into
mmu_enable_write_tracking(), and simultaneously add a WARN in the register path
that page tracking is enabled?

Oh, actually, a better idea. Add an inner __kvm_page_track_register_notifier()
that is not exported and thus used only by KVM, invoke mmu_enable_write_tracking()
from the exported kvm_page_track_register_notifier(), and then do the above.
That will require modifying KVMGT and KVM in a single patch, but that's ok.

That will avoid any possibility of an external user failing to enabling tracking
before registering its notifier, and also avoids bikeshedding over what to do with
the one-line wrapper to enable tracking.
