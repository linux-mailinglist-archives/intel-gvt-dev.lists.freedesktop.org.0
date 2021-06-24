Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E623B280B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Jun 2021 08:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63AB6E9FF;
	Thu, 24 Jun 2021 06:57:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2C56E9FF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 06:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624517865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igFDOV6BxGJ7IfsozRxLlI1SBnI7ilQNQtLZk9DKzFQ=;
 b=asCC5ri0fNyxMu0OfxQL3wdsNJxJJxEb6gBc2L4lngb6MQ5aFdbAdJaMs+C/NvGeHayLWB
 T4zQekFohCHH2JIk6ZSo5z/esaVxrKgmmjK/7mF64xLO2meaEv0d8YGSlN3oKK1UvJjD1K
 fXeH+waGXwObWS7dyWkNUwRkC8AhwR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-xPxejFQ9Phyw_UWuTyutzQ-1; Thu, 24 Jun 2021 02:57:41 -0400
X-MC-Unique: xPxejFQ9Phyw_UWuTyutzQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h14-20020a05600c350eb02901dfc071c176so1251249wmq.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Jun 2021 23:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=igFDOV6BxGJ7IfsozRxLlI1SBnI7ilQNQtLZk9DKzFQ=;
 b=ajmcnGoFTeIqvWH799gkQ5u2TI05f7pIi8wlSrLU4f60kIvqFwLc1XUlQ+5fL840Y2
 v6jHKFcKU+EaGYKjECzZ+pFaVzWTD8aCZ1FdmzMuSurNoxKcjd1AyRg3g9cLDIlForau
 1zQcltZ4mmIyLlK+kY02Wxr9x1DBS8Pj/78W934qy+u3Dbx3XzFGOjGgjflUdViXCxHO
 6NVbM0kdXFbAC6QsZip/2N75DRE6jFMBHEAckzl+MgMAMox2WJd9tUFY8h6lUVUpVObg
 ZaMts1RWnAqcW4BFKvhxWniqMsi3Lmg+ru0gwSBwG/C6bhHdt4WE26I0OZbiU+9ogP0h
 ANXw==
X-Gm-Message-State: AOAM531zO4Y+SJBhhmzrJgL8yzL42+ilHG1bsdnMEN1QPH9HYGyQO27+
 gWUc83fsucGqEGnU7wXDlixJp1Oz84F9IIP7f0Ip1/ruY95wVOPhKFC8rLO1GbnMls3H7Uu2oQG
 krBaHdlfcVnUuCcUqF4ajA7DoOZNZU1POaA==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr85628wri.141.1624517860546; 
 Wed, 23 Jun 2021 23:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdqChWxI2TqFhdGI9pdTdW0OY2cpxOML9ILwZzD3plJUW6I8N3vbOFGhbVC127GRhm0xAu2w==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr85587wri.141.1624517860347; 
 Wed, 23 Jun 2021 23:57:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o26sm1900491wmr.29.2021.06.23.23.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 23:57:39 -0700 (PDT)
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
To: David Stevens <stevensd@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20baae77-785c-5d46-e00c-41d86c2fbc56@redhat.com>
Date: Thu, 24 Jun 2021 08:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 24/06/21 05:57, David Stevens wrote:
> KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
> follow_pte in gfn_to_pfn. However, the resolved pfns may not have
> assoicated struct pages, so they should not be passed to pfn_to_page.
> This series removes such calls from the x86 and arm64 secondary MMU. To
> do this, this series modifies gfn_to_pfn to return a struct page in
> addition to a pfn, if the hva was resolved by gup. This allows the
> caller to call put_page only when necessated by gup.
> 
> This series provides a helper function that unwraps the new return type
> of gfn_to_pfn to provide behavior identical to the old behavior. As I
> have no hardware to test powerpc/mips changes, the function is used
> there for minimally invasive changes. Additionally, as gfn_to_page and
> gfn_to_pfn_cache are not integrated with mmu notifier, they cannot be
> easily changed over to only use pfns.
> 
> This addresses CVE-2021-22543 on x86 and arm64.

Thank you very much for this.  I agree that it makes sense to have a 
minimal change; I had similar changes almost ready, but was stuck with 
deadlocks in the gfn_to_pfn_cache case.  In retrospect I should have 
posted something similar to your patches.

I have started reviewing the patches, and they look good.  I will try to 
include them in 5.13.

Paolo

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
