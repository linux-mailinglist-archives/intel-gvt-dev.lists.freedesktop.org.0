Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6686258E5
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 11:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797EF10E7ED;
	Fri, 11 Nov 2022 10:56:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9C810E7ED;
 Fri, 11 Nov 2022 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668164203; x=1699700203;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=u7QIWUi0C6/FBWEuiDhVYicRF9D5dHYcVP0Zb/o5lgM=;
 b=IbNuZXiGuAg/xzRtMi5TEzGdW564+9OE8b1PXsFm3EGMGDev7jKgq2h8
 VZTbsxJXwd3wyrCIWHACvhZ+xeD1CQ/CVvhXjeITLnSZ2E072s9/N/mOT
 KDI728URM/67mTm0A722SCJR1aPNBkc6Ux/zo9GdXv2c8VkpSkjHaqtsk
 +k7xKzfQYSe7JVAnAtsxxdzX3te75pkT6Da2JhEVJrYs7pa1rfCngkZW/
 rIhWgQ7dUfbtFXC3opl0i+drO5QzyFLw4mq0XlqeL4gor222TFTQYehQU
 DMH14nrcErxFAmJe/fyq8FYGZgW+ECneC5/fLklIhpS5KE4wd19JyP287 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="375838628"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="375838628"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:56:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="637549316"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="637549316"
Received: from yzhao56-desk.sh.intel.com ([10.238.200.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:56:40 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: x86: add a new page track hook track_remove_slot
Date: Fri, 11 Nov 2022 18:33:50 +0800
Message-Id: <20221111103350.22326-1-yan.y.zhao@intel.com>
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

Page track hook track_remove_slot is used to notify users that a slot
has been removed and is called when a slot DELETE/MOVE is about to be
completed.

Users of this hook can drop write protections in the removed slot.

Note:
Since KVM_MR_MOVE currently never actually happens in KVM/QEMU, and has
never been properly supported in the external page track user, we just
use the hook track_remove_slot to notify users of the old slot being
removed.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 arch/x86/include/asm/kvm_page_track.h | 11 +++++++++++
 arch/x86/kvm/mmu/page_track.c         | 26 ++++++++++++++++++++++++++
 arch/x86/kvm/x86.c                    |  3 +++
 3 files changed, 40 insertions(+)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index eb186bc57f6a..046b024d1813 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -44,6 +44,16 @@ struct kvm_page_track_notifier_node {
 	 */
 	void (*track_flush_slot)(struct kvm *kvm, struct kvm_memory_slot *slot,
 			    struct kvm_page_track_notifier_node *node);
+	/*
+	 * It is called when memory slot is moved or removed
+	 * users can drop write-protection for the pages in that memory slot
+	 *
+	 * @kvm: the kvm where memory slot being moved or removed
+	 * @slot: the memory slot being moved or removed
+	 * @node: this node
+	 */
+	void (*track_remove_slot)(struct kvm *kvm, struct kvm_memory_slot *slot,
+				  struct kvm_page_track_notifier_node *node);
 };
 
 int kvm_page_track_init(struct kvm *kvm);
@@ -76,4 +86,5 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
 void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 			  int bytes);
 void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
+void kvm_page_track_remove_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
 #endif
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 2e09d1b6249f..4d6bab1d61c9 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -300,3 +300,29 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
 			n->track_flush_slot(kvm, slot, n);
 	srcu_read_unlock(&head->track_srcu, idx);
 }
+
+/*
+ * Notify the node that memory slot is removed or moved so that it can
+ * drop write-protection for the pages in the memory slot.
+ *
+ * The node should figure out it has any write-protected pages in this slot
+ * by itself.
+ */
+void kvm_page_track_remove_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
+{
+	struct kvm_page_track_notifier_head *head;
+	struct kvm_page_track_notifier_node *n;
+	int idx;
+
+	head = &kvm->arch.track_notifier_head;
+
+	if (hlist_empty(&head->track_notifier_list))
+		return;
+
+	idx = srcu_read_lock(&head->track_srcu);
+	hlist_for_each_entry_srcu(n, &head->track_notifier_list, node,
+				srcu_read_lock_held(&head->track_srcu))
+		if (n->track_remove_slot)
+			n->track_remove_slot(kvm, slot, n);
+	srcu_read_unlock(&head->track_srcu, idx);
+}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 916ebbc81e52..a24a4a2ad1a0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12844,6 +12844,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
+	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
+		kvm_page_track_remove_slot(kvm, old);
+
 	if (!kvm->arch.n_requested_mmu_pages &&
 	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE)) {
 		unsigned long nr_mmu_pages;
-- 
2.17.1

