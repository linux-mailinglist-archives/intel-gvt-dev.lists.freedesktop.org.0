Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B1512354
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Apr 2022 22:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD36710E504;
	Wed, 27 Apr 2022 20:03:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC3210E461
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Apr 2022 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/G/1I1AFGV7/M3Oqa7HyuoKCDAEb6r9zT6yudtrsQI=;
 b=NaGVpYV9OABk0Aan3G2dWyqKKgol5cF02sKZ32XQPZvztzhdEkbZeNq4UhLnlG+h5Rx5uR
 jDIkHRGO70ov02JMqujSk1uO4R1AkL8c49xgb/doECTesqX4r2wFwYbwxwwLlHbKH7mgpZ
 iOqZ9DFg8+s220d3/CpFPbm222nzS7U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-cESqV5ndMp6vWCOPK914cw-1; Wed, 27 Apr 2022 16:03:47 -0400
X-MC-Unique: cESqV5ndMp6vWCOPK914cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F8B785A5BC;
 Wed, 27 Apr 2022 20:03:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6D479E74;
 Wed, 27 Apr 2022 20:03:40 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write tracking
 externally
Date: Wed, 27 Apr 2022 23:02:59 +0300
Message-Id: <20220427200314.276673-5-mlevitsk@redhat.com>
In-Reply-To: <20220427200314.276673-1-mlevitsk@redhat.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This will be used to enable write tracking from nested AVIC code
and can also be used to enable write tracking in GVT-g module
when it actually uses it as opposed to always enabling it,
when the module is compiled in the kernel.

No functional change intended.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h       |  2 +-
 arch/x86/include/asm/kvm_page_track.h |  1 +
 arch/x86/kvm/mmu.h                    |  8 +++++---
 arch/x86/kvm/mmu/mmu.c                | 17 ++++++++++-------
 arch/x86/kvm/mmu/page_track.c         | 10 ++++++++--
 5 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 636df87542555..fc7df778a3d71 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1254,7 +1254,7 @@ struct kvm_arch {
 	 * is used as one input when determining whether certain memslot
 	 * related allocations are necessary.
 	 */
-	bool shadow_root_allocated;
+	bool mmu_page_tracking_enabled;
 
 #if IS_ENABLED(CONFIG_HYPERV)
 	hpa_t	hv_root_tdp;
diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index eb186bc57f6a9..955a5ae07b10e 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -50,6 +50,7 @@ int kvm_page_track_init(struct kvm *kvm);
 void kvm_page_track_cleanup(struct kvm *kvm);
 
 bool kvm_page_track_write_tracking_enabled(struct kvm *kvm);
+int kvm_page_track_write_tracking_enable(struct kvm *kvm);
 int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot);
 
 void kvm_page_track_free_memslot(struct kvm_memory_slot *slot);
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 671cfeccf04e9..44d15551f7156 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -269,7 +269,7 @@ int kvm_arch_write_log_dirty(struct kvm_vcpu *vcpu);
 int kvm_mmu_post_init_vm(struct kvm *kvm);
 void kvm_mmu_pre_destroy_vm(struct kvm *kvm);
 
-static inline bool kvm_shadow_root_allocated(struct kvm *kvm)
+static inline bool mmu_page_tracking_enabled(struct kvm *kvm)
 {
 	/*
 	 * Read shadow_root_allocated before related pointers. Hence, threads
@@ -277,9 +277,11 @@ static inline bool kvm_shadow_root_allocated(struct kvm *kvm)
 	 * see the pointers. Pairs with smp_store_release in
 	 * mmu_first_shadow_root_alloc.
 	 */
-	return smp_load_acquire(&kvm->arch.shadow_root_allocated);
+	return smp_load_acquire(&kvm->arch.mmu_page_tracking_enabled);
 }
 
+int mmu_enable_write_tracking(struct kvm *kvm);
+
 #ifdef CONFIG_X86_64
 static inline bool is_tdp_mmu_enabled(struct kvm *kvm) { return kvm->arch.tdp_mmu_enabled; }
 #else
