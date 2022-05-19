Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227752DA79
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 May 2022 18:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C531F11A30D;
	Thu, 19 May 2022 16:43:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7627511A336
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 16:43:56 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id s14so5287743plk.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=221Yw0kf0kWHOuKCBmfC/ycEQMuPJsFgC9zSqVTAwSA=;
 b=bu8vQ+GWvqJrRdEuq8YVrsfud1b3bQhlBNIuRQm9N4t2Lj3E7ojrr5du8GpLJyVQpt
 zI6LAgP0cWVNyhkC2dx8jWx3d1dzS6qKn2apfQz90gm0zn8LV2J6jLUuu+darR0d5jp1
 LpTWI9ig8g7I0oCfkW8terjt+U3QuRwraIIgfyUbQlX7hnu3WzrJLPVhPL16qrotB7X8
 X0sGHQiLnxPwCuwzmOoubt1yCoAYcRgt5bbtFh+Kh0gFthhZS04NdGml6wCRoLPw4YTT
 8exX0VVLnNWqt0NnU9LMNUK3s3E1Z3IQqSxPNndBTJ1hO64zu+VRfQofIL4ohxv4FNRK
 FrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=221Yw0kf0kWHOuKCBmfC/ycEQMuPJsFgC9zSqVTAwSA=;
 b=tz1Wrf8wBVDNmEZ6vusMCX7HOqh3dHs7nFza0Ha/Vb7qhlSiKksFHci0DLKosmWMWj
 iqLNyz/pXOe5x4BJQfPpRzTq0uYmJ1bIL+Aal1dGeEpZd7LN4ANxE1cmeARD9fUrjO6d
 xpSJs725mMmJyRTQSwNh0BwaemDYA82v0ro2eHNrvMKgA4s84WamfaU2kKguQ/cWIE8L
 sdVhDHEe+WwQq0bHdffXxk5cCDpzwWImStptZZsjRpD42HB214gaYMJtNmG2xncjLcRI
 8UiH6LkFXnVo+t+JLz4MNoqSygR1387z0whT/fwXPUSTcF9XqRCvcmYOfPSNuJoU3aob
 q0wQ==
X-Gm-Message-State: AOAM533kK/IJj0fUXJoE4lu02OX6mylS6coNiqYf+GbGM9qcUNgNLDB0
 VCtuHwOQK3vSldmmUgyyZQXzPA==
X-Google-Smtp-Source: ABdhPJw2CROjZjF/tfI3pH/231wqbGMtrzoTlXEZCDadRe7+Y7fJupSq7bjozl06CSrvxLG1Gs7+EA==
X-Received: by 2002:a17:902:b289:b0:161:872d:6f03 with SMTP id
 u9-20020a170902b28900b00161872d6f03mr5698065plr.30.1652978635790; 
 Thu, 19 May 2022 09:43:55 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 jh9-20020a170903328900b0015e8d4eb1f8sm4027559plb.66.2022.05.19.09.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:43:55 -0700 (PDT)
Date: Thu, 19 May 2022 16:43:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 06/19] KVM: x86: mmu: add gfn_in_memslot helper
Message-ID: <YoZzx6f1XBWL3i8F@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-7-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-7-mlevitsk@redhat.com>
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
> This is a tiny refactoring, and can be useful to check
> if a GPA/GFN is within a memslot a bit more cleanly.

This doesn't explain the actual motivation, which is to use the new helper from
arch code.

> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  include/linux/kvm_host.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 252ee4a61b58b..12e261559070b 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1580,6 +1580,13 @@ int kvm_request_irq_source_id(struct kvm *kvm);
>  void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id);
>  bool kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args);
>  
> +
> +static inline bool gfn_in_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
> +{
> +	return (gfn >= slot->base_gfn && gfn < slot->base_gfn + slot->npages);
> +}
> +

Spurious newline.

> +
>  /*
>   * Returns a pointer to the memslot if it contains gfn.
>   * Otherwise returns NULL.
> @@ -1590,12 +1597,13 @@ try_get_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
>  	if (!slot)
>  		return NULL;
>  
> -	if (gfn >= slot->base_gfn && gfn < slot->base_gfn + slot->npages)
> +	if (gfn_in_memslot(slot, gfn))
>  		return slot;
>  	else
>  		return NULL;

At this point, maybe:

	if (!slot || !gfn_in_memslot(slot, gfn))
		return NULL;

	return slot;

>  }
>  
> +
>  /*
>   * Returns a pointer to the memslot that contains gfn. Otherwise returns NULL.
>   *
> -- 
> 2.26.3
> 
