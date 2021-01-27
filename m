Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE4305BB2
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Jan 2021 13:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3916E323;
	Wed, 27 Jan 2021 12:41:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E118A6E111;
 Wed, 27 Jan 2021 12:41:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7363CACBA;
 Wed, 27 Jan 2021 12:41:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com
Subject: [PATCH v5 2/5] drm/i915/gt: Remove references to struct
 drm_device.pdev
Date: Wed, 27 Jan 2021 13:41:32 +0100
Message-Id: <20210127124135.11750-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127124135.11750-1-tzimmermann@suse.de>
References: <20210127124135.11750-1-tzimmermann@suse.de>
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 10 +++++-----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c       |  4 ++--
 drivers/gpu/drm/i915/gt/intel_reset.c     |  6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index ac9e020dbc9e..9b6b9f60336a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1250,7 +1250,7 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 
 	/* Waiting to drain ELSP? */
 	if (execlists_active(&engine->execlists)) {
-		synchronize_hardirq(engine->i915->drm.pdev->irq);
+		synchronize_hardirq(to_pci_dev(engine->i915->drm.dev)->irq);
 
 		intel_engine_flush_submission(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index dac07d66f658..9c701e5a00bc 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -769,7 +769,7 @@ static unsigned int chv_get_total_gtt_size(u16 gmch_ctrl)
 static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 {
 	struct drm_i915_private *i915 = ggtt->vm.i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	phys_addr_t phys_addr;
 	int ret;
 
@@ -839,7 +839,7 @@ static struct resource pci_resource(struct pci_dev *pdev, int bar)
 static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 {
 	struct drm_i915_private *i915 = ggtt->vm.i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
@@ -983,7 +983,7 @@ static u64 iris_pte_encode(dma_addr_t addr,
 static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 {
 	struct drm_i915_private *i915 = ggtt->vm.i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
@@ -1046,7 +1046,7 @@ static int i915_gmch_probe(struct i915_ggtt *ggtt)
 	phys_addr_t gmadr_base;
 	int ret;
 
-	ret = intel_gmch_probe(i915->bridge_dev, i915->drm.pdev, NULL);
+	ret = intel_gmch_probe(i915->bridge_dev, to_pci_dev(i915->drm.dev), NULL);
 	if (!ret) {
 		drm_err(&i915->drm, "failed to set up gmch\n");
 		return -EIO;
@@ -1091,7 +1091,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
 
 	ggtt->vm.gt = gt;
 	ggtt->vm.i915 = i915;
-	ggtt->vm.dma = &i915->drm.pdev->dev;
+	ggtt->vm.dma = i915->drm.dev;
 
 	if (INTEL_GEN(i915) <= 5)
 		ret = i915_gmch_probe(ggtt);
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 96b85a10ef33..3f940ae27028 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -301,7 +301,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt)
 
 	ppgtt->vm.gt = gt;
 	ppgtt->vm.i915 = i915;
-	ppgtt->vm.dma = &i915->drm.pdev->dev;
+	ppgtt->vm.dma = i915->drm.dev;
 	ppgtt->vm.total = BIT_ULL(INTEL_INFO(i915)->ppgtt_size);
 
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 91c1f58c1b25..3b7e62debe7e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -483,14 +483,14 @@ static bool rc6_supported(struct intel_rc6 *rc6)
 static void rpm_get(struct intel_rc6 *rc6)
 {
 	GEM_BUG_ON(rc6->wakeref);
-	pm_runtime_get_sync(&rc6_to_i915(rc6)->drm.pdev->dev);
+	pm_runtime_get_sync(rc6_to_i915(rc6)->drm.dev);
 	rc6->wakeref = true;
 }
 
 static void rpm_put(struct intel_rc6 *rc6)
 {
 	GEM_BUG_ON(!rc6->wakeref);
-	pm_runtime_put(&rc6_to_i915(rc6)->drm.pdev->dev);
+	pm_runtime_put(rc6_to_i915(rc6)->drm.dev);
 	rc6->wakeref = false;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 107430e1e864..416415b4bbe3 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -177,7 +177,7 @@ static int i915_do_reset(struct intel_gt *gt,
 			 intel_engine_mask_t engine_mask,
 			 unsigned int retry)
 {
-	struct pci_dev *pdev = gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 	int err;
 
 	/* Assert reset for at least 20 usec, and wait for acknowledgement. */
@@ -206,7 +206,7 @@ static int g33_do_reset(struct intel_gt *gt,
 			intel_engine_mask_t engine_mask,
 			unsigned int retry)
 {
-	struct pci_dev *pdev = gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 
 	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
 	return wait_for_atomic(g4x_reset_complete(pdev), 50);
@@ -216,7 +216,7 @@ static int g4x_do_reset(struct intel_gt *gt,
 			intel_engine_mask_t engine_mask,
 			unsigned int retry)
 {
-	struct pci_dev *pdev = gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 	struct intel_uncore *uncore = gt->uncore;
 	int ret;
 
-- 
2.30.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
