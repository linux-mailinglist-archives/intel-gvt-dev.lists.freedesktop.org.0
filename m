Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAAE767AF0
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226F410E7C9;
	Sat, 29 Jul 2023 01:36:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DB210E7C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:05 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-bc68c4e046aso2457485276.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594565; x=1691199365;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=SoliYXcqZNhJwX4JC/W6dr2P5TFLV6yeHcBLjtfnO3w=;
 b=i2Y3ZjuGxx6dTI33vqpOntS0rGKh6Xy6EO6sIQ/qLztj3pJ5jqIrfgzxo9NCzZHCqj
 i4KPR9+94mb8W/PkO+M0iD6e4jS2+CcnwjrTPSSwlArrQQ43Pf1gm4LZT1WpwtXKLi/d
 ARJPn0Nws82lXlBe+QxnAEnjFTUASubHBBnbK+mJnOsh1jE+G2xgZVV9y+Oh0sIztKFo
 EC7oCH2+5Ree4ym8NZrYar/k9ljchvITFj6D3l3vhsRKhZUD3atggsYM5VYCUaya/uXQ
 xaCP47s151vGb7wmrL1WpEBARdQM8Mb4mY89nqnnjdOfpgYr5vCMZjfi8AwK9Mtelzbw
 Fbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594565; x=1691199365;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SoliYXcqZNhJwX4JC/W6dr2P5TFLV6yeHcBLjtfnO3w=;
 b=kYaUc5ElI4dXe7tgBc8ulVKvi+WFCrBqP/nO6p9Bdh8n/hs+2O0RbZq7LAII4YuToF
 bnoL2/z3202PR039/RrCnRWUO34TT4DKqMI+CXT8bmsWo7VJ6pzgNRDfUGnfT+Y1JDOP
 s+P+HwrIxl2ZBbXoEILMg1EKrzRJe/ZY1L6Qm8GQgVdRv+JEZXPkUbccstsbKfNQ1Ncp
 uJ+W933P1YAR6PBlqo4cEi7OnVGvtqEvX+wfuPp8qQEXYwIaeLOFEOBpHnlvUu8HDZLu
 hqZAeu4sS1N45X187U64pHfgCphfXtD3rjDrLYH5tEtP0VyCPjDRYHc2yZdeJ8EJmcHY
 Bewg==
X-Gm-Message-State: ABy/qLZeW0VKoZAa2ZHXepqhY/8Q9i1hzhBWv+K3EpgTBmByJaJue5uf
 aKLeigWBPgil3NtkYXzG6klw3Saw/LQ=
X-Google-Smtp-Source: APBJJlGk0QWssPD6b44eFCz+Vh1QQ15SldFl85C6bex9iYYArT805l10SwRDdsIT89OTBqVkbAcB6VljnOQ=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:11ca:b0:d09:b19:fe2c with SMTP id
 n10-20020a05690211ca00b00d090b19fe2cmr18789ybu.12.1690594565002; Fri, 28 Jul
 2023 18:36:05 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:17 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-12-seanjc@google.com>
Subject: [PATCH v4 11/29] drm/i915/gvt: Protect gfn hash table with vgpu_lock
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

Use vgpu_lock instead of KVM's mmu_lock to protect accesses to the hash
table used to track which gfns are write-protected when shadowing the
guest's GTT, and hoist the acquisition of vgpu_lock from
intel_vgpu_page_track_handler() out to its sole caller,
kvmgt_page_track_write().

This fixes a bug where kvmgt_page_track_write(), which doesn't hold
kvm->mmu_lock, could race with intel_gvt_page_track_remove() and trigger
a use-after-free.

