Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25216767B0D
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FDC10E7D0;
	Sat, 29 Jul 2023 01:36:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDB910E7CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:28 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5847479b559so22022747b3.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594588; x=1691199388;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=8fCnN9sMgvUVZRhuIGf+CUQwPvlNDoZ8J2Y3rHonvyQ=;
 b=bxltsmX8PosoYUbrrME+KLQdCyiHK/NHecTMg8BvPbyYyS/d4uabpGJIwELmM/Cs/y
 basf32NPrEC9ISe0a1WcvRIugQoGq01XBHh5NMkPF2tDaOK+BiT9Fxs/0FY/w4XE1tyO
 sLOMYmvBBdlxUi/KUo2dTZwImxHb+szlKEQl/V4X7TMYvHtyRA2CE49MlH8tNhpb0kq7
 whVBxb16ZM50PRrmXdnbscat1w89uzUOJsm20xMNLUHRcNLbnIloP0ADWccRbTeXfA3C
 /YRwOtzjzHMzXy8Rsq0AbWcn8p0joOeIOAAib1fXWa33W87ET+nLEFllcJ+4tYnaY6Ap
 Pj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594588; x=1691199388;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8fCnN9sMgvUVZRhuIGf+CUQwPvlNDoZ8J2Y3rHonvyQ=;
 b=QS23RryTiA8TU58i6hlkS6ub5Pa5VK1uAH+Mc6dVgAflkIfmOeejUpl/4LyaEIagOm
 yM6/wAcc+dCm95I0XYfLLjovmgJwThyqiJw9vn0HYrcMAHCIeNpQN3NaRLoBDMAmrG+t
 eDPN6eUSBlMW1K3uJFHwrpBpftLXvzgWm05cFPcDtmW12SG1mZ10kAgZ2RYOzjvg8K5l
 QKBG7dmY1LMzs1xkBAJhMoecMctVRGas/F5n0MNuRXnP3mhFTrRalZPX1WfWJqMAX/v8
 WS33aP6wzfO8D8l4avR3FcMRGUUA0dovc+MctV17UNDmd6FnsEdwJV8G25Fo8AkYsNLZ
 UKqA==
X-Gm-Message-State: ABy/qLYvCoClIzt0q3JvAbsI/43cIuJ2j0iXyvKcqI4dxJhHakAYYHfh
 QsO65dt50k96fWcphdTquv+00/hwC2w=
X-Google-Smtp-Source: APBJJlGlJT4LHEigIZrr5fJbGPmW1zdL8mW+AMk82HqK98JL5TTHy6uGnJrsliHhjTFiLgGda0b1nQMVEeQ=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b385:0:b0:57a:141f:b4f7 with SMTP id
 r127-20020a81b385000000b0057a141fb4f7mr25896ywh.6.1690594588058; Fri, 28 Jul
 2023 18:36:28 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:29 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-24-seanjc@google.com>
Subject: [PATCH v4 23/29] KVM: x86/mmu: Drop infrastructure for multiple
 page-track modes
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

Drop "support" for multiple page-track modes, as there is no evidence
that array-based and refcounted metadata is the optimal solution for
other modes, nor is there any evidence that other use cases, e.g. for
access-tracking, will be a good fit for the page-track machinery in
general.