@@ -288,7 +290,7 @@ static inline bool is_tdp_mmu_enabled(struct kvm *kvm) { return false; }
 
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
-	return !is_tdp_mmu_enabled(kvm) || kvm_shadow_root_allocated(kvm);
+	return !is_tdp_mmu_enabled(kvm) || mmu_page_tracking_enabled(kvm);
 }
 
 static inline gfn_t gfn_to_index(gfn_t gfn, gfn_t base_gfn, int level)
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 904f0faff2186..fb744616bf7df 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3389,7 +3389,7 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
 	return r;
 }
 
-static int mmu_first_shadow_root_alloc(struct kvm *kvm)
+int mmu_enable_write_tracking(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *slot;
@@ -3399,21 +3399,20 @@ static int mmu_first_shadow_root_alloc(struct kvm *kvm)
 	 * Check if this is the first shadow root being allocated before
 	 * taking the lock.
 	 */
-	if (kvm_shadow_root_allocated(kvm))
+	if (mmu_page_tracking_enabled(kvm))
 		return 0;
 
 	mutex_lock(&kvm->slots_arch_lock);
 
 	/* Recheck, under the lock, whether this is the first shadow root. */
-	if (kvm_shadow_root_allocated(kvm))
+	if (mmu_page_tracking_enabled(kvm))
 		goto out_unlock;
 
 	/*
 	 * Check if anything actually needs to be allocated, e.g. all metadata
 	 * will be allocated upfront if TDP is disabled.
 	 */
-	if (kvm_memslots_have_rmaps(kvm) &&
-	    kvm_page_track_write_tracking_enabled(kvm))
+	if (kvm_memslots_have_rmaps(kvm) && mmu_page_tracking_enabled(kvm))
 		goto out_success;
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
@@ -3443,7 +3442,7 @@ static int mmu_first_shadow_root_alloc(struct kvm *kvm)
 	 * all the related pointers are set.
 	 */
 out_success:
-	smp_store_release(&kvm->arch.shadow_root_allocated, true);
+	smp_store_release(&kvm->arch.mmu_page_tracking_enabled, true);
 
 out_unlock:
 	mutex_unlock(&kvm->slots_arch_lock);
@@ -3480,7 +3479,7 @@ static int mmu_alloc_shadow_roots(struct kvm_vcpu *vcpu)
 		}
 	}
 
-	r = mmu_first_shadow_root_alloc(vcpu->kvm);
+	r = mmu_enable_write_tracking(vcpu->kvm);
 	if (r)
 		return r;
 
@@ -5753,6 +5752,10 @@ int kvm_mmu_init_vm(struct kvm *kvm)
 	node->track_write = kvm_mmu_pte_write;
 	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
 	kvm_page_track_register_notifier(kvm, node);
+
+	if (IS_ENABLED(CONFIG_KVM_EXTERNAL_WRITE_TRACKING) || !tdp_enabled)
+		mmu_enable_write_tracking(kvm);
+
 	return 0;
 }
 
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 2e09d1b6249f3..8857d629036d7 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -21,10 +21,16 @@
 
 bool kvm_page_track_write_tracking_enabled(struct kvm *kvm)
 {
-	return IS_ENABLED(CONFIG_KVM_EXTERNAL_WRITE_TRACKING) ||
-	       !tdp_enabled || kvm_shadow_root_allocated(kvm);
+	return mmu_page_tracking_enabled(kvm);
 }
 
+int kvm_page_track_write_tracking_enable(struct kvm *kvm)
+{
+	return mmu_enable_write_tracking(kvm);
+}
+EXPORT_SYMBOL_GPL(kvm_page_track_write_tracking_enable);
+
+
 void kvm_page_track_free_memslot(struct kvm_memory_slot *slot)
 {
 	int i;
-- 
2.26.3

