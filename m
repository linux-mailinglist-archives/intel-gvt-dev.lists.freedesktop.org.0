Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9DA6B567E
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571D310EA51;
	Sat, 11 Mar 2023 00:23:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E5610EA57
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:47 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 q1-20020a170902dac100b0019f1e3ea83dso582343plx.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494227;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=cRChIfKJ3K8DtJs7OGMgvrExuil8ZWfEDLQhfi2NWpc=;
 b=Dq8saSFXYnEuXxC6o0mtt4fI1VyD23Rtfssio2QJ8NUWmZPLMWdcGEEEmDZb32lk2X
 Z+3pXY0CsBZFZwN+kyZt33sPU3BlM0U+dL5qe32vWMqfG8PizHwhYfvoP7tEqSEByDnB
 8aIuoObFXcelPDhgFKLKaIfkcxnyDdwRcKdem4sDavCrJb0hoGYUvqZZ7/ScLDm3ThJg
 kaRrVkF4pOdKj44bOuqHglhMksLim39Sr7pPfDZAxn8Vso1J/CdeLJEe767Wv3W5lbo2
 FeMgb9CstSsi9aFVXJ1hth1MtgiPT/0ORTmz1K/IxuUanbIdULrXiYDcrPUiUzvdlq81
 Q39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494227;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRChIfKJ3K8DtJs7OGMgvrExuil8ZWfEDLQhfi2NWpc=;
 b=vFU48YAC6Uwg0y69zITJ6EieQdjxoLX6D+R4Lb99junUd80wiT/2vt8ieGQBQXIhn5
 6SrfWDL6a+PsP/8vK0bYUKUcPV/8UOp+gbZmO17WBt60BnXjnrdxHRWA081GRE06535R
 qTNcibwesfXuGB/X0updWEgshYMX8amgDgF4PfxXmHIE1Ce+yqPKFqeaBRGZ421sMYYZ
 Dkk5778C4dEWV1nZH7L/pNt0CTmSh/GFsVMqbuZ5Q1EjAhwcVXqW8j81UCqX18BEx6w5
 XidnV457EvNT6D7HOpkbH2F24Mh6lpTi7XorFc/rAfxHmdwEsBvpf/5rrIJsv7t7gsql
 q2fw==
X-Gm-Message-State: AO0yUKWhev/M8KOP2bmoJLKvnCXhsuf+fcrGbXEspZupeBoqYaGpLES0
 g2xXx6gk+HklVb4X3QfiX847PvL67Pw=
X-Google-Smtp-Source: AK7set89jqfAPReJN72LAAk9BQammid0gI651Msg4bOzx80eRCKVR51KJqkXt6hWEZ2Lz4n+pBogo5JAsmc=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:6804:b0:237:9cbe:22ad with SMTP id
 p4-20020a17090a680400b002379cbe22admr10081333pjj.5.1678494227546; Fri, 10 Mar
 2023 16:23:47 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:53 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-23-seanjc@google.com>
Subject: [PATCH v2 22/27] KVM: x86/mmu: Rename page-track APIs to reflect the
 new reality
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

Rename the page-track APIs to capture that they're all about tracking
writes, now that the facade of supporting multiple modes is gone.

Opportunstically replace "slot" with "gfn" in anticipation of removing
the @slot param from the external APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h |  8 ++++----
 arch/x86/kvm/mmu/mmu.c                |  8 ++++----
 arch/x86/kvm/mmu/page_track.c         | 21 +++++++++------------
 arch/x86/kvm/mmu/page_track.h         |  4 ++--
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  4 ++--
 5 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index 42a4ae451d36..20055064793a 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -43,10 +43,10 @@ struct kvm_page_track_notifier_node {
 				    struct kvm_page_track_notifier_node *node);
 };
 
-void kvm_slot_page_track_add_page(struct kvm *kvm,
-				  struct kvm_memory_slot *slot, gfn_t gfn);
-void kvm_slot_page_track_remove_page(struct kvm *kvm,
-				     struct kvm_memory_slot *slot, gfn_t gfn);
+void kvm_write_track_add_gfn(struct kvm *kvm,
+			     struct kvm_memory_slot *slot, gfn_t gfn);
+void kvm_write_track_remove_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+				gfn_t gfn);
 
 #ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 7f21a1705438..3d1aad44c2ec 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -820,7 +820,7 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 
 	/* the non-leaf shadow pages are keeping readonly. */
 	if (sp->role.level > PG_LEVEL_4K)
-		return kvm_slot_page_track_add_page(kvm, slot, gfn);
+		return kvm_write_track_add_gfn(kvm, slot, gfn);
 
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
 
@@ -866,7 +866,7 @@ static void unaccount_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 	slots = kvm_memslots_for_spte_role(kvm, sp->role);
 	slot = __gfn_to_memslot(slots, gfn);
 	if (sp->role.level > PG_LEVEL_4K)
