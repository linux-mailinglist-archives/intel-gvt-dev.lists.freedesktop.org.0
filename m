Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D178E6B5666
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B38010EA49;
	Sat, 11 Mar 2023 00:23:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B116E10EA47
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:27 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 k6-20020a25e806000000b00a623fca0d0aso7385562ybd.16
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494207;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6pZnJVg25eyMveIv3/duenR4ioTSWK21ILUn7ktJtk=;
 b=fW7SIHxJHBoSqAPEBOS5mWe5gfPekz/J4gy/C9npc9LGXg1kzzQmPSW2KEO5NfzKlp
 jis4mUml6dDwPYEJ5EZcT7y+L/sifVjanJbvSe1dSA76S2a3KcL+RGWUWj51mHMSGMK4
 23dVrVI1ebYRhkXY9xvQdAzQr5WZCSmGMsUEAL50y6nt/qHXnrf5wFxpXeQM1bXSuF96
 RrUQQVwdizUqSPQQZnZBxSly3MAIDFNYxQJCirto1mxjd6kBRO1QifVyyAt9NcJvSVCD
 QeD8M6UW1G8Rtt3ZXqUFXprmDp5ZSEdcEjgHi/biCE9qe7KO3/AZcKgH9hIp2RkMU2Nn
 Owqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494207;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q6pZnJVg25eyMveIv3/duenR4ioTSWK21ILUn7ktJtk=;
 b=reCnvwjX69vlWvXsPerhXscjelSdJtnCYtxdlKZ5mhPFQyPIqrtM6lYi5EmUHvT+UQ
 L9VUdKMGpD24/F0CFvQBhxIq8t1ThUglsfjYsQP1o3i/KOYN4YlX0cIEnEyAqNbzHMFl
 0gqCztnOjFDAKKIYZecDuIsZWCWrEusVYjI3zsyKkAUnfJ4bIzDc6CZgv97RirG4oJPS
 Nn2y6oXiS6YlukU6/NVcnTcBCtVUcuGPLljioGVIWASzOZ4yBxyWC1FiCXBcBUm72sFp
 lyj6eIXRCbiHm5cq+5/7XJ7nOrILeKOQENRQ1eHzv+ntvWhMIz2rXEorx7Mh7ybGt6GX
 Q1Rw==
X-Gm-Message-State: AO0yUKXWcjbfat4R81ABChT8vt8J77uX3W0Nu/bJl6o4g2nD4hq81LXU
 9DV4E7t88LdNRvw71W8LjnsHdbNG5LA=
X-Google-Smtp-Source: AK7set8PLWS0LgJdEMlnGsWe/+oN00JCQoIoDrltuwf20ow6dvSbBI2QU7f6C7ZLsFu9kLElsim6V3gV2u4=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:188:b0:a99:de9d:d504 with SMTP id
 t8-20020a056902018800b00a99de9dd504mr16643426ybh.12.1678494206913; Fri, 10
 Mar 2023 16:23:26 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:42 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-12-seanjc@google.com>
Subject: [PATCH v2 11/27] KVM: x86/mmu: Don't rely on page-track mechanism to
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
bouncing through the page-track mechanism.  KVM (unfortunately) needs to
zap and flush all page tables on memslot DELETE/MOVE irrespective of
whether KVM is shadowing guest page tables.

This will allow changing KVM to register a page-track notifier on the
first shadow root allocation, and will also allow deleting the misguided
kvm_page_track_flush_slot() hook itself once KVM-GT also moves to a
different method for reacting to memslot changes.

No functional change intended.

Cc: Yan Zhao <yan.y.zhao@intel.com>
Link: https://lore.kernel.org/r/20221110014821.1548347-2-seanjc@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/mmu/mmu.c          | 10 +---------
 arch/x86/kvm/x86.c              |  2 ++
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 808c292ad3f4..17281d6825c9 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1844,6 +1844,7 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
 void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
 				   const struct kvm_memory_slot *memslot);
 void kvm_mmu_zap_all(struct kvm *kvm);
+void kvm_mmu_zap_all_fast(struct kvm *kvm);
 void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen);
 void kvm_mmu_change_mmu_pages(struct kvm *kvm, unsigned long kvm_nr_mmu_pages);
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4685c80e441b..409dabec69df 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6030,7 +6030,7 @@ static void kvm_zap_obsolete_pages(struct kvm *kvm)
  * not use any resource of the being-deleted slot or all slots
  * after calling the function.
  */
-static void kvm_mmu_zap_all_fast(struct kvm *kvm)
+void kvm_mmu_zap_all_fast(struct kvm *kvm)
 {
 	lockdep_assert_held(&kvm->slots_lock);
 
@@ -6086,13 +6086,6 @@ static bool kvm_has_zapped_obsolete_pages(struct kvm *kvm)
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
@@ -6110,7 +6103,6 @@ int kvm_mmu_init_vm(struct kvm *kvm)
 	}
 
 	node->track_write = kvm_mmu_pte_write;
-	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
 	kvm_page_track_register_notifier(kvm, node);
 
 	kvm->arch.split_page_header_cache.kmem_cache = mmu_page_header_cache;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f706621c35b8..29dd6c97d145 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12662,6 +12662,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
+	kvm_mmu_zap_all_fast(kvm);
+
 	kvm_page_track_flush_slot(kvm, slot);
 }
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

