Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE73D12FC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100AD6E9A5;
	Wed, 21 Jul 2021 15:57:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3A76E97A;
 Wed, 21 Jul 2021 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=JHYnlZYAawt66XW3Q+ripC8oGTNrVcKpRHzoZUStE2E=; b=OX4Er02jbAktW3HdWEEsSLoJg7
 OWCgkybAgboUW6H28+8/9ugKw36eMdU9TLybzqdULKF1gDqTIc1JNLPMX+HxGE4wbk7zPBI+58dc8
 mwqkhupX4so4Gwr+N7WPghMCMUkfLVCUtaBdQuy6Yy7WbTFp///wLruReOADfaQEJZp8yDZbrPG92
 cfGBVwDKMRJGMZTjlkFHuFHs1somzgl0v0uZUy0GnERfRu64lMl9jaEtSC5hFzhM68+jUVv6tsCji
 V6r8n0E4pY6edf1sbeCgh/qF8usa+8eQQZb4wcY+Dox4EhXIdPVYgdl4XLmRECvLRW45ZMvf6YWIg
 byb0H3WA==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EaJ-009MPK-Nd; Wed, 21 Jul 2021 15:56:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 08/21] drm/i915/gvt: merge struct kvmgt_vdev into struct
 intel_vgpu
Date: Wed, 21 Jul 2021 17:53:42 +0200
Message-Id: <20210721155355.173183-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210721155355.173183-1-hch@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Move towards having only a single structure for the per-VGPU state.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h       |  31 ++-
 drivers/gpu/drm/i915/gvt/hypercall.h |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 288 ++++++++++-----------------
 drivers/gpu/drm/i915/gvt/mpt.h       |  16 --
 drivers/gpu/drm/i915/gvt/vgpu.c      |   8 +-
 5 files changed, 128 insertions(+), 216 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 40643fe14383..9f419e7f7a1b 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -206,21 +206,36 @@ struct intel_vgpu {
 
 	struct dentry *debugfs;
 
-	/* Hypervisor-specific device state. */
-	void *vdev;
-
 	struct list_head dmabuf_obj_list_head;
 	struct mutex dmabuf_lock;
 	struct idr object_idr;
 	struct intel_vgpu_vblank_timer vblank_timer;
 
 	u32 scan_nonprivbb;
-};
 
-static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
-{
-	return vgpu->vdev;
-}
+	struct mdev_device *mdev;
+	struct vfio_region *region;
+	int num_regions;
+	struct eventfd_ctx *intx_trigger;
+	struct eventfd_ctx *msi_trigger;
+
+	/*
+	 * Two caches are used to avoid mapping duplicated pages (eg.
+	 * scratch pages). This help to reduce dma setup overhead.
+	 */
+	struct rb_root gfn_cache;
+	struct rb_root dma_addr_cache;
+	unsigned long nr_cache_entries;
+	struct mutex cache_lock;
+
+	struct notifier_block iommu_notifier;
+	struct notifier_block group_notifier;
+	struct kvm *kvm;
+	struct work_struct release_work;
+	atomic_t released;
+	struct vfio_device *vfio_device;
+	struct vfio_group *vfio_group;
+};
 
 /* validating GM healthy status*/
 #define vgpu_is_vm_unhealthy(ret_val) \
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 27890a5e2d82..eacee6f41f9c 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -44,7 +44,6 @@ struct device;
 struct intel_gvt_mpt {
 	int (*host_init)(struct device *dev, void *gvt);
 	void (*host_exit)(struct device *dev, void *gvt);
-	int (*attach_vgpu)(void *vgpu, unsigned long *handle);
 	void (*detach_vgpu)(void *vgpu);
 	int (*inject_msi)(unsigned long handle, u32 addr, u16 data);
 	int (*enable_page_track)(unsigned long handle, u64 gfn);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index d1f3f1253306..bb536463a499 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -108,37 +108,6 @@ struct gvt_dma {
 	struct kref ref;
 };
 
-struct kvmgt_vdev {
-	struct intel_vgpu *vgpu;
-	struct mdev_device *mdev;
-	struct vfio_region *region;
-	int num_regions;
-	struct eventfd_ctx *intx_trigger;
-	struct eventfd_ctx *msi_trigger;
-
-	/*
-	 * Two caches are used to avoid mapping duplicated pages (eg.
-	 * scratch pages). This help to reduce dma setup overhead.
-	 */
-	struct rb_root gfn_cache;
-	struct rb_root dma_addr_cache;
-	unsigned long nr_cache_entries;
-	struct mutex cache_lock;
-
-	struct notifier_block iommu_notifier;
-	struct notifier_block group_notifier;
-	struct kvm *kvm;
-	struct work_struct release_work;
-	atomic_t released;
-	struct vfio_device *vfio_device;
-	struct vfio_group *vfio_group;
-};
-
-static inline struct kvmgt_vdev *kvmgt_vdev(struct intel_vgpu *vgpu)
-{
-	return intel_vgpu_vdev(vgpu);
-}
-
 static inline bool handle_valid(unsigned long handle)
 {
 	return !!(handle & ~0xff);
@@ -250,7 +219,6 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	int total_pages;
 	int npage;
 	int ret;
@@ -260,7 +228,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
-		ret = vfio_group_unpin_pages(vdev->vfio_group, &cur_gfn, 1);
+		ret = vfio_group_unpin_pages(vgpu->vfio_group, &cur_gfn, 1);
 		drm_WARN_ON(&i915->drm, ret != 1);
 	}
 }
