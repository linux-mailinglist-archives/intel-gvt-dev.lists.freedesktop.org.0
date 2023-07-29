Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18B767AF2
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D441610E7C1;
	Sat, 29 Jul 2023 01:36:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0610E7C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:07 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d2a7ec86216so512279276.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594567; x=1691199367;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=mQ+ZuzEFbl5O8mlpWOHgtbjc+Hc/5HoNzhozE45JaLU=;
 b=WZConVgDmS5EmLUtUW3mWU7S8RxEZOVUVAu20Avyg+dOT8q99nTIpuz55xULKWjISw
 iCAurxgWrZk5icw5zY5sztJnmPPEWtvRbD0q5iScqHoLph8A+Trwc9DE/7E+yCbSArRH
 096LUklzL9PKq5+7HD3ZdjHqQKTNSLFEp4UUvOIah0va5NhjfqhpczKpIhbbpdSoqBDd
 /cGZ3dGKnFyE7j7LlLeysb6brynTp1h/cN3eXU8/k167F4MM7x8Jz4AMq8txNwYoq7kz
 AT8lnb9euANf7Knv+9SQX9b42mS+B949wl6d6R8Hqd1o33mEljeyuwvXAaZrbwAZKY5H
 xm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594567; x=1691199367;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mQ+ZuzEFbl5O8mlpWOHgtbjc+Hc/5HoNzhozE45JaLU=;
 b=Z4AUU/yiLeF9jvwTuuVtYMWTe1kWYMi3kBXh6ejutCJjdvsEY1td7Pl8cShugiqDL4
 GwU7o9bHQ9m8jY3kGRz06YnPoiJGh//YmFeZPlUcL1JCeg3l2pqMLB9bWAJXqD3LkLBO
 vKWWSboUbF4qk6KQ5YkMZNGCixBdgRN3GrJ3WQhBbw7OVLjC2gjoCBqS71F5qNs0r6Fd
 /kKbOt75Z8Z85RP676uBVahwUFTxMJcKHfEaSTkUpovneSVaPpUUb0D4iqhJNcu5C5kz
 1NVwEj8JqMpBzuyFMeiKgIy4ylWcWDYMnWOigokuSyspVO2KViFFLIPFPVXwgOSbpSRd
 EBFA==
X-Gm-Message-State: ABy/qLYI5VSSkbYBgRhgmpW2GnXacGx1XffhWTkHXUJQ/FyuPXJUkoTM
 xaULcF0xUGlHwDqWULFjXNNxISGxH7U=
X-Google-Smtp-Source: APBJJlFQ3hhnV1P7ciVR0dYoESD3XPJ++F/enrXhmW6nGDeuy1gJ4hjm9TqahxJ6bBSca1yu04RHJYuqicA=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2057:0:b0:c41:4696:e879 with SMTP id
 g84-20020a252057000000b00c414696e879mr17328ybg.7.1690594566810; Fri, 28 Jul
 2023 18:36:06 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:18 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-13-seanjc@google.com>
Subject: [PATCH v4 12/29] KVM: x86/mmu: Move kvm_arch_flush_shadow_{all,
 memslot}() to mmu.c
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
 Yongwei Ma <yongwei.ma@intel.com>, Ben Gardon <bgardon@google.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Move x86's implementation of kvm_arch_flush_shadow_{all,memslot}() into
mmu.c, and make kvm_mmu_zap_all() static as it was globally visible only
for kvm_arch_flush_shadow_all().  This will allow refactoring
kvm_arch_flush_shadow_memslot() to call kvm_mmu_zap_all() directly without
having to expose kvm_mmu_zap_all_fast() outside of mmu.c.  Keeping
everything in mmu.c will also likely simplify supporting TDX, which
intends to do zap only relevant SPTEs on memslot updates.

No functional change intended.

Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/mmu/mmu.c          | 13 ++++++++++++-
 arch/x86/kvm/x86.c              | 11 -----------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 28bd38303d70..856ec22aceb6 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1832,7 +1832,6 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
 				   const struct kvm_memory_slot *memslot);
 void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
 				   const struct kvm_memory_slot *memslot);
-void kvm_mmu_zap_all(struct kvm *kvm);
 void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen);
 void kvm_mmu_change_mmu_pages(struct kvm *kvm, unsigned long kvm_nr_mmu_pages);
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce..c6dee659d592 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6732,7 +6732,7 @@ void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
 	 */
 }
 
-void kvm_mmu_zap_all(struct kvm *kvm)
+static void kvm_mmu_zap_all(struct kvm *kvm)
 {
 	struct kvm_mmu_page *sp, *node;
 	LIST_HEAD(invalid_list);
@@ -6757,6 +6757,17 @@ void kvm_mmu_zap_all(struct kvm *kvm)
 	write_unlock(&kvm->mmu_lock);
 }
 
+void kvm_arch_flush_shadow_all(struct kvm *kvm)
+{
+	kvm_mmu_zap_all(kvm);
+}
+
+void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
+				   struct kvm_memory_slot *slot)
+{
+	kvm_page_track_flush_slot(kvm, slot);
+}
+
 void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen)
 {
 	WARN_ON(gen & KVM_MEMSLOT_GEN_UPDATE_IN_PROGRESS);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a6b9bea62fb8..059571d5abed 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12776,17 +12776,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 		kvm_arch_free_memslot(kvm, old);
 }
 
-void kvm_arch_flush_shadow_all(struct kvm *kvm)
-{
-	kvm_mmu_zap_all(kvm);
-}
-
-void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
-				   struct kvm_memory_slot *slot)
-{
-	kvm_page_track_flush_slot(kvm, slot);
-}
-
 static inline bool kvm_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
 {
 	return (is_guest_mode(vcpu) &&
-- 
2.41.0.487.g6d72f3e995-goog

