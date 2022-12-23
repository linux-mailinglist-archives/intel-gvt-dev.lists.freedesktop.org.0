Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4D654A15
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6F110E5EB;
	Fri, 23 Dec 2022 00:58:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A45210E5F8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:02 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 h6-20020a17090aa88600b00223fccff2efso4000256pjq.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=ACcf4TIOY/KNCxT8YXaOwMosCx8LQofQdn0euCiCY4M=;
 b=TMBTtSKif9JQYrBRgC2Kk26Arhd33oSJssQxGXX/l24pjOtYOl3FvdMwZWJ1gMi8be
 fxmbPb0zXMsVCi1OjlfQel7xq87Va6mq6g/Ca3vzmLvdxVTKlW+1Q5rwQmDHpa7RT1bW
 1UfbKAXIuJxp0UmFpoguv7JwOpet+rHaqILtSPjCBepdHWNxYgrzerCuDKGQ78gVYADM
 K3tr43AkqFOOIuSyw/7t7XKS2KzvT+E6FucHlxZOO89VrQsP8riSCpTQBRNvLE43KMjj
 MAMf3oEGVz8uxC39pSO9satkIJA10i4iFcEgNSKCfejQPAsa5QzyABTCtrSsCnD+cbDL
 x8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ACcf4TIOY/KNCxT8YXaOwMosCx8LQofQdn0euCiCY4M=;
 b=1IlPK7+CYSOuqN8wnehOU6zBzagsMM2PPd1r8wW0gTJS+m2xMBemMTik4Nb/DOBd5J
 y5Uq9SHbpEK+U7TeRq8mA+KBsAEAYc23w0hOkOkZ7O6SQ/I6fU4GpJriVrw97QoU9xr+
 +2ZznCSDLOSqXdkYltrp2bE6kSlmW47TSzXF1mp8HdpcBcqq7BndufBKpvQzIbvcOxC/
 TRS52+JNer1ywO7tPoUgOP9XCRIu7+3+Wezj7/QgKE+vgdWD40f5IkpJyBOIekGAFueG
 tcNTV4D3G9iCmgDOEBaMACk9ZN4zc2xl+Efc9Vvj3I0YvSAiYaZQ8gahJM7rVFqNHrea
 TN+g==
X-Gm-Message-State: AFqh2kpJtzV5Ud3gfzal8yqH0oGoO+mS30mE4uhm32ZWBtyB11egSmKp
 hJm5oPU+9yJkeEJ+XYJpLJmwfaSjvWs=
X-Google-Smtp-Source: AMrXdXuqqyTgcQHilI53SefEG/5sBcIEwh5xs70zEETtCu7A3Q44yDAHVNGxCdXtPPvHf1LR8O/lpRt7G1I=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4ca:b0:188:a51c:b570 with SMTP id
 o10-20020a170902d4ca00b00188a51cb570mr461459plg.7.1671757081979; Thu, 22 Dec
 2022 16:58:01 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:22 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-11-seanjc@google.com>
Subject: [PATCH 10/27] KVM: x86/mmu: Don't rely on page-track mechanism to
 flush on memslot change
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Call kvm_mmu_zap_all_fast() directly when flushing a memslot instead of
bounding through the page-track mechanism.  KVM (unfortunately) needs to
zap and flush all page tables on memslot DELETE/MOVE irrespective of
whether KVM is shadowing guest page tables.

This will allow changing KVM to register a page-track notifier on the
first shadow root allocation, and will also allow deleting the misguided
kvm_page_track_flush_slot() hook itself once KVM-GT also moves to a
different method for reacting to memslot changes.

No functional change intended.

Cc: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/r/20221110014821.1548347-2-seanjc@google.com
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/mmu/mmu.c          | 10 +---------
 arch/x86/kvm/x86.c              |  2 ++
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index aa4eb8cfcd7e..fcb042f971ee 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1798,6 +1798,7 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
 void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
 				   const struct kvm_memory_slot *memslot);
 void kvm_mmu_zap_all(struct kvm *kvm);
+void kvm_mmu_zap_all_fast(struct kvm *kvm);
 void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen);
 void kvm_mmu_change_mmu_pages(struct kvm *kvm, unsigned long kvm_nr_mmu_pages);
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ca7428b68eba..8c3a453554ed 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6009,7 +6009,7 @@ static void kvm_zap_obsolete_pages(struct kvm *kvm)
  * not use any resource of the being-deleted slot or all slots
  * after calling the function.
  */
-static void kvm_mmu_zap_all_fast(struct kvm *kvm)
+void kvm_mmu_zap_all_fast(struct kvm *kvm)
 {
 	lockdep_assert_held(&kvm->slots_lock);
 
@@ -6065,13 +6065,6 @@ static bool kvm_has_zapped_obsolete_pages(struct kvm *kvm)
 	return unlikely(!list_empty_careful(&kvm->arch.zapped_obsolete_pages));
 }
 
-static void kvm_mmu_invalidate_zap_pages_in_memslot(struct kvm *kvm,
-			struct kvm_memory_slot *slot,
-			struct kvm_page_track_notifier_node *node)
-{
-	kvm_mmu_zap_all_fast(kvm);
-}
-
 int kvm_mmu_init_vm(struct kvm *kvm)
 {
 	struct kvm_page_track_notifier_node *node = &kvm->arch.mmu_sp_tracker;
@@ -6089,7 +6082,6 @@ int kvm_mmu_init_vm(struct kvm *kvm)
 	}
 
 	node->track_write = kvm_mmu_pte_write;
-	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
 	kvm_page_track_register_notifier(kvm, node);
 
 	kvm->arch.split_page_header_cache.kmem_cache = mmu_page_header_cache;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 312aea1854ae..af0d83e33bc4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12599,6 +12599,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
+	kvm_mmu_zap_all_fast(kvm);
+
 	kvm_page_track_flush_slot(kvm, slot);
 }
 
-- 
2.39.0.314.g84b9a713c41-goog

