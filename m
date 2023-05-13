Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B3701325
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C83110E6FE;
	Sat, 13 May 2023 00:36:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70D410E703
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:28 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-6439bc1e3aaso6263840b3a.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938188; x=1686530188;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=caCqfAxo3tmXcjzSDBInzE0fjHL4Utao36SGXPLAgDo=;
 b=1SA3m92adALDdF4M2tXh8CcJTLmqMlbEPkHzYlWk50YCEITk5P2uF6rHKRQgOBiv32
 ZT+h+YLliALljJTtaZAvr2hT8E0y373siHAadOsRN9M6ehdkksWXHqGXRpvMrSH8gOZs
 em/7SfUtC0MW3DkkSdI9+CDcNXE5iE4G1yV6Xd4UNMDBMbhyEEJYSO3CoojdzTzX8uQG
 cWH1K+Mgx/lImOT2SQkoHr179+Z5+05bY+K0rCQkliXJaPkVMUF73jVxg/xpPmhM8BEd
 NJ0LlVvKYO0hF0pT15fN9D39cnRhHsN++gywGdN3SvOv4TnOgFHMifRG5XpMekm1RY/+
 RGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938188; x=1686530188;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=caCqfAxo3tmXcjzSDBInzE0fjHL4Utao36SGXPLAgDo=;
 b=A+6/q7CXehr4E7O8pQNhQEeGy9NEeK8ZIMpfvi0ARLe4doOqrCWsFkR/KDqOhPO9W6
 ijDFNiUCuntk+xeXuO1iECugpRJE/VEBa/njYmk/NFL/xbH252MHgI/hEpF8aKBgs5yx
 4UND+WKb97Ua4m4myulBYdo6cO1y8gH2j47t9icRqGCQdTMq2jiTdTMQS3WZGBla+66l
 Svy6EgCY1reQ72CWVnNrG20zdp67q97CpK9c07jPMoz8TF66dLbAFWYUSlcEHAR5FTEK
 LYDCpBhN7S6Et1V2Lh177qSlKE3dR2Q3s3pQfYRwqPLW79gM6PaMROVlz9798yA24ooL
 9hCQ==
X-Gm-Message-State: AC+VfDy8KltKLg/M9PAOvw0tdM4g0tRqnIeOXm49LzZOLinOlCqyJBl0
 9+f2PYR9mrmGp57eoxrln1mbo8QLVgY=
X-Google-Smtp-Source: ACHHUZ5ZIoceJVCJgJPVozwhsPt6F90NmTGVT77kQymdEYSNjXuOySK3njg3DHtwar2gg6RBit/1FTDXB0E=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:785:b0:643:a3a6:115f with SMTP id
 g5-20020a056a00078500b00643a3a6115fmr7156203pfu.3.1683938188573; Fri, 12 May
 2023 17:36:28 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:44 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-13-seanjc@google.com>
Subject: [PATCH v3 12/28] KVM: x86/mmu: Don't rely on page-track mechanism to
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
 arch/x86/kvm/mmu/mmu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2e4476d38377..23a79723031b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6184,13 +6184,6 @@ static bool kvm_has_zapped_obsolete_pages(struct kvm *kvm)
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
@@ -6208,7 +6201,6 @@ int kvm_mmu_init_vm(struct kvm *kvm)
 	}
 
 	node->track_write = kvm_mmu_pte_write;
-	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
 	kvm_page_track_register_notifier(kvm, node);
 
 	kvm->arch.split_page_header_cache.kmem_cache = mmu_page_header_cache;
@@ -6750,6 +6742,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
+	kvm_mmu_zap_all_fast(kvm);
+
 	kvm_page_track_flush_slot(kvm, slot);
 }
 
-- 
2.40.1.606.ga4b1b128d6-goog

