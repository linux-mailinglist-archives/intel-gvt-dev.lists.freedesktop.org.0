Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D458E654A29
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F150710E199;
	Fri, 23 Dec 2022 00:58:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE4E10E60D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:28 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 k1-20020a17090a9d8100b00225af21197dso1790085pjp.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=F68NRl2pI2gfNuGgfMnIAWelg21w3HsZ2MQHgdeJqA4=;
 b=msOJNFnhoMnqI73ZE5Z/qzHzk1j1M17RXCGluQf+a1yGw+P+1l2k09p3c4nsLWzmnN
 pGJWlqgSqAKnQE3mahhPADrmGu8jPVkEdf0n9y9CcUlINRrJ+5so3C4FqghwM1Rjeeyr
 dO8UGzGKn9lb1P79acr83Jg8pns4LgY5d0brjPfAzfMfNjGLfV912nDbKkrVinnQzvaP
 jDbT/T79j+5jmmgUG3JcATGeYhCiOKtdGiG9lC69hUz4SGXmq4dZN5jaYHcfXLF5ZhVn
 NQs6RGxqIHtcjcBmeXaX4Av/w15ydZTZs/qHPs1i3mEu6rnjqULNOFXAC2qPXEVe/gdv
 PlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F68NRl2pI2gfNuGgfMnIAWelg21w3HsZ2MQHgdeJqA4=;
 b=LfqoUBJkb2S8Yze1OxovB3qOFb/eBOnG0a018UatgtlM5hv6aPH5/NxXiNWaS2OnTh
 FzgxGTFCxglxzVVgPGHPltktydw0BxgIzrIyqZzh1S+rGw0nT6sTJH3t6moXvGfhZ3VG
 ptZH8s7oBPHADhUg7hBondAH4IMD6ZXqjAH5fbsiqNBcIPQF64dCOvMDimx6xNrK8Uu/
 6IsXwJjAxvjeb8Ls6Xo34pBp1V8u4nMUcMY0Bhm68XuyriVOPsb7cb8uDPlKiuIU9ZAA
 k3SX9jXssKkJFHNDo6GDNH0Ow1GmGnbL4mz9Bf32kpAWrebYKz2ffFbbuArRIrlCGEb2
 54Ng==
X-Gm-Message-State: AFqh2kqs3a6sXSBnbb9WMe6EXagkJ0bXs0az2o5a6R0Mm0QUPQv996kz
 yI/7+hclH/G0x+LYQTQePNrLLVx+dHM=
X-Google-Smtp-Source: AMrXdXvbfGwlJd/u1wxfpzDD8Ky+xg1iXAqvTzrQ7pRY9+ichgHs9jry+/iz2oMhuB/PfPD8/qh+1mi/xP4=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:7d93:b0:189:680e:c2e5 with SMTP id
 a19-20020a1709027d9300b00189680ec2e5mr362426plm.51.1671757108048; Thu, 22 Dec
 2022 16:58:28 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:37 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-26-seanjc@google.com>
Subject: [PATCH 25/27] KVM: x86/mmu: Handle KVM bookkeeping in page-track
 APIs, not callers
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

