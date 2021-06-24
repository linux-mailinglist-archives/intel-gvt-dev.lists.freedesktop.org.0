Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349013B2652
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Jun 2021 06:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB456E9DE;
	Thu, 24 Jun 2021 04:28:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F796E9DF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 04:28:34 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id q190so11145117qkd.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Jun 2021 21:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vf6iRayWkpLOoYUf7pNtG+CaRTyVw0JAqulSitMDQO0=;
 b=XhlMv+xUBROxE3lM6Rw1CgXO1kddD8cgUoOHPx8CrrP4EyoU4DEd7SG1RL9I+0DYan
 boJUZwUYrjArp3SWtAGk9E+FeS6qz4WFyjdbkPcDaZ6Ojv9o8/zJPPYdzKO3qy5vBtEQ
 HXmGW25TeHi/8kTi8dJmCqS/q5sIDUcuof6X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vf6iRayWkpLOoYUf7pNtG+CaRTyVw0JAqulSitMDQO0=;
 b=hFdNpmr3sWq+gPHsq2fWf3NNQrVcv13KRURAj72qV5+9OewwpnUo7dfoCBd7+oc4Bi
 Cp10pqtDqt/1ZjCsxtxd8W5wfKQrW8lfu1Kz290jsaCLS3S9jjUtz4glb6JoDEz8oLVX
 xZ/RquI4NcQMaecfk2e+vIYyo3rtY6BR+zL5Z5t2Ks/MogY8wfWayWwH/lSndc0iYu+7
 jACApOvkRJQzluufYPqbtO7IbMz9hdsUxpBS8SMPgPeNUPTA4osi+QQwfGk4gsd7zvBD
 9BUbbm4qs/czrkYdSu+/GrG3qNpavzAuHa9neyZgKkBSWutlFokBlTk+Z5/cMOXcfp97
 6fqg==
X-Gm-Message-State: AOAM531Zg4LKAxas/pBCwTk1sgvU963WYWLAgciNRRqnGevv8UmPBArj
 vPrknuHB56Eq//lz4wPc6Dl3gzv1R/8vag4YvIG5dQ==
X-Google-Smtp-Source: ABdhPJzN6yIAnrutP4mXY4YUqxFUME7cFcfwCCdv9KLoP/1Ux65U8D0qn4SKiYpFY+s6pSHfO29nSf+YvOucHrB1PFc=
X-Received: by 2002:a05:620a:1a87:: with SMTP id
 bl7mr3690332qkb.232.1624508913860; 
 Wed, 23 Jun 2021 21:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-7-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-7-stevensd@google.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 24 Jun 2021 13:28:23 +0900
Message-ID: <CAD=HUj6C455sDhBUdQ_Kev=DPpdLRDDycumqfh8kjvredGh=hw@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/i915/gvt: use gfn_to_pfn's page instead of pfn
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>
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
Cc: David Stevens <stevensd@google.com>, intel-gvt-dev@lists.freedesktop.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Please ignore this last patch. It was put together as an afterthought
and wasn't properly tested.

-David

