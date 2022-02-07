Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C0E4AC480
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 16:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819C410E5DC;
	Mon,  7 Feb 2022 15:56:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE22110F7CB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdwpmbef/Bh6XlwaL5pVGukYEI2IsJrzG/O+p5FnU2s=;
 b=DE/BHsSiEucXgigebfg+eeNh1VVPmYVyk0rJSTOOZYWrwdCyWnmSPtWfKuuh3iOLLjTdt2
 we7cOTEbI8neYUIEYMObDrCwv8FcMjk37OY8FhY9H7a/+mLYjpeWQoW6gdygHfPgCaOXjB
 6dl8+8H7NB/HWYH54JrRCpqD2YH8xcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-oPbGccWgM-qCFCmjnGmEAg-1; Mon, 07 Feb 2022 10:56:21 -0500
X-MC-Unique: oPbGccWgM-qCFCmjnGmEAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C37231091DA5;
 Mon,  7 Feb 2022 15:56:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90B227DE4D;
 Mon,  7 Feb 2022 15:56:11 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 09/30] KVM: x86: SVM: move avic definitions from AMD's
 spec to svm.h
Date: Mon,  7 Feb 2022 17:54:26 +0200
Message-Id: <20220207155447.840194-10-mlevitsk@redhat.com>
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

asm/svm.h is the correct place for all values that are defined in
the SVM spec, and that includes AVIC.

Also add some values from the spec that were not defined before
and will be soon useful.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/msr-index.h |  1 +
 arch/x86/include/asm/svm.h       | 36 ++++++++++++++++++++++++++++++++
 arch/x86/kvm/svm/avic.c          | 22 +------------------
 arch/x86/kvm/svm/svm.h           | 11 ----------
 4 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 01e2650b95859..552ff8a5ea023 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -476,6 +476,7 @@
 #define MSR_AMD64_ICIBSEXTDCTL		0xc001103c
 #define MSR_AMD64_IBSOPDATA4		0xc001103d
 #define MSR_AMD64_IBS_REG_COUNT_MAX	8 /* includes MSR_AMD64_IBSBRTARGET */
+#define MSR_AMD64_SVM_AVIC_DOORBELL	0xc001011b
 #define MSR_AMD64_VM_PAGE_FLUSH		0xc001011e
 #define MSR_AMD64_SEV_ES_GHCB		0xc0010130
 #define MSR_AMD64_SEV			0xc0010131
diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index b00dbc5fac2b2..bb2fb78523cee 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -220,6 +220,42 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 #define SVM_NESTED_CTL_SEV_ENABLE	BIT(1)
 #define SVM_NESTED_CTL_SEV_ES_ENABLE	BIT(2)
 
+
+/* AVIC */
+#define AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK	(0xFF)
+#define AVIC_LOGICAL_ID_ENTRY_VALID_BIT			31
+#define AVIC_LOGICAL_ID_ENTRY_VALID_MASK		(1 << 31)
+
+#define AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK	(0xFFULL)
+#define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK	(0xFFFFFFFFFFULL << 12)
+#define AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK		(1ULL << 62)
+#define AVIC_PHYSICAL_ID_ENTRY_VALID_MASK		(1ULL << 63)
+#define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK		(0xFF)
+
+#define AVIC_DOORBELL_PHYSICAL_ID_MASK			(0xFF)
+
+#define AVIC_UNACCEL_ACCESS_WRITE_MASK		1
+#define AVIC_UNACCEL_ACCESS_OFFSET_MASK		0xFF0
+#define AVIC_UNACCEL_ACCESS_VECTOR_MASK		0xFFFFFFFF
+
+enum avic_ipi_failure_cause {
+	AVIC_IPI_FAILURE_INVALID_INT_TYPE,
+	AVIC_IPI_FAILURE_TARGET_NOT_RUNNING,
+	AVIC_IPI_FAILURE_INVALID_TARGET,
+	AVIC_IPI_FAILURE_INVALID_BACKING_PAGE,
+};
+
+
+/*
+ * 0xff is broadcast, so the max index allowed for physical APIC ID
+ * table is 0xfe.  APIC IDs above 0xff are reserved.
+ */
+#define AVIC_MAX_PHYSICAL_ID_COUNT	0xff
+
+#define AVIC_HPA_MASK	~((0xFFFULL << 52) | 0xFFF)
+#define VMCB_AVIC_APIC_BAR_MASK		0xFFFFFFFFFF000ULL
+
+
 struct vmcb_seg {
 	u16 selector;
 	u16 attrib;
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 99f907ec5aa8f..fabfc337e1c35 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -27,20 +27,6 @@
 #include "irq.h"
 #include "svm.h"
 
-#define SVM_AVIC_DOORBELL	0xc001011b
-
-#define AVIC_HPA_MASK	~((0xFFFULL << 52) | 0xFFF)
-
-/*
- * 0xff is broadcast, so the max index allowed for physical APIC ID
- * table is 0xfe.  APIC IDs above 0xff are reserved.
- */
-#define AVIC_MAX_PHYSICAL_ID_COUNT	255
-
-#define AVIC_UNACCEL_ACCESS_WRITE_MASK		1
-#define AVIC_UNACCEL_ACCESS_OFFSET_MASK		0xFF0
-#define AVIC_UNACCEL_ACCESS_VECTOR_MASK		0xFFFFFFFF
-
 /* AVIC GATAG is encoded using VM and VCPU IDs */
 #define AVIC_VCPU_ID_BITS		8
 #define AVIC_VCPU_ID_MASK		((1 << AVIC_VCPU_ID_BITS) - 1)
@@ -73,12 +59,6 @@ struct amd_svm_iommu_ir {
 	void *data;		/* Storing pointer to struct amd_ir_data */
 };
 
-enum avic_ipi_failure_cause {
-	AVIC_IPI_FAILURE_INVALID_INT_TYPE,
-	AVIC_IPI_FAILURE_TARGET_NOT_RUNNING,
-	AVIC_IPI_FAILURE_INVALID_TARGET,
-	AVIC_IPI_FAILURE_INVALID_BACKING_PAGE,
-};
 
 /* Note:
  * This function is called from IOMMU driver to notify
@@ -702,7 +682,7 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
 		 * one is harmless).
 		 */
 		if (cpu != get_cpu())
-			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
+			wrmsrl(MSR_AMD64_SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
 		put_cpu();
 	} else {
 		/*
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 852b12aee03d7..6343558982c73 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -555,17 +555,6 @@ extern struct kvm_x86_nested_ops svm_nested_ops;
 
 /* avic.c */
 
-#define AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK	(0xFF)
-#define AVIC_LOGICAL_ID_ENTRY_VALID_BIT			31
-#define AVIC_LOGICAL_ID_ENTRY_VALID_MASK		(1 << 31)
-
-#define AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK	(0xFFULL)
-#define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK	(0xFFFFFFFFFFULL << 12)
-#define AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK		(1ULL << 62)
-#define AVIC_PHYSICAL_ID_ENTRY_VALID_MASK		(1ULL << 63)
-
-#define VMCB_AVIC_APIC_BAR_MASK		0xFFFFFFFFFF000ULL
-
 int avic_ga_log_notifier(u32 ga_tag);
 void avic_vm_destroy(struct kvm *kvm);
 int avic_vm_init(struct kvm *kvm);
-- 
2.26.3

