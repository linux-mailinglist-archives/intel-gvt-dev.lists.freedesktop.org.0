Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C034AC496
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 16:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C01F10E24F;
	Mon,  7 Feb 2022 15:59:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1010E24F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oU3s7CnCjp2O1VaC3lW5tk3dKh1EHix/EeWBDaZUEPI=;
 b=KInWlYEaT+dXS+xhLpldYDpam0Ww6HERzgH8a5oZsoPgLtO+FhITtdb3vCZoTA+5H4lEfD
 yPct3juZfdGUs7VIGEiXIBlwCL6XNzRlt68itRPojGNK7548v3WHipjB8eiqpRjwBQWzbC
 b/wiDqS7avNUAyy5Ze0v1UsgtUwD3OQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-kR5m2bS0MdWEc_u9IHssKg-1; Mon, 07 Feb 2022 10:59:54 -0500
X-MC-Unique: kR5m2bS0MdWEc_u9IHssKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 955F7100D680;
 Mon,  7 Feb 2022 15:59:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6E917DE38;
 Mon,  7 Feb 2022 15:59:34 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 24/30] KVM: x86: nSVM: implement nested VMLOAD/VMSAVE
Date: Mon,  7 Feb 2022 17:54:41 +0200
Message-Id: <20220207155447.840194-25-mlevitsk@redhat.com>
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

This was tested by booting L1,L2,L3 (all Linux) and checking
that no VMLOAD/VMSAVE vmexits happened.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 35 +++++++++++++++++++++++++++++------
 arch/x86/kvm/svm/svm.c    |  7 +++++++
 arch/x86/kvm/svm/svm.h    |  8 +++++++-
 3 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 4a228a76b27d7..bdcb23c76e89e 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -120,6 +120,20 @@ static void nested_svm_uninit_mmu_context(struct kvm_vcpu *vcpu)
 	vcpu->arch.walk_mmu = &vcpu->arch.root_mmu;
 }
 
+static bool nested_vmcb_needs_vls_intercept(struct vcpu_svm *svm)
+{
+	if (!svm->v_vmload_vmsave_enabled)
+		return true;
+
+	if (!nested_npt_enabled(svm))
+		return true;
+
+	if (!(svm->nested.ctl.virt_ext & VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK))
+		return true;
+
+	return false;
+}
+
 void recalc_intercepts(struct vcpu_svm *svm)
 {
 	struct vmcb_control_area *c, *h;
@@ -161,8 +175,17 @@ void recalc_intercepts(struct vcpu_svm *svm)
 	if (!intercept_smi)
 		vmcb_clr_intercept(c, INTERCEPT_SMI);
 
-	vmcb_set_intercept(c, INTERCEPT_VMLOAD);
-	vmcb_set_intercept(c, INTERCEPT_VMSAVE);
+	if (nested_vmcb_needs_vls_intercept(svm)) {
+		/*
+		 * If the virtual VMLOAD/VMSAVE is not enabled for the L2,
+		 * we must intercept these instructions to correctly
+		 * emulate them in case L1 doesn't intercept them.
+		 */
+		vmcb_set_intercept(c, INTERCEPT_VMLOAD);
+		vmcb_set_intercept(c, INTERCEPT_VMSAVE);
+	} else {
+		WARN_ON(!(c->virt_ext & VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK));
+	}
 }
 
 static bool nested_svm_vmrun_msrpm(struct vcpu_svm *svm)
@@ -426,10 +449,7 @@ static void nested_save_pending_event_to_vmcb12(struct vcpu_svm *svm,
 	vmcb12->control.exit_int_info = exit_int_info;
 }
 
-static inline bool nested_npt_enabled(struct vcpu_svm *svm)
-{
-	return svm->nested.ctl.nested_ctl & SVM_NESTED_CTL_NP_ENABLE;
-}
+
 
 static void nested_svm_transition_tlb_flush(struct kvm_vcpu *vcpu)
 {
@@ -607,6 +627,9 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
 		svm->vmcb->control.virt_ext  |=
 			(svm->nested.ctl.virt_ext & LBR_CTL_ENABLE_MASK);
 
+	if (!nested_vmcb_needs_vls_intercept(svm))
+		svm->vmcb->control.virt_ext |= VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK;
+
 	nested_svm_transition_tlb_flush(vcpu);
 
 	/* Enter Guest-Mode */
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 76aa6054d9db2..0f068da098d9f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1051,6 +1051,8 @@ static inline void init_vmcb_after_set_cpuid(struct kvm_vcpu *vcpu)
 
 		set_msr_interception(vcpu, svm->msrpm, MSR_IA32_SYSENTER_EIP, 0, 0);
 		set_msr_interception(vcpu, svm->msrpm, MSR_IA32_SYSENTER_ESP, 0, 0);
+
+		svm->v_vmload_vmsave_enabled = false;
 	} else {
 		/*
 		 * If hardware supports Virtual VMLOAD VMSAVE then enable it
@@ -3993,6 +3995,8 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	svm->tsc_scaling_enabled = tsc_scaling && guest_cpuid_has(vcpu, X86_FEATURE_TSCRATEMSR);
 	svm->lbrv_enabled = lbrv && guest_cpuid_has(vcpu, X86_FEATURE_LBRV);
 
+	svm->v_vmload_vmsave_enabled = vls && guest_cpuid_has(vcpu, X86_FEATURE_V_VMSAVE_VMLOAD);
+
 	svm_recalc_instruction_intercepts(vcpu, svm);
 
 	/* For sev guests, the memory encryption bit is not reserved in CR3.  */
@@ -4799,6 +4803,9 @@ static __init void svm_set_cpu_caps(void)
 		if (lbrv)
 			kvm_cpu_cap_set(X86_FEATURE_LBRV);
 
+		if (vls)
+			kvm_cpu_cap_set(X86_FEATURE_V_VMSAVE_VMLOAD);
+
 		/* Nested VM can receive #VMEXIT instead of triggering #GP */
 		kvm_cpu_cap_set(X86_FEATURE_SVME_ADDR_CHK);
 	}
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 0012ba5affcba..e8ffd458a5575 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -217,10 +217,11 @@ struct vcpu_svm {
 	unsigned int3_injected;
 	unsigned long int3_rip;
 
-	/* cached guest cpuid flags for faster access */
+	/* optional nested SVM features that are enabled for this guest  */
 	bool nrips_enabled                : 1;
 	bool tsc_scaling_enabled          : 1;
 	bool lbrv_enabled                 : 1;
+	bool v_vmload_vmsave_enabled      : 1;
 
 	u32 ldr_reg;
 	u32 dfr_reg;
@@ -468,6 +469,11 @@ static inline bool gif_set(struct vcpu_svm *svm)
 		return !!(svm->vcpu.arch.hflags & HF_GIF_MASK);
 }
 
+static inline bool nested_npt_enabled(struct vcpu_svm *svm)
+{
+	return svm->nested.ctl.nested_ctl & SVM_NESTED_CTL_NP_ENABLE;
+}
+
 /* svm.c */
 #define MSR_INVALID				0xffffffffU
 
-- 
2.26.3

