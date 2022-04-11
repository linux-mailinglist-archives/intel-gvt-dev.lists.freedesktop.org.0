Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C44FBE8F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E4710EC2C;
	Mon, 11 Apr 2022 14:14:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C289310EBB5;
 Mon, 11 Apr 2022 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TO70N9dvqoS5lkquCWR1xtCLH7JNTt1iUVXlp2hpJYM=; b=WSedrvGNNTyDyZyIaNKoC/Ov93
 u1e2NOa/t3fyPDZWxA+g/b/i53MX2wgE7Z+e9/JBk1kkmcBivNvnU7x24O4R0TpmhL9JfzRow+UYL
 xU0IqEzUC4zlZkyhLRucprOjK4Hq9dbrL+eikADyyCTkaXO3LSGXxmfncVBrffsiLp4/90rXw3e1W
 BCAUB2+I1jA8P+BOThxd+w9jK+DkTHx0fZn+Kgs8T2fzVAIKRZDx3BO4QhAoEd86LIGAp+DzjiNiB
 AGJAbTuV+EbcW0yftpIhKizAZ8HaQ0+K5viSrNxfHfMOIPZcmYxTkHIP0g0z4ti+ivXATy5zaZZZR
 qBn66DZw==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduoT-009KUy-HY; Mon, 11 Apr 2022 14:14:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 11/34] drm/i915/gvt: merge struct kvmgt_guest_info into strut
 intel_vgpu
Date: Mon, 11 Apr 2022 16:13:40 +0200
Message-Id: <20220411141403.86980-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411141403.86980-1-hch@lst.de>
References: <20220411141403.86980-1-hch@lst.de>
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

Consolidate the per-VGPU structures into a single one.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h   |   8 +++
 drivers/gpu/drm/i915/gvt/kvmgt.c | 117 ++++++++++++-------------------
 2 files changed, 52 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 628dd686c03d5..16daa615f9c0d 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -34,6 +34,7 @@
 #define _GVT_H_
 
 #include <uapi/linux/pci_regs.h>
+#include <linux/kvm_host.h>
 
 #include "i915_drv.h"
 #include "intel_gvt.h"
@@ -174,6 +175,8 @@ struct intel_vgpu_submission {
 	} last_ctx[I915_NUM_ENGINES];
 };
 
