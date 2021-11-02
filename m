Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B764427BB
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAD16FAC4;
	Tue,  2 Nov 2021 07:08:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C8A6FAB7;
 Tue,  2 Nov 2021 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5VhoCXCpq8u499w+SP3im3pY/KiRy9zV72umr6tL/YA=; b=yLANPYzHtMLlMpqEb7b9ql+tJA
 ng5bwMY3VjItDNR1GyTZbdCYjGkeMP7//geBglwDQB4KVDbOiaWO5p/qIZLEsqdLtpv56MEnu8vsb
 bdgccRyPZyiw8qJUjQy6wy75KZHuefG92QYgNschmSYO1avgCxbvSVbR7Y3/sFy1uodem46loZAGV
 iTAFKii7mch+st1QBKn9oCKYJI36QPRTfsPoKIetbxMiWz0++6gtFS/X+b+oP1y3lGNKbAEK+U+QV
 tBdnjdKc9Pa6UoYwoipN6Mt+gzIJDIJGGgzLS+viUSFmvjurC/+nDTdGzQ2FUHT7lU0VseajATQBZ
 ceDe0s3w==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnu3-000iLb-Ki; Tue, 02 Nov 2021 07:08:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 22/29] drm/i915/gvt: devirtualize dma_pin_guest_page
Date: Tue,  2 Nov 2021 08:05:54 +0100
Message-Id: <20211102070601.155501-23-hch@lst.de>
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
index 03d82f4f9aa2e..eacfe7beaaf67 100644
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
index 727b276a29a21..14dc28d329047 100644
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
index ba03b3368a955..d49437aeabac8 100644
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
index 5a35d40f6afee..c186eaa8d980c 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1903,8 +1903,7 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	return ret;
 }
 
-static int kvmgt_dma_pin_guest_page(struct intel_vgpu *vgpu,
-		dma_addr_t dma_addr)
+int intel_gvt_dma_pin_guest_page(struct intel_vgpu *vgpu, dma_addr_t dma_addr)
 {
 	struct gvt_dma *entry;
 	int ret = 0;
@@ -1950,7 +1949,6 @@ void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
-	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
 };
 
 struct intel_gvt_host intel_gvt_host = {
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 26c1ee690f7e9..3be602a3f764a 100644
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

