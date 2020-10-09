Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0438C28861F
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Oct 2020 11:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877C86EC97;
	Fri,  9 Oct 2020 09:42:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383656EC92;
 Fri,  9 Oct 2020 09:42:05 +0000 (UTC)
IronPort-SDR: ddmZ5g2feZAHS12uApRX9lZ4EBHUC/SDBvFrzRkUkwTvkuMPOCcZHBgW7F7qB6Nsr8Oy9ZcMvw
 MNXeLKoa78sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165525968"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165525968"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 02:42:04 -0700
IronPort-SDR: is0MM3peDcXNMuRcU99TcNb7wHnpS6GIb920zDuTUa7GGG0rDumRZVsos33mT/F5wRRlVz9BLi
 BVKzfMNXL2UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316982691"
Received: from unknown (HELO xzhan34-mobl2.bj.intel.com) ([10.238.154.62])
 by orsmga006.jf.intel.com with ESMTP; 09 Oct 2020 02:42:01 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/12] drm/i915: vgpu shared memory setup for pv support
Date: Fri,  9 Oct 2020 08:04:33 +0800
Message-Id: <1602201883-27829-3-git-send-email-xiaolin.zhang@intel.com>
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

To support vgpu pv features, a common shared memory is setup used for
communication and data exchange between guest and host GVTg to reduce
data access overhead and trap cost.

guest i915 will allocate this common memory (1 page size) and then pass
it's physical address to host GVTg through PVINFO register so that host
GVTg can access this shared guest page meory without trap cost with
hyperviser's facility.

guest i915 will send VGT_G2V_SHARED_PAGE_SETUP notification to host GVTg
once shared memory setup succcessfully finished.

the layout of the shared_page also defined as well, the first part is the
PV vervsion information used for compabilty support.

v2: addressed dim checkpatch issues and Jani Nikula's comment.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c    |  2 +
 drivers/gpu/drm/i915/i915_drv.h    |  2 +
 drivers/gpu/drm/i915/i915_pvinfo.h |  5 +-
 drivers/gpu/drm/i915/i915_vgpu.c   | 95 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vgpu.h   | 14 ++++++
 5 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index ebc1506..2b8e846 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -969,6 +969,8 @@ static void i915_driver_release(struct drm_device *dev)
 
 	disable_rpm_wakeref_asserts(rpm);
 
