Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B394A4427B3
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36CC6FAA7;
	Tue,  2 Nov 2021 07:08:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F3D6FAA7;
 Tue,  2 Nov 2021 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=58CmCULPDLoEGaihAnOOfI5d7mfUyv82hNKcixlvUGo=; b=KGiJPwPdRwbQa4oKdu8nGvtUXy
 eHaYIjr9V6VAus7B2nu857Y+joIwHjZfxgC6FkY7i8qDCNmxgRBr6pWSaxiGZWfJW5DcRWIG0tna3
 eB0NDBYEUO8/PuBSkxKbDq/d9xxk7Zod6zxaC4hoSSy88Dhr+Fo8RCyOLx07N2h56zMVLVFTV19yg
 5VnFkCNs/VItRlll/nasTl37pcmr/JGBfm8AE/19/ZqYk2fLs5JigRNqYWBml7Wq7T0cS1MXx6ieH
 LY5PJpBussDkidb673Otb9wu6qJPSnD1xf4eZS7c7/hSk7NMiwwo+1IwhCMWcHYQMR3x5yUscr4uh
 iBXe8hDg==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhntr-000iK2-Ul; Tue, 02 Nov 2021 07:08:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 20/29] drm/i915/gvt: devirtualize ->{enable,
 disable}_page_track
Date: Tue,  2 Nov 2021 08:05:52 +0100
Message-Id: <20211102070601.155501-21-hch@lst.de>
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

Just call the kvmgt functions directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h        |  3 +++
 drivers/gpu/drm/i915/gvt/hypercall.h  |  2 --
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  6 ++----
 drivers/gpu/drm/i915/gvt/mpt.h        | 28 ---------------------------
 drivers/gpu/drm/i915/gvt/page_track.c |  8 ++++----
 5 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index b0bd52921b55e..28e405e00fecd 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -764,6 +764,9 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
+int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn);
+int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn);
+
 #include "trace.h"
 #include "mpt.h"
 
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index dbde492cafc84..ded13a63ab663 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -45,8 +45,6 @@ struct intel_vgpu;
 struct intel_gvt_mpt {
 	int (*host_init)(struct device *dev, void *gvt);
 	void (*host_exit)(struct device *dev, void *gvt);
-	int (*enable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
-	int (*disable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
 
 	int (*dma_map_guest_page)(struct intel_vgpu *vgpu, unsigned long gfn,
 				  unsigned long size, dma_addr_t *dma_addr);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3bc400629920d..4795d7c223ad7 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1684,7 +1684,7 @@ static void kvmgt_host_exit(struct device *dev, void *gvt)
 	intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
 }
 
-static int kvmgt_page_track_add(struct intel_vgpu *info, u64 gfn)
+int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 {
 	struct kvm *kvm = info->kvm;
 	struct kvm_memory_slot *slot;
@@ -1714,7 +1714,7 @@ static int kvmgt_page_track_add(struct intel_vgpu *info, u64 gfn)
 	return 0;
 }
 
-static int kvmgt_page_track_remove(struct intel_vgpu *info, u64 gfn)
+int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 {
 	struct kvm *kvm = info->kvm;
 	struct kvm_memory_slot *slot;
@@ -1950,8 +1950,6 @@ static void kvmgt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
-	.enable_page_track = kvmgt_page_track_add,
-	.disable_page_track = kvmgt_page_track_remove,
 	.dma_map_guest_page = kvmgt_dma_map_guest_page,
 	.dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
 	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 2d4bb6eaa08e3..d2723ac8bb044 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -71,34 +71,6 @@ static inline void intel_gvt_hypervisor_host_exit(struct device *dev, void *gvt)
 	intel_gvt_host.mpt->host_exit(dev, gvt);
 }
 
-/**
- * intel_gvt_hypervisor_enable_page_track - track a guest page
- * @vgpu: a vGPU
- * @gfn: the gfn of guest
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_enable_page_track(
-		struct intel_vgpu *vgpu, unsigned long gfn)
-{
-	return intel_gvt_host.mpt->enable_page_track(vgpu, gfn);
-}
-
-/**
- * intel_gvt_hypervisor_disable_page_track - untrack a guest page
- * @vgpu: a vGPU
- * @gfn: the gfn of guest
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_disable_page_track(
-		struct intel_vgpu *vgpu, unsigned long gfn)
-{
-	return intel_gvt_host.mpt->disable_page_track(vgpu, gfn);
-}
-
 /**
  * intel_gvt_hypervisor_dma_map_guest_page - setup dma map for guest page
  * @vgpu: a vGPU
diff --git a/drivers/gpu/drm/i915/gvt/page_track.c b/drivers/gpu/drm/i915/gvt/page_track.c
index 84856022528ee..3375b51c75f1e 100644
--- a/drivers/gpu/drm/i915/gvt/page_track.c
+++ b/drivers/gpu/drm/i915/gvt/page_track.c
@@ -87,7 +87,7 @@ void intel_vgpu_unregister_page_track(struct intel_vgpu *vgpu,
 	track = radix_tree_delete(&vgpu->page_track_tree, gfn);
 	if (track) {
 		if (track->tracked)
-			intel_gvt_hypervisor_disable_page_track(vgpu, gfn);
+			intel_gvt_page_track_remove(vgpu, gfn);
 		kfree(track);
 	}
 }
@@ -112,7 +112,7 @@ int intel_vgpu_enable_page_track(struct intel_vgpu *vgpu, unsigned long gfn)
 	if (track->tracked)
 		return 0;
 
-	ret = intel_gvt_hypervisor_enable_page_track(vgpu, gfn);
+	ret = intel_gvt_page_track_add(vgpu, gfn);
 	if (ret)
 		return ret;
 	track->tracked = true;
@@ -139,7 +139,7 @@ int intel_vgpu_disable_page_track(struct intel_vgpu *vgpu, unsigned long gfn)
 	if (!track->tracked)
 		return 0;
 
-	ret = intel_gvt_hypervisor_disable_page_track(vgpu, gfn);
+	ret = intel_gvt_page_track_remove(vgpu, gfn);
 	if (ret)
 		return ret;
 	track->tracked = false;
@@ -172,7 +172,7 @@ int intel_vgpu_page_track_handler(struct intel_vgpu *vgpu, u64 gpa,
 
 	if (unlikely(vgpu->failsafe)) {
 		/* Remove write protection to prevent furture traps. */
-		intel_vgpu_disable_page_track(vgpu, gpa >> PAGE_SHIFT);
+		intel_gvt_page_track_remove(vgpu, gpa >> PAGE_SHIFT);
 	} else {
 		ret = page_track->handler(page_track, gpa, data, bytes);
 		if (ret)
-- 
2.30.2

