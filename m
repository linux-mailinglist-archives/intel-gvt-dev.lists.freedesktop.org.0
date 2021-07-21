Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DC3D130E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0AD6E427;
	Wed, 21 Jul 2021 15:58:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A495D6E427;
 Wed, 21 Jul 2021 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=99eXLsNfUb85Fnq2w86jb2ofNpgSLWUwU9fuG1hHzlA=; b=VsrKTD27Xh9T0U5SAlW4zLFnpj
 wZ4yY/bPNPs8G7d6TVPPxpllaO0+zHzYntqgDndb2uF2SKrTUC3V/2Zqnjur5vhC4+FhiZHuPS6jv
 r7gzDAp8P1viLiyBpIeEPEtrhA0OmrGGdj/+9INEFGbspymodqSUEjgCusKyv79lrSZdjGJ44f0fz
 W6bp11g8Y6gEwrroJQtH2vqsvodCKtGxPGkwyhcNCg6JjMKQIuCgk4e5uRepBqZaHSlfLgkgmD29M
 gxVZB/kDjhcdYjeGWaoGhun4amXrNF5TVnKS7AIwo+rLO4W4KkeGdDm9dVl7o7tPH3IY1tm9goyxg
 Hcp5dbfA==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ec1-009MXo-Vf; Wed, 21 Jul 2021 15:58:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 13/21] drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
Date: Wed, 21 Jul 2021 17:53:47 +0200
Message-Id: <20210721155355.173183-14-hch@lst.de>
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

Just call the code to setup the opregions and EDID data directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
 drivers/gpu/drm/i915/gvt/hypercall.h |  3 ---
 drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ++----
 drivers/gpu/drm/i915/gvt/mpt.h       | 32 ----------------------------
 drivers/gpu/drm/i915/gvt/vgpu.c      |  6 +++---
 5 files changed, 8 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index e604d6f6d06a..1cb4b48d9a25 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -516,6 +516,9 @@ void intel_gvt_reset_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_deactivate_vgpu(struct intel_vgpu *vgpu);
 
+int intel_gvt_set_opregion(struct intel_vgpu *vgpu);
+int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num);
+
 /* validating GM functions */
 #define vgpu_gmadr_is_aperture(vgpu, gmadr) \
 	((gmadr >= vgpu_aperture_gmadr_base(vgpu)) && \
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index fd903d52f431..091249a924a8 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -57,9 +57,6 @@ struct intel_gvt_mpt {
 				dma_addr_t dma_addr);
 
 	int (*dma_pin_guest_page)(struct intel_vgpu *vgpu, dma_addr_t dma_addr);
-
-	int (*set_opregion)(struct intel_vgpu *vgpu);
-	int (*set_edid)(struct intel_vgpu *vgpu, int port_num);
 	bool (*is_valid_gfn)(struct intel_vgpu *vgpu, unsigned long gfn);
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index a74fd4c78f35..572d51950abb 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -643,7 +643,7 @@ static int intel_vgpu_register_reg(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-static int kvmgt_set_opregion(struct intel_vgpu *vgpu)
+int intel_gvt_set_opregion(struct intel_vgpu *vgpu)
 {
 	void *base;
 	int ret;
@@ -670,7 +670,7 @@ static int kvmgt_set_opregion(struct intel_vgpu *vgpu)
 	return ret;
 }
 
-static int kvmgt_set_edid(struct intel_vgpu *vgpu, int port_num)
+int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num)
 {
 	struct intel_vgpu_port *port = intel_vgpu_port(vgpu, port_num);
 	struct vfio_edid_region *base;
@@ -2011,8 +2011,6 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.dma_map_guest_page = kvmgt_dma_map_guest_page,
 	.dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
 	.dma_pin_guest_page = kvmgt_dma_pin_guest_page,
-	.set_opregion = kvmgt_set_opregion,
-	.set_edid = kvmgt_set_edid,
 	.is_valid_gfn = kvmgt_is_valid_gfn,
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 2196187203af..9738aa3377b4 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -210,38 +210,6 @@ intel_gvt_hypervisor_dma_pin_guest_page(struct intel_vgpu *vgpu,
 	return intel_gvt_host.mpt->dma_pin_guest_page(vgpu, dma_addr);
 }
 
-/**
- * intel_gvt_hypervisor_set_opregion - Set opregion for guest
- * @vgpu: a vGPU
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_set_opregion(struct intel_vgpu *vgpu)
-{
-	if (!intel_gvt_host.mpt->set_opregion)
-		return 0;
-
-	return intel_gvt_host.mpt->set_opregion(vgpu);
-}
-
-/**
- * intel_gvt_hypervisor_set_edid - Set EDID region for guest
- * @vgpu: a vGPU
- * @port_num: display port number
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_set_edid(struct intel_vgpu *vgpu,
-						int port_num)
-{
-	if (!intel_gvt_host.mpt->set_edid)
-		return 0;
-
-	return intel_gvt_host.mpt->set_edid(vgpu, port_num);
-}
-
 /**
  * intel_gvt_hypervisor_is_valid_gfn - check if a visible gfn
  * @vgpu: a vGPU
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 9e8fa9f388eb..2fadd6fea5ac 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -426,14 +426,14 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 
 	intel_gvt_debugfs_add_vgpu(vgpu);
 
-	ret = intel_gvt_hypervisor_set_opregion(vgpu);
+	ret = intel_gvt_set_opregion(vgpu);
 	if (ret)
 		goto out_clean_sched_policy;
 
 	if (IS_BROADWELL(dev_priv) || IS_BROXTON(dev_priv))
-		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
+		ret = intel_gvt_set_edid(vgpu, PORT_B);
 	else
-		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
+		ret = intel_gvt_set_edid(vgpu, PORT_D);
 	if (ret)
 		goto out_clean_sched_policy;
 
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
