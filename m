Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7202B3B2BB4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Jun 2021 11:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DFA6EB42;
	Thu, 24 Jun 2021 09:43:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D656EB44
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624527817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkxHw284a/HcUQKczqJcr3hZxs0a/eNZzaMIqcieCR4=;
 b=N2dmpoXd8h1tJ/1jVQ8EadWoXvdJ00hsKd76ingRURI7ArP7YM3OVAqgd5iCcGtLbxK3C7
 J0rwSiQGm1W62yubsHJcsSZWAiwG+R6YTX3bMtLXDw+7oAc+B11Z/3FqYtBXdPD45Pcc9x
 UB6haCnVbw5AnTQduuhTYeNyrGJRGKk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-t937Du8YPFqCrVCpPfCD2g-1; Thu, 24 Jun 2021 05:43:36 -0400
X-MC-Unique: t937Du8YPFqCrVCpPfCD2g-1
Received: by mail-ed1-f69.google.com with SMTP id
 dy23-20020a05640231f7b0290394996f1452so3047129edb.18
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 02:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qkxHw284a/HcUQKczqJcr3hZxs0a/eNZzaMIqcieCR4=;
 b=isNQ3e3JFI71TeaG4h/yq9pfEZXGGW3Nio6OC3dslmd27T5rmOMpABb/zAQNmr1vD5
 WiMA+iWSbuGVqmAIP9WWJZ5f17UHmnTQBPcaYjzYm3q6ZLLuynxn1JQgyTaw0fY1zqjX
 ghbLokh2X0VwENpByq7xz0i0a7Ubd1fjK5STi+IyZMaPNeVDj7y1Q3ccQxZyYqTR7mpV
 ardiYAcxw1fmG8vfBvIA0W6L9Vr+oVP/BAO9e5PV7GxCsoSw4uyR9037dbiceDEClQHw
 YyqsYngzK9i+ese4FrluSu6s8becHtz/I/iae5d0Sf0zvFrgt1i7qB5UO8xSdYu7Qyl8
 kC7A==
X-Gm-Message-State: AOAM530iy7Q3R6c//JaZ/8I7XhQFNg+nlja+WXt7mtAZlCIxj34X+Z35
 TLws08PDagKpo/b4TlwQ+kbhet0+c7CNojzsuPe5GCyTPbR4CV9+F8bzd6BCfb3nrpWgCZM77+b
 aGQoase8EOcNLSdg4fct6au0igtKFcHOv/Q==
X-Received: by 2002:a05:6402:944:: with SMTP id
 h4mr5798156edz.76.1624527815210; 
 Thu, 24 Jun 2021 02:43:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD6cFFU4Uspcy5dTYBfn7A0VR+4loxnlaoo/QjHY9IN1nmjQ4mSQ+4egclMkG5+RC1oGdqOg==
X-Received: by 2002:a05:6402:944:: with SMTP id
 h4mr5798117edz.76.1624527814999; 
 Thu, 24 Jun 2021 02:43:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t17sm1544705edv.75.2021.06.24.02.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 02:43:34 -0700 (PDT)
Subject: Re: [PATCH 1/6] KVM: x86/mmu: release audited pfns
To: Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, David Stevens <stevensd@chromium.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-2-stevensd@google.com>
 <1624524156.04etgk7zmz.astroid@bobo.none>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4816287a-b9a9-d3f4-f844-06922d696e06@redhat.com>
Date: Thu, 24 Jun 2021 11:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624524156.04etgk7zmz.astroid@bobo.none>
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
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 kvm-ppc@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 24/06/21 10:43, Nicholas Piggin wrote:
> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>> From: David Stevens <stevensd@chromium.org>
> 
> Changelog? This looks like a bug, should it have a Fixes: tag?

Probably has been there forever... The best way to fix the bug would be 
to nuke mmu_audit.c, which I've threatened to do many times but never 
followed up on.

Paolo

> Thanks,
> Nick
> 
>>
>> Signed-off-by: David Stevens <stevensd@chromium.org>
>> ---
>>   arch/x86/kvm/mmu/mmu_audit.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/x86/kvm/mmu/mmu_audit.c b/arch/x86/kvm/mmu/mmu_audit.c
>> index cedc17b2f60e..97ff184084b4 100644
>> --- a/arch/x86/kvm/mmu/mmu_audit.c
>> +++ b/arch/x86/kvm/mmu/mmu_audit.c
>> @@ -121,6 +121,8 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64 *sptep, int level)
>>   		audit_printk(vcpu->kvm, "levels %d pfn %llx hpa %llx "
>>   			     "ent %llxn", vcpu->arch.mmu->root_level, pfn,
>>   			     hpa, *sptep);
>> +
>> +	kvm_release_pfn_clean(pfn);
>>   }
>>   
>>   static void inspect_spte_has_rmap(struct kvm *kvm, u64 *sptep)
>> -- 
>> 2.32.0.93.g670b81a890-goog
>>
>>
> 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
