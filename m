Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95D654A2A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F87910E601;
	Fri, 23 Dec 2022 00:58:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725B210E609
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:30 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 q92-20020a17090a17e500b00223b688fe9fso1804833pja.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=E5mEvk7mhTbLTbI71CnckeUYfBuaX+0urxAADq0bdpk=;
 b=H4aiigdAaqzzU7IYxEhnMpAq+LO60LbHzZkIUHopuBtbH6R08DMSSogGhi16I6aE+4
 rBYIQ2VLojy92J2PjyPZiHasqVnT0Ui5kZCWTATNP1Cul9XqKd/nszUe4q3i+a4O0uNF
 bQZebRaR8FAgQDfzR6SWs/it4PXf9aFISvcDfu7stvlvsBejgW/qGrDacC5uvcsaP05G
 NzSEC5gIE0jjBIqUWtHqUP1Xyc9t0AIcTg6eWJlbLxpb0SMx/Yww3bYWtSkzpxW/rR/F
 c6ZwXZP4ooTQfKR+K5Oxmg1twSznhUSZNuMCeAD4BqJs9cvQednvW2HhTkFitU22C50d
 f7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E5mEvk7mhTbLTbI71CnckeUYfBuaX+0urxAADq0bdpk=;
 b=wqq0l7dP++ehYUNYvDJ2WmCq6DkhhiBQqJLKvQN+mAExXf9fb3fMWPVoivtkdaA08m
 j6za1EMOu9hOBouSovrS44LdHHHGIMkdeRjMWcKmlOQy4tq912c7ja9yDlLvJXwRTl79
 4pVSCoRovqlhsqfaffHAreZLf3eeae5i87p+ua41QCAjWLM9f1YICECu+ej7cafdd3LB
 vTHrhKrcdoMxo3vK8+F6LGfKSGVHiRAtlGjq1M/grQ+YvFdLSti/hKxnJ9blhTZc0Xlv
 VdKzpLt6MlFCBEGcDZCqYxpesfnonkaSKLphbmzGNtwBzVx/ZP6r3Mroatn5rTudEGIA
 kRwg==
X-Gm-Message-State: AFqh2kralJoOiqCCTuz8d1jEDTZ7R+P9neA8UYuvO1GY8FY4YgT1jMFc
 LPMPqbAYaWvNtUBeqiA90yHzx6rue5E=
X-Google-Smtp-Source: AMrXdXsumktbf9ORj6WvpRUFhzGjzygFSn5YpEseKjoNgVCVrMAzWGMwc4HsbeZ8JZZkARlRq26lxPKoLnE=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:701:b0:219:1d0a:34a6 with SMTP id
 s1-20020a17090b070100b002191d0a34a6mr180831pjz.1.1671757109874; Thu, 22 Dec
 2022 16:58:29 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:38 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-27-seanjc@google.com>
Subject: [PATCH 26/27] KVM: x86/mmu: Add page-track API to query if a gfn is
 valid
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

Add a page-track API to query if a gfn is "valid", i.e. is backed by a
memslot and is visible to the guest.  This is one more step toward
removing KVM internal details from the page-track APIs.

Add a FIXME to call out that intel_gvt_is_valid_gfn() is broken with
respect to 2MiB (or larger) guest entries, e.g. if the starting gfn is
valid but a 2MiB page starting at the gfn covers "invalid" memory due
to running beyond the memslot.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h |  1 +
 arch/x86/kvm/mmu/page_track.c         | 13 +++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.c        | 11 ++---------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index 66a0d7c34311..99e1d6eeb0fb 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -52,6 +52,7 @@ int kvm_page_track_register_notifier(struct kvm *kvm,
 void kvm_page_track_unregister_notifier(struct kvm *kvm,
 					struct kvm_page_track_notifier_node *n);
 
+bool kvm_page_track_is_valid_gfn(struct kvm *kvm, gfn_t gfn);
 int kvm_write_track_add_gfn(struct kvm *kvm, gfn_t gfn);
 int kvm_write_track_remove_gfn(struct kvm *kvm, gfn_t gfn);
 #endif /* CONFIG_KVM_EXTERNAL_WRITE_TRACKING */
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 1af431a41f71..9da071a514b3 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -264,6 +264,19 @@ enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
 }
 EXPORT_SYMBOL_GPL(kvm_page_track_max_mapping_level);
 
+bool kvm_page_track_is_valid_gfn(struct kvm *kvm, gfn_t gfn)
+{
+	bool ret;
+	int idx;
+
+	idx = srcu_read_lock(&kvm->srcu);
+	ret = kvm_is_visible_gfn(kvm, gfn);
+	srcu_read_unlock(&kvm->srcu, idx);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kvm_page_track_is_valid_gfn);
+
 /*
  * add guest page to the tracking pool so that corresponding access on that
  * page will be intercepted.
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 59ba6639e622..43c4fc23205d 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -51,18 +51,11 @@ static int preallocated_oos_pages = 8192;
 
 static bool intel_gvt_is_valid_gfn(struct intel_vgpu *vgpu, unsigned long gfn)
 {
-	struct kvm *kvm = vgpu->vfio_device.kvm;
-	int idx;
-	bool ret;
-
 	if (!vgpu->attached)
 		return false;
 
-	idx = srcu_read_lock(&kvm->srcu);
-	ret = kvm_is_visible_gfn(kvm, gfn);
-	srcu_read_unlock(&kvm->srcu, idx);
-
-	return ret;
+	/* FIXME: This doesn't properly handle guest entries larger than 4K. */
+	return kvm_page_track_is_valid_gfn(vgpu->vfio_device.kvm, gfn);
 }
 
 /*
-- 
2.39.0.314.g84b9a713c41-goog