-		return kvm_slot_page_track_remove_page(kvm, slot, gfn);
+		return kvm_write_track_remove_gfn(kvm, slot, gfn);
 
 	kvm_mmu_gfn_allow_lpage(slot, gfn);
 }
@@ -2745,7 +2745,7 @@ int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
 	 * track machinery is used to write-protect upper-level shadow pages,
 	 * i.e. this guards the role.level == 4K assertion below!
 	 */
-	if (kvm_slot_page_track_is_active(kvm, slot, gfn))
+	if (kvm_gfn_is_write_tracked(kvm, slot, gfn))
 		return -EPERM;
 
 	/*
@@ -4153,7 +4153,7 @@ static bool page_fault_handle_page_track(struct kvm_vcpu *vcpu,
 	 * guest is writing the page which is write tracked which can
 	 * not be fixed by page fault handler.
 	 */
-	if (kvm_slot_page_track_is_active(vcpu->kvm, fault->slot, fault->gfn))
+	if (kvm_gfn_is_write_tracked(vcpu->kvm, fault->slot, fault->gfn))
 		return true;
 
 	return false;
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index f8c89110f896..1993db4578e5 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -84,10 +84,9 @@ static void update_gfn_write_track(struct kvm_memory_slot *slot, gfn_t gfn,
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
  */
-void kvm_slot_page_track_add_page(struct kvm *kvm,
-				  struct kvm_memory_slot *slot, gfn_t gfn)
+void kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+			     gfn_t gfn)
 {
-
 	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
 		return;
 
@@ -102,12 +101,11 @@ void kvm_slot_page_track_add_page(struct kvm *kvm,
 	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
 		kvm_flush_remote_tlbs(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_slot_page_track_add_page);
+EXPORT_SYMBOL_GPL(kvm_write_track_add_gfn);
 
 /*
  * remove the guest page from the tracking pool which stops the interception
- * of corresponding access on that page. It is the opposed operation of
- * kvm_slot_page_track_add_page().
+ * of corresponding access on that page.
  *
  * It should be called under the protection both of mmu-lock and kvm->srcu
  * or kvm->slots_lock.
@@ -116,8 +114,8 @@ EXPORT_SYMBOL_GPL(kvm_slot_page_track_add_page);
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
  */
-void kvm_slot_page_track_remove_page(struct kvm *kvm,
-				     struct kvm_memory_slot *slot, gfn_t gfn)
+void kvm_write_track_remove_gfn(struct kvm *kvm,
+				struct kvm_memory_slot *slot, gfn_t gfn)
 {
 	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
 		return;
@@ -130,14 +128,13 @@ void kvm_slot_page_track_remove_page(struct kvm *kvm,
 	 */
 	kvm_mmu_gfn_allow_lpage(slot, gfn);
 }
-EXPORT_SYMBOL_GPL(kvm_slot_page_track_remove_page);
+EXPORT_SYMBOL_GPL(kvm_write_track_remove_gfn);
 
 /*
  * check if the corresponding access on the specified guest page is tracked.
  */
-bool kvm_slot_page_track_is_active(struct kvm *kvm,
-				   const struct kvm_memory_slot *slot,
-				   gfn_t gfn)
+bool kvm_gfn_is_write_tracked(struct kvm *kvm,
+			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
 	int index;
 
diff --git a/arch/x86/kvm/mmu/page_track.h b/arch/x86/kvm/mmu/page_track.h
index 789d0c479519..50d3278e8c69 100644
--- a/arch/x86/kvm/mmu/page_track.h
+++ b/arch/x86/kvm/mmu/page_track.h
@@ -15,8 +15,8 @@ int kvm_page_track_create_memslot(struct kvm *kvm,
 				  struct kvm_memory_slot *slot,
 				  unsigned long npages);
 
-bool kvm_slot_page_track_is_active(struct kvm *kvm,
-				   const struct kvm_memory_slot *slot, gfn_t gfn);
+bool kvm_gfn_is_write_tracked(struct kvm *kvm,
+			      const struct kvm_memory_slot *slot, gfn_t gfn);
 
 #ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 int kvm_page_track_init(struct kvm *kvm);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1e0f4ec55782..e5a18d92030b 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1578,7 +1578,7 @@ int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	kvm_slot_page_track_add_page(kvm, slot, gfn);
+	kvm_write_track_add_gfn(kvm, slot, gfn);
 	write_unlock(&kvm->mmu_lock);
 
 	srcu_read_unlock(&kvm->srcu, idx);
@@ -1607,7 +1607,7 @@ int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	kvm_slot_page_track_remove_page(kvm, slot, gfn);
+	kvm_write_track_remove_gfn(kvm, slot, gfn);
 	write_unlock(&kvm->mmu_lock);
 	srcu_read_unlock(&kvm->srcu, idx);
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

