Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E371225F141
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Sep 2020 02:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA206E0D9;
	Mon,  7 Sep 2020 00:55:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500A6E03F;
 Mon,  7 Sep 2020 00:55:49 +0000 (UTC)
IronPort-SDR: aqYUBejQp0hI+p7anU2pNUJR+173+y0qMTP4nfT3jXNf8sszy9wosdPZqUi+WE3IvXr23UPEnz
 T5yq/9LLxuxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157950645"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157950645"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 17:55:48 -0700
IronPort-SDR: LLRGS5rfrz119c2BoHTTSBerk4PRia//2cxn3wtttbu7mipvDflKNqYnG4eFTfDlx0Rxy6GFMj
 6lU5gerVZ/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="479443942"
Received: from xzhan34-mobl2.bj.intel.com ([10.238.154.74])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2020 17:55:43 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 07/12] drm/i915/gvt: GVTg expose pv_caps PVINFO register
Date: Sat,  5 Sep 2020 00:21:40 +0800
Message-Id: <1599236505-9086-8-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: kevin.tian@intel.com, Xiaolin Zhang <xiaolin.zhang@intel.com>,
 joonas.lahtinen@linux.intel.com, zhenyuw@linux.intel.com,
 chris@chris-wilson.co.uk, zhiyuan.lv@intel.com, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

expose pv_caps PVINFO register from GVTg to guest in order that guest can
query and control different pv capability support.

report VGT_CAPS_PV capability in pvinfo page for guest.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h      | 8 ++++++++
 drivers/gpu/drm/i915/gvt/handlers.c | 5 +++++
 drivers/gpu/drm/i915/gvt/vgpu.c     | 1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 9831361..31d8a2bcc 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -49,6 +49,7 @@
 #include "fb_decoder.h"
 #include "dmabuf.h"
 #include "page_track.h"
+#include "i915_vgpu.h"
 
 #define GVT_MAX_VGPU 8
 
@@ -212,6 +213,7 @@ struct intel_vgpu {
 	struct idr object_idr;
 
 	u32 scan_nonprivbb;
+	u32 pv_caps;
 };
 
 static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
@@ -531,6 +533,12 @@ static inline u64 intel_vgpu_get_bar_gpa(struct intel_vgpu *vgpu, int bar)
 			PCI_BASE_ADDRESS_MEM_MASK;
 }
 
+static inline bool intel_vgpu_enabled_pv_cap(struct intel_vgpu *vgpu,
+		enum pv_caps cap)
+{
+	return (vgpu->pv_caps & cap);
+}
+
 void intel_vgpu_clean_opregion(struct intel_vgpu *vgpu);
 int intel_vgpu_init_opregion(struct intel_vgpu *vgpu);
 int intel_vgpu_opregion_base_write_handler(struct intel_vgpu *vgpu, u32 gpa);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index ee3648d..bfea065 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1203,6 +1203,7 @@ static int pvinfo_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 		break;
 	case 0x78010:	/* vgt_caps */
 	case 0x7881c:
+	case _vgtif_reg(pv_caps):
 		break;
 	default:
 		invalid_read = true;
@@ -1272,6 +1273,10 @@ static int pvinfo_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	case _vgtif_reg(g2v_notify):
 		handle_g2v_notification(vgpu, data);
 		break;
+	case _vgtif_reg(pv_caps):
+		DRM_INFO("vgpu id=%d pv caps =0x%x\n", vgpu->id, data);
+		vgpu->pv_caps = data;
+		break;
 	/* add xhot and yhot to handled list to avoid error log */
 	case _vgtif_reg(cursor_x_hot):
 	case _vgtif_reg(cursor_y_hot):
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 8fa9b31..4867426 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -48,6 +48,7 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) = VGT_CAPS_FULL_PPGTT;
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_HWSP_EMULATION;
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_HUGE_GTT;
+	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_PV;
 
 	vgpu_vreg_t(vgpu, vgtif_reg(avail_rs.mappable_gmadr.base)) =
 		vgpu_aperture_gmadr_base(vgpu);
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
