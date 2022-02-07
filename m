Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B354AC4A2
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 17:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059D410E24F;
	Mon,  7 Feb 2022 16:00:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297C410E24F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQ1uiq30ca/wtmdEmBkE1pSZd4AYgwDXu3pWHPnS4Sg=;
 b=iMghWqvGSYIGgcOdc/ZCduvwDYB7C5Rn/R5tMcpPPEM8DMohwjDluxDhQsTVA5entuc4vY
 VbcI75PpPg3P8SJaFMu/+RlgXyAYn0akvqPJl71OaxrAN5Mc2JvyXGAh5C3Odn6Gvbu0Kb
 MlTIgrbTAF1CvHDkHPCv4WVRPcXOBPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-go2mTwCUMJOBBfV8StMKZA-1; Mon, 07 Feb 2022 11:00:27 -0500
X-MC-Unique: go2mTwCUMJOBBfV8StMKZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6588C8144E1;
 Mon,  7 Feb 2022 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FC027DE38;
 Mon,  7 Feb 2022 15:59:49 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 25/30] KVM: x86: nSVM: support PAUSE filter threshold
 and count when cpu_pm=on
Date: Mon,  7 Feb 2022 17:54:42 +0200
Message-Id: <20220207155447.840194-26-mlevitsk@redhat.com>
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

Allow L1 to use these settings if L0 disables PAUSE interception
(AKA cpu_pm=on)

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c |  6 ++++++
 arch/x86/kvm/svm/svm.c    | 17 +++++++++++++++++
 arch/x86/kvm/svm/svm.h    |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index bdcb23c76e89e..601d38ae05cc6 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -630,6 +630,12 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
 	if (!nested_vmcb_needs_vls_intercept(svm))
 		svm->vmcb->control.virt_ext |= VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK;
 
+	if (svm->pause_filter_enabled)
+		svm->vmcb->control.pause_filter_count = svm->nested.ctl.pause_filter_count;
+
+	if (svm->pause_threshold_enabled)
+		svm->vmcb->control.pause_filter_thresh = svm->nested.ctl.pause_filter_thresh;
+
 	nested_svm_transition_tlb_flush(vcpu);
 
 	/* Enter Guest-Mode */
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0f068da098d9f..e49043807ec44 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3997,6 +3997,17 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 
 	svm->v_vmload_vmsave_enabled = vls && guest_cpuid_has(vcpu, X86_FEATURE_V_VMSAVE_VMLOAD);
 
+	if (kvm_pause_in_guest(vcpu->kvm)) {
+		svm->pause_filter_enabled = pause_filter_count > 0 &&
+					    guest_cpuid_has(vcpu, X86_FEATURE_PAUSEFILTER);
+
+		svm->pause_threshold_enabled = pause_filter_thresh > 0 &&
+					    guest_cpuid_has(vcpu, X86_FEATURE_PFTHRESHOLD);
+	} else {
+		svm->pause_filter_enabled = false;
+		svm->pause_threshold_enabled = false;
+	}
+
 	svm_recalc_instruction_intercepts(vcpu, svm);
 
 	/* For sev guests, the memory encryption bit is not reserved in CR3.  */
@@ -4806,6 +4817,12 @@ static __init void svm_set_cpu_caps(void)
 		if (vls)
 			kvm_cpu_cap_set(X86_FEATURE_V_VMSAVE_VMLOAD);
 
+		if (pause_filter_count)
+			kvm_cpu_cap_set(X86_FEATURE_PAUSEFILTER);
+
+		if (pause_filter_thresh)
+			kvm_cpu_cap_set(X86_FEATURE_PFTHRESHOLD);
+
 		/* Nested VM can receive #VMEXIT instead of triggering #GP */
 		kvm_cpu_cap_set(X86_FEATURE_SVME_ADDR_CHK);
 	}
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index e8ffd458a5575..297ec57f9941c 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -222,6 +222,8 @@ struct vcpu_svm {
 	bool tsc_scaling_enabled          : 1;
 	bool lbrv_enabled                 : 1;
 	bool v_vmload_vmsave_enabled      : 1;
+	bool pause_filter_enabled         : 1;
+	bool pause_threshold_enabled      : 1;
 
 	u32 ldr_reg;
 	u32 dfr_reg;
-- 
2.26.3

