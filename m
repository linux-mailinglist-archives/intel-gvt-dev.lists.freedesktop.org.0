Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048E260BDC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 09:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1A06E542;
	Tue,  8 Sep 2020 07:21:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0D6E507;
 Tue,  8 Sep 2020 07:21:47 +0000 (UTC)
IronPort-SDR: DP5sUyZZrgdksJehASQ4EuXjnRw7OasVUggavknE4rINSgWPuxW5/2ep5I/72HN4Hfs7+AMp05
 2OF9s07XHeHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145796496"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="145796496"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 00:21:46 -0700
IronPort-SDR: Hs1ttBwTcq3XVrnPfwdpH/7OhPiIRLRpOYniz95HC8F7daxZyiT/Qcj2+ZV650ZULVIo5Q8NaN
 FsbdSr792/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="303988555"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2020 00:21:43 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/i915/gvt: Save/restore HW status for GVT during
 suspend/resume
Date: Tue,  8 Sep 2020 15:21:38 +0800
Message-Id: <20200908072138.773573-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This patch save/restore necessary GVT info during i915 suspend/resume so
that GVT enabled QEMU VM can continue running.

Only GGTT and fence regs are saved/restored now. GVT will save GGTT
entries into GVT in suspend routine, and restore the saved entries
and re-init fence regs in resume routine.

V2:
- Change kzalloc/kfree to vzalloc/vfree since the space allocated
from kmalloc may not enough for all saved GGTT entries.
- Keep gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c and
move the actual implementation to gvt.h/gvt.c. (zhenyu)
- Check gvt config on and active with intel_gvt_active(). (zhenyu)

V3: (zhenyu)
- Incorrect copy length. Should be num entries * entry size.
- Use memcpy_toio()/memcpy_fromio() instead of memcpy for iomem.
- Add F_PM_SAVE flags to indicate which MMIOs to save/restore for PM.

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c      | 75 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
 drivers/gpu/drm/i915/gvt/gvt.c      | 15 ++++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  8 +++
 drivers/gpu/drm/i915/gvt/handlers.c | 39 +++++++++++++--
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
 drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
 drivers/gpu/drm/i915/intel_gvt.c    | 29 +++++++++++
 drivers/gpu/drm/i915/intel_gvt.h    | 10 ++++
 9 files changed, 179 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 04bf018ecc34..817095dd221b 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2533,6 +2533,11 @@ static void intel_vgpu_destroy_ggtt_mm(struct intel_vgpu *vgpu)
 	}
 	intel_vgpu_destroy_mm(vgpu->gtt.ggtt_mm);
 	vgpu->gtt.ggtt_mm = NULL;
