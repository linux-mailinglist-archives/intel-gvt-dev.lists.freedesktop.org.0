Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE884AC48C
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 16:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E49010E264;
	Mon,  7 Feb 2022 15:59:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAB510E264
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PA0ZlhnyV8+URLprs6c44r6sDD4SwJewRmeM2u7HZ1o=;
 b=jMPFZ/gt5tFdRYiobreHN4+W4V4Y6O0LMq1QmlWHrXenrJTzEkx4r7NNva81pFaKSxonzL
 BXjrhG0rhxCxDGS5fJ+wX8diE0qqq/oU3BWFblCVphn8ZfwP5ZPVuVMr0tJaTN1rvIqa9W
 m9DOXhKj0wZu4YrreQlSnaLv0Rmwi6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-CJQeKoKLORqhqrfN0EJQcg-1; Mon, 07 Feb 2022 10:59:08 -0500
X-MC-Unique: CJQeKoKLORqhqrfN0EJQcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1522F3E743;
 Mon,  7 Feb 2022 15:58:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 923C89652D;
 Mon,  7 Feb 2022 15:58:47 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 18/30] KVM: x86: mmu: add strict mmu mode
Date: Mon,  7 Feb 2022 17:54:35 +0200
Message-Id: <20220207155447.840194-19-mlevitsk@redhat.com>
In-Reply-To: <20220207155447.840194-1-mlevitsk@redhat.com>
References: <20220207155447.840194-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Kan Liang <kan.liang@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tony Luck <tony.luck@intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Add an (mostly debug) option to force KVM's shadow mmu
to never have unsync pages.

This is useful in some cases to debug it.

It is also useful for some legacy guest OSes which don't
flush TLBs correctly, and thus don't work on modern
CPUs which have speculative MMUs.

Using this option together with legacy paging (npt/ept=0)
allows to correctly simulate such old MMU while still
getting most of the benefits of the virtualization.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 43c7abdd6b70f..fa2da6990703f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -91,6 +91,10 @@ __MODULE_PARM_TYPE(nx_huge_pages_recovery_period_ms, "uint");
 static bool __read_mostly force_flush_and_sync_on_reuse;
 module_param_named(flush_on_reuse, force_flush_and_sync_on_reuse, bool, 0644);
 
+
+bool strict_mmu;
+module_param(strict_mmu, bool, 0644);
+
 /*
  * When setting this variable to true it enables Two-Dimensional-Paging
  * where the hardware walks 2 page tables:
@@ -2703,7 +2707,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	wrprot = make_spte(vcpu, sp, slot, pte_access, gfn, pfn, *sptep, prefetch,
-			   true, host_writable, &spte);
+			   !strict_mmu, host_writable, &spte);
 
 	if (*sptep == spte) {
 		ret = RET_PF_SPURIOUS;
@@ -5139,6 +5143,11 @@ static u64 mmu_pte_write_fetch_gpte(struct kvm_vcpu *vcpu, gpa_t *gpa,
  */
 static bool detect_write_flooding(struct kvm_mmu_page *sp)
 {
+	/*
+	 * When using non speculating MMU, use a bit higher threshold
+	 * for write flood detection
+	 */
+	int threshold = strict_mmu ? 10 :  3;
 	/*
 	 * Skip write-flooding detected for the sp whose level is 1, because
 	 * it can become unsync, then the guest page is not write-protected.
@@ -5147,7 +5156,7 @@ static bool detect_write_flooding(struct kvm_mmu_page *sp)
 		return false;
 
 	atomic_inc(&sp->write_flooding_count);
-	return atomic_read(&sp->write_flooding_count) >= 3;
+	return atomic_read(&sp->write_flooding_count) >= threshold;
 }
 
 /*
-- 
2.26.3