@@ -269,7 +237,6 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, struct page **page)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long base_pfn = 0;
 	int total_pages;
 	int npage;
@@ -284,7 +251,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 		unsigned long pfn;
 
-		ret = vfio_group_pin_pages(vdev->vfio_group, &cur_gfn, 1,
+		ret = vfio_group_pin_pages(vgpu->vfio_group, &cur_gfn, 1,
 					   IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
@@ -351,7 +318,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
 		dma_addr_t dma_addr)
 {
-	struct rb_node *node = kvmgt_vdev(vgpu)->dma_addr_cache.rb_node;
+	struct rb_node *node = vgpu->dma_addr_cache.rb_node;
 	struct gvt_dma *itr;
 
 	while (node) {
@@ -369,7 +336,7 @@ static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
 
 static struct gvt_dma *__gvt_cache_find_gfn(struct intel_vgpu *vgpu, gfn_t gfn)
 {
-	struct rb_node *node = kvmgt_vdev(vgpu)->gfn_cache.rb_node;
+	struct rb_node *node = vgpu->gfn_cache.rb_node;
 	struct gvt_dma *itr;
 
 	while (node) {
@@ -390,7 +357,6 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 {
 	struct gvt_dma *new, *itr;
 	struct rb_node **link, *parent = NULL;
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
 	new = kzalloc(sizeof(struct gvt_dma), GFP_KERNEL);
 	if (!new)
@@ -403,7 +369,7 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 	kref_init(&new->ref);
 
 	/* gfn_cache maps gfn to struct gvt_dma. */
-	link = &vdev->gfn_cache.rb_node;
+	link = &vgpu->gfn_cache.rb_node;
 	while (*link) {
 		parent = *link;
 		itr = rb_entry(parent, struct gvt_dma, gfn_node);
@@ -414,11 +380,11 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 			link = &parent->rb_right;
 	}
 	rb_link_node(&new->gfn_node, parent, link);
-	rb_insert_color(&new->gfn_node, &vdev->gfn_cache);
+	rb_insert_color(&new->gfn_node, &vgpu->gfn_cache);
 
 	/* dma_addr_cache maps dma addr to struct gvt_dma. */
 	parent = NULL;
-	link = &vdev->dma_addr_cache.rb_node;
+	link = &vgpu->dma_addr_cache.rb_node;
 	while (*link) {
 		parent = *link;
 		itr = rb_entry(parent, struct gvt_dma, dma_addr_node);
@@ -429,51 +395,46 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 			link = &parent->rb_right;
 	}
 	rb_link_node(&new->dma_addr_node, parent, link);
-	rb_insert_color(&new->dma_addr_node, &vdev->dma_addr_cache);
+	rb_insert_color(&new->dma_addr_node, &vgpu->dma_addr_cache);
 
-	vdev->nr_cache_entries++;
+	vgpu->nr_cache_entries++;
 	return 0;
 }
 
 static void __gvt_cache_remove_entry(struct intel_vgpu *vgpu,
 				struct gvt_dma *entry)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
-
-	rb_erase(&entry->gfn_node, &vdev->gfn_cache);
-	rb_erase(&entry->dma_addr_node, &vdev->dma_addr_cache);
+	rb_erase(&entry->gfn_node, &vgpu->gfn_cache);
+	rb_erase(&entry->dma_addr_node, &vgpu->dma_addr_cache);
 	kfree(entry);
-	vdev->nr_cache_entries--;
+	vgpu->nr_cache_entries--;
 }
 
 static void gvt_cache_destroy(struct intel_vgpu *vgpu)
 {
 	struct gvt_dma *dma;
 	struct rb_node *node = NULL;
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
 	for (;;) {
-		mutex_lock(&vdev->cache_lock);
-		node = rb_first(&vdev->gfn_cache);
+		mutex_lock(&vgpu->cache_lock);
+		node = rb_first(&vgpu->gfn_cache);
 		if (!node) {
-			mutex_unlock(&vdev->cache_lock);
+			mutex_unlock(&vgpu->cache_lock);
 			break;
 		}
 		dma = rb_entry(node, struct gvt_dma, gfn_node);
 		gvt_dma_unmap_page(vgpu, dma->gfn, dma->dma_addr, dma->size);
 		__gvt_cache_remove_entry(vgpu, dma);
-		mutex_unlock(&vdev->cache_lock);
+		mutex_unlock(&vgpu->cache_lock);
 	}
 }
 
 static void gvt_cache_init(struct intel_vgpu *vgpu)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
-
-	vdev->gfn_cache = RB_ROOT;
-	vdev->dma_addr_cache = RB_ROOT;
-	vdev->nr_cache_entries = 0;
-	mutex_init(&vdev->cache_lock);
+	vgpu->gfn_cache = RB_ROOT;
+	vgpu->dma_addr_cache = RB_ROOT;
+	vgpu->nr_cache_entries = 0;
+	mutex_init(&vgpu->cache_lock);
 }
 
 static void kvmgt_protect_table_init(struct kvmgt_guest_info *info)
@@ -547,18 +508,17 @@ static void kvmgt_protect_table_del(struct kvmgt_guest_info *info,
 static size_t intel_vgpu_reg_rw_opregion(struct intel_vgpu *vgpu, char *buf,
 		size_t count, loff_t *ppos, bool iswrite)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned int i = VFIO_PCI_OFFSET_TO_INDEX(*ppos) -
 			VFIO_PCI_NUM_REGIONS;
-	void *base = vdev->region[i].data;
+	void *base = vgpu->region[i].data;
 	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
 
 
-	if (pos >= vdev->region[i].size || iswrite) {
+	if (pos >= vgpu->region[i].size || iswrite) {
 		gvt_vgpu_err("invalid op or offset for Intel vgpu OpRegion\n");
 		return -EINVAL;
 	}
-	count = min(count, (size_t)(vdev->region[i].size - pos));
+	count = min(count, (size_t)(vgpu->region[i].size - pos));
 	memcpy(buf, base + pos, count);
 
 	return count;
@@ -651,8 +611,7 @@ static size_t intel_vgpu_reg_rw_edid(struct intel_vgpu *vgpu, char *buf,
 	int ret;
 	unsigned int i = VFIO_PCI_OFFSET_TO_INDEX(*ppos) -
 			VFIO_PCI_NUM_REGIONS;
-	struct vfio_edid_region *region =
-		(struct vfio_edid_region *)kvmgt_vdev(vgpu)->region[i].data;
+	struct vfio_edid_region *region = vgpu->region[i].data;
 	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
 
 	if (pos < region->vfio_edid_regs.edid_offset) {
@@ -684,34 +643,32 @@ static int intel_vgpu_register_reg(struct intel_vgpu *vgpu,
 		const struct intel_vgpu_regops *ops,
 		size_t size, u32 flags, void *data)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	struct vfio_region *region;
 
-	region = krealloc(vdev->region,
-			(vdev->num_regions + 1) * sizeof(*region),
+	region = krealloc(vgpu->region,
+			(vgpu->num_regions + 1) * sizeof(*region),
 			GFP_KERNEL);
 	if (!region)
 		return -ENOMEM;
 
-	vdev->region = region;
-	vdev->region[vdev->num_regions].type = type;
-	vdev->region[vdev->num_regions].subtype = subtype;
-	vdev->region[vdev->num_regions].ops = ops;
-	vdev->region[vdev->num_regions].size = size;
-	vdev->region[vdev->num_regions].flags = flags;
-	vdev->region[vdev->num_regions].data = data;
-	vdev->num_regions++;
+	vgpu->region = region;
+	vgpu->region[vgpu->num_regions].type = type;
+	vgpu->region[vgpu->num_regions].subtype = subtype;
+	vgpu->region[vgpu->num_regions].ops = ops;
+	vgpu->region[vgpu->num_regions].size = size;
+	vgpu->region[vgpu->num_regions].flags = flags;
+	vgpu->region[vgpu->num_regions].data = data;
+	vgpu->num_regions++;
 	return 0;
 }
 
 static int kvmgt_get_vfio_device(void *p_vgpu)
 {
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
-	vdev->vfio_device = vfio_device_get_from_dev(
-		mdev_dev(vdev->mdev));
-	if (!vdev->vfio_device) {
+	vgpu->vfio_device = vfio_device_get_from_dev(
+		mdev_dev(vgpu->mdev));
+	if (!vgpu->vfio_device) {
 		gvt_vgpu_err("failed to get vfio device\n");
 		return -ENODEV;
 	}
@@ -777,14 +734,14 @@ static int kvmgt_set_edid(void *p_vgpu, int port_num)
 	return ret;
 }
 
-static void kvmgt_put_vfio_device(void *vgpu)
+static void kvmgt_put_vfio_device(void *data)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev((struct intel_vgpu *)vgpu);
+	struct intel_vgpu *vgpu = data;
 
-	if (WARN_ON(!vdev->vfio_device))
+	if (WARN_ON(!vgpu->vfio_device))
 		return;
 
-	vfio_device_put(vdev->vfio_device);
+	vfio_device_put(vgpu->vfio_device);
 }
 
 static int intel_vgpu_create(struct mdev_device *mdev)
@@ -811,9 +768,9 @@ static int intel_vgpu_create(struct mdev_device *mdev)
 		goto out;
 	}
 
-	INIT_WORK(&kvmgt_vdev(vgpu)->release_work, intel_vgpu_release_work);
+	INIT_WORK(&vgpu->release_work, intel_vgpu_release_work);
 
-	kvmgt_vdev(vgpu)->mdev = mdev;
+	vgpu->mdev = mdev;
 	mdev_set_drvdata(mdev, vgpu);
 
 	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
@@ -838,10 +795,8 @@ static int intel_vgpu_remove(struct mdev_device *mdev)
 static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
-	struct kvmgt_vdev *vdev = container_of(nb,
-					       struct kvmgt_vdev,
-					       iommu_notifier);
-	struct intel_vgpu *vgpu = vdev->vgpu;
+	struct intel_vgpu *vgpu =
+		container_of(nb, struct intel_vgpu, iommu_notifier);
 
 	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
 		struct vfio_iommu_type1_dma_unmap *unmap = data;
@@ -851,7 +806,7 @@ static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 		iov_pfn = unmap->iova >> PAGE_SHIFT;
 		end_iov_pfn = iov_pfn + unmap->size / PAGE_SIZE;
 
-		mutex_lock(&vdev->cache_lock);
+		mutex_lock(&vgpu->cache_lock);
 		for (; iov_pfn < end_iov_pfn; iov_pfn++) {
 			entry = __gvt_cache_find_gfn(vgpu, iov_pfn);
 			if (!entry)
@@ -861,7 +816,7 @@ static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 					   entry->size);
 			__gvt_cache_remove_entry(vgpu, entry);
 		}
-		mutex_unlock(&vdev->cache_lock);
+		mutex_unlock(&vgpu->cache_lock);
 	}
 
 	return NOTIFY_OK;
@@ -870,16 +825,15 @@ static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 static int intel_vgpu_group_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
-	struct kvmgt_vdev *vdev = container_of(nb,
-					       struct kvmgt_vdev,
-					       group_notifier);
+	struct intel_vgpu *vgpu =
+		container_of(nb, struct intel_vgpu, group_notifier);
 
 	/* the only action we care about */
 	if (action == VFIO_GROUP_NOTIFY_SET_KVM) {
-		vdev->kvm = data;
+		vgpu->kvm = data;
 
 		if (!data)
-			schedule_work(&vdev->release_work);
+			schedule_work(&vgpu->release_work);
 	}
 
 	return NOTIFY_OK;
@@ -888,17 +842,16 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
 static int intel_vgpu_open(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long events;
 	int ret;
 	struct vfio_group *vfio_group;
 
-	vdev->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
-	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
+	vgpu->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
+	vgpu->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
 	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY, &events,
-				&vdev->iommu_notifier);
+				&vgpu->iommu_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
 			ret);
@@ -907,7 +860,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
 	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
-				&vdev->group_notifier);
+				&vgpu->group_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
 			ret);
@@ -920,7 +873,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
 		goto undo_register;
 	}
