Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1517512344
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Apr 2022 22:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B4310E315;
	Wed, 27 Apr 2022 20:03:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2B910E315
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Apr 2022 20:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/591BE30Gw+sLgR7wcCQy4XNcbdAfVRmL/PYPXct/c=;
 b=XPkkeYEAWFap96lYZxwrLKAMl5g2xvRV6SZcEsytJrK2mZoVUj0SutUScXd36DMtPib1ZU
 hJFDhXkoIqTqAJDY1vylPIwYQGr3Ozl5H4tghMIujI7p89iL+sku38GtrdUUnS0F3z7eX2
 6mojn0yqqe3JJmF8IOk9ZcVfa4xEQCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-dQOqBeYMObyNtmOAhvPWIA-1; Wed, 27 Apr 2022 16:03:30 -0400
X-MC-Unique: dQOqBeYMObyNtmOAhvPWIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06EDD8039D7;
 Wed, 27 Apr 2022 20:03:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6323F9E82;
 Wed, 27 Apr 2022 20:03:23 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 01/19] KVM: x86: document AVIC/APICv inhibit reasons
Date: Wed, 27 Apr 2022 23:02:56 +0300
Message-Id: <20220427200314.276673-2-mlevitsk@redhat.com>
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

These days there are too many AVIC/APICv inhibit
reasons, and it doesn't hurt to have some documentation
for them.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f164c6c1514a4..63eae00625bda 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1046,14 +1046,29 @@ struct kvm_x86_msr_filter {
 };
 
 enum kvm_apicv_inhibit {
+	/* APICv/AVIC is disabled by module param and/or not supported in hardware */
 	APICV_INHIBIT_REASON_DISABLE,
+	/* APICv/AVIC is inhibited because AutoEOI feature is being used by a HyperV guest*/
 	APICV_INHIBIT_REASON_HYPERV,
+	/* AVIC is inhibited on a CPU because it runs a nested guest */
 	APICV_INHIBIT_REASON_NESTED,
+	/* AVIC is inhibited due to wait for an irq window (AVIC doesn't support this) */
 	APICV_INHIBIT_REASON_IRQWIN,
+	/*
+	 * AVIC is inhibited because i8254 're-inject' mode is used
+	 * which needs EOI intercept which AVIC doesn't support
+	 */
 	APICV_INHIBIT_REASON_PIT_REINJ,
+	/* AVIC is inhibited because the guest has x2apic in its CPUID*/
 	APICV_INHIBIT_REASON_X2APIC,
+	/* AVIC/APICv is inhibited because KVM_GUESTDBG_BLOCKIRQ was enabled */
 	APICV_INHIBIT_REASON_BLOCKIRQ,
+	/*
+	 * AVIC/APICv is inhibited because the guest didn't yet
+	 * enable kernel/split irqchip
+	 */
 	APICV_INHIBIT_REASON_ABSENT,
+	/* AVIC is disabled because SEV doesn't support it */
 	APICV_INHIBIT_REASON_SEV,
 };
 
-- 
2.26.3

