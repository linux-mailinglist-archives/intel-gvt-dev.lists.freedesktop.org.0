Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C86549FF
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055EE10E0D1;
	Fri, 23 Dec 2022 00:58:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2B810E5FB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:18 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 k2-20020a17090a514200b002198214abdcso1794179pjm.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=RmIwb9k/SqB1LqdRcr0G+09cT+gAvGR5f8klU1SCXxI=;
 b=MH389gr2y0u/PUo/yBQScWfJTRoQrOiIYogq620at7Epoq+AzEq8BvkRW6dqDUDlzp
 giee49v09L/UiRkCySNTzRn+haVIjDqGinCLvYUWxgOfuNKJ3cvnkXDVXkPrQZzhMacS
 WT6mHlB9YLfgdiQt5YpevppaWySxhsMPIFqevdGTSdZw1RdRvsYXakEApD9tUXC7Mv1N
 EGgWND418RVwJL+LH6nWLs+4qMEOblDmmfc4oZUcG78GddkZzMysGS2VZsignqtuZni2
 vitgXqRaEQQ2Ufukr8fLFSo6pk/31co2ITI+xPCTiNhse05PFUMuPIcY/aHytJewfncc
 XYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RmIwb9k/SqB1LqdRcr0G+09cT+gAvGR5f8klU1SCXxI=;
 b=pK6d8PvX36kEwQTuBEJMb/Q8XaYMJo05aL/do4tgGcjDYytnoLs4s8LmkQDsrtMk7i
 DakF28wNVz4/VSkljR2++nX6XYpcEqFwfsVzouLWKWi8wU70OZSS8S2ih59ubf9h/HxS
 +SUI+ToLmYOFeT0C4L82eOBQF18t6W4G/8J6HQ1Ci/QhNKn3msZ8tOgTH1XBREgCc2yA
 1znJNjFaAs2maBBMvwb8oj87fmDt+JWPHt+wkf5IoNxD2RIl35zYzpnrLVejSoHgWzo9
 MbXvVrlzVTfEh/NZdcuQZMN63TEY+FFFFm5+EsiNI3mkldCWmyS4E4sMkqIM/I7BR0E+
 DI8w==
X-Gm-Message-State: AFqh2krprq2Pyu0wYS0ptmSTe38R9q7AktgnJSrpzVIrQVUscGm+gDxp
 u4apIYcygqABDlWdoxmKp9hQANrWWvU=
X-Google-Smtp-Source: AMrXdXsuuT+Rfv7Ka620Z8HtXWRrUqlm2IJLYfXoad0YT0tmShcBBNAbtzi1lR42YTfgvAaxmy4Lxliq44o=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:701:b0:219:1d0a:34a6 with SMTP id
 s1-20020a17090b070100b002191d0a34a6mr180820pjz.1.1671757098036; Thu, 22 Dec
 2022 16:58:18 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:31 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-20-seanjc@google.com>
Subject: [PATCH 19/27] KVM: x86/mmu: Use page-track notifiers iff there are
 external users
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

