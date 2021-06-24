Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B693B2C3F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Jun 2021 12:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A176EB4B;
	Thu, 24 Jun 2021 10:17:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400A16EB4C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624529857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4frsi0H+HBjHeCdKISuXJMG773wuFNrwEMxUF4xqOQU=;
 b=H1QmQf0HjgfEEO/YXFb07R4kp428RjM92oYJv9BIIfU1pd6duojaDyI7drSXXC1f8H2Ywn
 AvXBDSZI/lrCj8j/ASh1qhpRLH3p3oHWD1DEynMOa3UyttSPWHJ+KipgM4k9oOjf43gYiE
 MaEh2Ii3o4SFW6mTXKeDD9DV8UVUfwc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-xe2xAbv_OmicQfYLs2wpFg-1; Thu, 24 Jun 2021 06:17:35 -0400
X-MC-Unique: xe2xAbv_OmicQfYLs2wpFg-1
Received: by mail-ej1-f71.google.com with SMTP id
 de48-20020a1709069bf0b029048ae3ebecabso1810353ejc.16
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 03:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4frsi0H+HBjHeCdKISuXJMG773wuFNrwEMxUF4xqOQU=;
 b=rZALKLjgOOk+TtFdVByueyE6VU3DCL2wH28+71Ar94LMVLb4aHappd9zCht8MjDnFs
 UPp/Ve81fWQ9bqtU0vRY6RMoweNMABsuxGrnWVFptrD0icoBKBlX4stZj0hS0oXc5JyO
 SI6fFbUDP+iVN+MWcUd3b50bSLhIWfF8S1S7PKEutaMUsY15krBsfs+174hyRvillYAZ
 LQ38smo/pWxyOvgSFAdi6z3j6k3BbcRw+VHPEKxYnuslV70Ie3cm7A+TJz62kk4pRWU1
 mRkY5ADz6IN2tbtq/sDnZN3h9sEV7ovTzFXHXsLrj1SZFlU55y30sMAOyUtkOd8HaNU7
 zU+Q==
X-Gm-Message-State: AOAM530S/l2Yrtkc64oS53iDqeVLX2XK6ZkaKT7yb5qLPHB5LTKh5wJM
 636rnaqHCJkKiMdncyTXdk503o3H9UmgnzqzjCR4qKJ27nxWlQlOg/VuJmhR8hdgkB4w0ifMWAy
 YV7HnrvTX4W5hsCVQAL8qS/MUhgCYrS2SIw==
X-Received: by 2002:a17:906:b254:: with SMTP id
 ce20mr4621433ejb.480.1624529854732; 
 Thu, 24 Jun 2021 03:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxC6TqcAfZORfwKXJXCm8bql8vynsp6j3JYon1fQgnkpoL4xlG5zu/uVtJRITtzGjbxU3KFw==
X-Received: by 2002:a17:906:b254:: with SMTP id
 ce20mr4621398ejb.480.1624529854552; 
 Thu, 24 Jun 2021 03:17:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x21sm1600772edv.97.2021.06.24.03.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 03:17:33 -0700 (PDT)
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To: Marc Zyngier <maz@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-4-stevensd@google.com>
 <1624524744.2sr7o7ix86.astroid@bobo.none> <87mtrfinks.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b7f9c30-eb12-35c5-191f-0e8e469e1b88@redhat.com>
Date: Thu, 24 Jun 2021 12:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87mtrfinks.wl-maz@kernel.org>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@ozlabs.org>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Alexandru Elisei <alexandru.elisei@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, David Stevens <stevensd@chromium.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 24/06/21 12:06, Marc Zyngier wrote:
> On Thu, 24 Jun 2021 09:58:00 +0100,
> Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>>> From: David Stevens <stevensd@chromium.org>
>>>   out_unlock:
>>>   	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
>>>   		read_unlock(&vcpu->kvm->mmu_lock);
>>>   	else
>>>   		write_unlock(&vcpu->kvm->mmu_lock);
>>> -	kvm_release_pfn_clean(pfn);
>>> +	if (pfnpg.page)
>>> +		put_page(pfnpg.page);
>>>   	return r;
>>>   }
>>
>> How about
>>
>>    kvm_release_pfn_page_clean(pfnpg);
> 
> I'm not sure. I always found kvm_release_pfn_clean() ugly, because it
> doesn't mark the page 'clean'. I find put_page() more correct.
> 
> Something like 'kvm_put_pfn_page()' would make more sense, but I'm so
> bad at naming things that I could just as well call it 'bob()'.

The best way to go would be to get rid of kvm_release_pfn_clean() and 
always go through a pfn_page.  Then we could or could not introduce 
wrappers kvm_put_pfn_page{,_dirty}.

I think for now it's best to limit the churn since these patches will go 
in the stable releases too, and clean up the resulting API once we have 
a clear idea of how all architectures are using kvm_pfn_page.

Paolo

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