E.g. one potential use case of access-tracking would be to prevent guest
access to poisoned memory (from the guest's perspective).  In that case,
the number of poisoned pages is likely to be a very small percentage of
the guest memory, and there is no need to reference count the number of
access-tracking users, i.e. expanding gfn_track[] for a new mode would be
grossly inefficient.  And for poisoned memory, host userspace would also
likely want to trap accesses, e.g. to inject #MC into the guest, and that
isn't currently supported by the page-track framework.

A better alternative for that poisoned page use case is likely a
variation of the proposed per-gfn attributes overlay (linked), which
would allow efficiently tracking the sparse set of poisoned pages, and by
default would exit to userspace on access.

Link: https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
Cc: Ben Gardon <bgardon@google.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h       |  12 +--
 arch/x86/include/asm/kvm_page_track.h |  11 +--
 arch/x86/kvm/mmu/mmu.c                |  14 ++--
 arch/x86/kvm/mmu/page_track.c         | 111 ++++++++------------------
 arch/x86/kvm/mmu/page_track.h         |   3 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c      |   4 +-
 6 files changed, 51 insertions(+), 104 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 33b1ceb30dd2..a915e23d61fa 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -288,13 +288,13 @@ struct kvm_kernel_irq_routing_entry;
  * kvm_mmu_page_role tracks the properties of a shadow page (where shadow page
  * also includes TDP pages) to determine whether or not a page can be used in
  * the given MMU context.  This is a subset of the overall kvm_cpu_role to
- * minimize the size of kvm_memory_slot.arch.gfn_track, i.e. allows allocating
- * 2 bytes per gfn instead of 4 bytes per gfn.
+ * minimize the size of kvm_memory_slot.arch.gfn_write_track, i.e. allows
+ * allocating 2 bytes per gfn instead of 4 bytes per gfn.
  *
  * Upper-level shadow pages having gptes are tracked for write-protection via
- * gfn_track.  As above, gfn_track is a 16 bit counter, so KVM must not create
- * more than 2^16-1 upper-level shadow pages at a single gfn, otherwise
- * gfn_track will overflow and explosions will ensure.
+ * gfn_write_track.  As above, gfn_write_track is a 16 bit counter, so KVM must
+ * not create more than 2^16-1 upper-level shadow pages at a single gfn,
+ * otherwise gfn_write_track will overflow and explosions will ensue.
  *
  * A unique shadow page (SP) for a gfn is created if and only if an existing SP
  * cannot be reused.  The ability to reuse a SP is tracked by its role, which
@@ -1005,7 +1005,7 @@ struct kvm_lpage_info {
 struct kvm_arch_memory_slot {
 	struct kvm_rmap_head *rmap[KVM_NR_PAGE_SIZES];
 	struct kvm_lpage_info *lpage_info[KVM_NR_PAGE_SIZES - 1];
-	unsigned short *gfn_track[KVM_PAGE_TRACK_MAX];
+	unsigned short *gfn_write_track;
 };
 
 /*
diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index 61adb07b5927..9e4ee26d1779 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -4,17 +4,10 @@
 
 #include <linux/kvm_types.h>
 
-enum kvm_page_track_mode {
-	KVM_PAGE_TRACK_WRITE,
-	KVM_PAGE_TRACK_MAX,
-};
-
 void kvm_slot_page_track_add_page(struct kvm *kvm,
-				  struct kvm_memory_slot *slot, gfn_t gfn,
-				  enum kvm_page_track_mode mode);
+				  struct kvm_memory_slot *slot, gfn_t gfn);
 void kvm_slot_page_track_remove_page(struct kvm *kvm,
-				     struct kvm_memory_slot *slot, gfn_t gfn,
-				     enum kvm_page_track_mode mode);
+				     struct kvm_memory_slot *slot, gfn_t gfn);
 
 #ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 /*
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 88923b1eb510..b8dce17bffdc 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -840,8 +840,7 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 
 	/* the non-leaf shadow pages are keeping readonly. */
 	if (sp->role.level > PG_LEVEL_4K)
-		return kvm_slot_page_track_add_page(kvm, slot, gfn,
-						    KVM_PAGE_TRACK_WRITE);
+		return kvm_slot_page_track_add_page(kvm, slot, gfn);
 
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
 
@@ -887,8 +886,7 @@ static void unaccount_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 	slots = kvm_memslots_for_spte_role(kvm, sp->role);
 	slot = __gfn_to_memslot(slots, gfn);
 	if (sp->role.level > PG_LEVEL_4K)
-		return kvm_slot_page_track_remove_page(kvm, slot, gfn,
-						       KVM_PAGE_TRACK_WRITE);
+		return kvm_slot_page_track_remove_page(kvm, slot, gfn);
 
 	kvm_mmu_gfn_allow_lpage(slot, gfn);
 }
@@ -2832,7 +2830,7 @@ int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
 	 * track machinery is used to write-protect upper-level shadow pages,
 	 * i.e. this guards the role.level == 4K assertion below!
 	 */
-	if (kvm_slot_page_track_is_active(kvm, slot, gfn, KVM_PAGE_TRACK_WRITE))
+	if (kvm_slot_page_track_is_active(kvm, slot, gfn))
 		return -EPERM;
 
 	/*
@@ -4233,7 +4231,7 @@ static bool page_fault_handle_page_track(struct kvm_vcpu *vcpu,
 	 * guest is writing the page which is write tracked which can
 	 * not be fixed by page fault handler.
 	 */
-	if (kvm_slot_page_track_is_active(vcpu->kvm, fault->slot, fault->gfn, KVM_PAGE_TRACK_WRITE))
+	if (kvm_slot_page_track_is_active(vcpu->kvm, fault->slot, fault->gfn))
 		return true;
 
 	return false;
@@ -5468,8 +5466,8 @@ void kvm_mmu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	 * physical address properties) in a single VM would require tracking
 	 * all relevant CPUID information in kvm_mmu_page_role. That is very
 	 * undesirable as it would increase the memory requirements for
