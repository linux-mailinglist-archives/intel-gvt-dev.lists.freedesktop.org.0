Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B96B5681
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D757710EA5D;
	Sat, 11 Mar 2023 00:23:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA3010EA49
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:41 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 f14-20020a056a00228e00b005e46dd41b67so3551500pfe.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494221;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=HxEehcXrpX7olViouiK87C8bjDZGeN8cYW+EXJJdOt4=;
 b=cdfSt3tL/o32zElEZy8WVfwKyKq0Jt+YGOROR7DJVMExtIx8l+v0zqqv6OwwH4my+N
 YZMD6W0gWu24Dh9pEpDi5BgsLnWkgPMV3Auw/ong/FOFp6zpGetKNdy3xE5hpaL0MUP9
 45s90QSDJ42lx29KEJ5HuhxhSOnDPKDdR6La9hO2fNOv06okUHihyBtMZLipEcviN1Xj
 lVqYWcrS9ESXFiSQ9eXX4yIOTevZ5OxXP8cNCSSbZF7LMrkarHGClMZdMQdSAzzHa1os
 7NmxPjl26+WrNkN9bqKy8DA1cg4Q6TW2z5gWXAMMrAGjrrdrtezFONadIMFRhSkzNpBz
 n4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494221;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxEehcXrpX7olViouiK87C8bjDZGeN8cYW+EXJJdOt4=;
 b=RD2ItSVt1K26kednk8UAgLPJG9ycumocfKhXdvYVt/7pWwaoCVnQZDiaFg3/1TbhMv
 kLqMAB2+1W+7Yn5L2rxyS4nhk4mhOUMjlDKxA/i7NV9B1r1d+t6NuK3bpZvApggvPOMY
 Q/mPoxvuS4+oLUk9PWbUfQrz1tSQsrl5peJj3KXVTpROsPaigZ4fpQEWI3mLpiOTrCbw
 b1eMPRJUmr46caDLx7RzMdJKBP91E6ADT7CjEGK7tgxK7zZE6txw9g1ISQp+IDUvauyA
 ZjXxl/YDqQ+VZs5+5GOGAjJ3/KZVtP5QbZoBb4I1jk8Bt7hZ50xijWhrZ62Xr38Rsu3J
 Ppaw==
X-Gm-Message-State: AO0yUKWUhzneto+QJOvheOtzHmVxumOfztA1R8C+y6bg1LzKusJ9VFKw
 IuYa/FUar2CccwJLgxcejNGNgaRu954=
X-Google-Smtp-Source: AK7set9aO/RVHNF+aYFR945UEqH4waU6tY57HFw+LZH9GnnzvfVBmwvKLQUHkYpu0OGsMCqkqK6RAHzU9TI=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr11130509pfe.5.1678494221665; Fri, 10
 Mar 2023 16:23:41 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:50 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-20-seanjc@google.com>
Subject: [PATCH v2 19/27] KVM: x86/mmu: Move KVM-only page-track declarations
 to internal header
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

Bury the declaration of the page-track helpers that are intended only for
internal KVM use in a "private" header.  In addition to guarding against
unwanted usage of the internal-only helpers, dropping their definitions
avoids exposing other structures that should be KVM-internal, e.g. for
memslots.  This is a baby step toward making kvm_host.h a KVM-internal
header in the very distant future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h | 26 ++++-----------------
 arch/x86/kvm/mmu/mmu.c                |  3 ++-
 arch/x86/kvm/mmu/page_track.c         |  8 +------
 arch/x86/kvm/mmu/page_track.h         | 33 +++++++++++++++++++++++++++
 arch/x86/kvm/x86.c                    |  1 +
 5 files changed, 42 insertions(+), 29 deletions(-)
 create mode 100644 arch/x86/kvm/mmu/page_track.h

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index e5eb98ca4fce..deece45936a5 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_KVM_PAGE_TRACK_H
 #define _ASM_X86_KVM_PAGE_TRACK_H
 
+#include <linux/kvm_types.h>
+
 enum kvm_page_track_mode {
 	KVM_PAGE_TRACK_WRITE,
 	KVM_PAGE_TRACK_MAX,
@@ -46,28 +48,15 @@ struct kvm_page_track_notifier_node {
 				    struct kvm_page_track_notifier_node *node);
 };
 
