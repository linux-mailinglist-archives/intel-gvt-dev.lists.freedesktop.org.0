Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4341D70FB
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 08:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6FC6E130;
	Mon, 18 May 2020 06:30:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AC56E11C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 06:30:06 +0000 (UTC)
IronPort-SDR: ufLoUZ3r4nUlCpg6TDKXOWnN3aGiqKPDzbNkd7u4YeEJ6UizMimr18S0YkxskwDb4QozaxCoxn
 XdfVXbh0utjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 23:30:06 -0700
IronPort-SDR: vLIJ7Qvqw5zvy1wW5HGjuBrBKRgqtREdrNF7pCuX7TJD5hAZbrhOWNfvjYZTsVFYlmUBvmYNgg
 qxkW4Tj/hWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="465464535"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.118])
 by fmsmga005.fm.intel.com with ESMTP; 17 May 2020 23:30:05 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Enable GVT enabled host S3/Resume
Date: Mon, 18 May 2020 14:28:51 +0800
Message-Id: <20200518062852.158709-2-colin.xu@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518062852.158709-1-colin.xu@intel.com>
References: <20200518062852.158709-1-colin.xu@intel.com>
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

This patch save/restore necessary GVT info during host S3 so that when
QEMU w/ GVT vGPU is running, host can enter and resume S3.

Only GGTT and fence regs are necessary. GVT will save GGTT entries into
GVT in suspend routine, and restore the saved entries and re-init fence
regs in resume routine.

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c      | 74 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
 drivers/gpu/drm/i915/gvt/gvt.c      | 14 ++++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  6 +++
 drivers/gpu/drm/i915/gvt/handlers.c | 20 ++++++++
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
 drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
 7 files changed, 120 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index a3a4305eda01..965c86b2a50e 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2533,6 +2533,11 @@ static void intel_vgpu_destroy_ggtt_mm(struct intel_vgpu *vgpu)
 	}
 	intel_vgpu_destroy_mm(vgpu->gtt.ggtt_mm);
 	vgpu->gtt.ggtt_mm = NULL;
+
+	if (vgpu->ggtt_entries) {
+		kfree(vgpu->ggtt_entries);
+		vgpu->ggtt_entries = NULL;
+	}
 }
 
 /**
@@ -2852,3 +2857,72 @@ void intel_vgpu_reset_gtt(struct intel_vgpu *vgpu)
 	intel_vgpu_destroy_all_ppgtt_mm(vgpu);
 	intel_vgpu_reset_ggtt(vgpu, true);
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
+		vgpu->ggtt_entries = kzalloc((num_low + num_hi) *
+				sizeof(u64), GFP_KERNEL);
+		if (!vgpu->ggtt_entries)
+			continue;
+
+		index = vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
+		addr = (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
+		memcpy(vgpu->ggtt_entries, addr, num_low);
+
+		index = vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
+		addr = (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
+		memcpy((u64 *)vgpu->ggtt_entries + num_low, addr, num_hi);
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
+		memcpy(addr, vgpu->ggtt_entries, num_low);
+		index = vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
+		addr = (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
+		memcpy(addr, (u64 *)vgpu->ggtt_entries + num_low, num_hi);
+
+		kfree(vgpu->ggtt_entries);
+		vgpu->ggtt_entries = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index 52d0d88abd86..141e0a41cd50 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -280,5 +280,7 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
 	unsigned int off, void *p_data, unsigned int bytes);
 
 void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
+void intel_gvt_save_ggtt(struct intel_gvt *gvt);
+void intel_gvt_restore_ggtt(struct intel_gvt *gvt);
 
 #endif /* _GVT_GTT_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index c7c561237883..aa836956c46e 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -405,6 +405,20 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	return ret;
 }
 
+int intel_gvt_pm_suspend(struct intel_gvt *gvt)
+{
+	intel_gvt_save_ggtt(gvt);
+	return 0;
+}
+
+int intel_gvt_pm_resume(struct intel_gvt *gvt)
+{
+	intel_gvt_restore_regs(gvt);
+	intel_gvt_restore_ggtt(gvt);
+
+	return 0;
+}
+
 int
 intel_gvt_register_hypervisor(struct intel_gvt_mpt *m)
 {
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index ff7f2515a6fe..e97475ef4b93 100644
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
@@ -679,6 +683,8 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
+int intel_gvt_pm_suspend(struct intel_gvt *gvt);
+int intel_gvt_pm_resume(struct intel_gvt *gvt);
 
 #include "trace.h"
 #include "mpt.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 3e88e3b5c43a..c2bfcd135679 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3619,3 +3619,23 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 		intel_vgpu_default_mmio_read(vgpu, offset, pdata, bytes) :
 		intel_vgpu_default_mmio_write(vgpu, offset, pdata, bytes);
 }
+
+void intel_gvt_restore_regs(struct intel_gvt *gvt)
+{
+	struct drm_i915_private *dev_priv = gvt->gt->i915;
+	struct intel_vgpu *vgpu;
+	int i, id;
+
+	for_each_active_vgpu(gvt, vgpu, id) {
+		mmio_hw_access_pre(gvt->gt);
+		for (i = 0; i < vgpu_fence_sz(vgpu); i++) {
+			intel_vgpu_write_fence(vgpu, i, vgpu_vreg64(vgpu,
+				fence_num_to_offset(i)));
+		}
+#define VGPU_RESTORE_REG(offset) I915_WRITE(_MMIO(offset), \
+		vgpu_vreg(vgpu, offset))
+		VGPU_RESTORE_REG(0x4df4);
+		VGPU_RESTORE_REG(0x4dfc);
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
index 3779f9f28061..674b96fbe761 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -396,6 +396,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	idr_init(&vgpu->object_idr);
 	intel_vgpu_init_cfg_space(vgpu, param->primary);
 	vgpu->d3_entered = false;
+	vgpu->ggtt_entries = NULL;
 
 	ret = intel_vgpu_init_mmio(vgpu);
 	if (ret)
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
