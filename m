Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93217767B16
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CD910E7D4;
	Sat, 29 Jul 2023 01:36:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DAC10E7D5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:36 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-c647150c254so4708096276.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594595; x=1691199395;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=amIVyFUDmr19Rdoy9QFBSwKKDRSCRSFyEk92UDANkXE=;
 b=RJRsOHCnRliqVLndbTLFcP4E0LRyhN5fJsyVcc6OyR4/hRry49lK7ZjA9puPsmz2KQ
 xKvxmxyk8FSLhM06pncJot5W2H4fdbkbUOxylhnc5AbuGMlS8fsn6yfIzOL3I9BJUOCB
 TLQ6fHpAysTqMVQwI8yepP+OKkRI1CtQbfcubnp83I34mjIC1J3b5du9CpBF6ntmMb1x
 Gt4Q5qytuJjxPBbt704v1awpMhhbZTh67zfIYgsgOj5WFvSA6iDjjN6VaNxypuV9yWqN
 X+YvlgPrYDTxnRfuP9Gztv9JQVImrn+z+EBcaGsTSNZOVhIK5Jy9/EFl4uEQ0mIqryPt
 gZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594595; x=1691199395;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=amIVyFUDmr19Rdoy9QFBSwKKDRSCRSFyEk92UDANkXE=;
 b=ikjG/wa1wyKPq3dP3QdGVfHOZG5GqArp0fzUZborPG6CJpwwcpKd3kYnJPVjZx23Ff
 CFk3bJzCOm1U7EUtBxNkRN1v+m8rZNCqLfuiMdBu6aXSLJKOmzZAS2QYeUslNLrxVFLJ
 TNJTh5LAtkjKapIFsyXaPu7qIwQCSG0KGRxsVP68sxrS0P3MD/2ufbc5168SjLfTA6Bd
 Xd14LC1YT8rLUY6PuumdqYO3S1MzSQW4FE5isSJBSzGvkfdPrs8qUfv2YD4A005qB+ho
 MUsVGQeEpG+Co+1WGKQwilT0qZJhUFdACAt/sg7UTWESeGEIWpIpybbolN9GjbbGP77Y
 rc4w==
X-Gm-Message-State: ABy/qLYFbdvtLKCweuI6J79cgvH3r6VVVdusS3YkEdogWojNGEvFw6V1
 CjYGVvdyZKj+JNrDL4oxwI8MY8Lm3wU=
X-Google-Smtp-Source: APBJJlEaHvLHRC1AZGizZcGovHew1Bh4VikIyu0fVrKKbCM6AapcazsxoYzmP/+h0QYxWieVJkKL4ovRVfc=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d702:0:b0:d29:958c:e431 with SMTP id
 o2-20020a25d702000000b00d29958ce431mr25262ybg.1.1690594595412; Fri, 28 Jul
 2023 18:36:35 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:33 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-28-seanjc@google.com>
Subject: [PATCH v4 27/29] KVM: x86/mmu: Drop @slot param from
 exported/external page-track APIs
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

Refactor KVM's exported/external page-track, a.k.a. write-track, APIs
to take only the gfn and do the required memslot lookup in KVM proper.
Forcing users of the APIs to get the memslot unnecessarily bleeds
KVM internals into KVMGT and complicates usage of the APIs.

No functional change intended.

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h |  7 +--
 arch/x86/kvm/mmu/mmu.c                |  4 +-
 arch/x86/kvm/mmu/page_track.c         | 85 ++++++++++++++++++++-------
 arch/x86/kvm/mmu/page_track.h         |  5 ++
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 37 +++---------
 5 files changed, 80 insertions(+), 58 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index f5c1db36cdb7..4afab697e21c 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -4,11 +4,6 @@
 
 #include <linux/kvm_types.h>
 
-void kvm_write_track_add_gfn(struct kvm *kvm,
-			     struct kvm_memory_slot *slot, gfn_t gfn);
-void kvm_write_track_remove_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-				gfn_t gfn);
-
 #ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 /*
  * The notifier represented by @kvm_page_track_notifier_node is linked into
