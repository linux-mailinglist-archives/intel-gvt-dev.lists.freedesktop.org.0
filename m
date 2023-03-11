Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C996B564E
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F17F10EA31;
	Sat, 11 Mar 2023 00:23:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E40C10EA2E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:10 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 n22-20020a62e516000000b0062262d6ed76so13033pff.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494190;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=eHqcqPuh0X7PQYReRTzohsMCRBED7m2vs4Y/3/bIpTQ=;
 b=tQGcDl0LzQbxToMGy5qxSYm8BEkXfhbWlTvTCiUHeYOQgTHbWZTZZRkA7ZqcvX9S86
 3KiDsW9HNTSISW2P73wBpcZ88hyQ+IeGlvy5TgSamFq6NZTm/UCrON8iXa2dzvIiWiGp
 +W4KemfD5UbSRZai7O68Kru+sWhdpFoikAvEsG8v0bmcf6DxSsz56ky4hZo8E4ooAgFs
 IspDuedJicbD6DnDrr+rpTcXPSUmA74Zy61zSlLY4/K0RTTs/UISui5nZTVB4TEsa+jv
 TweVwST4EA6OgArjt0oJ45NmU6Sj1e+QIO04KVV0l5mDaDbix4kdjntEKEREKSIzJqHJ
 LaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494190;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHqcqPuh0X7PQYReRTzohsMCRBED7m2vs4Y/3/bIpTQ=;
 b=Zjg+NiKWrKo5/6k7I8njD9DjTolB5VZCrfPzamNtKP8GoPTq94ddh1G7XqkfjsVtl4
 Xdw2e+zdvLCy1k7HOTiqAMJPdAp4gMk/UHbggmNO4UT2bDQ+bdqEWKkpx04WjTl1nO4/
 2mw5tJ6puk+xW8jQvTJPkCXucUn/uB8qhcmQIeN6cEnBVSLT8daM3QEvAyRLxZrb0DOO
 fQuCCZ5gdnBSzP8b0wKzI9nMBKtKHfCark3XPtoA5so4zgpMbSkBTJ+TVUnogB4lbZ2I
 oK2R/C+2CIpmmsr8e6f6hKi3QmDnh6cGNTGEKPAun9BasN4M0vRTbBZK9Z/OZDEQrcTf
 KlmA==
X-Gm-Message-State: AO0yUKVaaVFUZKUouAXldVETMo1Qt2gZbsAzIyRRnBW3wz0RqUr8V4bZ
 Ll0j1je1OObNQKhiS1IseW+1fKc1jUo=
X-Google-Smtp-Source: AK7set9jx7Uy7PzVJsl0JZUMlerJnH1eqXkOWuYf0hsbDX1FhGPzk3Q6AIFhADI5JkJoBFyLT7Lz5rpwrlo=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c688:b0:22c:89b:8e97 with SMTP id
 n8-20020a17090ac68800b0022c089b8e97mr1510024pjt.1.1678494189968; Fri, 10 Mar
 2023 16:23:09 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:33 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-3-seanjc@google.com>
Subject: [PATCH v2 02/27] KVM: x86/mmu: Factor out helper to get max mapping
 size of a memslot
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

Extract the memslot-related logic of kvm_mmu_max_mapping_level() into a
new helper so that KVMGT can determine whether or not mapping a 2MiB page
into the guest is (dis)allowed per KVM's memslots.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 21 +++++++++++++++------
 arch/x86/kvm/mmu/mmu_internal.h |  2 ++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c8ebe542c565..4685c80e441b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3083,20 +3083,29 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	return level;
 }
 
+int kvm_mmu_max_slot_mapping_level(const struct kvm_memory_slot *slot,
+				   gfn_t gfn, int max_level)
+{
+	struct kvm_lpage_info *linfo;
+
+	for ( ; max_level > PG_LEVEL_4K; max_level--) {
+		linfo = lpage_info_slot(gfn, slot, max_level);
+		if (!linfo->disallow_lpage)
+			break;
+	}
+	return max_level;
+}
+
 int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn,
 			      int max_level)
 {
-	struct kvm_lpage_info *linfo;
 	int host_level;
 
 	max_level = min(max_level, max_huge_page_level);
-	for ( ; max_level > PG_LEVEL_4K; max_level--) {
-		linfo = lpage_info_slot(gfn, slot, max_level);
-		if (!linfo->disallow_lpage)
-			break;
-	}
+	max_level = kvm_mmu_max_slot_mapping_level(slot, gfn, max_level);
 
+	/* Avoid walking the host page tables if a hugepage is impossible. */
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index cc58631e2336..9db7fa0b3bf9 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -328,6 +328,8 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	return r;
 }
 
+int kvm_mmu_max_slot_mapping_level(const struct kvm_memory_slot *slot,
+				   gfn_t gfn, int max_level);
 int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn,
 			      int max_level);
-- 
2.40.0.rc1.284.g88254d51c5-goog