-	vdev->vfio_group = vfio_group;
+	vgpu->vfio_group = vfio_group;
 
 	/* Take a module reference as mdev core doesn't take
 	 * a reference for vendor driver.
@@ -936,39 +889,37 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 
 	intel_gvt_activate_vgpu(vgpu);
 
-	atomic_set(&vdev->released, 0);
+	atomic_set(&vgpu->released, 0);
 	return ret;
 
 undo_group:
-	vfio_group_put_external_user(vdev->vfio_group);
-	vdev->vfio_group = NULL;
+	vfio_group_put_external_user(vgpu->vfio_group);
+	vgpu->vfio_group = NULL;
 
 undo_register:
 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
-					&vdev->group_notifier);
+					&vgpu->group_notifier);
 
 undo_iommu:
 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
-					&vdev->iommu_notifier);
+					&vgpu->iommu_notifier);
 out:
 	return ret;
 }
 
 static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	struct eventfd_ctx *trigger;
 
-	trigger = vdev->msi_trigger;
+	trigger = vgpu->msi_trigger;
 	if (trigger) {
 		eventfd_ctx_put(trigger);
-		vdev->msi_trigger = NULL;
+		vgpu->msi_trigger = NULL;
 	}
 }
 
 static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 {
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	struct kvmgt_guest_info *info;
 	int ret;
@@ -976,18 +927,18 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	if (!handle_valid(vgpu->handle))
 		return;
 
-	if (atomic_cmpxchg(&vdev->released, 0, 1))
+	if (atomic_cmpxchg(&vgpu->released, 0, 1))
 		return;
 
 	intel_gvt_release_vgpu(vgpu);
 
-	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_IOMMU_NOTIFY,
-					&vdev->iommu_notifier);
+	ret = vfio_unregister_notifier(mdev_dev(vgpu->mdev), VFIO_IOMMU_NOTIFY,
+					&vgpu->iommu_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
-	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_GROUP_NOTIFY,
-					&vdev->group_notifier);
+	ret = vfio_unregister_notifier(mdev_dev(vgpu->mdev), VFIO_GROUP_NOTIFY,
+					&vgpu->group_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for group failed: %d\n", ret);
 
@@ -998,9 +949,9 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	kvmgt_guest_exit(info);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
-	vfio_group_put_external_user(vdev->vfio_group);
+	vfio_group_put_external_user(vgpu->vfio_group);
 
-	vdev->kvm = NULL;
+	vgpu->kvm = NULL;
 	vgpu->handle = 0;
 }
 
@@ -1013,10 +964,10 @@ static void intel_vgpu_release(struct mdev_device *mdev)
 
 static void intel_vgpu_release_work(struct work_struct *work)
 {
-	struct kvmgt_vdev *vdev = container_of(work, struct kvmgt_vdev,
-					       release_work);
+	struct intel_vgpu *vgpu =
+		container_of(work, struct intel_vgpu, release_work);
 
-	__intel_vgpu_release(vdev->vgpu);
+	__intel_vgpu_release(vgpu);
 }
 
 static u64 intel_vgpu_get_bar_addr(struct intel_vgpu *vgpu, int bar)
@@ -1098,13 +1049,12 @@ static ssize_t intel_vgpu_rw(struct mdev_device *mdev, char *buf,
 			size_t count, loff_t *ppos, bool is_write)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
 	u64 pos = *ppos & VFIO_PCI_OFFSET_MASK;
 	int ret = -EINVAL;
 
 
-	if (index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions) {
+	if (index >= VFIO_PCI_NUM_REGIONS + vgpu->num_regions) {
 		gvt_vgpu_err("invalid index: %u\n", index);
 		return -EINVAL;
 	}
@@ -1133,11 +1083,11 @@ static ssize_t intel_vgpu_rw(struct mdev_device *mdev, char *buf,
 	case VFIO_PCI_ROM_REGION_INDEX:
 		break;
 	default:
-		if (index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
+		if (index >= VFIO_PCI_NUM_REGIONS + vgpu->num_regions)
 			return -EINVAL;
 
 		index -= VFIO_PCI_NUM_REGIONS;
-		return vdev->region[index].ops->rw(vgpu, buf, count,
+		return vgpu->region[index].ops->rw(vgpu, buf, count,
 				ppos, is_write);
 	}
 
@@ -1390,7 +1340,7 @@ static int intel_vgpu_set_msi_trigger(struct intel_vgpu *vgpu,
 			gvt_vgpu_err("eventfd_ctx_fdget failed\n");
 			return PTR_ERR(trigger);
 		}
-		kvmgt_vdev(vgpu)->msi_trigger = trigger;
+		vgpu->msi_trigger = trigger;
 	} else if ((flags & VFIO_IRQ_SET_DATA_NONE) && !count)
 		intel_vgpu_release_msi_eventfd_ctx(vgpu);
 
@@ -1442,7 +1392,6 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 			     unsigned long arg)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long minsz;
 
 	gvt_dbg_core("vgpu%d ioctl, cmd: %d\n", vgpu->id, cmd);
@@ -1461,7 +1410,7 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 		info.flags = VFIO_DEVICE_FLAGS_PCI;
 		info.flags |= VFIO_DEVICE_FLAGS_RESET;
 		info.num_regions = VFIO_PCI_NUM_REGIONS +
-				vdev->num_regions;
+				vgpu->num_regions;
 		info.num_irqs = VFIO_PCI_NUM_IRQS;
 
 		return copy_to_user((void __user *)arg, &info, minsz) ?
@@ -1552,22 +1501,22 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 					.header.version = 1 };
 
 				if (info.index >= VFIO_PCI_NUM_REGIONS +
-						vdev->num_regions)
+						vgpu->num_regions)
 					return -EINVAL;
 				info.index =
 					array_index_nospec(info.index,
 							VFIO_PCI_NUM_REGIONS +
-							vdev->num_regions);
+							vgpu->num_regions);
 
 				i = info.index - VFIO_PCI_NUM_REGIONS;
 
 				info.offset =
 					VFIO_PCI_INDEX_TO_OFFSET(info.index);
-				info.size = vdev->region[i].size;
-				info.flags = vdev->region[i].flags;
+				info.size = vgpu->region[i].size;
+				info.flags = vgpu->region[i].flags;
 
-				cap_type.type = vdev->region[i].type;
-				cap_type.subtype = vdev->region[i].subtype;
+				cap_type.type = vgpu->region[i].type;
+				cap_type.subtype = vgpu->region[i].subtype;
 
 				ret = vfio_info_add_capability(&caps,
 							&cap_type.header,
@@ -1909,15 +1858,13 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 {
 	struct kvmgt_guest_info *info;
 	struct intel_vgpu *vgpu;
-	struct kvmgt_vdev *vdev;
 	struct kvm *kvm;
 
 	vgpu = mdev_get_drvdata(mdev);
 	if (handle_valid(vgpu->handle))
 		return -EEXIST;
 
-	vdev = kvmgt_vdev(vgpu);
-	kvm = vdev->kvm;
+	kvm = vgpu->kvm;
 	if (!kvm || kvm->mm != current->mm) {
 		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
 		return -ESRCH;
@@ -1943,7 +1890,7 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	kvm_page_track_register_notifier(kvm, &info->track_node);
 
 	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
-			     &vdev->nr_cache_entries);
+			     &vgpu->nr_cache_entries);
 	return 0;
 }
 
@@ -1961,52 +1908,33 @@ static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
 	return true;
 }
 
-static int kvmgt_attach_vgpu(void *p_vgpu, unsigned long *handle)
-{
-	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
-
-	vgpu->vdev = kzalloc(sizeof(struct kvmgt_vdev), GFP_KERNEL);
-
-	if (!vgpu->vdev)
-		return -ENOMEM;
-
-	kvmgt_vdev(vgpu)->vgpu = vgpu;
-
-	return 0;
-}
-
 static void kvmgt_detach_vgpu(void *p_vgpu)
 {
 	int i;
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
-	if (!vdev->region)
+	if (!vgpu->region)
 		return;
 
-	for (i = 0; i < vdev->num_regions; i++)
-		if (vdev->region[i].ops->release)
-			vdev->region[i].ops->release(vgpu,
-					&vdev->region[i]);
-	vdev->num_regions = 0;
-	kfree(vdev->region);
-	vdev->region = NULL;
-
-	kfree(vdev);
+	for (i = 0; i < vgpu->num_regions; i++)
+		if (vgpu->region[i].ops->release)
+			vgpu->region[i].ops->release(vgpu,
+					&vgpu->region[i]);
+	vgpu->num_regions = 0;
+	kfree(vgpu->region);
+	vgpu->region = NULL;
 }
 
 static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
 {
 	struct kvmgt_guest_info *info;
 	struct intel_vgpu *vgpu;
-	struct kvmgt_vdev *vdev;
 
 	if (!handle_valid(handle))
 		return -ESRCH;
 
 	info = (struct kvmgt_guest_info *)handle;
 	vgpu = info->vgpu;
-	vdev = kvmgt_vdev(vgpu);
 
 	/*
 	 * When guest is poweroff, msi_trigger is set to NULL, but vgpu's
@@ -2017,10 +1945,10 @@ static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
 	 * enabled by guest. so if msi_trigger is null, success is still
 	 * returned and don't inject interrupt into guest.
 	 */
