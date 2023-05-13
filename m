Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA3701329
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B8410E6F8;
	Sat, 13 May 2023 00:36:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A3110E707
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:32 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-55a37bf6fd0so173038317b3.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938192; x=1686530192;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=OZEggBbNblRsi2erSP3Gdfhqb5e/8lV2CB/rQrFchS8=;
 b=4Igpt6TW9x4CyyUHgTyI0EJQh8OQLuCfDSzR+F/zcP5RMAUiMHo/cBjjxlYPZiOvhM
 l6EastCXgINOTBF6qg6msAVseFMbGgaxTzYYNK8z3nnqlGpxKRNNrk4f0un4E0WTW0k/
 bXYje+HsRbWsfEdjspnxU/HKpZR4p+S7IRQ+7gy2T3MFPfs/ZPE3HR0ZMCR0ZFyLdY34
 lziPt3Vo9sPl9mzf5Gcri32A+lbht/j8S27dICw2kk9xXd1S4hCNxcqRnoY84+22qeR8
 qu/bW0EoI5luvX0Jd6iL5ZfGf8LYhK6TeBzFNxYPHaHOZEzfX8sggfZxSyGzwDpOfArT
 7TPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938192; x=1686530192;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OZEggBbNblRsi2erSP3Gdfhqb5e/8lV2CB/rQrFchS8=;
 b=ggnNYRoBU7t6WYbatKa2ghXTDHUg6vYFyf64YRi/z+lHNDhpPeqZl6ziumyanUxDYK
 jSiyBvbW+VUhW1F7UmahDLa8OXQ4ik66wr6MQAoa0q69tbEnN0/hPYeFN2NTWAaNy3pT
 pvfR7VvaoNA9BOXdE/UhFgk9JoCLctBZ11XrfCtR2vIPCHwOX7rhqkB8vDTLvnpQXXWh
 JgtG36H0BLfHUSfRcwqVrnQS+GCYDISePDSsR7tuUfjUXVgYuAcdZcDM6b9uT4BPPwIQ
 XJGK3taqMqMiy1NSiFg7NYaKMFogDIwtkgf/7WUI/ejAaUtui979R11S8J2KTsw6DMr8
 HeDQ==
X-Gm-Message-State: AC+VfDwWrfZE+0DA0x3xAiAslZO6JYTlXbozlVzJpXabnDuh5N4qKId7
 NzssCVMVUgwlcoiWtjBBXmnPFHhFtMA=
X-Google-Smtp-Source: ACHHUZ5IL0mxanQb+3z0FkMZEYHAxx8lR74ouUyEdydLk2Ld178r8tywT4lRuzG7g2edgClIvXW+7Wli+8Q=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ae65:0:b0:55d:f921:6bfa with SMTP id
 g37-20020a81ae65000000b0055df9216bfamr11964813ywk.5.1683938192252; Fri, 12
 May 2023 17:36:32 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:46 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-15-seanjc@google.com>
Subject: [PATCH v3 14/28] KVM: drm/i915/gvt: Drop @vcpu from KVM's
 ->track_write() hook
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

Drop @vcpu from KVM's ->track_write() hook provided for external users of
the page-track APIs now that KVM itself doesn't use the page-track
mechanism.

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h |  5 ++---
 arch/x86/kvm/mmu/page_track.c         |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 10 ++++------
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index eb186bc57f6a..8c4d216e3b2b 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -26,14 +26,13 @@ struct kvm_page_track_notifier_node {
 	 * It is called when guest is writing the write-tracked page
 	 * and write emulation is finished at that time.
 	 *
-	 * @vcpu: the vcpu where the write access happened.
 	 * @gpa: the physical address written by guest.
 	 * @new: the data was written to the address.
 	 * @bytes: the written length.
 	 * @node: this node
 	 */
-	void (*track_write)(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
-			    int bytes, struct kvm_page_track_notifier_node *node);
+	void (*track_write)(gpa_t gpa, const u8 *new, int bytes,
+			    struct kvm_page_track_notifier_node *node);
 	/*
 	 * It is called when memory slot is being moved or removed
 	 * users can drop write-protection for the pages in that memory slot
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 23088c90d2fd..891e5cc52b45 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -272,7 +272,7 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 	hlist_for_each_entry_srcu(n, &head->track_notifier_list, node,
 				srcu_read_lock_held(&head->track_srcu))
 		if (n->track_write)
-			n->track_write(vcpu, gpa, new, bytes, n);
+			n->track_write(gpa, new, bytes, n);
 	srcu_read_unlock(&head->track_srcu, idx);
 
 	kvm_mmu_track_write(vcpu, gpa, new, bytes);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 0785f9cb2c20..aaebb44c139f 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -106,9 +106,8 @@ struct gvt_dma {
 #define vfio_dev_to_vgpu(vfio_dev) \
 	container_of((vfio_dev), struct intel_vgpu, vfio_device)
 
-static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
-		const u8 *val, int len,
-		struct kvm_page_track_notifier_node *node);
+static void kvmgt_page_track_write(gpa_t gpa, const u8 *val, int len,
+				   struct kvm_page_track_notifier_node *node);
 static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		struct kvm_page_track_notifier_node *node);
@@ -1602,9 +1601,8 @@ int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 	return 0;
 }
 
-static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
-		const u8 *val, int len,
-		struct kvm_page_track_notifier_node *node)
+static void kvmgt_page_track_write(gpa_t gpa, const u8 *val, int len,
+				   struct kvm_page_track_notifier_node *node)
 {
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
-- 
2.40.1.606.ga4b1b128d6-goog

