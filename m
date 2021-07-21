Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C093D1325
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 18:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AFD6E9A5;
	Wed, 21 Jul 2021 16:00:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4281E6E88A;
 Wed, 21 Jul 2021 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=82dEs+QK8clDq3Pt2lMrAAeDCJqiHd3ZB8Jdeya5Gvc=; b=sRwZtN5JPOtgbYSaT+IxrmHdoA
 3G1b1SSk+OKQAm5SYA0QWnWIl6aSQImQamHngl4lXKRv4l+YS29GRqapmf5OzJ9kvzc1N+kBWUS0z
 s58Mq8IP3DCfd+jPNcqGjUrY7A2ACC+p/TSDWi23SwQUcKsgYs2L9dQ6HuS1cU9Vqgr0h1Lew/Uoy
 IDn2MinUJO/TJ1le955+OW1zlWYz9bzHhhr4IiU/eRM6fxxYJVjwBd+jVD+MrEacS9LleuXCnLQEr
 XjZ+7HoUneOWQF4hr70YyKP82SDU1DxpYF0PS6eiQfZsAcmRZIaeM/6E4q/nXoO/f3YO5YtXurG5E
 yk1hJwPA==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Edp-009MeG-Bh; Wed, 21 Jul 2021 16:00:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 17/21] drm/i915/gvt: devirtualize ->gfn_to_mfn
Date: Wed, 21 Jul 2021 17:53:51 +0200
Message-Id: <20210721155355.173183-18-hch@lst.de>
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

Just open code it in the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gtt.c       |  9 +++++----
 drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 16 ----------------
 drivers/gpu/drm/i915/gvt/mpt.h       | 14 --------------
 4 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 5783642d4d79..75782f59df8e 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1176,15 +1176,16 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	struct intel_gvt_gtt_entry *entry)
 {
 	struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
-	unsigned long pfn;
+	kvm_pfn_t pfn;
 
 	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
 		return 0;
 
-	pfn = intel_gvt_hypervisor_gfn_to_mfn(vgpu, ops->get_pfn(entry));
-	if (pfn == INTEL_GVT_INVALID_ADDR)
+	if (!vgpu->attached)
+		return -EINVAL;
+	pfn = gfn_to_pfn(vgpu->kvm, ops->get_pfn(entry));
+	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
-
 	return PageTransHuge(pfn_to_page(pfn));
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index c1a9eeed0460..dbde492cafc8 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -47,7 +47,6 @@ struct intel_gvt_mpt {
 	void (*host_exit)(struct device *dev, void *gvt);
 	int (*enable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
 	int (*disable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
-	unsigned long (*gfn_to_mfn)(struct intel_vgpu *vgpu, unsigned long gfn);
 
 	int (*dma_map_guest_page)(struct intel_vgpu *vgpu, unsigned long gfn,
 				  unsigned long size, dma_addr_t *dma_addr);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 2d3ef59e7227..226e3f3c41df 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1855,21 +1855,6 @@ void intel_vgpu_detach_regions(struct intel_vgpu *vgpu)
 	vgpu->region = NULL;
 }
 
-static unsigned long kvmgt_gfn_to_pfn(struct intel_vgpu *vgpu,
-		unsigned long gfn)
-{
-	kvm_pfn_t pfn;
-
-	if (!vgpu->attached)
-		return INTEL_GVT_INVALID_ADDR;
-
-	pfn = gfn_to_pfn(vgpu->kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return INTEL_GVT_INVALID_ADDR;
-
-	return pfn;
-}
-
 static int kvmgt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, dma_addr_t *dma_addr)
 {
@@ -1966,7 +1951,6 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_exit = kvmgt_host_exit,
 	.enable_page_track = kvmgt_page_track_add,
 	.disable_page_track = kvmgt_page_track_remove,
-	.gfn_to_mfn = kvmgt_gfn_to_pfn,
 	.dma_map_guest_page = kvmgt_dma_map_guest_page,
 	.dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
 	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 1a796f2181ba..2d4bb6eaa08e 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -99,20 +99,6 @@ static inline int intel_gvt_hypervisor_disable_page_track(
 	return intel_gvt_host.mpt->disable_page_track(vgpu, gfn);
 }
 
-/**
- * intel_gvt_hypervisor_gfn_to_mfn - translate a GFN to MFN
- * @vgpu: a vGPU
- * @gpfn: guest pfn
- *
- * Returns:
- * MFN on success, INTEL_GVT_INVALID_ADDR if failed.
- */
-static inline unsigned long intel_gvt_hypervisor_gfn_to_mfn(
-		struct intel_vgpu *vgpu, unsigned long gfn)
-{
-	return intel_gvt_host.mpt->gfn_to_mfn(vgpu, gfn);
-}
-
 /**
  * intel_gvt_hypervisor_dma_map_guest_page - setup dma map for guest page
  * @vgpu: a vGPU
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
