Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A261F70132F
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004310E704;
	Sat, 13 May 2023 00:36:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5FF10E709
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:35 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-55a42c22300so172149737b3.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938194; x=1686530194;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=ppmpPnvYH2liION2C18+4wtZokm3fkaR+RkN6Z/HLA4=;
 b=45UXT9+SktxePZpw2T3kVWDruDvjmvEtVDBKj9cD13lxzc+wcDHTX1vfWSxxwD74Q5
 RkCQv8COWyYfaup3oymSJZNKJOF09mKoC3BDy8v/rvLfKkHYICZQ+z5io7IBdiOa+ro7
 pLsKJKBn4GtdpqxqnOOWFsQZAZob2rn2K1hmGq5qSndnyviQsbmFx2RMjk9VpLmrFVdc
 EtrmzT72ZwUTG2/nLbUY9/41N1zuDT7bo7FxLVHZPG196vNcbU/uoYh4rFAlqZVh1ook
 O6qy8LI9LxKiBA457PiKeZO0WZuUXPtezPe8yrINQ4yJ5DfAcSjqhxDgdV6/hPIqVIpr
 HbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938194; x=1686530194;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ppmpPnvYH2liION2C18+4wtZokm3fkaR+RkN6Z/HLA4=;
 b=MiyCouQ+MQy/OCcIp0TFYQ8D+78Qqdsj375bDyyiBpgOtqIHQEgW7g8XsbuoIfrNIT
 MUcBR6wAGZ906G8wkh0FhYSr1q6eRBYV1ztbZl7x9A33XXCygJ7OJIFoZdzAsIHiGok8
 xMghkrFPZNcUJlOffadM4jeDsrTTLPXRdsjPhtG71F10ZLse1KeW2m++n70wtegr94JH
 4ML8FcIfTaXOae/MmARYYU4hJQzSPbXxkawjlUpYnyhiGLlspxe85ZjGCjk2Z9WJj3+V
 I+0mCx4Oa7/NhQKRWAs4HuEWddk51FpEZmx+jiA0TiRBmSzBeY5jTi3wTwDzlIdm/pc1
 Vl3g==
X-Gm-Message-State: AC+VfDwc2mkaslGYscEs1MtJD5YWIh3W6W7QkCUi/m3ZZn+9etgQQufx
 7jbOWi1vEep0Q/oc7fFs0/P/MuAt2Rc=
X-Google-Smtp-Source: ACHHUZ68Gfp2L3qA4yBtJO4pZIg9ly481TsVhQlG6aCEVrcslKa5xgUsBbKar1DsGwUseLixH3Iyb891DOQ=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4509:0:b0:561:244d:c40 with SMTP id
 s9-20020a814509000000b00561244d0c40mr1686825ywa.5.1683938194315; Fri, 12 May
 2023 17:36:34 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:47 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-16-seanjc@google.com>
Subject: [PATCH v3 15/28] KVM: x86: Reject memslot MOVE operations if KVMGT is
 attached
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Disallow moving memslots if the VM has external page-track users, i.e. if
KVMGT is being used to expose a virtual GPU to the guest, as KVMGT doesn't
correctly handle moving memory regions.

Note, this is potential ABI breakage!  E.g. userspace could move regions
that aren't shadowed by KVMGT without harming the guest.  However, the
only known user of KVMGT is QEMU, and QEMU doesn't move generic memory
regions.  KVM's own support for moving memory regions was also broken for
multiple years (albeit for an edge case, but arguably moving RAM is
itself an edge case), e.g. see commit edd4fa37baa6 ("KVM: x86: Allocate
new rmap and large page tracking when moving memslot").

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h | 3 +++
 arch/x86/kvm/mmu/page_track.c         | 5 +++++
 arch/x86/kvm/x86.c                    | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index 8c4d216e3b2b..f744682648e7 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -75,4 +75,7 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
 void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 			  int bytes);
 void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot);
+
+bool kvm_page_track_has_external_user(struct kvm *kvm);
+
 #endif
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 891e5cc52b45..e6de9638e560 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -303,3 +303,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
 			n->track_flush_slot(kvm, slot, n);
 	srcu_read_unlock(&head->track_srcu, idx);
 }
+
+bool kvm_page_track_has_external_user(struct kvm *kvm)
+{
+	return hlist_empty(&kvm->arch.track_notifier_head.track_notifier_list);
+}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b2d9c5979df7..c6bbd8ffd8c8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12588,6 +12588,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
+	/*
+	 * KVM doesn't support moving memslots when there are external page
+	 * trackers attached to the VM, i.e. if KVMGT is in use.
+	 */
+	if (change == KVM_MR_MOVE && kvm_page_track_has_external_user(kvm))
+		return -EINVAL;
+
 	if (change == KVM_MR_CREATE || change == KVM_MR_MOVE) {
 		if ((new->base_gfn + new->npages - 1) > kvm_mmu_max_gfn())
 			return -EINVAL;
-- 
2.40.1.606.ga4b1b128d6-goog