@@ -55,6 +50,8 @@ kvm_page_track_register_notifier(struct kvm *kvm,
 void
 kvm_page_track_unregister_notifier(struct kvm *kvm,
 				   struct kvm_page_track_notifier_node *n);
+int kvm_write_track_add_gfn(struct kvm *kvm, gfn_t gfn);
+int kvm_write_track_remove_gfn(struct kvm *kvm, gfn_t gfn);
 #else
 /*
  * Allow defining a node in a structure even if page tracking is disabled, e.g.
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a0309fde3549..c6ae1885371c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -840,7 +840,7 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 
 	/* the non-leaf shadow pages are keeping readonly. */
 	if (sp->role.level > PG_LEVEL_4K)
-		return kvm_write_track_add_gfn(kvm, slot, gfn);
+		return __kvm_write_track_add_gfn(kvm, slot, gfn);
 
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
 
@@ -886,7 +886,7 @@ static void unaccount_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 	slots = kvm_memslots_for_spte_role(kvm, sp->role);
 	slot = __gfn_to_memslot(slots, gfn);
 	if (sp->role.level > PG_LEVEL_4K)
-		return kvm_write_track_remove_gfn(kvm, slot, gfn);
+		return __kvm_write_track_remove_gfn(kvm, slot, gfn);
 
 	kvm_mmu_gfn_allow_lpage(slot, gfn);
 }
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index eedb5889d73e..2a64df38ccab 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -74,16 +74,8 @@ static void update_gfn_write_track(struct kvm_memory_slot *slot, gfn_t gfn,
 	slot->arch.gfn_write_track[index] += count;
 }
 
