Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05D78E632
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Aug 2023 08:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EB210E16F;
	Thu, 31 Aug 2023 06:20:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDB710E16F;
 Thu, 31 Aug 2023 06:20:46 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a9b41ffe11so248726b6e.2; 
 Wed, 30 Aug 2023 23:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693462846; x=1694067646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X+jqy6UmwlpXKBUUM0ud5ESOAXmNXokCUc660IroIvM=;
 b=jWluWSumhJgUni5Y81Tgl/awFXAym4Vg+n+wRp+ve7fEixh+hF6M8wj9qjVW89cq4L
 4JKd7bqeeq6gwEC/5ccY1Zqt/fjFTDOVo0nDwG54nygLJuN0GUvwkcSXfGGS2fmF98dI
 k1NwtsligPaYbE9+03QbU3L/CIacNkn+dyE9zhCWXhnmgsm42Xv6B7Nb2gyP2eyu/DlR
 O/fIzMyka9prIP0u/F3aMo046QJo/z5ivZkO/tZ9XXH17GPOvcDENmO2JQHYbCKZfySb
 c1261BOO+5cx2z9c1dsPpKogBLNB8x9VNZXMw0geEwXM8F+XkAJgcSfu4Q57qyaT5GPR
 8bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693462846; x=1694067646;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X+jqy6UmwlpXKBUUM0ud5ESOAXmNXokCUc660IroIvM=;
 b=e96k6F85aPGS8KbM8WvdEXecBO8KZKrIMXFzcxaXOxJuYvunAhzBBfYLpoGcmTgiYt
 9mbWgYOIOxcZixUTg3Xzw+w8WYk6qJKfVtT/ukuK3FPbLga3NPQjZxz2CVTqmD4pNKuV
 EWBjPrCLSvLUvWBvqyq4Am8DWsaV/hcDQBKhVH7mc5Xmf0snsHmgiyIKvmQsrNKNZ8jC
 5HSMHjDnbPzBtIsOisHJxNsgbZSW8huSltHCy1XJLIv5VOHsCNojkq44e/Cn1/RCZbOm
 8k+wRB0TX5moDYibvd3c5uefeqz1aTzOhHnyjyg3u/8FJKjTJtxg2hqxXi2yS7QyaIBk
 Gs4A==
X-Gm-Message-State: AOJu0Yx7keYntD1xW94qjkuEuxguAmesPdf9kUWqWg/uCdh2m0h7dO9o
 KMwgWvuYvCwUNnTS3hHxcaitUApGB4lKnyk3
X-Google-Smtp-Source: AGHT+IEMBcOqG/sFHsxtiZ12bSJJWByAijh/EpFU8UYpq6Ez8S4hxINVnRdMSzRNuGUGSMBh1MMBzQ==
X-Received: by 2002:a54:4587:0:b0:3a7:4876:6044 with SMTP id
 z7-20020a544587000000b003a748766044mr3652539oib.52.1693462845705; 
 Wed, 30 Aug 2023 23:20:45 -0700 (PDT)
Received: from [192.168.255.10] ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a17090a6a8b00b0026b420ae167sm2188559pjj.17.2023.08.30.23.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 23:20:44 -0700 (PDT)
Message-ID: <7a6488f2-fef4-6709-6a95-168b0c034ff4@gmail.com>
Date: Thu, 31 Aug 2023 14:20:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 16/29] KVM: x86: Reject memslot MOVE operations if
 KVMGT is attached
To: Sean Christopherson <seanjc@google.com>
References: <20230729013535.1070024-1-seanjc@google.com>
 <20230729013535.1070024-17-seanjc@google.com>
 <6c691bc5-dbfc-46f9-8c09-9c74c51d8708@gmail.com>
 <ZO+roobNH2QbZZWn@google.com>
Content-Language: en-US
From: Like Xu <like.xu.linux@gmail.com>
In-Reply-To: <ZO+roobNH2QbZZWn@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 31/8/2023 4:50 am, Sean Christopherson wrote:
> On Wed, Aug 30, 2023, Like Xu wrote:
>> On 2023/7/29 09:35, Sean Christopherson wrote:
>>> Disallow moving memslots if the VM has external page-track users, i.e. if
>>> KVMGT is being used to expose a virtual GPU to the guest, as KVMGT doesn't
>>> correctly handle moving memory regions.
>>>
>>> Note, this is potential ABI breakage!  E.g. userspace could move regions
>>> that aren't shadowed by KVMGT without harming the guest.  However, the
>>> only known user of KVMGT is QEMU, and QEMU doesn't move generic memory
>>
>> This change breaks two kvm selftests:
>>
>> - set_memory_region_test;
>> - memslot_perf_test;
> 
> It shoudn't.  As of this patch, KVM doesn't register itself as a page-track user,
> i.e. KVMGT is the only remaining caller to kvm_page_track_register_notifier().
> Unless I messed up, the only way kvm_page_track_has_external_user() can return
> true is if KVMGT is attached to the VM.  The selftests most definitely don't do
> anything with KVMGT, so I don't see how they can fail.
> 
> Are you seeing actually failures?

