Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288204AC4BB
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 17:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D8110E24F;
	Mon,  7 Feb 2022 16:01:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE66310F2A3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Xxoic2Sn/qFA/mhRCvHnS08xjpesyCCqOxwVNKsehI=;
 b=FG1ebdiDdUhq14BQ2zFh/f8/Yu1nQ8HZIHoEBUOjqYd1ZzScYGv+9980tZJQbsfyu2p+Rg
 cVhcTTcgzRGtSjcswY09+N3/fIXsYg79HdtRXCUN8Qy3A15s1PWk+Pub6xQJph7BTawTy4
 YY8ToidN36MPW6sXC2JPw3ezG65vUm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-U0zzcjwdOgqudp1ofBwlyw-1; Mon, 07 Feb 2022 11:01:31 -0500
X-MC-Unique: U0zzcjwdOgqudp1ofBwlyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49ED4814243;
 Mon,  7 Feb 2022 16:01:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C07CA83796;
 Mon,  7 Feb 2022 16:00:48 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 27/30] KVM: x86: add force_intercept_exceptions_mask
Date: Mon,  7 Feb 2022 17:54:44 +0200
Message-Id: <20220207155447.840194-28-mlevitsk@redhat.com>
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
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@suse.de>,
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

This parameter will be used by VMX and SVM code to force
interception of a set of exceptions, given by a bitmask
for guest debug and/or kvm debug.

This is based on an idea first shown here:
https://patchwork.kernel.org/project/kvm/patch/20160301192822.GD22677@pd.tnic/

CC: Borislav Petkov <bp@suse.de>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 7 +++++++
 arch/x86/kvm/x86.c              | 9 +++++++++
 arch/x86/kvm/x86.h              | 5 +++++
 3 files changed, 21 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 428ab1cc7dd34..fa498612839a0 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1168,6 +1168,13 @@ struct kvm_arch {
 	struct kvm_pmu_event_filter __rcu *pmu_event_filter;
 	struct task_struct *nx_lpage_recovery_thread;
 
+	/*
+	 * Bitmask of exceptions that KVM will intercept
+	 * and forward to the guest, even if that is not needed
+	 * for normal operation. Debug feature.
+	 */
+	u32 force_intercept_exceptions_bitmask;
+
 #ifdef CONFIG_X86_64
 	/*
 	 * Whether the TDP MMU is enabled for this VM. This contains a
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 63d84c373e465..202c34697852f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -193,6 +193,13 @@ module_param(enable_pmu, bool, 0444);
 bool __read_mostly eager_page_split = true;
 module_param(eager_page_split, bool, 0644);
 
+/*
+ * force_intercept_exceptions_mask is a writable param and its value
+ * is snapshotted when a VM is created
+ */
+static uint force_intercept_exceptions_mask;
+module_param(force_intercept_exceptions_mask, uint, S_IRUGO | S_IWUSR);
+
 /*
  * Restoring the host value for MSRs that are only consumed when running in
  * usermode, e.g. SYSCALL MSRs and TSC_AUX, can be deferred until the CPU
@@ -11646,6 +11653,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
 
 	kvm->arch.guest_can_read_msr_platform_info = true;
+	kvm->arch.force_intercept_exceptions_bitmask = force_intercept_exceptions_mask;
 
 #if IS_ENABLED(CONFIG_HYPERV)
 	spin_lock_init(&kvm->arch.hv_root_tdp_lock);
@@ -12886,6 +12894,7 @@ int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
 }
 EXPORT_SYMBOL_GPL(kvm_sev_es_string_io);
 
+
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_entry);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_exit);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_fast_mmio);
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index e9b303b21f173..34f96f483c7e5 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -91,6 +91,11 @@ static inline bool kvm_exception_is_soft(unsigned int nr)
 	return (nr == BP_VECTOR) || (nr == OF_VECTOR);
 }
 
+static inline bool kvm_is_exception_force_intercepted(struct kvm *kvm, int exception)
+{
+	return kvm->arch.force_intercept_exceptions_bitmask & BIT(exception);
+}
+
 static inline bool is_protmode(struct kvm_vcpu *vcpu)
 {
 	return kvm_read_cr0_bits(vcpu, X86_CR0_PE);
-- 
2.26.3