+
+	if (vgpu->ggtt_entries) {
+		vfree(vgpu->ggtt_entries);
+		vgpu->ggtt_entries = NULL;
+	}
 }
 
 /**
@@ -2834,3 +2839,73 @@ void intel_vgpu_reset_ggtt(struct intel_vgpu *vgpu, bool invalidate_old)
 
 	ggtt_invalidate(gvt->gt);
 }
+
+/**
+ * intel_gvt_save_ggtt - save all vGPU's ggtt entries
+ * @gvt: intel gvt device
+ *
+ * This function is called at driver suspend stage to save
+ * GGTT entries of every active vGPU.
+ *
+ */
+void intel_gvt_save_ggtt(struct intel_gvt *gvt)
+{
+	struct intel_vgpu *vgpu;
+	int id;
+	u32 index, num_low, num_hi;
+	void __iomem *addr;
+
+	for_each_active_vgpu(gvt, vgpu, id) {
+		num_low = vgpu_aperture_sz(vgpu) >> PAGE_SHIFT;
+		num_hi = vgpu_hidden_sz(vgpu) >> PAGE_SHIFT;
+		vgpu->ggtt_entries = vzalloc((num_low + num_hi) * sizeof(u64));
+		if (!vgpu->ggtt_entries)
+			continue;
+
+		index = vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
+		addr = (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
+		memcpy_fromio(vgpu->ggtt_entries, addr, num_low * sizeof(u64));
+
+		index = vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
+		addr = (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
+		memcpy_fromio(vgpu->ggtt_entries + num_low,
+			      addr, num_hi * sizeof(u64));
+	}
+}
+
+/**
+ * intel_gvt_restore_ggtt - restore all vGPU's ggtt entries
+ * @gvt: intel gvt device
+ *
+ * This function is called at driver resume stage to restore
+ * GGTT entries of every active vGPU.
+ *
+ */
+void intel_gvt_restore_ggtt(struct intel_gvt *gvt)
+{
+	struct intel_vgpu *vgpu;
+	int id;
+	u32 index, num_low, num_hi;
+	void __iomem *addr;
+
+	for_each_active_vgpu(gvt, vgpu, id) {
+		if (!vgpu->ggtt_entries) {
+			gvt_vgpu_err("fail to get saved ggtt\n");
+			continue;
+		}
+
+		num_low = vgpu_aperture_sz(vgpu) >> PAGE_SHIFT;
+		num_hi = vgpu_hidden_sz(vgpu) >> PAGE_SHIFT;
+
+		index = vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
+		addr = (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
+		memcpy_toio(addr, vgpu->ggtt_entries, num_low * sizeof(u64));
+		index = vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
+		addr = (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
+		memcpy_toio(addr, vgpu->ggtt_entries + num_low,
+			    num_hi * sizeof(u64));
+
+		vfree(vgpu->ggtt_entries);
+		vgpu->ggtt_entries = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index b76a262dd9bc..0d2fb2714852 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -279,5 +279,7 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
 	unsigned int off, void *p_data, unsigned int bytes);
 
 void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
+void intel_gvt_save_ggtt(struct intel_gvt *gvt);
+void intel_gvt_restore_ggtt(struct intel_gvt *gvt);
 
 #endif /* _GVT_GTT_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index c7c561237883..3de740fa0911 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -405,6 +405,21 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	return ret;
 }
 
+int
+intel_gvt_pm_suspend(struct intel_gvt *gvt)
+{
+	intel_gvt_save_ggtt(gvt);
+	return 0;
+}
+
+int
+intel_gvt_pm_resume(struct intel_gvt *gvt)
+{
+	intel_gvt_restore_regs(gvt);
+	intel_gvt_restore_ggtt(gvt);
+	return 0;
+}
+
 int
 intel_gvt_register_hypervisor(struct intel_gvt_mpt *m)
 {
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 9831361f181e..f489a4872acc 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -199,9 +199,13 @@ struct intel_vgpu {
 	struct intel_vgpu_submission submission;
 	struct radix_tree_root page_track_tree;
 	u32 hws_pga[I915_NUM_ENGINES];
+
 	/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state */
 	bool d3_entered;
 
+	/* Saved GGTT entries during host suspend state */
+	u64 *ggtt_entries;
+
 	struct dentry *debugfs;
 
 	/* Hypervisor-specific device state. */
@@ -255,6 +259,8 @@ struct intel_gvt_mmio {
 #define F_CMD_ACCESS	(1 << 3)
 /* This reg has been accessed by a VM */
 #define F_ACCESSED	(1 << 4)
+/* This reg requires save & restore during host PM suspend/resume */
+#define F_PM_SAVE	(1 << 5)
 /* This reg has been accessed through GPU commands */
 #define F_UNALIGN	(1 << 6)
 /* This reg is in GVT's mmio save-restor list and in hardware
@@ -685,6 +691,8 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
+int intel_gvt_pm_suspend(struct intel_gvt *gvt);
+int intel_gvt_pm_resume(struct intel_gvt *gvt);
 
 #include "trace.h"
 #include "mpt.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 26ac9712aac8..aee93c8c6422 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3103,9 +3103,10 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(TRVADR, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS,
-		NULL, gen9_trtte_write);
-	MMIO_DH(_MMIO(0x4dfc), D_SKL_PLUS, NULL, gen9_trtt_chicken_write);
+	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS | F_PM_SAVE,
+		 NULL, gen9_trtte_write);
+	MMIO_DFH(_MMIO(0x4dfc), D_SKL_PLUS, F_PM_SAVE,
+		 NULL, gen9_trtt_chicken_write);
 
 	MMIO_D(_MMIO(0x46430), D_SKL_PLUS);
 
@@ -3642,3 +3643,35 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 		intel_vgpu_default_mmio_read(vgpu, offset, pdata, bytes) :
 		intel_vgpu_default_mmio_write(vgpu, offset, pdata, bytes);
 }
+
+static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
+					  u32 offset, void *data)
+{
+	struct intel_vgpu *vgpu = data;
+	struct drm_i915_private *dev_priv = gvt->gt->i915;
+
+	if (gvt->mmio.mmio_attribute[offset >> 2] & F_PM_SAVE)
+		I915_WRITE(_MMIO(offset), vgpu_vreg(vgpu, offset));
+
+	return 0;
+}
+
+void intel_gvt_restore_regs(struct intel_gvt *gvt)
+{
+	struct intel_vgpu *vgpu;
+	int i, id;
+	u64 val;
+
+	for_each_active_vgpu(gvt, vgpu, id) {
+		mmio_hw_access_pre(gvt->gt);
+		for (i = 0; i < vgpu_fence_sz(vgpu); i++) {
+			val = vgpu_vreg64(vgpu, fence_num_to_offset(i));
+			intel_vgpu_write_fence(vgpu, i, val);
+		}
+
+		intel_gvt_for_each_tracked_mmio(gvt,
+						mmio_pm_restore_handler, vgpu);
+
+		mmio_hw_access_post(gvt->gt);
+	}
+}
diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/mmio.h
index cc4812648bf4..999d9dda0614 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.h
+++ b/drivers/gpu/drm/i915/gvt/mmio.h
@@ -104,4 +104,7 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 
 int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 				  void *p_data, unsigned int bytes);
+
+void intel_gvt_restore_regs(struct intel_gvt *gvt);
+
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index e0e073045d83..a0c1c47a842b 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -395,6 +395,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	idr_init(&vgpu->object_idr);
 	intel_vgpu_init_cfg_space(vgpu, param->primary);
 	vgpu->d3_entered = false;
+	vgpu->ggtt_entries = NULL;
 
 	ret = intel_vgpu_init_mmio(vgpu);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 99fe8aef1c67..33650daef567 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -24,6 +24,7 @@
 #include "i915_drv.h"
 #include "i915_vgpu.h"
 #include "intel_gvt.h"
+#include "gvt/gvt.h"
 
 /**
  * DOC: Intel GVT-g host support
@@ -147,3 +148,31 @@ void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 
 	intel_gvt_clean_device(dev_priv);
 }
+
+/**
+ * intel_gvt_suspend - GVT suspend routine wapper
+ *
+ * @dev_priv: drm i915 private *
+ *
+ * This function is called at the i915 driver suspend stage to save necessary
+ * HW status for GVT so that vGPU can continue running after resume.
+ */
+void intel_gvt_suspend(struct drm_i915_private *dev_priv)
+{
+	if (intel_gvt_active(dev_priv))
+		intel_gvt_pm_suspend(dev_priv->gvt);
+}
+
+/**
+ * intel_gvt_suspend - GVT resume routine wapper
+ *
+ * @dev_priv: drm i915 private *
+ *
+ * This function is called at the i915 driver resume stage to restore required
+ * HW status for GVT so that vGPU can continue running after resumed.
+ */
+void intel_gvt_resume(struct drm_i915_private *dev_priv)
+{
+	if (intel_gvt_active(dev_priv))
+		intel_gvt_pm_resume(dev_priv->gvt);
+}
diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/intel_gvt.h
index 502fad8a8652..5732c7b10ab2 100644
--- a/drivers/gpu/drm/i915/intel_gvt.h
+++ b/drivers/gpu/drm/i915/intel_gvt.h
@@ -33,6 +33,8 @@ int intel_gvt_init_device(struct drm_i915_private *dev_priv);
 void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
 int intel_gvt_init_host(void);
 void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
+void intel_gvt_suspend(struct drm_i915_private *dev_priv);
+void intel_gvt_resume(struct drm_i915_private *dev_priv);
 #else
 static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
 {
@@ -46,6 +48,14 @@ static inline void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 static inline void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
 {
 }
+
+static inline void intel_gvt_suspend(struct drm_i915_private *dev_priv)
+{
+}
+
+static inline void intel_gvt_resume(struct drm_i915_private *dev_priv)
+{
+}
 #endif
 
 #endif /* _INTEL_GVT_H_ */
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
