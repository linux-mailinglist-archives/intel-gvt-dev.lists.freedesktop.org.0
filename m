Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53878D6CD
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Aug 2023 17:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761C10E549;
	Wed, 30 Aug 2023 15:04:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947E110E549;
 Wed, 30 Aug 2023 15:04:30 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68bec3a1c0fso4180466b3a.1; 
 Wed, 30 Aug 2023 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693407870; x=1694012670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BY1v90+5NSPW40nepdwawsmQXXDE6gdV3lwX6BIPunA=;
 b=Mb+xyE/xiJ6C1gSJu/qbjA8Al7GQZdNZUz//cs2DouvJYS/guRV/06VZXEo8KnZSSB
 C5Sw+DiUo+Inmnv/9q95IhrGtoTy7Kvq9pXTDHzB9h78uRNQOd0iFVuuTPi1gCjnqcGJ
 jDh/c3akLYzD0BgtcLsXka8MzLTHwCauzggAabMpIDIuWDBOeV7/a0yUiHU1PbOd7Kcg
 4ltMZbogaDRKvkFEOqJDs8I2A5/bCdEbT26pIhg8gjDvXSd6aRH6/3nfixzDRn2+oeFP
 +Gk1OnR1Ko1iX2idw9KJFPOqYvlaFrKPlB+7KSo2XdebdJ00mOyTvNJX/6+wJ4USPXvY
 VSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693407870; x=1694012670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BY1v90+5NSPW40nepdwawsmQXXDE6gdV3lwX6BIPunA=;
 b=SFISaLYDa8aUI/hPNh6ynmtRrmrW3FhwUkee8oQftgi+JczY1NCHYz5ziiVvh/9kcX
 QXYqaZe6nbixNtoPdTjaFwiU3FOok7fjyfZ8S2219Hz92+mjCdnvq0QbVnGZzxYxJJ34
 pneaIJqtvFxeiE2lLDhjpYEdrD6jsDGJ7Ai75jw5/L2/9h6LHjcG9B8OOD51Z7hvHXTH
 ZsC3DVLlBt4TWxMstvGVAJq3D8ZiR/xjfGqAHoetzguHSx9sOToVDok671fNByGei6jN
 75ZiTLPY8mC0Jq0LJZ2iMM4iDsRDIxYDCUU5c6IEgBE/RHi+rYaFZqg9Z88+edQSu4WT
 G27Q==
X-Gm-Message-State: AOJu0YxCp5XdteTYZaZpgoySCUrBNNstWyY51JsMJT4vpEebZ6CtZhVo
 2/dtpB4aCmTRKY/MUGgqOJ0=
X-Google-Smtp-Source: AGHT+IHRm7rtzj81ZlIYH0T79lr+GUMNzYCHKFMVKdWz4gEygQ5O/SCsRCq+FFjEb1B0FGxf56amUA==
X-Received: by 2002:a05:6a21:9997:b0:14c:c767:a56a with SMTP id
 ve23-20020a056a21999700b0014cc767a56amr2949112pzb.25.1693407869896; 
 Wed, 30 Aug 2023 08:04:29 -0700 (PDT)
Received: from [192.168.255.10] ([101.80.250.8])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa79055000000b00682a908949bsm10496088pfo.92.2023.08.30.08.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 08:04:29 -0700 (PDT)
Message-ID: <6c691bc5-dbfc-46f9-8c09-9c74c51d8708@gmail.com>
Date: Wed, 30 Aug 2023 23:04:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 16/29] KVM: x86: Reject memslot MOVE operations if
 KVMGT is attached
To: Sean Christopherson <seanjc@google.com>
References: <20230729013535.1070024-1-seanjc@google.com>
 <20230729013535.1070024-17-seanjc@google.com>
From: Like Xu <like.xu.linux@gmail.com>
In-Reply-To: <20230729013535.1070024-17-seanjc@google.com>
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

On 2023/7/29 09:35, Sean Christopherson wrote:
> Disallow moving memslots if the VM has external page-track users, i.e. if
> KVMGT is being used to expose a virtual GPU to the guest, as KVMGT doesn't
> correctly handle moving memory regions.
> 
> Note, this is potential ABI breakage!  E.g. userspace could move regions
> that aren't shadowed by KVMGT without harming the guest.  However, the
> only known user of KVMGT is QEMU, and QEMU doesn't move generic memory

This change breaks two kvm selftests:

- set_memory_region_test;
- memslot_perf_test;

Please help confirm if the tests/doc needs to be updated,
or if the assumption needs to be further clarified.

> regions.  KVM's own support for moving memory regions was also broken for
> multiple years (albeit for an edge case, but arguably moving RAM is
> itself an edge case), e.g. see commit edd4fa37baa6 ("KVM: x86: Allocate
> new rmap and large page tracking when moving memslot").
> 
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/include/asm/kvm_page_track.h | 3 +++
>   arch/x86/kvm/mmu/page_track.c         | 5 +++++
>   arch/x86/kvm/x86.c                    | 7 +++++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
> index 8c4d216e3b2b..f744682648e7 100644
> --- a/arch/x86/include/asm/kvm_page_track.h
> +++ b/arch/x86/include/asm/kvm_page_track.h
> @@ -75,4 +75,7 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
>   void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
>   			  int bytes);
>   void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
> +
> +bool kvm_page_track_has_external_user(struct kvm *kvm);
> +
>   #endif
> diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> index 891e5cc52b45..e6de9638e560 100644
> --- a/arch/x86/kvm/mmu/page_track.c
> +++ b/arch/x86/kvm/mmu/page_track.c
> @@ -303,3 +303,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
>   			n->track_flush_slot(kvm, slot, n);
>   	srcu_read_unlock(&head->track_srcu, idx);
>   }
> +
> +bool kvm_page_track_has_external_user(struct kvm *kvm)
> +{
> +	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
> +}
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 059571d5abed..4394bb49051f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12606,6 +12606,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>   				   struct kvm_memory_slot *new,
>   				   enum kvm_mr_change change)
>   {
> +	/*
> +	 * KVM doesn't support moving memslots when there are external page
> +	 * trackers attached to the VM, i.e. if KVMGT is in use.
> +	 */
> +	if (change == KVM_MR_MOVE && kvm_page_track_has_external_user(kvm))
> +		return -EINVAL;
> +
>   	if (change == KVM_MR_CREATE || change == KVM_MR_MOVE) {
>   		if ((new->base_gfn + new->npages - 1) > kvm_mmu_max_gfn())
>   			return -EINVAL;
