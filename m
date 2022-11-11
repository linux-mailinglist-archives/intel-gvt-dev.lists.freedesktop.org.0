Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F36258ED
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 11:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895E310E7FF;
	Fri, 11 Nov 2022 10:58:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC1810E7ED;
 Fri, 11 Nov 2022 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668164282; x=1699700282;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=rdP472iIcXARHSPftEHD7qv99p1yFZZR6gsVvb/7Mfg=;
 b=IDUcgEUNByigDcpPWmJAQ5hx/M/FMhxa6Y/tQAWhwiLe2lm57yR0DjzB
 aDs8tHga1ORQPeIi3ka6m8/pQoUu6r91GmAP9V5iHUaeIJC6x005qiAzi
 75MKPD2OZZ3PcyaNLS8+X/VeqJSs/Qk+ZnMdpnFJvqqcBpcqdM2wHBeCE
 vPwaH4VgJJ0ZyrgdOQLXAdQ40Pu97LrPePqHmDVYJh6qLPBfRsR81g92J
 0E6R35V0+BTQUJA1fHcGf86j3h21yVoxA5uyU4gcL0Vl3foWMSPZf/CGy
 DhwH7KVkGzz+jK1vf9za4v7rFi36Oo8yovZFXf5cjCiodz9TiwP1JcFnd A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="313364809"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="313364809"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:58:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="706509732"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="706509732"
Received: from yzhao56-desk.sh.intel.com ([10.238.200.254])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:57:59 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] KVM: x86: Remove the unused page track hook
 track_flush_slot
Date: Fri, 11 Nov 2022 18:35:04 +0800
Message-Id: <20221111103504.22431-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111103247.22275-1-yan.y.zhao@intel.com>
References: <20221111103247.22275-1-yan.y.zhao@intel.com>
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
Suggested-by: Sean Christopherson <seanjc@google.com>
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

