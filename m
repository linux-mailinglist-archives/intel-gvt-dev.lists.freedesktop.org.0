Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D47A3B25D9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Jun 2021 05:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E9D6E9DA;
	Thu, 24 Jun 2021 03:59:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084616E9DA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jun 2021 03:59:44 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id g24so2675581pji.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Jun 2021 20:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SdgTNYjmLMWmcRIfueOdYZ96HzTH4opPLXoYslwZ9E=;
 b=HPdpShzC0ybrvT3bK4wS9AKVUDr5krTibehvPCZeEb7XnHyjJPFqDvLyg3WoT7WmjA
 ii16HFDb+Dr/ywbx1G0hClCMdzQem5OgkBkpMqkErnAepeE/QnIHr5J5GBAyF/S1r4Eo
 AQK6afL4d3/6PBkes4NF6aPC5Zj6ARVYpr48Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SdgTNYjmLMWmcRIfueOdYZ96HzTH4opPLXoYslwZ9E=;
 b=HxchveZWL017mcQ7KopNivRXBnOl8HlFT9UOkAQ4cOAmWa0W5dHFHhvoMdzo3d36qF
 2qkQzjU1N0voQMw1UkFZvOEm/O3tms7AJW1UqIykBsgJsWeMSoTh6IwX2UKrh0p96Shy
 ADVU8ZAWV3xj9lutc728R6UJWM5v172zrEyGmIHQE5CANeHxF73zVudTg2HrWTGVxlU4
 D5NcGP06DFbx7hbEJsFWBWDN6jfcXEWwxIxoYmB2m3mVf/O3GIZgMNR4ZTPBCMdSEngS
 wOpD4ToXydki2Gqt6vkLjSM3YODwYtj1i0sCt9L+agh+a/fz+JnOsqlyZ2hgyiF4wSZp
 wMiA==
X-Gm-Message-State: AOAM532ReggiaS+dUClS6zxML7d73t8SFycvItS75t4sa+YK1yyi78uj
 AVllZGkkVjUELzYoam+g6Djp7A==
X-Google-Smtp-Source: ABdhPJzreaDO29ENi90p5LTXgfYQ+JVEXyymwYOr6PQkte1CXgDzacuiEb/ffZjtnDSEFkJwBV2Mlg==
X-Received: by 2002:a17:903:228d:b029:127:95be:1f7d with SMTP id
 b13-20020a170903228db029012795be1f7dmr2430947plh.64.1624507183619; 
 Wed, 23 Jun 2021 20:59:43 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
 by smtp.gmail.com with UTF8SMTPSA id r92sm6898647pja.6.2021.06.23.20.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 20:59:43 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 4/6] KVM: arm64/mmu: avoid struct page in MMU
Date: Thu, 24 Jun 2021 12:57:47 +0900
Message-Id: <20210624035749.4054934-5-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
References: <20210624035749.4054934-1-stevensd@google.com>
MIME-Version: 1.0
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
Cc: intel-gvt-dev@lists.freedesktop.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 David Stevens <stevensd@chromium.org>, James Morse <james.morse@arm.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

Avoid converting pfns returned by follow_fault_pfn to struct pages to
transiently take a reference. The reference was originally taken to
match the reference taken by gup. However, pfns returned by
follow_fault_pfn may not have a struct page set up for reference
counting.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/arm64/kvm/mmu.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 896b3644b36f..a741972cb75f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -779,17 +779,17 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
  */
 static unsigned long
 transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
-			    unsigned long hva, kvm_pfn_t *pfnp,
+			    unsigned long hva, struct kvm_pfn_page *pfnpgp,
 			    phys_addr_t *ipap)
 {
-	kvm_pfn_t pfn = *pfnp;
+	kvm_pfn_t pfn = pfnpgp->pfn;
 
 	/*
 	 * Make sure the adjustment is done only for THP pages. Also make
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (kvm_is_transparent_hugepage(pfn) &&
+	if (pfnpgp->page && kvm_is_transparent_hugepage(pfn) &&
 	    fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
 		/*
 		 * The address we faulted on is backed by a transparent huge
@@ -810,10 +810,11 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 		 * page accordingly.
 		 */
 		*ipap &= PMD_MASK;
-		kvm_release_pfn_clean(pfn);
+		put_page(pfnpgp->page);
 		pfn &= ~(PTRS_PER_PMD - 1);
-		kvm_get_pfn(pfn);
-		*pfnp = pfn;
+		pfnpgp->pfn = pfn;
+		pfnpgp->page = pfn_to_page(pfnpgp->pfn);
+		get_page(pfnpgp->page);
 
 		return PMD_SIZE;
 	}
@@ -836,7 +837,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	struct vm_area_struct *vma;
 	short vma_shift;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 	bool logging_active = memslot_is_logging(memslot);
 	unsigned long fault_level = kvm_vcpu_trap_get_fault_level(vcpu);
 	unsigned long vma_pagesize, fault_granule;
@@ -933,17 +934,16 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	smp_rmb();
 
-	pfn = kvm_pfn_page_unwrap(__gfn_to_pfn_memslot(memslot, gfn, false,
-						       NULL, write_fault,
-						       &writable, NULL));
-	if (pfn == KVM_PFN_ERR_HWPOISON) {
+	pfnpg = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
+				     write_fault, &writable, NULL);
+	if (pfnpg.pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
 	}
-	if (is_error_noslot_pfn(pfn))
+	if (is_error_noslot_pfn(pfnpg.pfn))
 		return -EFAULT;
 
-	if (kvm_is_device_pfn(pfn)) {
+	if (kvm_is_device_pfn(pfnpg.pfn)) {
 		device = true;
 		force_pte = true;
 	} else if (logging_active && !write_fault) {
@@ -968,16 +968,16 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	if (vma_pagesize == PAGE_SIZE && !force_pte)
 		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
-							   &pfn, &fault_ipa);
+							   &pfnpg, &fault_ipa);
 	if (writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
 	if (fault_status != FSC_PERM && !device)
-		clean_dcache_guest_page(pfn, vma_pagesize);
+		clean_dcache_guest_page(pfnpg.pfn, vma_pagesize);
 
 	if (exec_fault) {
 		prot |= KVM_PGTABLE_PROT_X;
-		invalidate_icache_guest_page(pfn, vma_pagesize);
+		invalidate_icache_guest_page(pfnpg.pfn, vma_pagesize);
 	}
 
 	if (device)
@@ -994,20 +994,23 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
 	} else {
 		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
-					     __pfn_to_phys(pfn), prot,
+					     __pfn_to_phys(pfnpg.pfn), prot,
 					     memcache);
 	}
 
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret) {
-		kvm_set_pfn_dirty(pfn);
+		if (pfnpg.page)
+			kvm_set_pfn_dirty(pfnpg.pfn);
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 	}
 
 out_unlock:
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(pfn);
-	kvm_release_pfn_clean(pfn);
+	if (pfnpg.page) {
+		kvm_set_pfn_accessed(pfnpg.pfn);
+		put_page(pfnpg.page);
+	}
 	return ret != -EAGAIN ? ret : 0;
 }
 
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
