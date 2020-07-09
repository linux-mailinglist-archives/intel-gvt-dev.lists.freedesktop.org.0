Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 609DA219987
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jul 2020 09:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F716E9E5;
	Thu,  9 Jul 2020 07:11:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D4F6E9E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jul 2020 07:11:34 +0000 (UTC)
IronPort-SDR: dJy0Gqz1j3Ce1j1D/1pdq8UxmwwMlCgPZMX+0uAeFNRIkpddonwZxDrexIQuW1CuI02bB/XfLU
 TI+a0BHQGCoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="209478118"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="209478118"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 00:11:33 -0700
IronPort-SDR: BmYogz/EwwEAUpRN0bra9oecPiPOh9PAOp8BLpw9ktrKdW8P4xPoyncn23OUZuBqLZVb/AdWbm
 ZeOAMT2GiMqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="358355214"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga001.jf.intel.com with ESMTP; 09 Jul 2020 00:11:32 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915/gvt: Do not destroy ppgtt_mm during vGPU
 D3->D0.
Date: Thu,  9 Jul 2020 15:09:56 +0800
Message-Id: <20200709071002.247960-2-colin.xu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709071002.247960-1-colin.xu@intel.com>
References: <20200709071002.247960-1-colin.xu@intel.com>
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
Cc: kevin.tian@intel.com, colin.xu@intel.com, zhenyuw@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

When system enters S3 state, device enters D3 state while RAM remains
powered. From vGPU/GVT perspective, ppgtt_mm is residual in guest memory
during vGPU in D3 state, so that when guest state transits from S3->S0,
ppgtt_mm can be re-used and no need rebuild.

Previous implementation invalidate and destroy ppgtt_mm at DMLR,
regardless the power state transition is S0->S3->S0 (guest suspend or
resume) or OFF->S0 (normal boot/reboot), invalidate and destroy ppgtt_mm
is unnecessary in the former transition case.

The patch saves the vGPU D3/D0 transition state when guest writes the
PCI_PM_CTRL in vGPU's configure space, then in later DMLR, GVT can decide
whether or not invalidate and destroy ppgtt_mm is required. The
d3_entered flags is reset after DMLR.

To test this feature, make sure S3 is enabled in QEMU parameters:
i440fx: PIIX4_PM.disable_s3=0
q35: ICH9-LPC.disable_s3=0
Also need enable sleep option in guest OS if it's disabled.

v2:
- Revise commit message to more accurate description. (Kevin)
- Split patch by logic. (Zhenyu)

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.c       |  2 +-
 drivers/gpu/drm/i915/gvt/gtt.h       |  2 ++
 drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
 drivers/gpu/drm/i915/gvt/vgpu.c      | 17 +++++++++++++++--
 5 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index 072725a448db..ad86c5eb5bba 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -70,6 +70,7 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *vgpu, unsigned int off,
 {
 	u8 *cfg_base = vgpu_cfg_space(vgpu);
 	u8 mask, new, old;
+	pci_power_t pwr;
 	int i = 0;
 
 	for (; i < bytes && (off + i < sizeof(pci_cfg_space_rw_bmp)); i++) {
@@ -91,6 +92,15 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *vgpu, unsigned int off,
 	/* For other configuration space directly copy as it is. */
 	if (i < bytes)
 		memcpy(cfg_base + off + i, src + i, bytes - i);
+
+	if (off == vgpu->cfg_space.pmcsr_off && vgpu->cfg_space.pmcsr_off) {
+		pwr = (pci_power_t __force)(*(u16*)(&vgpu_cfg_space(vgpu)[off])
+			& PCI_PM_CTRL_STATE_MASK);
+		if (pwr == PCI_D3hot)
+			vgpu->d3_entered = true;
+		gvt_dbg_core("vgpu-%d power status changed to %d\n",
+			     vgpu->id, pwr);
+	}
 }
 
 /**
@@ -366,6 +376,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 	struct intel_gvt *gvt = vgpu->gvt;
 	const struct intel_gvt_device_info *info = &gvt->device_info;
 	u16 *gmch_ctl;
+	u8 next;
 
 	memcpy(vgpu_cfg_space(vgpu), gvt->firmware.cfg_space,
 	       info->cfg_space_size);
@@ -401,6 +412,19 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 		pci_resource_len(gvt->gt->i915->drm.pdev, 2);
 
 	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
+
+	/* PM Support */
+	vgpu->cfg_space.pmcsr_off = 0;
+	if (vgpu_cfg_space(vgpu)[PCI_STATUS] & PCI_STATUS_CAP_LIST) {
+		next = vgpu_cfg_space(vgpu)[PCI_CAPABILITY_LIST];
+		do {
+			if (vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_ID] == PCI_CAP_ID_PM) {
+				vgpu->cfg_space.pmcsr_off = next + PCI_PM_CTRL;
+				break;
+			}
+			next = vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_NEXT];
+		} while (next);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 210016192ce7..a3a4305eda01 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2501,7 +2501,7 @@ int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
 	return create_scratch_page_tree(vgpu);
 }
 