+	intel_vgpu_destroy(dev_priv);
+
 	i915_gem_driver_release(dev_priv);
 
 	intel_memory_regions_driver_release(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b854a53..9af915a 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -800,6 +800,8 @@ struct i915_virtual_gpu {
 	bool active;
 	u32 caps;
 	u32 pv_caps;
+
+	struct intel_vgpu_pv *pv;
 };
 
 struct intel_cdclk_config {
diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h b/drivers/gpu/drm/i915/i915_pvinfo.h
index 8b0dc25..1d44876 100644
--- a/drivers/gpu/drm/i915/i915_pvinfo.h
+++ b/drivers/gpu/drm/i915/i915_pvinfo.h
@@ -48,6 +48,7 @@ enum vgt_g2v_type {
 	VGT_G2V_PPGTT_L4_PAGE_TABLE_DESTROY,
 	VGT_G2V_EXECLIST_CONTEXT_CREATE,
 	VGT_G2V_EXECLIST_CONTEXT_DESTROY,
+	VGT_G2V_SHARED_PAGE_REGISTER,
 	VGT_G2V_MAX,
 };
 
@@ -112,7 +113,9 @@ struct vgt_if {
 
 	u32 pv_caps;
 
-	u32  rsv7[0x200 - 25];    /* pad to one page */
+	u64 shared_page_gpa;
+
+	u32  rsv7[0x200 - 27];    /* pad to one page */
 } __packed;
 
 #define vgtif_offset(x) (offsetof(struct vgt_if, x))
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index d0c9cee..146877f 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -112,6 +112,17 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
 	pci_iounmap(pdev, shared_area);
 }
 
+void intel_vgpu_destroy(struct drm_i915_private *i915)
+{
+	struct intel_vgpu_pv *pv = i915->vgpu.pv;
+
+	if (!intel_vgpu_active(i915) || !pv)
+		return;
+
+	__free_page(virt_to_page(pv->mem));
+	kfree(pv);
+}
+
 void intel_vgpu_register(struct drm_i915_private *i915)
 {
 	/*
@@ -363,6 +374,84 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
  */
 
 /*
+ * shared_page setup for VGPU PV features
+ */
+static int intel_vgpu_pv_setup_shared_page(struct drm_i915_private *i915,
+					   void __iomem *shared_area)
+{
+	void __iomem *addr;
+	struct intel_vgpu_pv *pv;
+	struct intel_vgpu_pv_shared_page *base;
+	u64 gpa;
+	u16 ver_maj, ver_min;
+	int ret = 0;
+
+	/* We allocate 1 page shared between guest and GVT for data exchange.
+	 *       _______________________________
+	 *      |version                        |
+	 *      |_______________________________PAGE/8
+	 *      |                               |
+	 *      |_______________________________PAGE/4
+	 *      |                               |
+	 *      |                               |
+	 *      |                               |
+	 *      |_______________________________PAGE/2
+	 *      |                               |
+	 *      |                               |
+	 *      |                               |
+	 *      |                               |
+	 *      |                               |
+	 *      |                               |
+	 *      |                               |
+	 *      |_______________________________|
+	 *
+	 * 0 offset: PV version area
+	 */
+
+	base = (struct intel_vgpu_pv_shared_page *)get_zeroed_page(GFP_KERNEL);
+	if (!base) {
+		drm_dbg(&i915->drm, "out of memory for shared memory\n");
+		return -ENOMEM;
+	}
+
+	/* pass guest memory pa address to GVT and then read back to verify */
+	gpa = __pa(base);
+	addr = shared_area + vgtif_offset(shared_page_gpa);
+	writeq(gpa, addr);
+	if (gpa != readq(addr)) {
+		drm_dbg(&i915->drm, "write shared_page_gpa failed\n");
+		ret = -EIO;
+		goto err;
+	}
+
+	addr = shared_area + vgtif_offset(g2v_notify);
+	writel(VGT_G2V_SHARED_PAGE_REGISTER, addr);
+
+	ver_maj = base->ver_major;
+	ver_min = base->ver_minor;
+	if (ver_maj != PV_MAJOR || ver_min != PV_MINOR) {
+		drm_dbg(&i915->drm, "vgpu PV version incompatible\n");
+		ret = -EIO;
+		goto err;
+	}
+
+	pv = kzalloc(sizeof(*pv), GFP_KERNEL);
+	if (!pv) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	drm_dbg(&i915->drm,
+		"vgpu PV version major %d and minor %d\n", ver_maj, ver_min);
+	i915->vgpu.pv = pv;
+	pv->mem = base;
+	return ret;
+err:
+	__free_page(virt_to_page(base));
+	return ret;
+}
+
+/*
  * Config vgpu PV ops for different PV capabilities
  */
 void intel_vgpu_pv_config_caps(struct drm_i915_private *i915,
@@ -396,5 +485,11 @@ bool intel_vgpu_pv_detect_caps(struct drm_i915_private *i915,
 	if (!pvcaps)
 		return false;
 
+	if (intel_vgpu_pv_setup_shared_page(i915, shared_area)) {
+		i915->vgpu.pv_caps = 0;
+		writel(0, shared_area + vgtif_offset(pv_caps));
+		return false;
+	}
+
 	return true;
 }
diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
index 1dccea6..ab8d25b 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.h
+++ b/drivers/gpu/drm/i915/i915_vgpu.h
@@ -29,12 +29,26 @@
 struct drm_i915_private;
 struct i915_ggtt;
 
+#define PV_MAJOR        0
+#define PV_MINOR        1
+
 /* intel vGPU PV capabilities */
 enum intel_vgpu_pv_caps {
 	PV_NONE = 0,
 };
 
+/* A shared memory(4KB) between GVTg and vgpu allocated by guest */
+struct intel_vgpu_pv_shared_page {
+	u16 ver_major;
+	u16 ver_minor;
+};
+
+struct intel_vgpu_pv {
+	struct intel_vgpu_pv_shared_page *mem;
+};
+
 void intel_vgpu_detect(struct drm_i915_private *i915);
+void intel_vgpu_destroy(struct drm_i915_private *i915);
 bool intel_vgpu_active(struct drm_i915_private *i915);
 void intel_vgpu_register(struct drm_i915_private *i915);
 bool intel_vgpu_has_full_ppgtt(struct drm_i915_private *i915);
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