+#define KVMGT_DEBUGFS_FILENAME		"kvmgt_nr_cache_entries"
+
 struct intel_vgpu {
 	struct intel_gvt *gvt;
 	struct mutex vgpu_lock;
@@ -236,6 +239,11 @@ struct intel_vgpu {
 	atomic_t released;
 	struct vfio_device *vfio_device;
 	struct vfio_group *vfio_group;
+
+	struct kvm_page_track_notifier_node track_node;
+#define NR_BKT (1 << 18)
+	struct hlist_head ptable[NR_BKT];
+#undef NR_BKT
 };
 
 /* validating GM healthy status*/
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1c2b949d8e01f..37cdf092a7140 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -39,7 +39,6 @@
 #include <linux/spinlock.h>
 #include <linux/eventfd.h>
 #include <linux/uuid.h>
-#include <linux/kvm_host.h>
 #include <linux/vfio.h>
 #include <linux/mdev.h>
 #include <linux/debugfs.h>
@@ -92,16 +91,6 @@ struct kvmgt_pgfn {
 	struct hlist_node hnode;
 };
 
-#define KVMGT_DEBUGFS_FILENAME "kvmgt_nr_cache_entries"
-struct kvmgt_guest_info {
-	struct kvm *kvm;
-	struct intel_vgpu *vgpu;
-	struct kvm_page_track_notifier_node track_node;
-#define NR_BKT (1 << 18)
-	struct hlist_head ptable[NR_BKT];
-#undef NR_BKT
-};
-
 struct gvt_dma {
 	struct intel_vgpu *vgpu;
 	struct rb_node gfn_node;
@@ -232,7 +221,7 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 
 static int kvmgt_guest_init(struct mdev_device *mdev);
 static void intel_vgpu_release_work(struct work_struct *work);
-static bool kvmgt_guest_exit(struct kvmgt_guest_info *info);
+static bool kvmgt_guest_exit(struct intel_vgpu *info);
 
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
@@ -456,12 +445,12 @@ static void gvt_cache_init(struct intel_vgpu *vgpu)
 	mutex_init(&vgpu->cache_lock);
 }
 
-static void kvmgt_protect_table_init(struct kvmgt_guest_info *info)
+static void kvmgt_protect_table_init(struct intel_vgpu *info)
 {
 	hash_init(info->ptable);
 }
 
-static void kvmgt_protect_table_destroy(struct kvmgt_guest_info *info)
+static void kvmgt_protect_table_destroy(struct intel_vgpu *info)
 {
 	struct kvmgt_pgfn *p;
 	struct hlist_node *tmp;
@@ -474,7 +463,7 @@ static void kvmgt_protect_table_destroy(struct kvmgt_guest_info *info)
 }
 
 static struct kvmgt_pgfn *
-__kvmgt_protect_table_find(struct kvmgt_guest_info *info, gfn_t gfn)
+__kvmgt_protect_table_find(struct intel_vgpu *info, gfn_t gfn)
 {
 	struct kvmgt_pgfn *p, *res = NULL;
 
@@ -488,8 +477,7 @@ __kvmgt_protect_table_find(struct kvmgt_guest_info *info, gfn_t gfn)
 	return res;
 }
 
-static bool kvmgt_gfn_is_write_protected(struct kvmgt_guest_info *info,
-				gfn_t gfn)
+static bool kvmgt_gfn_is_write_protected(struct intel_vgpu *info, gfn_t gfn)
 {
 	struct kvmgt_pgfn *p;
 
@@ -497,7 +485,7 @@ static bool kvmgt_gfn_is_write_protected(struct kvmgt_guest_info *info,
 	return !!p;
 }
 
-static void kvmgt_protect_table_add(struct kvmgt_guest_info *info, gfn_t gfn)
+static void kvmgt_protect_table_add(struct intel_vgpu *info, gfn_t gfn)
 {
 	struct kvmgt_pgfn *p;
 
@@ -512,8 +500,7 @@ static void kvmgt_protect_table_add(struct kvmgt_guest_info *info, gfn_t gfn)
 	hash_add(info->ptable, &p->hnode, gfn);
 }
 
-static void kvmgt_protect_table_del(struct kvmgt_guest_info *info,
-				gfn_t gfn)
+static void kvmgt_protect_table_del(struct intel_vgpu *info, gfn_t gfn)
 {
 	struct kvmgt_pgfn *p;
 
@@ -940,7 +927,6 @@ static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
 static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 {
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
-	struct kvmgt_guest_info *info;
 	int ret;
 
 	if (!handle_valid(vgpu->handle))
@@ -964,8 +950,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	/* dereference module reference taken at open */
 	module_put(THIS_MODULE);
 
-	info = (struct kvmgt_guest_info *)vgpu->handle;
-	kvmgt_guest_exit(info);
+	kvmgt_guest_exit(vgpu);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
 	vfio_group_put_external_user(vgpu->vfio_group);
@@ -1751,7 +1736,7 @@ static void kvmgt_host_exit(struct device *dev, void *gvt)
 
 static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 {
-	struct kvmgt_guest_info *info;
+	struct intel_vgpu *info;
 	struct kvm *kvm;
 	struct kvm_memory_slot *slot;
 	int idx;
@@ -1759,7 +1744,7 @@ static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 	if (!handle_valid(handle))
 		return -ESRCH;
 
-	info = (struct kvmgt_guest_info *)handle;
+	info = (struct intel_vgpu *)handle;
 	kvm = info->kvm;
 
 	idx = srcu_read_lock(&kvm->srcu);
@@ -1785,7 +1770,7 @@ static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 
 static int kvmgt_page_track_remove(unsigned long handle, u64 gfn)
 {
-	struct kvmgt_guest_info *info;
+	struct intel_vgpu *info;
 	struct kvm *kvm;
 	struct kvm_memory_slot *slot;
 	int idx;
@@ -1793,7 +1778,7 @@ static int kvmgt_page_track_remove(unsigned long handle, u64 gfn)
 	if (!handle_valid(handle))
 		return 0;
 
-	info = (struct kvmgt_guest_info *)handle;
+	info = (struct intel_vgpu *)handle;
 	kvm = info->kvm;
 
 	idx = srcu_read_lock(&kvm->srcu);
@@ -1821,11 +1806,11 @@ static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
 		const u8 *val, int len,
 		struct kvm_page_track_notifier_node *node)
 {
-	struct kvmgt_guest_info *info = container_of(node,
-					struct kvmgt_guest_info, track_node);
+	struct intel_vgpu *info =
+		container_of(node, struct intel_vgpu, track_node);
 
 	if (kvmgt_gfn_is_write_protected(info, gpa_to_gfn(gpa)))
-		intel_vgpu_page_track_handler(info->vgpu, gpa,
+		intel_vgpu_page_track_handler(info, gpa,
 						     (void *)val, len);
 }
 
@@ -1835,8 +1820,8 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 {
 	int i;
 	gfn_t gfn;
-	struct kvmgt_guest_info *info = container_of(node,
-					struct kvmgt_guest_info, track_node);
+	struct intel_vgpu *info =
+		container_of(node, struct intel_vgpu, track_node);
 
 	write_lock(&kvm->mmu_lock);
 	for (i = 0; i < slot->npages; i++) {
@@ -1853,7 +1838,6 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
 {
 	struct intel_vgpu *itr;
-	struct kvmgt_guest_info *info;
 	int id;
 	bool ret = false;
 
@@ -1862,8 +1846,7 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
 		if (!handle_valid(itr->handle))
 			continue;
 
-		info = (struct kvmgt_guest_info *)itr->handle;
-		if (kvm && kvm == info->kvm) {
+		if (kvm && kvm == itr->kvm) {
 			ret = true;
 			goto out;
 		}
@@ -1875,7 +1858,6 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
 
 static int kvmgt_guest_init(struct mdev_device *mdev)
 {
-	struct kvmgt_guest_info *info;
 	struct intel_vgpu *vgpu;
 	struct kvm *kvm;
 
@@ -1892,38 +1874,29 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	if (__kvmgt_vgpu_exist(vgpu, kvm))
 		return -EEXIST;
 
-	info = vzalloc(sizeof(struct kvmgt_guest_info));
-	if (!info)
-		return -ENOMEM;
-
-	vgpu->handle = (unsigned long)info;
-	info->vgpu = vgpu;
-	info->kvm = kvm;
-	kvm_get_kvm(info->kvm);
+	vgpu->handle = (unsigned long)vgpu;
+	kvm_get_kvm(vgpu->kvm);
 
-	kvmgt_protect_table_init(info);
+	kvmgt_protect_table_init(vgpu);
 	gvt_cache_init(vgpu);
 
-	info->track_node.track_write = kvmgt_page_track_write;
-	info->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
-	kvm_page_track_register_notifier(kvm, &info->track_node);
+	vgpu->track_node.track_write = kvmgt_page_track_write;
+	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
+	kvm_page_track_register_notifier(kvm, &vgpu->track_node);
 
 	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
 			     &vgpu->nr_cache_entries);
 	return 0;
 }
 
-static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
+static bool kvmgt_guest_exit(struct intel_vgpu *info)
 {
-	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME,
-				      info->vgpu->debugfs));
+	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, info->debugfs));
 
 	kvm_page_track_unregister_notifier(info->kvm, &info->track_node);
 	kvm_put_kvm(info->kvm);
 	kvmgt_protect_table_destroy(info);
-	gvt_cache_destroy(info->vgpu);
-	vfree(info);
-
+	gvt_cache_destroy(info);
 	return true;
 }
 
@@ -1946,14 +1919,12 @@ static void kvmgt_detach_vgpu(void *p_vgpu)
 
 static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
 {
-	struct kvmgt_guest_info *info;
 	struct intel_vgpu *vgpu;
 
 	if (!handle_valid(handle))
 		return -ESRCH;
 
-	info = (struct kvmgt_guest_info *)handle;
-	vgpu = info->vgpu;
+	vgpu = (struct intel_vgpu *)handle;
 
 	/*
 	 * When guest is poweroff, msi_trigger is set to NULL, but vgpu's
@@ -1975,15 +1946,15 @@ static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
 
 static unsigned long kvmgt_gfn_to_pfn(unsigned long handle, unsigned long gfn)
 {
-	struct kvmgt_guest_info *info;
+	struct intel_vgpu *vgpu;
 	kvm_pfn_t pfn;
 
 	if (!handle_valid(handle))
 		return INTEL_GVT_INVALID_ADDR;
 
-	info = (struct kvmgt_guest_info *)handle;
+	vgpu = (struct intel_vgpu *)handle;
 
-	pfn = gfn_to_pfn(info->kvm, gfn);
+	pfn = gfn_to_pfn(vgpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return INTEL_GVT_INVALID_ADDR;
 
@@ -2000,7 +1971,7 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 	if (!handle_valid(handle))
 		return -EINVAL;
 
-	vgpu = ((struct kvmgt_guest_info *)handle)->vgpu;
+	vgpu = (struct intel_vgpu *)handle;
 
 	mutex_lock(&vgpu->cache_lock);
 
@@ -2042,22 +2013,22 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 
 static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma_addr)
 {
-	struct kvmgt_guest_info *info;
+	struct intel_vgpu *vgpu;
 	struct gvt_dma *entry;
 	int ret = 0;
 
 	if (!handle_valid(handle))
 		return -ENODEV;
 
-	info = (struct kvmgt_guest_info *)handle;
+	vgpu = (struct intel_vgpu *)handle;
 
-	mutex_lock(&info->vgpu->cache_lock);
-	entry = __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
+	mutex_lock(&vgpu->cache_lock);
+	entry = __gvt_cache_find_dma_addr(vgpu, dma_addr);
 	if (entry)
 		kref_get(&entry->ref);
 	else
 		ret = -ENOMEM;
-	mutex_unlock(&info->vgpu->cache_lock);
+	mutex_unlock(&vgpu->cache_lock);
 
 	return ret;
 }
@@ -2079,7 +2050,7 @@ static void kvmgt_dma_unmap_guest_page(unsigned long handle, dma_addr_t dma_addr
 	if (!handle_valid(handle))
 		return;
 
-	vgpu = ((struct kvmgt_guest_info *)handle)->vgpu;
+	vgpu = (struct intel_vgpu *)handle;
 
 	mutex_lock(&vgpu->cache_lock);
 	entry = __gvt_cache_find_dma_addr(vgpu, dma_addr);
@@ -2091,14 +2062,14 @@ static void kvmgt_dma_unmap_guest_page(unsigned long handle, dma_addr_t dma_addr
 static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
 			void *buf, unsigned long len, bool write)
 {
-	struct kvmgt_guest_info *info;
+	struct intel_vgpu *vgpu;
 
 	if (!handle_valid(handle))
 		return -ESRCH;
 
-	info = (struct kvmgt_guest_info *)handle;
+	vgpu = (struct intel_vgpu *)handle;
 
-	return vfio_dma_rw(info->vgpu->vfio_group, gpa, buf, len, write);
+	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, write);
 }
 
 static int kvmgt_read_gpa(unsigned long handle, unsigned long gpa,
@@ -2115,7 +2086,7 @@ static int kvmgt_write_gpa(unsigned long handle, unsigned long gpa,
 
 static bool kvmgt_is_valid_gfn(unsigned long handle, unsigned long gfn)
 {
-	struct kvmgt_guest_info *info;
+	struct intel_vgpu *vgpu;
 	struct kvm *kvm;
 	int idx;
 	bool ret;
@@ -2123,8 +2094,8 @@ static bool kvmgt_is_valid_gfn(unsigned long handle, unsigned long gfn)
 	if (!handle_valid(handle))
 		return false;
 
-	info = (struct kvmgt_guest_info *)handle;
-	kvm = info->kvm;
+	vgpu = (struct intel_vgpu *)handle;
+	kvm = vgpu->kvm;
 
 	idx = srcu_read_lock(&kvm->srcu);
 	ret = kvm_is_visible_gfn(kvm, gfn);
-- 
2.30.2

