Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768FA4AC487
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 16:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A7910E5DC;
	Mon,  7 Feb 2022 15:58:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D0F10F84C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZW9E72jh7L2Mkny6o+vpEWPJ8Jc7Yzvnii4XswRCco=;
 b=RGmlVN0gGFnTqJzBNnHlCz5VeF/1HZZnATmxpEqAzguEaWHy1XDjodnKIhyG3IW4qhVnQW
 P9Mz9QCz3BaCMIrpDOs6yRZ64UlSruryQ9n6rdnVcmo7sx7DDQitXYCiidFa4fr6kIp8Ou
 nPW3YcY3lGatOSTbmcsVXeYlL0Lt7UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-ItZjqKbCO7yGGgBJ6tjfpA-1; Mon, 07 Feb 2022 10:58:34 -0500
X-MC-Unique: ItZjqKbCO7yGGgBJ6tjfpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293E6192FDB5;
 Mon,  7 Feb 2022 15:58:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A20C67DE38;
 Mon,  7 Feb 2022 15:57:48 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 15/30] KVM: x86: SVM: remove avic's broken code that
 updated APIC ID
Date: Mon,  7 Feb 2022 17:54:32 +0200
Message-Id: <20220207155447.840194-16-mlevitsk@redhat.com>
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

Now that KVM doesn't allow to change APIC ID in case AVIC is
enabled, remove buggy AVIC code that tried to do so.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 8f23e7d239097..768252b3dfee6 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -440,35 +440,6 @@ static int avic_handle_ldr_update(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static int avic_handle_apic_id_update(struct kvm_vcpu *vcpu)
-{
-	u64 *old, *new;
-	struct vcpu_svm *svm = to_svm(vcpu);
-	u32 id = kvm_xapic_id(vcpu->arch.apic);
-
-	if (vcpu->vcpu_id == id)
-		return 0;
-
-	old = avic_get_physical_id_entry(vcpu, vcpu->vcpu_id);
-	new = avic_get_physical_id_entry(vcpu, id);
-	if (!new || !old)
-		return 1;
-
-	/* We need to move physical_id_entry to new offset */
-	*new = *old;
-	*old = 0ULL;
-	to_svm(vcpu)->avic_physical_id_cache = new;
-
-	/*
-	 * Also update the guest physical APIC ID in the logical
-	 * APIC ID table entry if already setup the LDR.
-	 */
-	if (svm->ldr_reg)
-		avic_handle_ldr_update(vcpu);
-
-	return 0;
-}
-
 static void avic_handle_dfr_update(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -488,10 +459,6 @@ static int avic_unaccel_trap_write(struct vcpu_svm *svm)
 				AVIC_UNACCEL_ACCESS_OFFSET_MASK;
 
 	switch (offset) {
-	case APIC_ID:
-		if (avic_handle_apic_id_update(&svm->vcpu))
-			return 0;
-		break;
 	case APIC_LDR:
 		if (avic_handle_ldr_update(&svm->vcpu))
 			return 0;
@@ -584,8 +551,6 @@ int avic_init_vcpu(struct vcpu_svm *svm)
 
 void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 {
-	if (avic_handle_apic_id_update(vcpu) != 0)
-		return;
 	avic_handle_dfr_update(vcpu);
 	avic_handle_ldr_update(vcpu);
 }
-- 
2.26.3

