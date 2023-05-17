Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB1706B90
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 May 2023 16:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAD510E434;
	Wed, 17 May 2023 14:50:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5476A10E432
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 14:50:29 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-51b7810ec2cso544077a12.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684335028; x=1686927028;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pDsdBMwmB7I2Qp688+UBcj3KD8alKjVIKuHiZri9HMU=;
 b=Vf+7S2HoSpfs2i91kZKs1dMajBCg4atRbZ1RdHfApDlXNjHAhHxRwez5A5qZNHe2jv
 V0o4IUUnS336MnI4yymhfCjVauEsGe8mKhzMo8rb46v3D64L7OyYpQlYBvNELH3PaE7V
 FcnaP5aDFfMfOWo+P5kJmjS+zZS//6/Lt34MqwTss3nyMeKmrbr/uI1dWi2bjbV1Ndkb
 cXCzjRfg6Nl1KV49v8ID5U6rveTZCkiD26mW7/h36IwbzqwvRsQvuzCVGjs+Ty2qNsgc
 EckxMnZV0hHOddy4Jc7+/6qYUYqXK1JZAUlL8AN2bGd8+Yo9N1QiKq7D6OW3Ya6pVVVF
 89AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684335028; x=1686927028;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDsdBMwmB7I2Qp688+UBcj3KD8alKjVIKuHiZri9HMU=;
 b=kR0yMjtchsiuFOY4DaqvUGS7ZvfyUXUNTj54VrxizIwC5C8Gsl0GMXf32xyZrSUqrJ
 KGkfX9wxuQMt6Ef+aiMGSyvv6O+D7BukjneX0sbRzEbmidOjD+/U7vaCc1X8vhLDMcbA
 C2eDnbZZm5hUzfCbgYDuM0SLGCRjp4Ngu0a9Zvn1JkELybA4wKYdiBL7YwStGvxctBrc
 yyLLhzRTJBjbDqGOVv6cliQe31+2SNXqTnhgm3uF9Bdtivnnj4y+EOPY69IJo/E01lEc
 V8icw8jIPZXng/ZdpsDpDTTcyTAbxKBUr0LL19VU4wMf2DeMoa9JbjfyAM49INP8L+qI
 58Kg==
X-Gm-Message-State: AC+VfDzzB/+mL2EKtna3//gNgWpcCo04A+oBKIsLIw09g1X2JFU+XVi+
 56w9y7ZDOwerevTEO4BcMumm4LbPQwQ=
X-Google-Smtp-Source: ACHHUZ75/t5JCGUIwclJmPSmeF9uOB4McX3h8rZmEZLvYDyHDz2kKHj8Q6kfck2kxY5E1pOs7Hb99X7Mh6A=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:6cc8:0:b0:52c:b46d:3609 with SMTP id
 h191-20020a636cc8000000b0052cb46d3609mr10657615pgc.12.1684335028469; Wed, 17
 May 2023 07:50:28 -0700 (PDT)
Date: Wed, 17 May 2023 07:50:26 -0700
In-Reply-To: <ZGNO5gYKOhhnslsp@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
 <20230513003600.818142-4-seanjc@google.com>
 <ZGNO5gYKOhhnslsp@yzhao56-desk.sh.intel.com>
Message-ID: <ZGTpsvZed+r3Low1@google.com>
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

On Tue, May 16, 2023, Yan Zhao wrote:
> hi Sean
> 
> Do you think it's necessary to double check that struct page pointers
> are also contiguous?

No, the virtual address space should be irrelevant.  The only way it would be
problematic is if something in dma_map_page() expected to be able to access the
entire chunk of memory by getting the virtual address of only the first page,
but I can't imagine that code is reading or writing memory, let alone doing so
across a huge range of memory.

> And do you like to also include a fix as below, which is to remove the
> warning in vfio_device_container_unpin_pages() when npage is 0?
> 
> @ -169,7 +173,8 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>         *page = base_page;
>         return 0;
>  err:
> -       gvt_unpin_guest_page(vgpu, gfn, npage * PAGE_SIZE);
> +       if (npage)
> +               gvt_unpin_guest_page(vgpu, gfn, npage * PAGE_SIZE);
>         return ret;
>  }

Sure.  Want to give your SoB?  I'll write a changelog.

Thanks again!
