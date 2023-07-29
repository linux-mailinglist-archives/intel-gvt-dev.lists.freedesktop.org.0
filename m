Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF5767AF4
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312910E7D0;
	Sat, 29 Jul 2023 01:36:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4BF10E7C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:09 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-55c79a5565aso1694119a12.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594568; x=1691199368;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=LElPg6EV64u55H7Mf5AyrdjNlx5IOWlBkIPEppU8Jnw=;
 b=jfCkSXMvNm0a4r+jhBUQwEXZDOxflF3V10465oegx122JX3cMjyBQ9B6yH6wk+0Jzp
 UVY6dLZfCVQ0+FBwRm/X8oVmEgDEuMdMqkJVU/heWBSTLawPW9MjAzRT+N1Ynxg/SZNT
 KNqx0RkGgbjKNuutmmNxcjNPUVwHvZRAkFFuiWse/LAAXFpfuTolirdvvmrpgdLdTv4u
 Z4LbCo1VWeYHuIu/i1dW/gchrcve2Xo01BA20So28O333O53tZVGRyVXESvsCZFJCXwh
 1d9D4TzpmXEjyMHr15owgr2TNH+L6sDCDTgxWySgb2terfpz4qAARImLY+CUy17C8wlM
 P1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594568; x=1691199368;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LElPg6EV64u55H7Mf5AyrdjNlx5IOWlBkIPEppU8Jnw=;
 b=HqtOolljN2saT1bQY0Hu+ZZlU+Dck5WbQMiZCzbiHq2lv0hiLAs6F7RqIJG+hdzFJW
 lAjr6k6VatnbYzIvPtjMi/dth3mjceGm4SQIw86CVTjjmmEnC4cbOYi2yqNjVap7nJfx
 o4Va1zdO/6k2fs+kamlSNUvjWOWA/ZujuHl73JU6XYZWaHrnqbS6DkQNeqo4pQLNBasD
 hyTEnd41K4beVQ9W/qkNVJkeVhRtsOlDcQ9HAycd8lhlOiLvR1RW6xtAyTF5/0v7Jvtz
 jZoaQwnC75nzZACX/tIrRMNVdOT8ItFQ637uQP+9MipBcssx7qsb3XebyXgSmTgSFb59
 F9lg==
X-Gm-Message-State: ABy/qLbRfpUjmhz/xhba9deldxcz+K9fCftm+GX6Tsz4UnsV/P51Wy6x
 dlKa3nBAPyUauqy0xXSWC6B/T4PGdT8=
X-Google-Smtp-Source: APBJJlFvu/5rgdRg5jWuo0EZYVBoATZTGEN5oN8JxS8hlpYglyUmwtlAU4FlgtZH1W7tOI6Tno2qFTm78ZM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c406:b0:1b8:3c5e:2289 with SMTP id
 k6-20020a170902c40600b001b83c5e2289mr12198plk.2.1690594568714; Fri, 28 Jul
 2023 18:36:08 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:19 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-14-seanjc@google.com>
Subject: [PATCH v4 13/29] KVM: x86/mmu: Don't rely on page-track mechanism to
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
 Yongwei Ma <yongwei.ma@intel.com>, Ben Gardon <bgardon@google.com>,
 intel-gvt-dev@lists.freedesktop.org
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
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c6dee659d592..79ea57396d97 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6199,13 +6199,6 @@ static bool kvm_has_zapped_obsolete_pages(struct kvm *kvm)
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
@@ -6223,7 +6216,6 @@ int kvm_mmu_init_vm(struct kvm *kvm)
 	}
 
 	node->track_write = kvm_mmu_pte_write;
-	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
 	kvm_page_track_register_notifier(kvm, node);
 
 	kvm->arch.split_page_header_cache.kmem_cache = mmu_page_header_cache;
@@ -6765,6 +6757,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
+	kvm_mmu_zap_all_fast(kvm);
+
 	kvm_page_track_flush_slot(kvm, slot);
 }
 
-- 
2.41.0.487.g6d72f3e995-goog