Get/put references to KVM when a page-track notifier is (un)registered
instead of relying on the caller to do so.  Forcing the caller to do the
bookkeeping is unnecessary and adds one more thing for users to get
wrong, e.g. see commit 9ed1fdee9ee3 ("drm/i915/gvt: Get reference to KVM
iff attachment to VM is successful").

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_page_track.h | 10 ++++------
 arch/x86/kvm/mmu/page_track.c         | 18 ++++++++++++------
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 23 ++++++++++-------------
 3 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index 415537ce45b4..66a0d7c34311 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -47,12 +47,10 @@ struct kvm_page_track_notifier_node {
 enum pg_level kvm_page_track_max_mapping_level(struct kvm *kvm, gfn_t gfn,
 					       enum pg_level max_level);
 
-void
-kvm_page_track_register_notifier(struct kvm *kvm,
-				 struct kvm_page_track_notifier_node *n);
-void
-kvm_page_track_unregister_notifier(struct kvm *kvm,
-				   struct kvm_page_track_notifier_node *n);
+int kvm_page_track_register_notifier(struct kvm *kvm,
+				     struct kvm_page_track_notifier_node *n);
+void kvm_page_track_unregister_notifier(struct kvm *kvm,
+					struct kvm_page_track_notifier_node *n);
 
 int kvm_write_track_add_gfn(struct kvm *kvm, gfn_t gfn);
 int kvm_write_track_remove_gfn(struct kvm *kvm, gfn_t gfn);
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index bc54afc1919c..1af431a41f71 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -157,17 +157,22 @@ int kvm_page_track_init(struct kvm *kvm)
  * register the notifier so that event interception for the tracked guest
  * pages can be received.
  */
-void
-kvm_page_track_register_notifier(struct kvm *kvm,
-				 struct kvm_page_track_notifier_node *n)
+int kvm_page_track_register_notifier(struct kvm *kvm,
+				     struct kvm_page_track_notifier_node *n)
 {
 	struct kvm_page_track_notifier_head *head;
 
+	if (!kvm || kvm->mm != current->mm)
+		return -ESRCH;
+
+	kvm_get_kvm(kvm);
+
 	head = &kvm->arch.track_notifier_head;
 
 	write_lock(&kvm->mmu_lock);
 	hlist_add_head_rcu(&n->node, &head->track_notifier_list);
 	write_unlock(&kvm->mmu_lock);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(kvm_page_track_register_notifier);
 
@@ -175,9 +180,8 @@ EXPORT_SYMBOL_GPL(kvm_page_track_register_notifier);
  * stop receiving the event interception. It is the opposed operation of
  * kvm_page_track_register_notifier().
  */
-void
-kvm_page_track_unregister_notifier(struct kvm *kvm,
-				   struct kvm_page_track_notifier_node *n)
+void kvm_page_track_unregister_notifier(struct kvm *kvm,
+					struct kvm_page_track_notifier_node *n)
 {
 	struct kvm_page_track_notifier_head *head;
 
@@ -187,6 +191,8 @@ kvm_page_track_unregister_notifier(struct kvm *kvm,
 	hlist_del_rcu(&n->node);
 	write_unlock(&kvm->mmu_lock);
 	synchronize_srcu(&head->track_srcu);
+
+	kvm_put_kvm(kvm);
 }
 EXPORT_SYMBOL_GPL(kvm_page_track_unregister_notifier);
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index f9d21d29f533..e4227ac6ab58 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -670,30 +670,28 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
 static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 {
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
+	int ret;
 
 	if (vgpu->attached)
 		return -EEXIST;
 
-	if (!vgpu->vfio_device.kvm ||
-	    vgpu->vfio_device.kvm->mm != current->mm) {
-		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
-		return -ESRCH;
-	}
-
 	if (__kvmgt_vgpu_exist(vgpu))
 		return -EEXIST;
 
+	vgpu->track_node.track_write = kvmgt_page_track_write;
+	vgpu->track_node.track_remove_region = kvmgt_page_track_remove_region;
+	ret = kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
+					       &vgpu->track_node);
+	if (ret) {
+		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
+		return ret;
+	}
+
 	vgpu->attached = true;
 
 	kvmgt_protect_table_init(vgpu);
 	gvt_cache_init(vgpu);
 
-	vgpu->track_node.track_write = kvmgt_page_track_write;
-	vgpu->track_node.track_remove_region = kvmgt_page_track_remove_region;
-	kvm_get_kvm(vgpu->vfio_device.kvm);
-	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
-					 &vgpu->track_node);
-
 	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
 			     &vgpu->nr_cache_entries);
 
@@ -730,7 +728,6 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 
 	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
 					   &vgpu->track_node);
-	kvm_put_kvm(vgpu->vfio_device.kvm);
 
 	kvmgt_protect_table_destroy(vgpu);
 	gvt_cache_destroy(vgpu);
-- 
2.39.0.314.g84b9a713c41-goog

