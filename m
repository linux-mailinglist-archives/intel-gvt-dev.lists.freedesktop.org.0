Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F53D1316
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B796E926;
	Wed, 21 Jul 2021 15:59:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B647F6E926;
 Wed, 21 Jul 2021 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=k0EPJdoVgWqIr3HursHUM68UvDJimI9KrqN/cwQVTNU=; b=aVuM5p/G+QfBQPNOOf2Uv5HLox
 en6nYMSEyYS39BX7uS/pEAWUkP/ZpLPqVUInDUToaJsNGBKFyBJ7C6I4xl2D9qO1+WKERFV96RpwT
 VRvLmgJcOchyoEeySol23+Sk6CYkz+5ulLg090UWXOffFufXF+yZhTMXAP2xOlZLABwgaSz9AwbP1
 ZIVqywU98/hKeimkMrXPe75aZi0gArPmwadOb2KqsOKMUAGXo/Ad935nP31ZH52bKPAAdSNmW2LCr
 1pp9eFNvUouQ50arokTTQ3B14rq5zmpbNJMQty8hsdmOKhpZInZaEnxmi4SpRUCors7DO7o/GFGmP
 ZkicX0xg==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ecf-009MZe-5G; Wed, 21 Jul 2021 15:59:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 15/21] drm/i915/gvt: devirtualize ->inject_msi
Date: Wed, 21 Jul 2021 17:53:49 +0200
Message-Id: <20210721155355.173183-16-hch@lst.de>
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

