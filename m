Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0153B3D98
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 25 Jun 2021 09:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890F86ECE4;
	Fri, 25 Jun 2021 07:37:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420446ECE4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Jun 2021 07:37:44 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id k6so7337127pfk.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Jun 2021 00:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fqk0DelF/G3CbqfbPGVAAboO/i2+VKjmNvuYbOFS18c=;
 b=MfQ9c0IIzkrFE+VtmmcjNlao2nJ8ViQGBtFp/x/59KONu6gOH3Mwk5XrtXTblsxFVA
 1mu4wyW2+1q33Y0q8K+qQlRULEPaJz0VOOS5NpFzA6uNw4HgpMvZ2kLnINHDWsIJVxVX
 MBdifgomPj+X+YQSA40dAjd9J57SbwAtlWJBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fqk0DelF/G3CbqfbPGVAAboO/i2+VKjmNvuYbOFS18c=;
 b=CvaiUetk5j2v+0LpdtGw2/NQ8Cd2lIiV6WwvjOSCpjzUhG5tMj/VBocbb37aRVsHIY
 GF4AftzvDB4BJn+0x7/d+fQRuemqPan08JI1N0opSot784DjTESdLvvyhff7VH7GRN48
 qff9EUAcSUyCZf1kCmC6urC3k05BOZZTTBd8k8kkCexbrc0LZVqssMe9w9GMKq+XsfJT
 Rug6umx+9PhwSq5h4pJ+aQGxJvi73XnQ8Kx+wsN+6+Oo8ysYKO7qmFbFQfU875BWVz59
 0hh0FfOR5UUTtOsaPE0ZCbV+VnhiaA7bQ/O2H/Sp/77SE3NpLCKNyt2XlXlEAOgkHdUB
 bUCw==
X-Gm-Message-State: AOAM5312EMYKfDLtumgkQOzr5W5anVO9lBoExQmQ+NusFVuDBdONUypE
 R9Us9fJvUVBODSrFleROAE9kgQ==
X-Google-Smtp-Source: ABdhPJyDQjJ8DoenzHqpaTZP97J/xwMvdaj5O2QENtyBCuGOv08FPB9cPN0MgLOILspvakBGi9fTdQ==
X-Received: by 2002:a63:b54:: with SMTP id a20mr8444200pgl.407.1624606663879; 
 Fri, 25 Jun 2021 00:37:43 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1492:9d4f:19fa:df61])
 by smtp.gmail.com with UTF8SMTPSA id m18sm5284072pff.88.2021.06.25.00.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:37:43 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Nick Piggin <npiggin@gmail.com>
Subject: [PATCH v2 4/5] KVM: arm64/mmu: use gfn_to_pfn_page
Date: Fri, 25 Jun 2021 16:36:15 +0900
Message-Id: <20210625073616.2184426-5-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210625073616.2184426-1-stevensd@google.com>
References: <20210625073616.2184426-1-stevensd@google.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Alexandru Elisei <alexandru.elisei@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Zhi Wang <zhi.a.wang@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, David Stevens <stevensd@chromium.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

Covert usages of the deprecated gfn_to_pfn functions to the new
gfn_to_pfn_page functions.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/arm64/kvm/mmu.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c10207fed2f3..c29da690ed74 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -780,7 +780,7 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
 static unsigned long
 transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 			    unsigned long hva, kvm_pfn_t *pfnp,
-			    phys_addr_t *ipap)
+			    struct page **page, phys_addr_t *ipap)
 {
 	kvm_pfn_t pfn = *pfnp;
 
@@ -789,7 +789,7 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (kvm_is_transparent_hugepage(pfn) &&
+	if (*page && kvm_is_transparent_hugepage(pfn) &&
 	    fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
 		/*
 		 * The address we faulted on is backed by a transparent huge
@@ -810,10 +810,11 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 		 * page accordingly.
 		 */
 		*ipap &= PMD_MASK;
-		kvm_release_pfn_clean(pfn);
+		put_page(*page);
 		pfn &= ~(PTRS_PER_PMD - 1);
-		kvm_get_pfn(pfn);
 		*pfnp = pfn;
+		*page = pfn_to_page(pfn);
+		get_page(*page);
 
 		return PMD_SIZE;
 	}
@@ -837,6 +838,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	short vma_shift;
 	gfn_t gfn;
 	kvm_pfn_t pfn;
+	struct page *page;
 	bool logging_active = memslot_is_logging(memslot);
 	unsigned long fault_level = kvm_vcpu_trap_get_fault_level(vcpu);
 	unsigned long vma_pagesize, fault_granule;
@@ -933,8 +935,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	smp_rmb();
 
-	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable, NULL);
+	pfn = __gfn_to_pfn_page_memslot(memslot, gfn, false, NULL,
+					write_fault, &writable, NULL, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
@@ -967,7 +969,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	if (vma_pagesize == PAGE_SIZE && !force_pte)
 		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
-							   &pfn, &fault_ipa);
+							   &pfn, &page,
+							   &fault_ipa);
 	if (writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
@@ -999,14 +1002,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret) {
-		kvm_set_pfn_dirty(pfn);
+		if (page)
+			kvm_set_pfn_dirty(pfn);
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 	}
 
 out_unlock:
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(pfn);
-	kvm_release_pfn_clean(pfn);
+	if (page) {
+		kvm_set_pfn_accessed(pfn);
+		put_page(page);
+	}
 	return ret != -EAGAIN ? ret : 0;
 }
 
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