-/*
- * add guest page to the tracking pool so that corresponding access on that
- * page will be intercepted.
- *
- * @kvm: the guest instance we are interested in.
- * @slot: the @gfn belongs to.
- * @gfn: the guest page.
- */
-void kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-			     gfn_t gfn)
+void __kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+			       gfn_t gfn)
 {
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
@@ -104,18 +96,9 @@ void kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
 		kvm_flush_remote_tlbs(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_write_track_add_gfn);
 
-/*
- * remove the guest page from the tracking pool which stops the interception
- * of corresponding access on that page.
- *
- * @kvm: the guest instance we are interested in.
- * @slot: the @gfn belongs to.
- * @gfn: the guest page.
- */
-void kvm_write_track_remove_gfn(struct kvm *kvm,
-				struct kvm_memory_slot *slot, gfn_t gfn)
+void __kvm_write_track_remove_gfn(struct kvm *kvm,
+				  struct kvm_memory_slot *slot, gfn_t gfn)
 {
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
@@ -133,7 +116,6 @@ void kvm_write_track_remove_gfn(struct kvm *kvm,
 	 */
 	kvm_mmu_gfn_allow_lpage(slot, gfn);
 }
-EXPORT_SYMBOL_GPL(kvm_write_track_remove_gfn);
 
 /*
  * check if the corresponding access on the specified guest page is tracked.
@@ -257,4 +239,63 @@ void kvm_page_track_delete_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
 	srcu_read_unlock(&head->track_srcu, idx);
 }
 
+/*
+ * add guest page to the tracking pool so that corresponding access on that
+ * page will be intercepted.
+ *
+ * @kvm: the guest instance we are interested in.
+ * @gfn: the guest page.
+ */
+int kvm_write_track_add_gfn(struct kvm *kvm, gfn_t gfn)
+{
+	struct kvm_memory_slot *slot;
+	int idx;
+
+	idx = srcu_read_lock(&kvm->srcu);
+
+	slot = gfn_to_memslot(kvm, gfn);
+	if (!slot) {
+		srcu_read_unlock(&kvm->srcu, idx);
+		return -EINVAL;
+	}
+
+	write_lock(&kvm->mmu_lock);
+	__kvm_write_track_add_gfn(kvm, slot, gfn);
+	write_unlock(&kvm->mmu_lock);
+
+	srcu_read_unlock(&kvm->srcu, idx);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_write_track_add_gfn);
+
+/*
+ * remove the guest page from the tracking pool which stops the interception
+ * of corresponding access on that page.
+ *
+ * @kvm: the guest instance we are interested in.
+ * @gfn: the guest page.
+ */
+int kvm_write_track_remove_gfn(struct kvm *kvm, gfn_t gfn)
+{
+	struct kvm_memory_slot *slot;
+	int idx;
+
+	idx = srcu_read_lock(&kvm->srcu);
+
+	slot = gfn_to_memslot(kvm, gfn);
+	if (!slot) {
+		srcu_read_unlock(&kvm->srcu, idx);
+		return -EINVAL;
+	}
+
+	write_lock(&kvm->mmu_lock);
+	__kvm_write_track_remove_gfn(kvm, slot, gfn);
+	write_unlock(&kvm->mmu_lock);
+
+	srcu_read_unlock(&kvm->srcu, idx);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_write_track_remove_gfn);
 #endif
diff --git a/arch/x86/kvm/mmu/page_track.h b/arch/x86/kvm/mmu/page_track.h
index 50d3278e8c69..62f98c6c5af3 100644
--- a/arch/x86/kvm/mmu/page_track.h
+++ b/arch/x86/kvm/mmu/page_track.h
@@ -15,6 +15,11 @@ int kvm_page_track_create_memslot(struct kvm *kvm,
 				  struct kvm_memory_slot *slot,
 				  unsigned long npages);
 
+void __kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+			       gfn_t gfn);
+void __kvm_write_track_remove_gfn(struct kvm *kvm,
+				  struct kvm_memory_slot *slot, gfn_t gfn);
+
 bool kvm_gfn_is_write_tracked(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn);
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 05a7e614ead0..21342a93e418 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1546,9 +1546,7 @@ static struct mdev_driver intel_vgpu_mdev_driver = {
 
 int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 {
-	struct kvm *kvm = info->vfio_device.kvm;
-	struct kvm_memory_slot *slot;
-	int idx;
+	int r;
 
 	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
 		return -ESRCH;
@@ -1556,18 +1554,9 @@ int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 	if (kvmgt_gfn_is_write_protected(info, gfn))
 		return 0;
 
-	idx = srcu_read_lock(&kvm->srcu);
-	slot = gfn_to_memslot(kvm, gfn);
-	if (!slot) {
-		srcu_read_unlock(&kvm->srcu, idx);
-		return -EINVAL;
-	}
-
-	write_lock(&kvm->mmu_lock);
-	kvm_write_track_add_gfn(kvm, slot, gfn);
-	write_unlock(&kvm->mmu_lock);
-
-	srcu_read_unlock(&kvm->srcu, idx);
+	r = kvm_write_track_add_gfn(info->vfio_device.kvm, gfn);
+	if (r)
+		return r;
 
 	kvmgt_protect_table_add(info, gfn);
 	return 0;
@@ -1575,9 +1564,7 @@ int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 
 int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 {
-	struct kvm *kvm = info->vfio_device.kvm;
-	struct kvm_memory_slot *slot;
-	int idx;
+	int r;
 
 	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
 		return -ESRCH;
@@ -1585,17 +1572,9 @@ int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 	if (!kvmgt_gfn_is_write_protected(info, gfn))
 		return 0;
 
-	idx = srcu_read_lock(&kvm->srcu);
-	slot = gfn_to_memslot(kvm, gfn);
-	if (!slot) {
-		srcu_read_unlock(&kvm->srcu, idx);
-		return -EINVAL;
-	}
-
-	write_lock(&kvm->mmu_lock);
-	kvm_write_track_remove_gfn(kvm, slot, gfn);
-	write_unlock(&kvm->mmu_lock);
-	srcu_read_unlock(&kvm->srcu, idx);
+	r = kvm_write_track_remove_gfn(info->vfio_device.kvm, gfn);
+	if (r)
+		return r;
 
 	kvmgt_protect_table_del(info, gfn);
 	return 0;
-- 
2.41.0.487.g6d72f3e995-goog