Fixing kvmgt_page_track_write() by taking kvm->mmu_lock is not an option
as mmu_lock is a r/w spinlock, and intel_vgpu_page_track_handler() might
sleep when acquiring vgpu->cache_lock deep down the callstack:

  intel_vgpu_page_track_handler()
  |
  |->  page_track->handler / ppgtt_write_protection_handler()
       |
       |-> ppgtt_handle_guest_write_page_table_bytes()
           |
           |->  ppgtt_handle_guest_write_page_table()
                |
                |-> ppgtt_handle_guest_entry_removal()
                    |
                    |-> ppgtt_invalidate_pte()
                        |
                        |-> intel_gvt_dma_unmap_guest_page()
                            |
                            |-> mutex_lock(&vgpu->cache_lock);

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 55 +++++++++++++++------------
 drivers/gpu/drm/i915/gvt/page_track.c | 10 +----
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 6f52886c4051..034be0655daa 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -352,6 +352,8 @@ __kvmgt_protect_table_find(struct intel_vgpu *info, gfn_t gfn)
 {
 	struct kvmgt_pgfn *p, *res = NULL;
 
+	lockdep_assert_held(&info->vgpu_lock);
+
 	hash_for_each_possible(info->ptable, p, hnode, gfn) {
 		if (gfn == p->gfn) {
 			res = p;
@@ -1553,6 +1555,9 @@ int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
 		return -ESRCH;
 
+	if (kvmgt_gfn_is_write_protected(info, gfn))
+		return 0;
+
 	idx = srcu_read_lock(&kvm->srcu);
 	slot = gfn_to_memslot(kvm, gfn);
 	if (!slot) {
@@ -1561,16 +1566,12 @@ int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 	}
 
 	write_lock(&kvm->mmu_lock);
-
-	if (kvmgt_gfn_is_write_protected(info, gfn))
-		goto out;
-
 	kvm_slot_page_track_add_page(kvm, slot, gfn, KVM_PAGE_TRACK_WRITE);
+	write_unlock(&kvm->mmu_lock);
+
+	srcu_read_unlock(&kvm->srcu, idx);
+
 	kvmgt_protect_table_add(info, gfn);
-
-out:
-	write_unlock(&kvm->mmu_lock);
-	srcu_read_unlock(&kvm->srcu, idx);
 	return 0;
 }
 
@@ -1583,24 +1584,22 @@ int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
 		return -ESRCH;
 
-	idx = srcu_read_lock(&kvm->srcu);
-	slot = gfn_to_memslot(kvm, gfn);
-	if (!slot) {
-		srcu_read_unlock(&kvm->srcu, idx);
-		return -EINVAL;
-	}
-
-	write_lock(&kvm->mmu_lock);
-
 	if (!kvmgt_gfn_is_write_protected(info, gfn))
-		goto out;
+		return 0;
 
+	idx = srcu_read_lock(&kvm->srcu);
+	slot = gfn_to_memslot(kvm, gfn);
+	if (!slot) {
+		srcu_read_unlock(&kvm->srcu, idx);
+		return -EINVAL;
+	}
+
+	write_lock(&kvm->mmu_lock);
 	kvm_slot_page_track_remove_page(kvm, slot, gfn, KVM_PAGE_TRACK_WRITE);
+	write_unlock(&kvm->mmu_lock);
+	srcu_read_unlock(&kvm->srcu, idx);
+
 	kvmgt_protect_table_del(info, gfn);
-
-out:
-	write_unlock(&kvm->mmu_lock);
-	srcu_read_unlock(&kvm->srcu, idx);
 	return 0;
 }
 
@@ -1611,9 +1610,13 @@ static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
 
+	mutex_lock(&info->vgpu_lock);
+
 	if (kvmgt_gfn_is_write_protected(info, gpa_to_gfn(gpa)))
 		intel_vgpu_page_track_handler(info, gpa,
 						     (void *)val, len);
+
+	mutex_unlock(&info->vgpu_lock);
 }
 
 static void kvmgt_page_track_flush_slot(struct kvm *kvm,
@@ -1625,16 +1628,20 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
 
-	write_lock(&kvm->mmu_lock);
+	mutex_lock(&info->vgpu_lock);
+
 	for (i = 0; i < slot->npages; i++) {
 		gfn = slot->base_gfn + i;
 		if (kvmgt_gfn_is_write_protected(info, gfn)) {
+			write_lock(&kvm->mmu_lock);
 			kvm_slot_page_track_remove_page(kvm, slot, gfn,
 						KVM_PAGE_TRACK_WRITE);
+			write_unlock(&kvm->mmu_lock);
+
 			kvmgt_protect_table_del(info, gfn);
 		}
 	}
-	write_unlock(&kvm->mmu_lock);
+	mutex_unlock(&info->vgpu_lock);
 }
 
 void intel_vgpu_detach_regions(struct intel_vgpu *vgpu)
diff --git a/drivers/gpu/drm/i915/gvt/page_track.c b/drivers/gpu/drm/i915/gvt/page_track.c
index df34e73cba41..60a65435556d 100644
--- a/drivers/gpu/drm/i915/gvt/page_track.c
+++ b/drivers/gpu/drm/i915/gvt/page_track.c
@@ -162,13 +162,9 @@ int intel_vgpu_page_track_handler(struct intel_vgpu *vgpu, u64 gpa,
 	struct intel_vgpu_page_track *page_track;
 	int ret = 0;
 
-	mutex_lock(&vgpu->vgpu_lock);
-
 	page_track = intel_vgpu_find_page_track(vgpu, gpa >> PAGE_SHIFT);
-	if (!page_track) {
-		ret = -ENXIO;
-		goto out;
-	}
+	if (!page_track)
+		return -ENXIO;
 
 	if (unlikely(vgpu->failsafe)) {
 		/* Remove write protection to prevent furture traps. */
@@ -179,7 +175,5 @@ int intel_vgpu_page_track_handler(struct intel_vgpu *vgpu, u64 gpa,
 			gvt_err("guest page write error, gpa %llx\n", gpa);
 	}
 
-out:
-	mutex_unlock(&vgpu->vgpu_lock);
 	return ret;
 }
-- 
2.41.0.487.g6d72f3e995-goog