-int kvm_page_track_init(struct kvm *kvm);
-void kvm_page_track_cleanup(struct kvm *kvm);
-
-bool kvm_page_track_write_tracking_enabled(struct kvm *kvm);
-int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot);
-enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
-					       enum pg_level max_level);
-
-void kvm_page_track_free_memslot(struct kvm_memory_slot *slot);
-int kvm_page_track_create_memslot(struct kvm *kvm,
-				  struct kvm_memory_slot *slot,
-				  unsigned long npages);
-
 void kvm_slot_page_track_add_page(struct kvm *kvm,
 				  struct kvm_memory_slot *slot, gfn_t gfn,
 				  enum kvm_page_track_mode mode);
 void kvm_slot_page_track_remove_page(struct kvm *kvm,
 				     struct kvm_memory_slot *slot, gfn_t gfn,
 				     enum kvm_page_track_mode mode);
-bool kvm_slot_page_track_is_active(struct kvm *kvm,
-				   const struct kvm_memory_slot *slot,
-				   gfn_t gfn, enum kvm_page_track_mode mode);
+
+enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
+					       enum pg_level max_level);
 
 void
 kvm_page_track_register_notifier(struct kvm *kvm,
@@ -75,10 +64,5 @@ kvm_page_track_register_notifier(struct kvm *kvm,
 void
 kvm_page_track_unregister_notifier(struct kvm *kvm,
 				   struct kvm_page_track_notifier_node *n);
-void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
-			  int bytes);
-void kvm_page_track_delete_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
-
-bool kvm_page_track_has_external_user(struct kvm *kvm);
 
 #endif
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4f2f83d8322e..e192968340bf 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -25,6 +25,7 @@
 #include "kvm_cache_regs.h"
 #include "smm.h"
 #include "kvm_emulate.h"
+#include "page_track.h"
 #include "cpuid.h"
 #include "spte.h"
 
@@ -53,7 +54,7 @@
 #include <asm/io.h>
 #include <asm/set_memory.h>
 #include <asm/vmx.h>
-#include <asm/kvm_page_track.h>
+
 #include "trace.h"
 
 extern bool itlb_multihit_kvm_mitigation;
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 907ab8abb452..a21200df515d 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -15,10 +15,9 @@
 #include <linux/kvm_host.h>
 #include <linux/rculist.h>
 
-#include <asm/kvm_page_track.h>
-
 #include "mmu.h"
 #include "mmu_internal.h"
+#include "page_track.h"
 
 bool kvm_page_track_write_tracking_enabled(struct kvm *kvm)
 {
@@ -318,8 +317,3 @@ enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
 	return max_level;
 }
 EXPORT_SYMBOL_GPL(kvm_page_track_max_mapping_level);
-
-bool kvm_page_track_has_external_user(struct kvm *kvm)
-{
-	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
-}
diff --git a/arch/x86/kvm/mmu/page_track.h b/arch/x86/kvm/mmu/page_track.h
new file mode 100644
index 000000000000..89712f123ad3
--- /dev/null
+++ b/arch/x86/kvm/mmu/page_track.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_X86_PAGE_TRACK_H
+#define __KVM_X86_PAGE_TRACK_H
+
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_page_track.h>
+
+int kvm_page_track_init(struct kvm *kvm);
+void kvm_page_track_cleanup(struct kvm *kvm);
+
+bool kvm_page_track_write_tracking_enabled(struct kvm *kvm);
+int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot);
+
+void kvm_page_track_free_memslot(struct kvm_memory_slot *slot);
+int kvm_page_track_create_memslot(struct kvm *kvm,
+				  struct kvm_memory_slot *slot,
+				  unsigned long npages);
+
+bool kvm_slot_page_track_is_active(struct kvm *kvm,
+				   const struct kvm_memory_slot *slot,
+				   gfn_t gfn, enum kvm_page_track_mode mode);
+
+void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
+			  int bytes);
+void kvm_page_track_delete_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
+
+static inline bool kvm_page_track_has_external_user(struct kvm *kvm)
+{
+	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
+}
+
+#endif /* __KVM_X86_PAGE_TRACK_H */
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 59b02650cefc..ba61e51c05ed 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -25,6 +25,7 @@
 #include "tss.h"
 #include "kvm_cache_regs.h"
 #include "kvm_emulate.h"
+#include "mmu/page_track.h"
 #include "x86.h"
 #include "cpuid.h"
 #include "pmu.h"
-- 
2.40.0.rc1.284.g88254d51c5-goog