-	if (vdev->msi_trigger == NULL)
+	if (vgpu->msi_trigger == NULL)
 		return 0;
 
-	if (eventfd_signal(vdev->msi_trigger, 1) == 1)
+	if (eventfd_signal(vgpu->msi_trigger, 1) == 1)
 		return 0;
 
 	return -EFAULT;
@@ -2047,7 +1975,6 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 		unsigned long size, dma_addr_t *dma_addr)
 {
 	struct intel_vgpu *vgpu;
-	struct kvmgt_vdev *vdev;
 	struct gvt_dma *entry;
 	int ret;
 
@@ -2055,9 +1982,8 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 		return -EINVAL;
 
 	vgpu = ((struct kvmgt_guest_info *)handle)->vgpu;
-	vdev = kvmgt_vdev(vgpu);
 
-	mutex_lock(&vdev->cache_lock);
+	mutex_lock(&vgpu->cache_lock);
 
 	entry = __gvt_cache_find_gfn(vgpu, gfn);
 	if (!entry) {
@@ -2085,20 +2011,19 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 		*dma_addr = entry->dma_addr;
 	}
 
-	mutex_unlock(&vdev->cache_lock);
+	mutex_unlock(&vgpu->cache_lock);
 	return 0;
 
 err_unmap:
 	gvt_dma_unmap_page(vgpu, gfn, *dma_addr, size);
 err_unlock:
-	mutex_unlock(&vdev->cache_lock);
+	mutex_unlock(&vgpu->cache_lock);
 	return ret;
 }
 
 static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma_addr)
 {
 	struct kvmgt_guest_info *info;
-	struct kvmgt_vdev *vdev;
 	struct gvt_dma *entry;
 	int ret = 0;
 
@@ -2106,15 +2031,14 @@ static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma_addr)
 		return -ENODEV;
 
 	info = (struct kvmgt_guest_info *)handle;
