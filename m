Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B023B294F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Jun 2021 09:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0506EA62;
	Thu, 24 Jun 2021 07:31:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692C96EA32
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624519878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ummzXLEBVOW6zJVjd9RvyjdRwJ4z9g5ls7IEU8SqM4=;
 b=EKjWU/oCsLdpB6Ve8sDprlx/L0Jt05YjwP5nSO/SYUSh4gTC+85eoSZaZuuwdLQFSIEMWj
 qWrffPhvgFsjuYne1khKwc/x06PQHRVUPrUT3Ib2m+TuT4HlrzKGtbNqe1+p3MT6Q9vAeM
 Wh98VQCon2LWEZOpu4LDd4QF+wj3dH8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-4vYZpb_eNrCJG3aoivClOA-1; Thu, 24 Jun 2021 03:31:15 -0400
X-MC-Unique: 4vYZpb_eNrCJG3aoivClOA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k3-20020a5d62830000b029011a69a4d069so1848324wru.21
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 00:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ummzXLEBVOW6zJVjd9RvyjdRwJ4z9g5ls7IEU8SqM4=;
 b=JA27vKRYk+geyYiayId6MxlhqPjNXH3sMZWyS8UvrWjPY5alWNlqO+onrVUKYMdlG+
 MFsdlfwX5keUW/ei6ZSySH2VXRgAc2sTFryPr9yN0Jv/HaItF/J7f0tZMXLapiDk8p0Q
 eyirVk6qLOA7yWFRmlJuHHDE8sfmns9ZAJs8+IoY7MHi7UkgdOvCA72hd2nOjYxDz8wD
 br2exxT2D3Z/mI8hgB2WamEm5CL5roT3hQmxsKDgJ9kLejfgMq+HxmSQhyB762TGy4i/
 qHa6pmX3yBDobcx+7Nw0k69qLfr/6FiNKrusaxaWK9xdn8euPgdLnHZ2kHhK93OHHRqo
 twGQ==
X-Gm-Message-State: AOAM530oxHq6Agjk5e9h+HqqUlidwoYd0OXkxIZGTZB6+p6M23m7TaKW
 PRX+DXAOTkhzFv2faBw4fH8pYYN8jn19tYk0NUCCddhAyBphRrDhVDRulk+Wn55MfXz0GDwRnpF
 bLSF5L0bxpft+pnx62DqXHSBPOLempWaIEg==
X-Received: by 2002:adf:f88e:: with SMTP id u14mr2674297wrp.391.1624519873867; 
 Thu, 24 Jun 2021 00:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmU2A8muf7XixWmRWMn8O50eJCa1GKEjZYZIlN1VsKBfgiuuBfyX9v0BcxFt1KFEfxAoHypw==
X-Received: by 2002:adf:f88e:: with SMTP id u14mr2674272wrp.391.1624519873717; 
 Thu, 24 Jun 2021 00:31:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f19sm2269746wre.48.2021.06.24.00.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:31:13 -0700 (PDT)
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To: David Stevens <stevensd@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-4-stevensd@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <49504c79-2cd4-1707-a0a5-79b679a4b214@redhat.com>
Date: Thu, 24 Jun 2021 09:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624035749.4054934-4-stevensd@google.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
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
>   static int __direct_map(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
> -			int map_writable, int max_level, kvm_pfn_t pfn,
> +			int map_writable, int max_level,
> +			const struct kvm_pfn_page *pfnpg,
>   			bool prefault, bool is_tdp)
>   {
>   	bool nx_huge_page_workaround_enabled = is_nx_huge_pa

So the main difference with my tentative patches is that here I was 
passing the struct by value.  I'll try to clean this up for 5.15, but 
for now it's all good like this.  Thanks again!

Paolo

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
