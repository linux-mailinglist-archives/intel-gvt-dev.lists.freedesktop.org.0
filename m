Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24344427C8
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC266FAA8;
	Tue,  2 Nov 2021 07:08:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8616FAA8;
 Tue,  2 Nov 2021 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yRWWKlNRxl+oGryWUECDqY4kKwpfuEsy3w4SaJzR2Zs=; b=0ExP5YoBhdFRGRKgKFEEJC2FWx
 VvN1qlvKM7j0SC4/cujSxGJJZK+E1haAiIis+E6FXq8YVa6DrtmqmH7YTMDnHUBLXOjJvXzyjK9yd
 lnwkLSOt2UWCDE/zjVQyG7gPVkyi53PZ0WKDnOY3o7L1c4at4ZRq/vu7PpsgnpKDsU4y8xbdNoBU3
 bx+S9WzJxvyTpI/iFXllRC58bKVMEJCkHIXTZ5s1ZXOhbzRvQ4sHZn8Fc4KCPkraSCNOJv0qg1tME
 /xsablvjFtwbYZqKC5Q2k/X0Lng9//HhfCSHy+2GfF2IdhB7k1oDsGcWRETegdPRfitGvYgN8lQl/
 m0YWzS/Q==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnuT-000iTp-4b; Tue, 02 Nov 2021 07:08:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 27/29] drm/i915/gvt: remove kvmgt_guest_{init,exit}
Date: Tue,  2 Nov 2021 08:05:59 +0100
Message-Id: <20211102070601.155501-28-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Merge these into their only callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 129 ++++++++++++++-----------------
 1 file changed, 60 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index d3e0a3f5559db..46ab66ebbc9aa 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -97,6 +97,13 @@ struct gvt_dma {
 	struct kref ref;
 };
 
+static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
+		const u8 *val, int len,
+		struct kvm_page_track_notifier_node *node);
+static void kvmgt_page_track_flush_slot(struct kvm *kvm,
+		struct kvm_memory_slot *slot,
+		struct kvm_page_track_notifier_node *node);
+
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -195,9 +202,7 @@ void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 	}
 }
 
-static int kvmgt_guest_init(struct mdev_device *mdev);
 static void intel_vgpu_release_work(struct work_struct *work);
-static bool kvmgt_guest_exit(struct intel_vgpu *info);
 
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
@@ -785,6 +790,27 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
+{
+	struct intel_vgpu *itr;
+	int id;
+	bool ret = false;
+
+	mutex_lock(&vgpu->gvt->lock);
+	for_each_active_vgpu(vgpu->gvt, itr, id) {
+		if (!itr->attached)
+			continue;
+
+		if (vgpu->kvm == itr->kvm) {
+			ret = true;
+			goto out;
+		}
+	}
+out:
+	mutex_unlock(&vgpu->gvt->lock);
+	return ret;
+}
+
 static int intel_vgpu_open_device(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
@@ -829,14 +855,37 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 		goto undo_group;
 	}
 
-	ret = kvmgt_guest_init(mdev);
-	if (ret)
+	ret = -EEXIST;
+	if (vgpu->attached)
+		goto undo_group;
+
+	ret = -ESRCH;
+	if (!vgpu->kvm || vgpu->kvm->mm != current->mm) {
+		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
+		goto undo_group;
+	}
+
+	ret = -EEXIST;
+	if (__kvmgt_vgpu_exist(vgpu))
 		goto undo_group;
 
+	vgpu->attached = true;
+	kvm_get_kvm(vgpu->kvm);
+
+	kvmgt_protect_table_init(vgpu);
+	gvt_cache_init(vgpu);
+
+	vgpu->track_node.track_write = kvmgt_page_track_write;
+	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
+	kvm_page_track_register_notifier(vgpu->kvm, &vgpu->track_node);
+
+	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
+			     &vgpu->nr_cache_entries);
+
 	intel_gvt_activate_vgpu(vgpu);
 
 	atomic_set(&vgpu->released, 0);
-	return ret;
+	return 0;
 
 undo_group:
 	vfio_group_put_external_user(vgpu->vfio_group);
@@ -890,7 +939,12 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	/* dereference module reference taken at open */
 	module_put(THIS_MODULE);
 
-	kvmgt_guest_exit(vgpu);
+	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
+
+	kvm_page_track_unregister_notifier(vgpu->kvm, &vgpu->track_node);
+	kvm_put_kvm(vgpu->kvm);
+	kvmgt_protect_table_destroy(vgpu);
+	gvt_cache_destroy(vgpu);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
 	vfio_group_put_external_user(vgpu->vfio_group);
@@ -1745,69 +1799,6 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 	write_unlock(&kvm->mmu_lock);
 }
 
-static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
-{
-	struct intel_vgpu *itr;
-	int id;
-	bool ret = false;
-
-	mutex_lock(&vgpu->gvt->lock);
-	for_each_active_vgpu(vgpu->gvt, itr, id) {
-		if (!itr->attached)
-			continue;
-
-		if (kvm && kvm == itr->kvm) {
-			ret = true;
-			goto out;
-		}
-	}
-out:
-	mutex_unlock(&vgpu->gvt->lock);
-	return ret;
-}
-
-static int kvmgt_guest_init(struct mdev_device *mdev)
-{
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-	struct kvm *kvm = vgpu->kvm;
-
-	if (vgpu->attached)
-		return -EEXIST;
-
-	if (!kvm || kvm->mm != current->mm) {
-		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
-		return -ESRCH;
-	}
-
-	if (__kvmgt_vgpu_exist(vgpu, kvm))
-		return -EEXIST;
-
-	vgpu->attached = true;
-	kvm_get_kvm(vgpu->kvm);
-
-	kvmgt_protect_table_init(vgpu);
-	gvt_cache_init(vgpu);
-
-	vgpu->track_node.track_write = kvmgt_page_track_write;
-	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
-	kvm_page_track_register_notifier(kvm, &vgpu->track_node);
-
-	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
-			     &vgpu->nr_cache_entries);
-	return 0;
-}
-
-static bool kvmgt_guest_exit(struct intel_vgpu *info)
-{
-	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, info->debugfs));
-
-	kvm_page_track_unregister_notifier(info->kvm, &info->track_node);
-	kvm_put_kvm(info->kvm);
-	kvmgt_protect_table_destroy(info);
-	gvt_cache_destroy(info);
-	return true;
-}
-
 void intel_vgpu_detach_regions(struct intel_vgpu *vgpu)
 {
 	int i;
-- 
2.30.2

