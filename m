Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524AA708770
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 May 2023 20:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DFD10E114;
	Thu, 18 May 2023 18:04:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7281010E114
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 18:04:49 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-ba83fed51b0so2784175276.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684433088; x=1687025088;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vCrVtwdIraNV2irdPKpgDX1UCTkhSG6uoeDckqbr3Es=;
 b=gQ9Z3F2vw3+VareHpKfWGGRTctpzyfv4csZGMg2YaLnhnyXjwobQQGO/wA6h0O+lJ3
 9kRuqIngT8mGqWAbR+pbqmRCfc5Jn53wOJ8dC3SAyCq8ku2lJdrNYJDeS8QtzHJ11P3Z
 E2zgzhaLMfDysfnU9WzOecKRSRWAyK4ygjJIW9rT5PCi+ujIXjfWUjOifb86jt0FfJmB
 GEkCOzRHGp2BucWTHjYw1OeO0PpAGtx1WzumH46CcmmxMrIiXFUzYpmzuiK4RX3JyUhT
 x3dng1sy9tSLjWIox+YKLGWhx3LBS+vUH5O4fhooCf6bPzJXXs7MqY8SDb0+JZ8KHABy
 HwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684433088; x=1687025088;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vCrVtwdIraNV2irdPKpgDX1UCTkhSG6uoeDckqbr3Es=;
 b=LzMmKVVmN1m7eu2KJKWV5BwndKhnCKJzbcbk2eZBAkELoqh5lGVfxNxB3iITuH5kpW
 jnSPAGWJrOEPZ7DcCc9KxN65zitEyaNLDJOy73pQrVYV/cJ0Jp9tiLz3+9WPS2z4Qm/M
 v9UqaP8JvFZ5WQ7NZgdcL0/ambhP8T0DgeL6c1bvS5lc934wsSGX/nLA1G0SbXEW3BEZ
 rXQcxKO05Xu0LsKP0YLBlTEyIdzBKgiS9wvmk0e6RCZ/uGPQLqlgE+RsV2JXBALol+s5
 tzcTBGDW+CG3uc078bsNTPLpu2Au2wueAYs0Z2BG6L9BU5ZmURdyjcVOQkZn7xyNFlsc
 fUjQ==
X-Gm-Message-State: AC+VfDzT+Ef75Y+u2RTBaIkvBb0ghAt0/xTKDsOiLf4uI+F5pOF+AcUg
 kXPTz36JXtIizbnjO/bJV2SWuARqA6k=
X-Google-Smtp-Source: ACHHUZ6WUkWetnPqPXPZQxsXjjLbLmLdZFTJ9NTfgI7Sfh4L6noylG2KxLFdoGMzzXRn4d8670caCGGziEM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2e0b:0:b0:ba8:93c3:331a with SMTP id
 u11-20020a252e0b000000b00ba893c3331amr1627455ybu.5.1684433088097; Thu, 18 May
 2023 11:04:48 -0700 (PDT)
Date: Thu, 18 May 2023 11:04:46 -0700
In-Reply-To: <ZGXqo+tG35S2c+QQ@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
 <20230513003600.818142-4-seanjc@google.com>
 <ZGNO5gYKOhhnslsp@yzhao56-desk.sh.intel.com> <ZGTpsvZed+r3Low1@google.com>
 <ZGXqo+tG35S2c+QQ@yzhao56-desk.sh.intel.com>
Message-ID: <ZGZovmcrdh8NcWqb@google.com>
Subject: Re: [PATCH v3 03/28] drm/i915/gvt: Verify hugepages are contiguous in
 physical address space
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

On Thu, May 18, 2023, Yan Zhao wrote:
> On Wed, May 17, 2023 at 07:50:26AM -0700, Sean Christopherson wrote:
> > On Tue, May 16, 2023, Yan Zhao wrote:
> > > hi Sean
> > > 
> > > Do you think it's necessary to double check that struct page pointers
> > > are also contiguous?
> > 
> > No, the virtual address space should be irrelevant.  The only way it would be
> > problematic is if something in dma_map_page() expected to be able to access the
> > entire chunk of memory by getting the virtual address of only the first page,
> > but I can't imagine that code is reading or writing memory, let alone doing so
> > across a huge range of memory.
> Yes, I do find arm_iommu version of dma_map_page() access the memory by getting
> virtual address of pages passed in, but it's implemented as page by page, not only
> from the first page.
> 
> dma_map_page
>   dma_map_page_attrs
>     ops->map_page
>       arm_iommu_map_page

Heh, thankfully this is ARM specific, which presumably doesn't collide with KVMGT.

>          __dma_page_cpu_to_dev
>            dma_cache_maint_page
> 
> Just a little worried about the condition of PFNs are contiguous
> while they belong to different backends, e.g. one from system memory and
> one from MMIO.
> But I don't know how to avoid this without complicated checks.
> And this condition might not happen in practice.

IMO, assuming that contiguous pfns are vritually contiguous is wrong, i.e. would
be a bug in the other code.  The above dma_cache_maint_page() get's this right,
and even has a well written comment to boot.