On Thu, Jun 24, 2021 at 12:59 PM David Stevens <stevensd@chromium.org> wrote:
>
> Return struct page instead of pfn from gfn_to_mfn. This function is only
> used to determine if the page is a transparent hugepage, to enable 2MB
> huge gtt shadowing. Returning the page directly avoids the risk of
> calling pfn_to_page on a VM_IO|VM_PFNMAP pfn.
>
> This change also properly releases the reference on the page returned by
> gfn_to_pfn.
>
> Signed-off-by: David Stevens <stevensd@google.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c       | 12 ++++++++----
>  drivers/gpu/drm/i915/gvt/hypercall.h |  3 ++-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 12 ++++--------
>  drivers/gpu/drm/i915/gvt/mpt.h       |  8 ++++----
>  4 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index 9478c132d7b6..b2951c560582 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1160,16 +1160,20 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
>         struct intel_gvt_gtt_entry *entry)
>  {
>         struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
> -       unsigned long pfn;
> +       struct page *page;
> +       bool is_trans_huge;
>
>         if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
>                 return 0;
>
> -       pfn = intel_gvt_hypervisor_gfn_to_mfn(vgpu, ops->get_pfn(entry));
> -       if (pfn == INTEL_GVT_INVALID_ADDR)
> +       page = intel_gvt_hypervisor_gfn_to_mfn_page(vgpu, ops->get_pfn(entry));
> +       if (!page)
>                 return -EINVAL;
>
> -       return PageTransHuge(pfn_to_page(pfn));
> +       is_trans_huge = PageTransHuge(page);
> +       put_page(page);
> +
> +       return is_trans_huge;
>  }
>
>  static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
> index b79da5124f83..017190ff52d5 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -60,7 +60,8 @@ struct intel_gvt_mpt {
>                         unsigned long len);
>         int (*write_gpa)(unsigned long handle, unsigned long gpa, void *buf,
>                          unsigned long len);
> -       unsigned long (*gfn_to_mfn)(unsigned long handle, unsigned long gfn);
> +       struct page *(*gfn_to_mfn_page)(unsigned long handle,
> +                                       unsigned long gfn);
>
>         int (*dma_map_guest_page)(unsigned long handle, unsigned long gfn,
>                                   unsigned long size, dma_addr_t *dma_addr);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index b829ff67e3d9..1e97ae813ed0 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1928,21 +1928,17 @@ static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
>         return -EFAULT;
>  }
>
> -static unsigned long kvmgt_gfn_to_pfn(unsigned long handle, unsigned long gfn)
> +static struct page *kvmgt_gfn_to_page(unsigned long handle, unsigned long gfn)
>  {
>         struct kvmgt_guest_info *info;
>         kvm_pfn_t pfn;
>
>         if (!handle_valid(handle))
> -               return INTEL_GVT_INVALID_ADDR;
> +               return NULL;
>
>         info = (struct kvmgt_guest_info *)handle;
>
> -       pfn = kvm_pfn_page_unwrap(gfn_to_pfn(info->kvm, gfn));
> -       if (is_error_noslot_pfn(pfn))
> -               return INTEL_GVT_INVALID_ADDR;
> -
> -       return pfn;
> +       return gfn_to_pfn(info->kvm, gfn).page;
>  }
>
>  static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
> @@ -2112,7 +2108,7 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
>         .disable_page_track = kvmgt_page_track_remove,
>         .read_gpa = kvmgt_read_gpa,
>         .write_gpa = kvmgt_write_gpa,
> -       .gfn_to_mfn = kvmgt_gfn_to_pfn,
> +       .gfn_to_mfn_page = kvmgt_gfn_to_page,
>         .dma_map_guest_page = kvmgt_dma_map_guest_page,
>         .dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
>         .dma_pin_guest_page = kvmgt_dma_pin_guest_page,
> diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
> index 550a456e936f..9169b83cf0f6 100644
> --- a/drivers/gpu/drm/i915/gvt/mpt.h
> +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> @@ -214,17 +214,17 @@ static inline int intel_gvt_hypervisor_write_gpa(struct intel_vgpu *vgpu,
>  }
>
>  /**
> - * intel_gvt_hypervisor_gfn_to_mfn - translate a GFN to MFN
> + * intel_gvt_hypervisor_gfn_to_mfn_page - translate a GFN to MFN page
>   * @vgpu: a vGPU
>   * @gpfn: guest pfn
>   *
>   * Returns:
> - * MFN on success, INTEL_GVT_INVALID_ADDR if failed.
> + * struct page* on success, NULL if failed.
>   */
> -static inline unsigned long intel_gvt_hypervisor_gfn_to_mfn(
> +static inline unsigned long intel_gvt_hypervisor_gfn_to_mfn_page(
>                 struct intel_vgpu *vgpu, unsigned long gfn)
>  {
> -       return intel_gvt_host.mpt->gfn_to_mfn(vgpu->handle, gfn);
> +       return intel_gvt_host.mpt->gfn_to_mfn_page(vgpu->handle, gfn);
>  }
>
>  /**
> --
> 2.32.0.93.g670b81a890-goog
>
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
