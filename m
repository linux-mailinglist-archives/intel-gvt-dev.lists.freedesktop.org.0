Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2608F30771D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Jan 2021 14:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74F6E975;
	Thu, 28 Jan 2021 13:31:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E216E958;
 Thu, 28 Jan 2021 13:31:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2B58B11D;
 Thu, 28 Jan 2021 13:31:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, chris@chris-wilson.co.uk
Subject: [PATCH v6 3/5] drm/i915/gvt: Remove references to struct
 drm_device.pdev
Date: Thu, 28 Jan 2021 14:31:25 +0100
Message-Id: <20210128133127.2311-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128133127.2311-1-tzimmermann@suse.de>
References: <20210128133127.2311-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Convert i915 to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gvt/cfg_space.c |  5 +++--
 drivers/gpu/drm/i915/gvt/firmware.c  | 10 +++++-----
 drivers/gpu/drm/i915/gvt/gtt.c       | 12 ++++++------
 drivers/gpu/drm/i915/gvt/gvt.c       |  6 +++---
 drivers/gpu/drm/i915/gvt/kvmgt.c     |  4 ++--
 5 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index ad86c5eb5bba..b490e3db2e38 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -374,6 +374,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 			       bool primary)
 {
 	struct intel_gvt *gvt = vgpu->gvt;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	const struct intel_gvt_device_info *info = &gvt->device_info;
 	u16 *gmch_ctl;
 	u8 next;
@@ -407,9 +408,9 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 	memset(vgpu_cfg_space(vgpu) + INTEL_GVT_PCI_OPREGION, 0, 4);
 
 	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].size =
-		pci_resource_len(gvt->gt->i915->drm.pdev, 0);
+		pci_resource_len(pdev, 0);
 	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].size =
-		pci_resource_len(gvt->gt->i915->drm.pdev, 2);
+		pci_resource_len(pdev, 2);
 
 	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
 
diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index 990a181094e3..1a8274a3f4b1 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -76,7 +76,7 @@ static int mmio_snapshot_handler(struct intel_gvt *gvt, u32 offset, void *data)
 static int expose_firmware_sysfs(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	struct gvt_firmware_header *h;
 	void *firmware;
 	void *p;
@@ -127,7 +127,7 @@ static int expose_firmware_sysfs(struct intel_gvt *gvt)
 
 static void clean_firmware_sysfs(struct intel_gvt *gvt)
 {
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 
 	device_remove_bin_file(&pdev->dev, &firmware_attr);
 	vfree(firmware_attr.private);
@@ -151,7 +151,7 @@ static int verify_firmware(struct intel_gvt *gvt,
 			   const struct firmware *fw)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	struct gvt_firmware_header *h;
 	unsigned long id, crc32_start;
 	const void *mem;
@@ -205,7 +205,7 @@ static int verify_firmware(struct intel_gvt *gvt,
 int intel_gvt_load_firmware(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	struct intel_gvt_firmware *firmware = &gvt->firmware;
 	struct gvt_firmware_header *h;
 	const struct firmware *fw;
@@ -240,7 +240,7 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt)
 
 	gvt_dbg_core("request hw state firmware %s...\n", path);
 
-	ret = request_firmware(&fw, path, &gvt->gt->i915->drm.pdev->dev);
+	ret = request_firmware(&fw, path, gvt->gt->i915->drm.dev);
 	kfree(path);
 
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 897c007ea96a..6d12a5a401f6 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -746,7 +746,7 @@ static int detach_oos_page(struct intel_vgpu *vgpu,
 
 static void ppgtt_free_spt(struct intel_vgpu_ppgtt_spt *spt)
 {
-	struct device *kdev = &spt->vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *kdev = spt->vgpu->gvt->gt->i915->drm.dev;
 
 	trace_spt_free(spt->vgpu->id, spt, spt->guest_page.type);
 
@@ -831,7 +831,7 @@ static int reclaim_one_ppgtt_mm(struct intel_gvt *gvt);
 static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
 		struct intel_vgpu *vgpu, enum intel_gvt_gtt_type type)
 {
-	struct device *kdev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *kdev = vgpu->gvt->gt->i915->drm.dev;
 	struct intel_vgpu_ppgtt_spt *spt = NULL;
 	dma_addr_t daddr;
 	int ret;
@@ -2402,7 +2402,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 				vgpu->gvt->device_info.gtt_entry_size_shift;
 	void *scratch_pt;
 	int i;
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 	dma_addr_t daddr;
 
 	if (drm_WARN_ON(&i915->drm,
@@ -2460,7 +2460,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 static int release_scratch_page_tree(struct intel_vgpu *vgpu)
 {
 	int i;
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 	dma_addr_t daddr;
 
 	for (i = GTT_TYPE_PPGTT_PTE_PT; i < GTT_TYPE_MAX; i++) {
@@ -2732,7 +2732,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
 {
 	int ret;
 	void *page;
-	struct device *dev = &gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = gvt->gt->i915->drm.dev;
 	dma_addr_t daddr;
 
 	gvt_dbg_core("init gtt\n");
@@ -2781,7 +2781,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
  */
 void intel_gvt_clean_gtt(struct intel_gvt *gvt)
 {
-	struct device *dev = &gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = gvt->gt->i915->drm.dev;
 	dma_addr_t daddr = (dma_addr_t)(gvt->gtt.scratch_mfn <<
 					I915_GTT_PAGE_SHIFT);
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index d1d8ee4a5f16..aa7fc0dd1db5 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -50,7 +50,7 @@ static struct intel_vgpu_type *intel_gvt_find_vgpu_type(struct intel_gvt *gvt,
 		const char *name)
 {
 	const char *driver_name =
-		dev_driver_string(&gvt->gt->i915->drm.pdev->dev);
+		dev_driver_string(gvt->gt->i915->drm.dev);
 	int i;
 
 	name += strlen(driver_name) + 1;
@@ -189,7 +189,7 @@ static const struct intel_gvt_ops intel_gvt_ops = {
 static void init_device_info(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 
 	info->max_support_vgpus = 8;
 	info->cfg_space_size = PCI_CFG_SPACE_EXP_SIZE;
@@ -376,7 +376,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	intel_gvt_debugfs_init(gvt);
 
 	gvt_dbg_core("gvt device initialization is done\n");
-	intel_gvt_host.dev = &i915->drm.pdev->dev;
+	intel_gvt_host.dev = i915->drm.dev;
 	intel_gvt_host.initialized = true;
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 60f1a386dd06..551f00024e99 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -221,7 +221,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		dma_addr_t *dma_addr, unsigned long size)
 {
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 	struct page *page = NULL;
 	int ret;
 
@@ -244,7 +244,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		dma_addr_t dma_addr, unsigned long size)
 {
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 
 	dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
 	gvt_unpin_guest_page(vgpu, gfn, size);
-- 
2.30.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