Disable the page-track notifier code at compile time if there are no
external users, i.e. if CONFIG_KVM_EXTERNAL_WRITE_TRACKING=n.  KVM itself
now hooks emulated writes directly instead of relying on the page-track
mechanism.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h       |  2 ++
 arch/x86/include/asm/kvm_page_track.h |  2 ++
 arch/x86/kvm/mmu/page_track.c         |  9 ++++----
 arch/x86/kvm/mmu/page_track.h         | 30 +++++++++++++++++++++++----
 4 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index eec424fac0ba..e8f8e1bd96c7 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1223,7 +1223,9 @@ struct kvm_arch {
 	 * create an NX huge page (without hanging the guest).
 	 */
 	struct list_head possible_nx_huge_pages;
+#ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 	struct kvm_page_track_notifier_head track_notifier_head;
+#endif
 	/*
 	 * Protects marking pages unsync during page faults, as TDP MMU page
 	 * faults only take mmu_lock for read.  For simplicity, the unsync
diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index deece45936a5..53c2adb25a07 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -55,6 +55,7 @@ void kvm_slot_page_track_remove_page(struct kvm *kvm,
 				     struct kvm_memory_slot *slot, gfn_t gfn,
 				     enum kvm_page_track_mode mode);
 
+#ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
 					       enum pg_level max_level);
 
@@ -64,5 +65,6 @@ kvm_page_track_register_notifier(struct kvm *kvm,
 void
 kvm_page_track_unregister_notifier(struct kvm *kvm,
 				   struct kvm_page_track_notifier_node *n);
+#endif /* CONFIG_KVM_EXTERNAL_WRITE_TRACKING */
 
 #endif
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 2b302fd2c5dd..f932909aa9b5 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -193,6 +193,7 @@ bool kvm_slot_page_track_is_active(struct kvm *kvm,
 	return !!READ_ONCE(slot->arch.gfn_track[mode][index]);
 }
 
+#ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
 void kvm_page_track_cleanup(struct kvm *kvm)
 {
 	struct kvm_page_track_notifier_head *head;
@@ -208,6 +209,7 @@ int kvm_page_track_init(struct kvm *kvm)
 	head = &kvm->arch.track_notifier_head;
 	INIT_HLIST_HEAD(&head->track_notifier_list);
 	return init_srcu_struct(&head->track_srcu);
+	return 0;
 }
 
 /*
@@ -254,8 +256,8 @@ EXPORT_SYMBOL_GPL(kvm_page_track_unregister_notifier);
  * The node should figure out if the written page is the one that node is
  * interested in by itself.
  */
-void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
-			  int bytes)
+void __kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
+			    int bytes)
 {
 	struct kvm_page_track_notifier_head *head;
 	struct kvm_page_track_notifier_node *n;
@@ -272,8 +274,6 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 		if (n->track_write)
 			n->track_write(gpa, new, bytes, n);
 	srcu_read_unlock(&head->track_srcu, idx);
-
-	kvm_mmu_track_write(vcpu, gpa, new, bytes);
 }
 
 /*
@@ -316,3 +316,4 @@ enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
 	return max_level;
 }
 EXPORT_SYMBOL_GPL(kvm_page_track_max_mapping_level);
+#endif
diff --git a/arch/x86/kvm/mmu/page_track.h b/arch/x86/kvm/mmu/page_track.h
index 89712f123ad3..1b363784aa4a 100644
--- a/arch/x86/kvm/mmu/page_track.h
+++ b/arch/x86/kvm/mmu/page_track.h
@@ -6,8 +6,6 @@
 
 #include <asm/kvm_page_track.h>
 
-int kvm_page_track_init(struct kvm *kvm);
-void kvm_page_track_cleanup(struct kvm *kvm);
 
 bool kvm_page_track_write_tracking_enabled(struct kvm *kvm);
 int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot);
@@ -21,13 +19,37 @@ bool kvm_slot_page_track_is_active(struct kvm *kvm,
 				   const struct kvm_memory_slot *slot,
 				   gfn_t gfn, enum kvm_page_track_mode mode);
 
-void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
-			  int bytes);
+#ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
+int kvm_page_track_init(struct kvm *kvm);
+void kvm_page_track_cleanup(struct kvm *kvm);
+
+void __kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
+			    int bytes);
 void kvm_page_track_delete_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
 
 static inline bool kvm_page_track_has_external_user(struct kvm *kvm)
 {
 	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
 }
+#else
+static inline int kvm_page_track_init(struct kvm *kvm) { return 0; }
+static inline void kvm_page_track_cleanup(struct kvm *kvm) { }
+
+static inline void __kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
+					  const u8 *new, int bytes) { }
+static inline void kvm_page_track_delete_slot(struct kvm *kvm,
+					      struct kvm_memory_slot *slot) { }
+
+static inline bool kvm_page_track_has_external_user(struct kvm *kvm) { return false; }
+
+#endif /* CONFIG_KVM_EXTERNAL_WRITE_TRACKING */
+
+static inline void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
+					const u8 *new, int bytes)
+{
+	__kvm_page_track_write(vcpu, gpa, new, bytes);
+
+	kvm_mmu_track_write(vcpu, gpa, new, bytes);
+}
 
 #endif /* __KVM_X86_PAGE_TRACK_H */
-- 
2.39.0.314.g84b9a713c41-goog