-	 * gfn_track (see struct kvm_mmu_page_role comments).  For now that
-	 * problem is swept under the rug; KVM's CPUID API is horrific and
+	 * gfn_write_track (see struct kvm_mmu_page_role comments).  For now
+	 * that problem is swept under the rug; KVM's CPUID API is horrific and
 	 * it's all but impossible to solve it without introducing a new API.
 	 */
 	vcpu->arch.root_mmu.root_role.word = 0;
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index b20aad7ac3fe..cdc6069b8caf 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -27,76 +27,50 @@ bool kvm_page_track_write_tracking_enabled(struct kvm *kvm)
 
 void kvm_page_track_free_memslot(struct kvm_memory_slot *slot)
 {
-	int i;
+	kvfree(slot->arch.gfn_write_track);
+	slot->arch.gfn_write_track = NULL;
+}
 
-	for (i = 0; i < KVM_PAGE_TRACK_MAX; i++) {
-		kvfree(slot->arch.gfn_track[i]);
-		slot->arch.gfn_track[i] = NULL;
-	}
+static int __kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot,
+						 unsigned long npages)
+{
+	const size_t size = sizeof(*slot->arch.gfn_write_track);
+
+	if (!slot->arch.gfn_write_track)
+		slot->arch.gfn_write_track = __vcalloc(npages, size,
+						       GFP_KERNEL_ACCOUNT);
+
+	return slot->arch.gfn_write_track ? 0 : -ENOMEM;
 }
 
 int kvm_page_track_create_memslot(struct kvm *kvm,
 				  struct kvm_memory_slot *slot,
 				  unsigned long npages)
 {
-	int i;
-
-	for (i = 0; i < KVM_PAGE_TRACK_MAX; i++) {
-		if (i == KVM_PAGE_TRACK_WRITE &&
-		    !kvm_page_track_write_tracking_enabled(kvm))
-			continue;
-
-		slot->arch.gfn_track[i] =
-			__vcalloc(npages, sizeof(*slot->arch.gfn_track[i]),
-				  GFP_KERNEL_ACCOUNT);
-		if (!slot->arch.gfn_track[i])
-			goto track_free;
-	}
-
-	return 0;
-
-track_free:
-	kvm_page_track_free_memslot(slot);
-	return -ENOMEM;
-}
-
-static inline bool page_track_mode_is_valid(enum kvm_page_track_mode mode)
-{
-	if (mode < 0 || mode >= KVM_PAGE_TRACK_MAX)
-		return false;
-
-	return true;
-}
-
-int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot)
-{
-	unsigned short *gfn_track;
-
-	if (slot->arch.gfn_track[KVM_PAGE_TRACK_WRITE])
+	if (!kvm_page_track_write_tracking_enabled(kvm))
 		return 0;
 
-	gfn_track = __vcalloc(slot->npages, sizeof(*gfn_track),
-			      GFP_KERNEL_ACCOUNT);
-	if (gfn_track == NULL)
-		return -ENOMEM;
+	return __kvm_page_track_write_tracking_alloc(slot, npages);
+}
 
-	slot->arch.gfn_track[KVM_PAGE_TRACK_WRITE] = gfn_track;
-	return 0;
+int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot)
+{
+	return __kvm_page_track_write_tracking_alloc(slot, slot->npages);
 }
 
-static void update_gfn_track(struct kvm_memory_slot *slot, gfn_t gfn,
-			     enum kvm_page_track_mode mode, short count)
+static void update_gfn_write_track(struct kvm_memory_slot *slot, gfn_t gfn,
+				   short count)
 {
 	int index, val;
 
 	index = gfn_to_index(gfn, slot->base_gfn, PG_LEVEL_4K);
 
-	val = slot->arch.gfn_track[mode][index];
+	val = slot->arch.gfn_write_track[index];
 
 	if (WARN_ON(val + count < 0 || val + count > USHRT_MAX))
 		return;
 
-	slot->arch.gfn_track[mode][index] += count;
+	slot->arch.gfn_write_track[index] += count;
 }
 
 /*
@@ -109,21 +83,15 @@ static void update_gfn_track(struct kvm_memory_slot *slot, gfn_t gfn,
  * @kvm: the guest instance we are interested in.
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
- * @mode: tracking mode, currently only write track is supported.
  */
 void kvm_slot_page_track_add_page(struct kvm *kvm,
-				  struct kvm_memory_slot *slot, gfn_t gfn,
-				  enum kvm_page_track_mode mode)
+				  struct kvm_memory_slot *slot, gfn_t gfn)
 {
 
-	if (WARN_ON(!page_track_mode_is_valid(mode)))
+	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
 		return;
 
-	if (WARN_ON(mode == KVM_PAGE_TRACK_WRITE &&
-		    !kvm_page_track_write_tracking_enabled(kvm)))
-		return;
-
-	update_gfn_track(slot, gfn, mode, 1);
+	update_gfn_write_track(slot, gfn, 1);
 
 	/*
 	 * new track stops large page mapping for the
@@ -131,9 +99,8 @@ void kvm_slot_page_track_add_page(struct kvm *kvm,
 	 */
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
 
-	if (mode == KVM_PAGE_TRACK_WRITE)
-		if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
-			kvm_flush_remote_tlbs(kvm);
+	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
+		kvm_flush_remote_tlbs(kvm);
 }
 EXPORT_SYMBOL_GPL(kvm_slot_page_track_add_page);
 
