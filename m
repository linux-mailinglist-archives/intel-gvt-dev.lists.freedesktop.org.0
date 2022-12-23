Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340836549FE
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B4F10E5FB;
	Fri, 23 Dec 2022 00:58:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC63410E5FB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:14 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id
 b6-20020aa78706000000b00579e3853125so1835929pfo.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=RKF7pwud8YLdZV06SWOZWpUgew9kaBR/2Zer0uK8JrI=;
 b=Y78zDIL9TSKjC5fZ1xAudaofop4B7AoTczbfjdkWES3ri03Eu2accYPDVJ7U07L3YV
 bMXEgI7ZWdjTfCx1xYZSyZMf1+5W/HnZm0sdRrUfn4Ng8EmUBQAqj21hV/9jZ2vBeVbk
 nuSCozTMkur3ocnGD73uNO8NMJDs97XPzQNQBCx9X1Sj4sjULH/clMevSMApOLor5s4N
 5jh0ZFD2g7HUAQiUMlVq2cRtppI+TyI2fzSOnSvadfjsLUZU30evAxHXvMIWmQdD+j2D
 t8mVx08wS2KT1xKVDQNjayha/lafuX7Ned3uBtlIwPyOEcBTZpJ9AklmSlDTlHgpWEea
 Z60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RKF7pwud8YLdZV06SWOZWpUgew9kaBR/2Zer0uK8JrI=;
 b=IitCCocFvnlFsL6f3kdBKGb1DzUEnBkcr18dOhCa90GSDWUqamjBNzxrLiudVqFwMw
 ZDEpaEopwBn9uUJzzL/OKVLpwwy0QzTvsGo4bBUE5CGV7a1d8pAln/NMUjeujr8NMfaV
 xbUiFZLiz0k/sN8M8FFYKRLOCEEl7wmIqT5VGn/glTz1Yd8fmWtLY1e4+G0tE3qZbmLI
 0NDDMJc12kS4JGGG5eidhzSNXMghuJ4KFiIenkXM199nAawAQ6GnWdYt0rFNr6C7A0J4
 tXtl/juASBuhptKGHdZ/8aQynY+wzjzhk08XlaqoenIv4Mv/iwibO4Gv78eV7csV7OIE
 8kmA==
X-Gm-Message-State: AFqh2kryCdrUmd3Lg2IOMtpWjRlqiCIX6hYbCFJQAHmUDg44udT4gaA5
 qDX7o5nyt+ChiLJP+ORx4yJsykLbRr0=
X-Google-Smtp-Source: AMrXdXuPSOsnVIaAhuI/GEjWy6KZo22luijB03To5PTg4Z2znC3GOTMDbFFlTwqCGXNJMyxXYza7fLxRkak=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:9495:0:b0:537:b0c3:691 with SMTP id
 z21-20020aa79495000000b00537b0c30691mr554633pfk.59.1671757094428; Thu, 22 Dec
 2022 16:58:14 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:29 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-18-seanjc@google.com>
Subject: [PATCH 17/27] KVM: x86: Remove the unused page-track hook
 track_flush_slot()
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

From: Yan Zhao <yan.y.zhao@intel.com>

Remove ->track_remove_slot(), there are no longer any users and it's
unlikely a "flush" hook will ever be the correct API to provide to an
external page-track user.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h | 11 -----------
 arch/x86/kvm/mmu/page_track.c         | 26 --------------------------
 arch/x86/kvm/x86.c                    |  2 --
 3 files changed, 39 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index 152c5e7d7868..e5eb98ca4fce 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -33,16 +33,6 @@ struct kvm_page_track_notifier_node {
 	 */
 	void (*track_write)(gpa_t gpa, const u8 *new, int bytes,
 			    struct kvm_page_track_notifier_node *node);
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
 	 * Invoked when a memory region is removed from the guest.  Or in KVM
@@ -87,7 +77,6 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
 				   struct kvm_page_track_notifier_node *n);
 void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 			  int bytes);
-void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_page_track_delete_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
 
 bool kvm_page_track_has_external_user(struct kvm *kvm);
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 959be672e2ad..d2b9f7f183cc 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -277,32 +277,6 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 	kvm_mmu_track_write(vcpu, gpa, new, bytes);
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
  * Notify external page track nodes that a memory region is being removed from
  * the VM, e.g. so that users can free any associated metadata.
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cb0005e4baf0..f372c41ee2c2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12610,8 +12610,6 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
 	kvm_mmu_zap_all_fast(kvm);
-
-	kvm_page_track_flush_slot(kvm, slot);
 }
 
 static inline bool kvm_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
-- 
2.39.0.314.g84b9a713c41-goog