-	vdev = kvmgt_vdev(info->vgpu);
 
-	mutex_lock(&vdev->cache_lock);
+	mutex_lock(&info->vgpu->cache_lock);
 	entry = __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
 	if (entry)
 		kref_get(&entry->ref);
 	else
 		ret = -ENOMEM;
-	mutex_unlock(&vdev->cache_lock);
+	mutex_unlock(&info->vgpu->cache_lock);
 
 	return ret;
 }
@@ -2131,20 +2055,18 @@ static void __gvt_dma_release(struct kref *ref)
 static void kvmgt_dma_unmap_guest_page(unsigned long handle, dma_addr_t dma_addr)
 {
 	struct intel_vgpu *vgpu;
-	struct kvmgt_vdev *vdev;
 	struct gvt_dma *entry;
 
 	if (!handle_valid(handle))
 		return;
 
 	vgpu = ((struct kvmgt_guest_info *)handle)->vgpu;
-	vdev = kvmgt_vdev(vgpu);
 
-	mutex_lock(&vdev->cache_lock);
+	mutex_lock(&vgpu->cache_lock);
 	entry = __gvt_cache_find_dma_addr(vgpu, dma_addr);
 	if (entry)
 		kref_put(&entry->ref, __gvt_dma_release);
-	mutex_unlock(&vdev->cache_lock);
+	mutex_unlock(&vgpu->cache_lock);
 }
 
 static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