@@ -148,20 +115,14 @@ EXPORT_SYMBOL_GPL(kvm_slot_page_track_add_page);
  * @kvm: the guest instance we are interested in.
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
- * @mode: tracking mode, currently only write track is supported.
  */
 void kvm_slot_page_track_remove_page(struct kvm *kvm,
-				     struct kvm_memory_slot *slot, gfn_t gfn,
-				     enum kvm_page_track_mode mode)
+				     struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	if (WARN_ON(!page_track_mode_is_valid(mode)))
+	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
 		return;
 
-	if (WARN_ON(mode == KVM_PAGE_TRACK_WRITE &&
-		    !kvm_page_track_write_tracking_enabled(kvm)))
-		return;
-
-	update_gfn_track(slot, gfn, mode, -1);
+	update_gfn_write_track(slot, gfn, -1);
 
 	/*
 	 * allow large page mapping for the tracked page
@@ -176,22 +137,18 @@ EXPORT_SYMBOL_GPL(kvm_slot_page_track_remove_page);
  */
 bool kvm_slot_page_track_is_active(struct kvm *kvm,
 				   const struct kvm_memory_slot *slot,
-				   gfn_t gfn, enum kvm_page_track_mode mode)
+				   gfn_t gfn)
 {
 	int index;
 
-	if (WARN_ON(!page_track_mode_is_valid(mode)))
-		return false;
-
 	if (!slot)
 		return false;
 
-	if (mode == KVM_PAGE_TRACK_WRITE &&
-	    !kvm_page_track_write_tracking_enabled(kvm))
+	if (!kvm_page_track_write_tracking_enabled(kvm))
 		return false;
 
 	index = gfn_to_index(gfn, slot->base_gfn, PG_LEVEL_4K);
-	return !!READ_ONCE(slot->arch.gfn_track[mode][index]);
+	return !!READ_ONCE(slot->arch.gfn_write_track[index]);
 }
 
 #ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
diff --git a/arch/x86/kvm/mmu/page_track.h b/arch/x86/kvm/mmu/page_track.h
index 931b26b8fc8f..789d0c479519 100644
--- a/arch/x86/kvm/mmu/page_track.h
+++ b/arch/x86/kvm/mmu/page_track.h
@@ -16,8 +16,7 @@ int kvm_page_track_create_memslot(struct kvm *kvm,
 				  unsigned long npages);
 
 bool kvm_slot_page_track_is_active(struct kvm *kvm,
-				   const struct kvm_memory_slot *slot,
-				   gfn_t gfn, enum kvm_page_track_mode mode);
+				   const struct kvm_memory_slot *slot, gfn_t gfn);
 
 #ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 int kvm_page_track_init(struct kvm *kvm);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3f2327455d85..e71182b8a3f2 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1564,7 +1564,7 @@ int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	kvm_slot_page_track_add_page(kvm, slot, gfn, KVM_PAGE_TRACK_WRITE);
+	kvm_slot_page_track_add_page(kvm, slot, gfn);
 	write_unlock(&kvm->mmu_lock);
 
 	srcu_read_unlock(&kvm->srcu, idx);
@@ -1593,7 +1593,7 @@ int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	kvm_slot_page_track_remove_page(kvm, slot, gfn, KVM_PAGE_TRACK_WRITE);
+	kvm_slot_page_track_remove_page(kvm, slot, gfn);
 	write_unlock(&kvm->mmu_lock);
 	srcu_read_unlock(&kvm->srcu, idx);
 
-- 
2.41.0.487.g6d72f3e995-goog

