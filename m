Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDCB4AC472
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 16:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C73110E5DC;
	Mon,  7 Feb 2022 15:55:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D74010F7CB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWkaPZigKR8ZVYYpYKUmXEITXI5Ito7CWFDFszKolT0=;
 b=FoU8VjHyA+VSai7IIWulvkhJQjrpuuPMquS9VTYvhuUenzPoTfK4I6jigdXuoh3qz15aGv
 og9ZRJaErQA1JH5Voh+7ke904RmlWh5KMeg7KkyO+9mAKXBztt58y7TWsGnaS3s8Gw71s2
 sAusFqEUzeFoDplWE0J8E/mMQsHWbFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-UJZl6NgZNt-ieIzpmnWFHQ-1; Mon, 07 Feb 2022 10:55:16 -0500
X-MC-Unique: UJZl6NgZNt-ieIzpmnWFHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 064471091DA2;
 Mon,  7 Feb 2022 15:55:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51F757DE38;
 Mon,  7 Feb 2022 15:55:05 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 02/30] KVM: x86: nSVM: fix potential NULL derefernce on
 nested migration
Date: Mon,  7 Feb 2022 17:54:19 +0200
Message-Id: <20220207155447.840194-3-mlevitsk@redhat.com>
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Turns out that due to review feedback and/or rebases
I accidentally moved the call to nested_svm_load_cr3 to be too early,
before the NPT is enabled, which is very wrong to do.

KVM can't even access guest memory at that point as nested NPT
is needed for that, and of course it won't initialize the walk_mmu,
which is main issue the patch was addressing.

Fix this for real.

Fixes: 232f75d3b4b5 ("KVM: nSVM: call nested_svm_load_cr3 on nested state load")
Cc: stable@vger.kernel.org

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1218b5a342fc8..39d280e7e80ef 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1457,18 +1457,6 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	    !__nested_vmcb_check_save(vcpu, &save_cached))
 		goto out_free;
 
-	/*
-	 * While the nested guest CR3 is already checked and set by
-	 * KVM_SET_SREGS, it was set when nested state was yet loaded,
-	 * thus MMU might not be initialized correctly.
-	 * Set it again to fix this.
-	 */
-
-	ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
-				  nested_npt_enabled(svm), false);
-	if (WARN_ON_ONCE(ret))
-		goto out_free;
-
 
 	/*
 	 * All checks done, we can enter guest mode. Userspace provides
@@ -1494,6 +1482,20 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 
 	svm_switch_vmcb(svm, &svm->nested.vmcb02);
 	nested_vmcb02_prepare_control(svm);
+
+	/*
+	 * While the nested guest CR3 is already checked and set by
+	 * KVM_SET_SREGS, it was set when nested state was yet loaded,
+	 * thus MMU might not be initialized correctly.
+	 * Set it again to fix this.
+	 */
+
+	ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
+				  nested_npt_enabled(svm), false);
+	if (WARN_ON_ONCE(ret))
+		goto out_free;
+
+
 	kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
 	ret = 0;
 out_free:
-- 
2.26.3