Just open code the MSI injection in a single place instead of going
through the method table.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
 drivers/gpu/drm/i915/gvt/interrupt.c | 38 +++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 24 ------------------
 drivers/gpu/drm/i915/gvt/mpt.h       | 37 ---------------------------
 4 files changed, 37 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 08c622c4079b..de63bd8dd05b 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -45,7 +45,6 @@ struct intel_vgpu;
 struct intel_gvt_mpt {
 	int (*host_init)(struct device *dev, void *gvt);
 	void (*host_exit)(struct device *dev, void *gvt);
-	int (*inject_msi)(struct intel_vgpu *vgpu, u32 addr, u16 data);
 	int (*enable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
 	int (*disable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
 	unsigned long (*gfn_to_mfn)(struct intel_vgpu *vgpu, unsigned long gfn);
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index 614b951d919f..f3c350a9a80f 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -396,9 +396,45 @@ static void init_irq_map(struct intel_gvt_irq *irq)
 }
 
 /* =======================vEvent injection===================== */
+
+#define MSI_CAP_CONTROL(offset) (offset + 2)
+#define MSI_CAP_ADDRESS(offset) (offset + 4)
+#define MSI_CAP_DATA(offset) (offset + 8)
+#define MSI_CAP_EN 0x1
+
 static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
 {
-	return intel_gvt_hypervisor_inject_msi(vgpu);
+	unsigned long offset = vgpu->gvt->device_info.msi_cap_offset;
+	u16 control, data;
+	u32 addr;
+
+	control = *(u16 *)(vgpu_cfg_space(vgpu) + MSI_CAP_CONTROL(offset));
+	addr = *(u32 *)(vgpu_cfg_space(vgpu) + MSI_CAP_ADDRESS(offset));
+	data = *(u16 *)(vgpu_cfg_space(vgpu) + MSI_CAP_DATA(offset));
+
+	/* Do not generate MSI if MSIEN is disabled */
+	if (!(control & MSI_CAP_EN))
+		return 0;
+
+	if (WARN(control & GENMASK(15, 1), "only support one MSI format\n"))
+		return -EINVAL;
+
+	trace_inject_msi(vgpu->id, addr, data);
+
+	/*
+	 * When guest is powered off, msi_trigger is set to NULL, but vgpu's
+	 * config and mmio register isn't restored to default during guest
+	 * poweroff. If this vgpu is still used in next vm, this vgpu's pipe
+	 * may be enabled, then once this vgpu is active, it will get inject
+	 * vblank interrupt request. But msi_trigger is null until msi is
+	 * enabled by guest. so if msi_trigger is null, success is still
+	 * returned and don't inject interrupt into guest.
+	 */
+	if (!vgpu->attached)
+		return -ESRCH;
+	if (vgpu->msi_trigger && eventfd_signal(vgpu->msi_trigger, 1) != 1)
+		return -EFAULT;
+	return 0;
 }
 
 static void propagate_event(struct intel_gvt_irq *irq,
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 218c3deaf2b4..3a035802e4f0 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1855,29 +1855,6 @@ void intel_vgpu_detach_regions(struct intel_vgpu *vgpu)
 	vgpu->region = NULL;
 }
 
-static int kvmgt_inject_msi(struct intel_vgpu *vgpu, u32 addr, u16 data)
-{
-	if (!vgpu->attached)
-		return -ESRCH;
-
-	/*
-	 * When guest is poweroff, msi_trigger is set to NULL, but vgpu's
-	 * config and mmio register isn't restored to default during guest
-	 * poweroff. If this vgpu is still used in next vm, this vgpu's pipe
-	 * may be enabled, then once this vgpu is active, it will get inject
-	 * vblank interrupt request. But msi_trigger is null until msi is
-	 * enabled by guest. so if msi_trigger is null, success is still
-	 * returned and don't inject interrupt into guest.
-	 */
-	if (vgpu->msi_trigger == NULL)
-		return 0;
-
-	if (eventfd_signal(vgpu->msi_trigger, 1) == 1)
-		return 0;
-
-	return -EFAULT;
-}
-
 static unsigned long kvmgt_gfn_to_pfn(struct intel_vgpu *vgpu,
 		unsigned long gfn)
 {
@@ -2003,7 +1980,6 @@ static bool kvmgt_is_valid_gfn(struct intel_vgpu *vgpu, unsigned long gfn)
 static const struct intel_gvt_mpt kvmgt_mpt = {
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
-	.inject_msi = kvmgt_inject_msi,
 	.enable_page_track = kvmgt_page_track_add,
 	.disable_page_track = kvmgt_page_track_remove,
 	.gfn_to_mfn = kvmgt_gfn_to_pfn,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 78efcf1e6946..59369e8b3b69 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -71,43 +71,6 @@ static inline void intel_gvt_hypervisor_host_exit(struct device *dev, void *gvt)
 	intel_gvt_host.mpt->host_exit(dev, gvt);
 }
 
-#define MSI_CAP_CONTROL(offset) (offset + 2)
-#define MSI_CAP_ADDRESS(offset) (offset + 4)
-#define MSI_CAP_DATA(offset) (offset + 8)
-#define MSI_CAP_EN 0x1
-
-/**
- * intel_gvt_hypervisor_inject_msi - inject a MSI interrupt into vGPU
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_inject_msi(struct intel_vgpu *vgpu)
-{
-	unsigned long offset = vgpu->gvt->device_info.msi_cap_offset;
-	u16 control, data;
-	u32 addr;
-	int ret;
-
-	control = *(u16 *)(vgpu_cfg_space(vgpu) + MSI_CAP_CONTROL(offset));
-	addr = *(u32 *)(vgpu_cfg_space(vgpu) + MSI_CAP_ADDRESS(offset));
-	data = *(u16 *)(vgpu_cfg_space(vgpu) + MSI_CAP_DATA(offset));
-
-	/* Do not generate MSI if MSIEN is disable */
-	if (!(control & MSI_CAP_EN))
-		return 0;
-
-	if (WARN(control & GENMASK(15, 1), "only support one MSI format\n"))
-		return -EINVAL;
-
-	trace_inject_msi(vgpu->id, addr, data);
-
-	ret = intel_gvt_host.mpt->inject_msi(vgpu, addr, data);
-	if (ret)
-		return ret;
-	return 0;
-}
-
 /**
  * intel_gvt_hypervisor_enable_page_track - track a guest page
  * @vgpu: a vGPU
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
