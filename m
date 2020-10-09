Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7E288631
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Oct 2020 11:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD286ECA2;
	Fri,  9 Oct 2020 09:42:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA3D6ECA2;
 Fri,  9 Oct 2020 09:42:31 +0000 (UTC)
IronPort-SDR: wt8B5WE9EmpVAdS6M8sbMnw6V9bjJlIyrlXTlkwdWtfuN/L9ySk5epud8ud1X+6LhVPG+jVNtO
 PrurzVa+mRlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165526018"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165526018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 02:42:31 -0700
IronPort-SDR: 3tXyxtxMEB3kf7keMN8EqKWokUJWOuY+9kciC6z18dPVWacb9fjFVHco4pqyXzKMTiVjBoqdYI
 6a6Uixt+lxwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316982920"
Received: from unknown (HELO xzhan34-mobl2.bj.intel.com) ([10.238.154.62])
 by orsmga006.jf.intel.com with ESMTP; 09 Oct 2020 02:42:28 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/i915/gvt: GVTg support ggtt pv operations
Date: Fri,  9 Oct 2020 08:04:42 +0800
Message-Id: <1602201883-27829-12-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602201883-27829-1-git-send-email-xiaolin.zhang@intel.com>
References: <1602201883-27829-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: jani.nikula@linux.intel.com, kevin.tian@intel.com,
 Xiaolin Zhang <xiaolin.zhang@intel.com>, joonas.lahtinen@linux.intel.com,
 zhenyuw@linux.intel.com, chris@chris-wilson.co.uk, zhiyuan.lv@intel.com,
 zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This patch is to handle ppgtt PV_CMD_BIND_GGTT and PV_CMD_UNBIND_GGTT

for pv ggtt, it is operated (bind/unbind) per vma instead of per ggtt
entry mmio update to improve efficiency

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c      | 83 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/handlers.c |  4 ++
 drivers/gpu/drm/i915/gvt/vgpu.c     |  2 +-
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index c2b7527..7dcd427 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2734,6 +2734,83 @@ static void intel_vgpu_pv_ppgtt_unbind(struct intel_vgpu *vgpu,
 	}
 }
 
+static int intel_vgpu_pv_ggtt_bind(struct intel_vgpu *vgpu,
+				   struct intel_vgpu_pv_vma *vma, u64 *gpas)
+{
+	u64 off = (vma->start / I915_GTT_PAGE_SIZE) << 3;
+	u32 size = vma->size;
+	struct intel_vgpu_mm *ggtt_mm = vgpu->gtt.ggtt_mm;
+	struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
+	unsigned long g_gtt_index = off >> 3;
+	struct intel_gvt_gtt_entry e = {.val64 = 0, .type = GTT_TYPE_GGTT_PTE};
+	struct intel_gvt_gtt_entry m = {.val64 = 0, .type = GTT_TYPE_GGTT_PTE};
+	int ret = 0;
+	int i;
+	u64 gfn;
+	dma_addr_t dma_addr;
+
+	for (i = 0; i < size; i++) {
+		e.val64 = gpas[i];
+		if (!ops->test_present(&e)) {
+			ops->set_pfn(&m, vgpu->gvt->gtt.scratch_mfn);
+			ops->clear_present(&m);
+			goto out;
+		}
+
+		gfn = ops->get_pfn(&e);
+		m.val64 = e.val64;
+		ret = intel_gvt_hypervisor_dma_map_guest_page(vgpu, gfn,
+							      PAGE_SIZE, &dma_addr);
+		if (ret) {
+			gvt_vgpu_err("failed to map guest ggtt entry\n");
+			ops->set_pfn(&m, vgpu->gvt->gtt.scratch_mfn);
+		} else {
+			ops->set_pfn(&m, dma_addr >> PAGE_SHIFT);
+		}
+out:
+		g_gtt_index = off >> 3;
+		ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
+		ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
+		ggtt_invalidate_pte(vgpu, &e);
+		ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
+		off += 8;
+	}
+
+	ggtt_invalidate(vgpu->gvt->gt);
+	return ret;
+}
+
+static int intel_vgpu_pv_ggtt_unbind(struct intel_vgpu *vgpu,
+				     struct intel_vgpu_pv_vma *vma, u64 *gpas)
+{
+	u64 off = (vma->start / I915_GTT_PAGE_SIZE) << 3;
+	u32 size = vma->size;
+	struct intel_vgpu_mm *ggtt_mm = vgpu->gtt.ggtt_mm;
+	struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
+	unsigned long g_gtt_index = off >> 3;
+	struct intel_gvt_gtt_entry e = {.val64 = 0, .type = GTT_TYPE_GGTT_PTE};
+	struct intel_gvt_gtt_entry m = {.val64 = 0, .type = GTT_TYPE_GGTT_PTE};
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < size; i++) {
+		g_gtt_index = off >> 3;
+		e.val64 = gpas[i];
+		ggtt_invalidate_pte(vgpu, &e);
+		ops->clear_present(&e);
+		ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
+		ops->set_pfn(&m, vgpu->gvt->gtt.scratch_mfn);
+		ops->clear_present(&m);
+		ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
+		ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
+		off += 8;
+	}
+
+	ggtt_invalidate(vgpu->gvt->gt);
+
+	return ret;
+}
+
 int intel_vgpu_handle_pv_vma(struct intel_vgpu *vgpu,
 			     struct intel_vgpu_mm *mm, u32 cmd, u32 data[])
 {
@@ -2771,6 +2848,12 @@ int intel_vgpu_handle_pv_vma(struct intel_vgpu *vgpu,
 	case PV_CMD_BIND_PPGTT:
 		intel_vgpu_pv_ppgtt_bind(vgpu, mm, vma, dma_addrs);
 		break;
+	case PV_CMD_BIND_GGTT:
+		ret = intel_vgpu_pv_ggtt_bind(vgpu, vma, dma_addrs);
+		break;
+	case PV_CMD_UNBIND_GGTT:
+		ret = intel_vgpu_pv_ggtt_unbind(vgpu, vma, dma_addrs);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 732b4ed..7f83b77 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1348,6 +1348,10 @@ static int handle_pv_commands(struct intel_vgpu *vgpu)
 		}
 		ret = intel_vgpu_handle_pv_vma(vgpu, mm, cmd, data);
 		break;
+	case PV_CMD_BIND_GGTT:
+	case PV_CMD_UNBIND_GGTT:
+		ret = intel_vgpu_handle_pv_vma(vgpu, NULL, cmd, data);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index bf70e5517..c1e2f82 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -50,7 +50,7 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_HUGE_GTT;
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_PV;
 
-	vgpu_vreg_t(vgpu, vgtif_reg(pv_caps)) = PV_PPGTT;
+	vgpu_vreg_t(vgpu, vgtif_reg(pv_caps)) = PV_PPGTT | PV_GGTT;
 
 	vgpu_vreg_t(vgpu, vgtif_reg(avail_rs.mappable_gmadr.base)) =
 		vgpu_aperture_gmadr_base(vgpu);
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
