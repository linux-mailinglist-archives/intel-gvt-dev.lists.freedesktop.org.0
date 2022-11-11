Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7762578B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 11:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02FC10E7EA;
	Fri, 11 Nov 2022 10:01:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FCA10E7E4;
 Fri, 11 Nov 2022 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668160869; x=1699696869;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Oq0v5r5lyxdfiPIBLLI4trHp9sSEgQSGrg182cZ3Cpo=;
 b=WQ5nzYdmRT9qXgdCvzwJV7NFMmm5xCZ0n00J6VKUhIf9C19DFVyDfFid
 BlkaEqKg8oCI5vOE0QqARUWwyb/MyuwBqOcOwVhBtg0IVizBSsKyG9VW8
 Pu4IJpMhwriXe0Ws2O73iefrCXjQP2esu+3Y2ak+fEOOsquxQeB3M9OSc
 HSKgoCq3ApPi130DcAZwk5GW2J/aOqKtWy7Rxq8UU/oEIf8+aWLocuVxW
 9PqCu4i+D2tppPuwO2DVOkWsYWiLbKbf6EeSPf8Djxr/JMklRsFsnJC1t
 fMdfKEoqlPEShKvcGByMFoZqeL7JYwEMRTB8zAwkFf4MaDRAnRc/kgf5B w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291290404"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="291290404"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:01:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="706497697"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="706497697"
Received: from yzhao56-desk.sh.intel.com ([10.238.200.254])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:01:06 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] KVM: x86: Remove the unused page track hook
 track_flush_slot
Date: Fri, 11 Nov 2022 17:38:26 +0800
Message-Id: <20221111093826.3330-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111093222.3148-1-yan.y.zhao@intel.com>
References: <20221111093222.3148-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, seanjc@google.com,
 intel-gfx@lists.freedesktop.org, zhenyuw@linux.intel.com, pbonzini@redhat.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

There's no users of hook track_remove_slot any more and no external page
tracker user cares about slot flush.
So remove this hook.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Suggested-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 arch/x86/include/asm/kvm_page_track.h | 11 -----------
 arch/x86/kvm/mmu/page_track.c         | 26 --------------------------
 arch/x86/kvm/x86.c                    |  2 --
 3 files changed, 39 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index 046b024d1813..4f1d3c91fdc7 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -34,16 +34,6 @@ struct kvm_page_track_notifier_node {
 	 */
 	void (*track_write)(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 			    int bytes, struct kvm_page_track_notifier_node *node);
-	/*
-	 * It is called when memory slot is being moved or removed
-	 * users can drop write-protection for the pages in that memory slot
-	 *
-	 * @kvm: the kvm where memory slot being moved or removed
-	 * @slot: the memory slot being moved or removed
-	 * @node: this node
-	 */
-	void (*track_flush_slot)(struct kvm *kvm, struct kvm_memory_slot *slot,
-			    struct kvm_page_track_notifier_node *node);
 	/*
 	 * It is called when memory slot is moved or removed
 	 * users can drop write-protection for the pages in that memory slot
@@ -85,6 +75,5 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
 				   struct kvm_page_track_notifier_node *n);
 void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 			  int bytes);
-void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_page_track_remove_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
 #endif
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 4d6bab1d61c9..f783aea618f8 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -275,32 +275,6 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 	srcu_read_unlock(&head->track_srcu, idx);
 }
 
-/*
- * Notify the node that memory slot is being removed or moved so that it can
- * drop write-protection for the pages in the memory slot.
- *
- * The node should figure out it has any write-protected pages in this slot
- * by itself.
- */
-void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
-{
-	struct kvm_page_track_notifier_head *head;
-	struct kvm_page_track_notifier_node *n;
-	int idx;
-
-	head = &kvm->arch.track_notifier_head;
-
-	if (hlist_empty(&head->track_notifier_list))
-		return;
-
-	idx = srcu_read_lock(&head->track_srcu);
-	hlist_for_each_entry_srcu(n, &head->track_notifier_list, node,
-				srcu_read_lock_held(&head->track_srcu))
-		if (n->track_flush_slot)
-			n->track_flush_slot(kvm, slot, n);
-	srcu_read_unlock(&head->track_srcu, idx);
-}
-
 /*
  * Notify the node that memory slot is removed or moved so that it can
  * drop write-protection for the pages in the memory slot.
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a24a4a2ad1a0..260288f4d741 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12872,8 +12872,6 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
 	kvm_mmu_zap_all_fast(kvm);
-
-	kvm_page_track_flush_slot(kvm, slot);
 }
 
 static inline bool kvm_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
-- 
2.17.1

