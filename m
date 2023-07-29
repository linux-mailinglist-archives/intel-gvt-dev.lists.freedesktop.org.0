Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CEF767B03
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FD010E7CC;
	Sat, 29 Jul 2023 01:36:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3597510E7CB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:21 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1bba5626342so24615565ad.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594581; x=1691199381;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=uiEB/kQUv0ir0mfmtivhGXvmCVUeZ0u7hnCpQaqn4t4=;
 b=W1WZttu6R8I/jENPLMiq750pAPjCMMHtOHh60LBbYPpNTeCH0ePA0H+jt6+kfLVsE/
 hjHYcM7jdTFnI5wdJLWy4mdFWEzvMyZ9anQ2EAvPbF2qJ7U38NamwLi1U7pfo057CNuL
 2AyKDyj7uTqX0DsUcbae5I58jCUo+YVEiXj2LM9V/Ida88PEMWuE/vyDO6jjBeYyYFSf
 qdmjxt1/nTKtgrrq/DztwAtgNoSuQje8eJIRPHzT4zNsxPsaP1nnXSXxV+Qj6+5miIHC
 9hBFHCE/Pz6DrBA5toquhFoXIF0k6X710ptrk4VIl44Wbxnqtawa8NKi1CkuxdBwbW8Y
 wa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594581; x=1691199381;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uiEB/kQUv0ir0mfmtivhGXvmCVUeZ0u7hnCpQaqn4t4=;
 b=I+tWVpiqrcO8ubcuMqb4qcJuuyjftx/gk9mjQkjtDVHbcK94i2DSkA0QJUG6mo64KS
 XQ5fZH2oKirIj/8QHmq84u9ely9NM2Ko5j8OHZm8Xcoi69qXnsB0/QoAeFNZcH08yVHm
 XXspVhm2M//sJcxyl15JqsaY8Foukd1jDupMu6O8k5FDl8ECfwMdv+R6EAFpliLNbwtx
 kQKV6lgv77327q1q1W1vMHhp1DZTrpKe/MPQDfIWmfI3sRn8zUJcrrlgjFSEiXLrwEPj
 9+OM6/mBg+R/DvzUUhPYU11G+Jt2HX8tjMR6Xr7dH70QWw+HJHLFD7Nm9QBhMxDOxvMJ
 yYAw==
X-Gm-Message-State: ABy/qLbhkXDf6WEC8yuV4mAvYucu+av57J1c/8M5XB7S5FQ1jX3mFbB5
 ZhUVZio08HOogmolgLGUK/DaR1Q3xxE=
X-Google-Smtp-Source: APBJJlGXeVSCywK4IEJvnvwRYK3nnhvZFsuPXvnKZt5S6oIw94vJeB4OV6O4ynLG7j1W7KhxRTCUgMkCtis=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:da86:b0:1ba:a36d:f82c with SMTP id
 j6-20020a170902da8600b001baa36df82cmr12754plx.7.1690594580835; Fri, 28 Jul
 2023 18:36:20 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:25 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-20-seanjc@google.com>
Subject: [PATCH v4 19/29] drm/i915/gvt: switch from ->track_flush_slot() to
 ->track_remove_region()
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
 Yongwei Ma <yongwei.ma@intel.com>, Ben Gardon <bgardon@google.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: Yan Zhao <yan.y.zhao@intel.com>

Switch from the poorly named and flawed ->track_flush_slot() to the newly
introduced ->track_remove_region().  From KVMGT's perspective, the two
hooks are functionally equivalent, the only difference being that
->track_remove_region() is called only when KVM is 100% certain the
memory region will be removed, i.e. is invoked slightly later in KVM's
memslot modification flow.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
[sean: handle name change, massage changelog, rebase]
Tested-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3ea3cb9eb599..3f2327455d85 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -108,9 +108,8 @@ struct gvt_dma {
 
 static void kvmgt_page_track_write(gpa_t gpa, const u8 *val, int len,
 				   struct kvm_page_track_notifier_node *node);
-static void kvmgt_page_track_flush_slot(struct kvm *kvm,
-		struct kvm_memory_slot *slot,
-		struct kvm_page_track_notifier_node *node);
+static void kvmgt_page_track_remove_region(gfn_t gfn, unsigned long nr_pages,
+					   struct kvm_page_track_notifier_node *node);
 
 static ssize_t intel_vgpu_show_description(struct mdev_type *mtype, char *buf)
 {
@@ -666,7 +665,7 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 		return -EEXIST;
 
 	vgpu->track_node.track_write = kvmgt_page_track_write;
-	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
+	vgpu->track_node.track_remove_region = kvmgt_page_track_remove_region;
 	kvm_get_kvm(vgpu->vfio_device.kvm);
 	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
 					 &vgpu->track_node);
@@ -1617,22 +1616,20 @@ static void kvmgt_page_track_write(gpa_t gpa, const u8 *val, int len,
 	mutex_unlock(&info->vgpu_lock);
 }
 
-static void kvmgt_page_track_flush_slot(struct kvm *kvm,
-		struct kvm_memory_slot *slot,
-		struct kvm_page_track_notifier_node *node)
+static void kvmgt_page_track_remove_region(gfn_t gfn, unsigned long nr_pages,
+					   struct kvm_page_track_notifier_node *node)
 {
 	unsigned long i;
-	gfn_t gfn;
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
 
 	mutex_lock(&info->vgpu_lock);
 
-	for (i = 0; i < slot->npages; i++) {
-		gfn = slot->base_gfn + i;
-		if (kvmgt_gfn_is_write_protected(info, gfn))
-			kvmgt_protect_table_del(info, gfn);
+	for (i = 0; i < nr_pages; i++) {
+		if (kvmgt_gfn_is_write_protected(info, gfn + i))
+			kvmgt_protect_table_del(info, gfn + i);
 	}
+
 	mutex_unlock(&info->vgpu_lock);
 }
 
-- 
2.41.0.487.g6d72f3e995-goog

