Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB743D132F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 18:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE626E9AB;
	Wed, 21 Jul 2021 16:02:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113B66E97A;
 Wed, 21 Jul 2021 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lR5B78UR75Lds1tTglHXEvMg6ZX4tktWJPr2uN1g4xc=; b=UUoNsbmuTrTqJU8RJ+qHKmA/zW
 ihNxqmgIqe3yDhJdN1O/2RHRj1ey6Ikt4oeQznC5yV0ypO3OGAlEez8fXLLghyGcKxJAAc3OSSPkM
 m2/Hny83fKMEjzFA8orOurLqgtWDAxh4GQKNymiPr+JIElzVP/JPl5Rvki0KKPL1Nq3vvQray4faO
 yKQhgvBOfD1LOv0NJANfjUGf27VYQWnPm+rX781wcAW4RhQEJajHb7uE2rjQK2wc8OVJpHRnLNsL/
 fikRqpSdyUz2FrsgXdAq7N4oIynCJBu5lR78uJ1Fy0bE0+iO0GfMJycGnzHDWGYHYskgt0xCQHC/2
 61D6z1sA==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EfE-009Mkd-Oc; Wed, 21 Jul 2021 16:01:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 20/21] drm/i915/gvt: devirtualize dma_pin_guest_page
Date: Wed, 21 Jul 2021 17:53:54 +0200
Message-Id: <20210721155355.173183-21-hch@lst.de>
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

Just call the function directly and remove a pointless wrapper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c    | 14 +-------------
 drivers/gpu/drm/i915/gvt/gvt.h       |  1 +
 drivers/gpu/drm/i915/gvt/hypercall.h |  2 --
 drivers/gpu/drm/i915/gvt/kvmgt.c     |  4 +---
 drivers/gpu/drm/i915/gvt/mpt.h       | 15 ---------------
 5 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 03d82f4f9aa2..eacfe7beaaf6 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -36,18 +36,6 @@
 
 #define GEN8_DECODE_PTE(pte) (pte & GENMASK_ULL(63, 12))
 
-static int vgpu_pin_dma_address(struct intel_vgpu *vgpu,
-				unsigned long size,
-				dma_addr_t dma_addr)
-{
-	int ret = 0;
-
-	if (intel_gvt_hypervisor_dma_pin_guest_page(vgpu, dma_addr))
-		ret = -EINVAL;
-
-	return ret;
-}
-
 static int vgpu_gem_get_pages(
 		struct drm_i915_gem_object *obj)
 {
@@ -83,7 +71,7 @@ static int vgpu_gem_get_pages(
 	for_each_sg(st->sgl, sg, page_num, i) {
 		dma_addr_t dma_addr =
 			GEN8_DECODE_PTE(readq(&gtt_entries[i]));
-		if (vgpu_pin_dma_address(vgpu, PAGE_SIZE, dma_addr)) {
+		if (intel_gvt_dma_pin_guest_page(vgpu, dma_addr)) {
 			ret = -EINVAL;
 			goto out;
 		}
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 9d5a286e1269..a8fc381f558e 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -766,6 +766,7 @@ void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
 int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn);
 int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn);
+int intel_gvt_dma_pin_guest_page(struct intel_vgpu *vgpu, dma_addr_t dma_addr);
 int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, dma_addr_t *dma_addr);
 void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index ba03b3368a95..d49437aeabac 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -45,8 +45,6 @@ struct intel_vgpu;
 struct intel_gvt_mpt {
 	int (*host_init)(struct device *dev, void *gvt);
 	void (*host_exit)(struct device *dev, void *gvt);
-
-	int (*dma_pin_guest_page)(struct intel_vgpu *vgpu, dma_addr_t dma_addr);
 };
 
 #endif /* _GVT_HYPERCALL_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 8101c1485f12..5f10ed5eccde 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1902,8 +1902,7 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	return ret;
 }
 
-static int kvmgt_dma_pin_guest_page(struct intel_vgpu *vgpu,
-		dma_addr_t dma_addr)
+int intel_gvt_dma_pin_guest_page(struct intel_vgpu *vgpu, dma_addr_t dma_addr)
 {
 	struct gvt_dma *entry;
 	int ret = 0;
@@ -1949,7 +1948,6 @@ void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
-	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
 };
 
 struct intel_gvt_host intel_gvt_host = {
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 26c1ee690f7e..3be602a3f764 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -71,19 +71,4 @@ static inline void intel_gvt_hypervisor_host_exit(struct device *dev, void *gvt)
 	intel_gvt_host.mpt->host_exit(dev, gvt);
 }
 
-/**
- * intel_gvt_hypervisor_dma_pin_guest_page - pin guest dma buf
- * @vgpu: a vGPU
- * @dma_addr: guest dma addr
- *
- * Returns:
- * 0 on success, negative error code if failed.
- */
-static inline int
-intel_gvt_hypervisor_dma_pin_guest_page(struct intel_vgpu *vgpu,
-					dma_addr_t dma_addr)
-{
-	return intel_gvt_host.mpt->dma_pin_guest_page(vgpu, dma_addr);
-}
-
 #endif /* _GVT_MPT_H_ */
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