$ set_memory_region_test
Testing KVM_RUN with zero added memory regions
Allowed number of memory slots: 32764
Adding slots 0..32763, each memory region with 2048K size
Testing MOVE of in-use region, 10 loops
==== Test Assertion Failure ====
   lib/kvm_util.c:1163: !ret
   pid=52788 tid=52788 errno=22 - Invalid argument
      1	0x0000000000405ede: vm_mem_region_move at kvm_util.c:1161
      2	0x000000000040272a: test_move_memory_region at set_memory_region_test.c:195
      3	 (inlined by) main at set_memory_region_test.c:412
      4	0x00007f087423ad84: ?? ??:0
      5	0x00000000004029ed: _start at ??:?
   KVM_SET_USER_MEMORY_REGION failed
ret: -1 errno: 22 slot: 10 new_gpa: 0xbffff000

$ memslot_perf_test
Testing map performance with 1 runs, 5 seconds each
Memslot count too high for this test, decrease the cap (max is 8209)

Testing unmap performance with 1 runs, 5 seconds each
Test took 1.698964001s for slot setup + 5.020164088s all iterations
Done 43 iterations, avg 0.116748002s each
Best runtime result was 0.116748002s per iteration (with 43 iterations)

Testing unmap chunked performance with 1 runs, 5 seconds each
Test took 1.709885279s for slot setup + 5.028875257s all iterations
Done 44 iterations, avg 0.114292619s each
Best runtime result was 0.114292619s per iteration (with 44 iterations)

Testing move active area performance with 1 runs, 5 seconds each
==== Test Assertion Failure ====
   lib/kvm_util.c:1163: !ret
   pid=52779 tid=52779 errno=22 - Invalid argument
      1	0x0000000000406b4e: vm_mem_region_move at kvm_util.c:1161
      2	0x0000000000403686: test_memslot_move_loop at memslot_perf_test.c:624
      3	0x0000000000402c1c: test_execute at memslot_perf_test.c:828
      4	 (inlined by) test_loop at memslot_perf_test.c:1039
      5	 (inlined by) main at memslot_perf_test.c:1115
      6	0x00007fe01cc3ad84: ?? ??:0
      7	0x0000000000402fdd: _start at ??:?
   KVM_SET_USER_MEMORY_REGION failed
ret: -1 errno: 22 slot: 32763 new_gpa: 0x30010000

At one point I wondered if some of the less common kconfig's were enabled,
but the above two test failures could be easily fixed with the following diff:

diff --git a/arch/x86/kvm/mmu/page_track.h b/arch/x86/kvm/mmu/page_track.h
index 62f98c6c5af3..d4d72ed999b1 100644
--- a/arch/x86/kvm/mmu/page_track.h
+++ b/arch/x86/kvm/mmu/page_track.h
@@ -32,7 +32,7 @@ void kvm_page_track_delete_slot(struct kvm *kvm, struct 
kvm_memory_slot *slot);

  static inline bool kvm_page_track_has_external_user(struct kvm *kvm)
  {
-	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
+	return !hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
  }
  #else
  static inline int kvm_page_track_init(struct kvm *kvm) { return 0; }

, so I guess it's pretty obvious what's going on here.

> 
>> Please help confirm if the tests/doc needs to be updated,
>> or if the assumption needs to be further clarified.
> 
> What assumption?
> 
>>> regions.  KVM's own support for moving memory regions was also broken for
>>> multiple years (albeit for an edge case, but arguably moving RAM is
>>> itself an edge case), e.g. see commit edd4fa37baa6 ("KVM: x86: Allocate
>>> new rmap and large page tracking when moving memslot").
>>>
>>> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
>>> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>> ---
>>>    arch/x86/include/asm/kvm_page_track.h | 3 +++
>>>    arch/x86/kvm/mmu/page_track.c         | 5 +++++
>>>    arch/x86/kvm/x86.c                    | 7 +++++++
>>>    3 files changed, 15 insertions(+)
>>>
>>> diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
>>> index 8c4d216e3b2b..f744682648e7 100644
>>> --- a/arch/x86/include/asm/kvm_page_track.h
>>> +++ b/arch/x86/include/asm/kvm_page_track.h
>>> @@ -75,4 +75,7 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
>>>    void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
>>>    			  int bytes);
>>>    void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
>>> +
>>> +bool kvm_page_track_has_external_user(struct kvm *kvm);
>>> +
>>>    #endif
>>> diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
>>> index 891e5cc52b45..e6de9638e560 100644
>>> --- a/arch/x86/kvm/mmu/page_track.c
>>> +++ b/arch/x86/kvm/mmu/page_track.c
>>> @@ -303,3 +303,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
>>>    			n->track_flush_slot(kvm, slot, n);
>>>    	srcu_read_unlock(&head->track_srcu, idx);
>>>    }
>>> +
>>> +bool kvm_page_track_has_external_user(struct kvm *kvm)
>>> +{
>>> +	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
>>> +}
>>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>>> index 059571d5abed..4394bb49051f 100644
>>> --- a/arch/x86/kvm/x86.c
>>> +++ b/arch/x86/kvm/x86.c
>>> @@ -12606,6 +12606,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>>    				   struct kvm_memory_slot *new,
>>>    				   enum kvm_mr_change change)
>>>    {
>>> +	/*
>>> +	 * KVM doesn't support moving memslots when there are external page
>>> +	 * trackers attached to the VM, i.e. if KVMGT is in use.
>>> +	 */
>>> +	if (change == KVM_MR_MOVE && kvm_page_track_has_external_user(kvm))
>>> +		return -EINVAL;
>>> +
>>>    	if (change == KVM_MR_CREATE || change == KVM_MR_MOVE) {
>>>    		if ((new->base_gfn + new->npages - 1) > kvm_mmu_max_gfn())
>>>    			return -EINVAL;