-static void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
+void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
 {
 	struct list_head *pos, *n;
 	struct intel_vgpu_mm *mm;
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index 320b8d6ad92f..52d0d88abd86 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -279,4 +279,6 @@ int intel_vgpu_emulate_ggtt_mmio_read(struct intel_vgpu *vgpu,
 int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
 	unsigned int off, void *p_data, unsigned int bytes);
 
+void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
+
 #endif /* _GVT_GTT_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index a4a6db6b7f90..ff7f2515a6fe 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -106,6 +106,7 @@ struct intel_vgpu_pci_bar {
 struct intel_vgpu_cfg_space {
 	unsigned char virtual_cfg_space[PCI_CFG_SPACE_EXP_SIZE];
 	struct intel_vgpu_pci_bar bar[INTEL_GVT_MAX_BAR_NUM];
+	u32 pmcsr_off;
 };
 
 #define vgpu_cfg_space(vgpu) ((vgpu)->cfg_space.virtual_cfg_space)
@@ -198,6 +199,8 @@ struct intel_vgpu {
 	struct intel_vgpu_submission submission;
 	struct radix_tree_root page_track_tree;
 	u32 hws_pga[I915_NUM_ENGINES];
+	/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state */
+	bool d3_entered;
 
 	struct dentry *debugfs;
 
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 7d361623ff67..fb12448fe353 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -257,6 +257,7 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
 	intel_gvt_deactivate_vgpu(vgpu);
 
 	mutex_lock(&vgpu->vgpu_lock);
+	vgpu->d3_entered = false;
 	intel_vgpu_clean_workloads(vgpu, ALL_ENGINES);
 	intel_vgpu_dmabuf_cleanup(vgpu);
 	mutex_unlock(&vgpu->vgpu_lock);
@@ -393,6 +394,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
 	idr_init(&vgpu->object_idr);
 	intel_vgpu_init_cfg_space(vgpu, param->primary);
+	vgpu->d3_entered = false;
 
 	ret = intel_vgpu_init_mmio(vgpu);
 	if (ret)
@@ -557,10 +559,15 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 	/* full GPU reset or device model level reset */
 	if (engine_mask == ALL_ENGINES || dmlr) {
 		intel_vgpu_select_submission_ops(vgpu, ALL_ENGINES, 0);
-		intel_vgpu_invalidate_ppgtt(vgpu);
+		if (engine_mask == ALL_ENGINES)
+			intel_vgpu_invalidate_ppgtt(vgpu);
 		/*fence will not be reset during virtual reset */
 		if (dmlr) {
-			intel_vgpu_reset_gtt(vgpu);
+			if(!vgpu->d3_entered) {
+				intel_vgpu_invalidate_ppgtt(vgpu);
+				intel_vgpu_destroy_all_ppgtt_mm(vgpu);
+			}
+			intel_vgpu_reset_ggtt(vgpu, true);
 			intel_vgpu_reset_resource(vgpu);
 		}
 
@@ -573,6 +580,12 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 			/* only reset the failsafe mode when dmlr reset */
 			vgpu->failsafe = false;
 			vgpu->pv_notified = false;
+			/*
+			 * PCI_D0 is set before dmlr, so reset d3_entered here
+			 * after done using.
+			 */
+			if(vgpu->d3_entered)
+				vgpu->d3_entered = false;
 		}
 	}
 
-- 
2.27.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
