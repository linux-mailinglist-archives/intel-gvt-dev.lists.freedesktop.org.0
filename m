Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A5211C5E6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Dec 2019 07:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0536EC5E;
	Thu, 12 Dec 2019 06:21:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2019 06:21:25 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5E16EC5E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Dec 2019 06:21:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 22:14:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,304,1571727600"; d="scan'208";a="245580879"
Received: from gvt-optiplex-7060.bj.intel.com ([10.238.158.89])
 by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2019 22:14:16 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH v2] drm/i915/gvt: Pin vgpu dma address before using
Date: Thu, 12 Dec 2019 22:13:42 +0800
Message-Id: <20191212141342.3417-1-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dma-buf display uses the vgpu dma address saved in the guest part GGTT
table which is updated by vCPU thread. In host side, when the dma
address is used by qemu ui thread, gvt-g must make sure the dma address
is validated before letting it go to the HW. Invalid guest dma address
will easily cause DMA fault and make GPU hang.

v2: Rebase

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c    | 62 ++++++++++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/hypercall.h |  2 +
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 23 +++++++++++
 drivers/gpu/drm/i915/gvt/mpt.h       | 14 +++++++
 4 files changed, 97 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index e451298d11c3..9836ce6119a8 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -36,13 +36,31 @@
 
 #define GEN8_DECODE_PTE(pte) (pte & GENMASK_ULL(63, 12))
 
+static int vgpu_pin_dma_address(struct intel_vgpu *vgpu, unsigned long size,
+		dma_addr_t dma_addr)
+{
+	int ret = 0;
+
+	if (intel_gvt_hypervisor_dma_pin_guest_page(vgpu, dma_addr))
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static void vgpu_unpin_dma_address(struct intel_vgpu *vgpu,
+				  dma_addr_t dma_addr)
+{
+	intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, dma_addr);
+}
+
 static int vgpu_gem_get_pages(
 		struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct intel_vgpu *vgpu;
 	struct sg_table *st;
 	struct scatterlist *sg;
-	int i, ret;
+	int i, j, ret;
 	gen8_pte_t __iomem *gtt_entries;
 	struct intel_vgpu_fb_info *fb_info;
 	u32 page_num;
@@ -51,6 +69,10 @@ static int vgpu_gem_get_pages(
 	if (WARN_ON(!fb_info))
 		return -ENODEV;
 
+	vgpu = fb_info->obj->vgpu;
+	if (WARN_ON(!vgpu))
+		return -ENODEV;
+
 	st = kmalloc(sizeof(*st), GFP_KERNEL);
 	if (unlikely(!st))
 		return -ENOMEM;
@@ -64,21 +86,53 @@ static int vgpu_gem_get_pages(
 	gtt_entries = (gen8_pte_t __iomem *)dev_priv->ggtt.gsm +
 		(fb_info->start >> PAGE_SHIFT);
 	for_each_sg(st->sgl, sg, page_num, i) {
+		dma_addr_t dma_addr =
+			GEN8_DECODE_PTE(readq(&gtt_entries[i]));
+		if (vgpu_pin_dma_address(vgpu, PAGE_SIZE, dma_addr)) {
+			ret = -EINVAL;
+			goto out;
+		}
+
 		sg->offset = 0;
 		sg->length = PAGE_SIZE;
-		sg_dma_address(sg) =
-			GEN8_DECODE_PTE(readq(&gtt_entries[i]));
 		sg_dma_len(sg) = PAGE_SIZE;
+		sg_dma_address(sg) = dma_addr;
 	}
 
 	__i915_gem_object_set_pages(obj, st, PAGE_SIZE);
+out:
+	if (ret) {
+		dma_addr_t dma_addr;
+
+		for_each_sg(st->sgl, sg, i, j) {
+			dma_addr = sg_dma_address(sg);
+			if (dma_addr)
+				vgpu_unpin_dma_address(vgpu, dma_addr);
+		}
+		sg_free_table(st);
+		kfree(st);
+	}
+
+	return ret;
 
-	return 0;
 }
 
 static void vgpu_gem_put_pages(struct drm_i915_gem_object *obj,
 		struct sg_table *pages)
 {
+	struct scatterlist *sg;
+
+	if (obj->base.dma_buf) {
+		struct intel_vgpu_fb_info *fb_info = obj->gvt_info;
+		struct intel_vgpu_dmabuf_obj *obj = fb_info->obj;
+		struct intel_vgpu *vgpu = obj->vgpu;
+		int i;
+
+		for_each_sg(pages->sgl, sg, fb_info->size, i)
+			vgpu_unpin_dma_address(vgpu,
+					       sg_dma_address(sg));
+	}
+
 	sg_free_table(pages);
 	kfree(pages);
 }
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 9599c0a762b2..b17c4a1599cd 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -66,6 +66,8 @@ struct intel_gvt_mpt {
 				  unsigned long size, dma_addr_t *dma_addr);
 	void (*dma_unmap_guest_page)(unsigned long handle, dma_addr_t dma_addr);
 
+	int (*dma_pin_guest_page)(unsigned long handle, dma_addr_t dma_addr);
+
 	int (*map_gfn_to_mfn)(unsigned long handle, unsigned long gfn,
 			      unsigned long mfn, unsigned int nr, bool map);
 	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index a699ecade3fc..bd79a9718cc7 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1914,6 +1914,28 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 	return ret;
 }
 
+static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma_addr)
+{
+	struct kvmgt_guest_info *info;
+	struct gvt_dma *entry;
+	int ret = 0;
+
+	if (!handle_valid(handle))
+		return -ENODEV;
+
+	info = (struct kvmgt_guest_info *)handle;
+
+	mutex_lock(&info->vgpu->vdev.cache_lock);
+	entry = __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
+	if (entry)
+		kref_get(&entry->ref);
+	else
+		ret = -ENOMEM;
+	mutex_unlock(&info->vgpu->vdev.cache_lock);
+
+	return ret;
+}
+
 static void __gvt_dma_release(struct kref *ref)
 {
 	struct gvt_dma *entry = container_of(ref, typeof(*entry), ref);
@@ -2025,6 +2047,7 @@ static struct intel_gvt_mpt kvmgt_mpt = {
 	.gfn_to_mfn = kvmgt_gfn_to_pfn,
 	.dma_map_guest_page = kvmgt_dma_map_guest_page,
 	.dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
+	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
 	.set_opregion = kvmgt_set_opregion,
 	.set_edid = kvmgt_set_edid,
 	.get_vfio_device = kvmgt_get_vfio_device,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 0f9440128123..3bc40b0ba4cf 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -254,6 +254,20 @@ static inline void intel_gvt_hypervisor_dma_unmap_guest_page(
 	intel_gvt_host.mpt->dma_unmap_guest_page(vgpu->handle, dma_addr);
 }
 
+/**
+ * intel_gvt_hypervisor_dma_pin_guest_page - pin guest dma buf
+ * @vgpu: a vGPU
+ * @dma_addr: guest dma addr
+ *
+ * Returns:
+ * 0 on success, negative error code if failed.
+ */
+static inline int intel_gvt_hypervisor_dma_pin_guest_page(
+		struct intel_vgpu *vgpu, dma_addr_t dma_addr)
+{
+	return intel_gvt_host.mpt->dma_pin_guest_page(vgpu->handle, dma_addr);
+}
+
 /**
  * intel_gvt_hypervisor_map_gfn_to_mfn - map a GFN region to MFN
  * @vgpu: a vGPU
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
