Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755BE654A01
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6AF10E60A;
	Fri, 23 Dec 2022 00:58:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E285B10E605
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:16 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id
 g32-20020a635660000000b00478c21b8095so1903362pgm.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=2SF5s6q4/xQUtKV/+KulhfW7DVgHuWHr5hL3mzoDnJI=;
 b=YdyYiN/HfbomLEuoFTeN/yJRSYqp7WrvTDJCOomo3um5lS7K21Qcg1TnOovAxV2rjB
 e4tJI/oGsixBSZKxqJKrHwugFrPyqi16zf68pdsutFUeSEbtOOvQ9ShyozwKlqqbni3c
 jsw19AG0tt3LC59gkMVC2WP0A4DfveSohjEnkIO1k3V2Ax7nO0XOLGhIEh+97Gg8KAjy
 NaAIKLU4QFTYnrdYvYdnCLBHbK1Sd4jEO+Buld9qws+5f/xqz8kvoSsWzUm/UompVcOC
 Qoslt+SebQaRVkTaNf3sT7kRT9/tsUP96ovnJdXU7SeULDICSHpY8nZskPJ9kb7ub6NQ
 BaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SF5s6q4/xQUtKV/+KulhfW7DVgHuWHr5hL3mzoDnJI=;
 b=qT1wovWek7x/ph6TcB1DMQFBJ5J0Yk9ppuRKKusd1/X3K2sU++Qx9Kyntfd5j46j+S
 EZoo9gM7amLh5XMHBz8Mqnb6AAL0XSWhdRRgGEnAHL8bbLTIF1TWiYGwK+q8GUII+D5Z
 8qcTfU09fkXcmpumZlTOqSI45GL+GcYwMRFxEtC2/y3h6ntSLoAm8c/zpYJ8ZiiAGQQd
 dx3GoYXNLnluozKKCpou++yp2Qm0h+e4bW7RS74rwNSEFSZ/Yep6MM4LAWt95pda80KY
 MosDLMpEfu5PuS3eHL3r+KmkXIoWeXtJASV6YkmE2DfT3ENqummcyDrZ7vZm5CLP7vRx
 RJJg==
X-Gm-Message-State: AFqh2kqbzDwTKQTTAaX1iJ6wI1zfx6yiZOSz4/D6VXy9Bsr4GIMlJ2aN
 D26yZvGyCQv6JyoSJADQI3vAUTE6y9M=
X-Google-Smtp-Source: AMrXdXt0uH8Enm7A+uwjDx/JWL6mLB2GLLsrANJvONxxpHaK9UdS9/AhfXkVYLxnfSrgM4rXXqMd/X6qfkg=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:5a4c:0:b0:457:7285:fd2d with SMTP id
 z12-20020a655a4c000000b004577285fd2dmr479521pgs.580.1671757096173; Thu, 22
 Dec 2022 16:58:16 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:30 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-19-seanjc@google.com>
Subject: [PATCH 18/27] KVM: x86/mmu: Move KVM-only page-track declarations to
 internal header
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
index dfeddea8148a..6477ef435575 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -24,6 +24,7 @@
 #include "kvm_cache_regs.h"
 #include "smm.h"
 #include "kvm_emulate.h"
+#include "page_track.h"
 #include "cpuid.h"
 #include "spte.h"
 
@@ -51,7 +52,7 @@
 #include <asm/io.h>
 #include <asm/set_memory.h>
 #include <asm/vmx.h>
-#include <asm/kvm_page_track.h>
+
 #include "trace.h"
 
 extern bool itlb_multihit_kvm_mitigation;
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index d2b9f7f183cc..2b302fd2c5dd 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -14,10 +14,9 @@
 #include <linux/kvm_host.h>
 #include <linux/rculist.h>
 
-#include <asm/kvm_page_track.h>
-
 #include "mmu.h"
 #include "mmu_internal.h"
+#include "page_track.h"
 
 bool kvm_page_track_write_tracking_enabled(struct kvm *kvm)
 {
@@ -317,8 +316,3 @@ enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
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
index f372c41ee2c2..41d47a23396c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -24,6 +24,7 @@
 #include "tss.h"
 #include "kvm_cache_regs.h"
 #include "kvm_emulate.h"
+#include "mmu/page_track.h"
 #include "x86.h"
 #include "cpuid.h"
 #include "pmu.h"
-- 
2.39.0.314.g84b9a713c41-goog

