Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A4E512361
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Apr 2022 22:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B1410E385;
	Wed, 27 Apr 2022 20:04:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D9A10E3B4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Apr 2022 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmBISr5PcGWBT/vRUsWZC642bpN2n5dwnWOmG20jA/o=;
 b=B4ynen2NWbPOR9rLfhW0Kihug9TZ9NnktGnsC9X7qjju1ya1XRXs+Mx+5bzZrxqeeMdvIX
 m+p/12PWbUAIp3/Ywfa1Y5VHPbjM+VCj11a70ZfHxVxf0XRzhDYoWPoyoxLrUAfSo8V0Yo
 Czawtn89aivkw4xlq70mOX4NMFhtF74=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-aIzHEq1EN0Kqjj0eP2PcIg-1; Wed, 27 Apr 2022 16:04:04 -0400
X-MC-Unique: aIzHEq1EN0Kqjj0eP2PcIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87E6F1014A62;
 Wed, 27 Apr 2022 20:04:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20B2C9E74;
 Wed, 27 Apr 2022 20:03:57 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 07/19] KVM: x86: mmu: tweak fast path for emulation of
 access to nested NPT pages
Date: Wed, 27 Apr 2022 23:03:02 +0300
Message-Id: <20220427200314.276673-8-mlevitsk@redhat.com>
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

If a non leaf mmu page is write tracked externally for some reason,
which can in theory happen if it was used for nested avic physid page
before, then this code will enter an endless loop of page faults because
unprotecting the mmu page will not remove write tracking, nor will the
write tracker callback be called, because there is no mmu page at
this address.

Fix this by only invoking the fast path if we succeeded in zapping the
mmu page.

Fixes: 147277540bbc5 ("kvm: svm: Add support for additional SVM NPF error codes")
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 633a3138d68e1..8f77d41e7fd80 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5341,8 +5341,8 @@ int kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 error_code,
 	 */
 	if (vcpu->arch.mmu->root_role.direct &&
 	    (error_code & PFERR_NESTED_GUEST_PAGE) == PFERR_NESTED_GUEST_PAGE) {
-		kvm_mmu_unprotect_page(vcpu->kvm, gpa_to_gfn(cr2_or_gpa));
-		return 1;
+		if (kvm_mmu_unprotect_page(vcpu->kvm, gpa_to_gfn(cr2_or_gpa)))
+			return 1;
 	}
 
 	/*
-- 
2.26.3