@@ -2157,8 +2079,7 @@ static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
 
 	info = (struct kvmgt_guest_info *)handle;
 
-	return vfio_dma_rw(kvmgt_vdev(info->vgpu)->vfio_group,
-			   gpa, buf, len, write);
+	return vfio_dma_rw(info->vgpu->vfio_group, gpa, buf, len, write);
 }
 
 static int kvmgt_read_gpa(unsigned long handle, unsigned long gpa,
@@ -2196,7 +2117,6 @@ static bool kvmgt_is_valid_gfn(unsigned long handle, unsigned long gfn)
 static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
-	.attach_vgpu = kvmgt_attach_vgpu,
 	.detach_vgpu = kvmgt_detach_vgpu,
 	.inject_msi = kvmgt_inject_msi,
 	.enable_page_track = kvmgt_page_track_add,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 6d062cf71de9..8a659301d78b 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -71,22 +71,6 @@ static inline void intel_gvt_hypervisor_host_exit(struct device *dev, void *gvt)
 	intel_gvt_host.mpt->host_exit(dev, gvt);
 }
 
-/**
- * intel_gvt_hypervisor_attach_vgpu - call hypervisor to initialize vGPU
- * related stuffs inside hypervisor.
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_attach_vgpu(struct intel_vgpu *vgpu)
-{
-	/* optional to provide */
-	if (!intel_gvt_host.mpt->attach_vgpu)
-		return 0;
-
-	return intel_gvt_host.mpt->attach_vgpu(vgpu, &vgpu->handle);
-}
-
 /**
  * intel_gvt_hypervisor_detach_vgpu - call hypervisor to release vGPU
  * related stuffs inside hypervisor.
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index fa6b92615799..7b9a571c0dc9 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -405,13 +405,9 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 
 	populate_pvinfo_page(vgpu);
 
-	ret = intel_gvt_hypervisor_attach_vgpu(vgpu);
-	if (ret)
-		goto out_clean_vgpu_resource;
-
 	ret = intel_vgpu_init_gtt(vgpu);
 	if (ret)
-		goto out_detach_hypervisor_vgpu;
+		goto out_clean_vgpu_resource;
 
 	ret = intel_vgpu_init_opregion(vgpu);
 	if (ret)
@@ -454,8 +450,6 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	intel_vgpu_clean_opregion(vgpu);
 out_clean_gtt:
 	intel_vgpu_clean_gtt(vgpu);
-out_detach_hypervisor_vgpu:
-	intel_gvt_hypervisor_detach_vgpu(vgpu);
 out_clean_vgpu_resource:
 	intel_vgpu_free_resource(vgpu);
 out_clean_vgpu_mmio:
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
