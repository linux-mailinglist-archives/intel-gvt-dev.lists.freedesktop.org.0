Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C1288625
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Oct 2020 11:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FC86EC9E;
	Fri,  9 Oct 2020 09:42:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD5D6ECA0;
 Fri,  9 Oct 2020 09:42:13 +0000 (UTC)
IronPort-SDR: K2XQ//MmaSd+GZT0QgbUdg5laUnaFyRM+1Mx39/39peMet/tMwKd6SzFRDZzjaTVRQUzIWIuWA
 A5x3Mea9jLlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165525994"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165525994"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 02:42:13 -0700
IronPort-SDR: Cubz0TZCIt9SOmCRYHkBh8BXdIN1SnGNe9A3Q55ny7Bk1TgknSVP3cOayM48L98HhL0L8e+7oE
 hzSym5M3pvxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316982770"
Received: from unknown (HELO xzhan34-mobl2.bj.intel.com) ([10.238.154.62])
 by orsmga006.jf.intel.com with ESMTP; 09 Oct 2020 02:42:10 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/12] drm/i915: vgpu ggtt page table pv support
Date: Fri,  9 Oct 2020 08:04:36 +0800
Message-Id: <1602201883-27829-6-git-send-email-xiaolin.zhang@intel.com>
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

to improve efficiency and reduce the complexsity of vgpu ggtt support,
vgpu ggtt page table operations are implemented in pv fashion and
implemented pv version of bind/unbind for ggtt vma ops.

The pv version of ggtt vma ops use the CTB protocol to communicate pv ggtt
command along with data struct pv_vma from guest to GVT and then GVT will
implement command handler of PV_CMD_BIND_GGTT and PV_CMD_UBIND_gGTT to
support vgpu GGTT feature.

new PV_GGTT pv_cap is used to control this level of pv support in
both guest and host side.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c  |  4 +++-
 drivers/gpu/drm/i915/i915_vgpu.c | 36 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_vgpu.h |  3 +++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index bb0c129..cc4d28c 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1129,9 +1129,11 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	int ret;
 
 	/* We need to fallback to 4K pages if host doesn't support huge gtt. */
-	if (intel_vgpu_active(dev_priv) && !intel_vgpu_has_huge_gtt(dev_priv))
+	if (intel_vgpu_active(dev_priv)) {
 		mkwrite_device_info(dev_priv)->page_sizes =
 			I915_GTT_PAGE_SIZE_4K;
+		intel_vgpu_pv_config_caps(dev_priv, PV_GGTT, &dev_priv->ggtt);
+	}
 
 	ret = i915_gem_init_userptr(dev_priv);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index 81be1db5..b11fcae 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -100,7 +100,7 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
 	mutex_init(&dev_priv->vgpu.lock);
 
 	/* guest driver PV capability */
-	dev_priv->vgpu.pv_caps = PV_PPGTT;
+	dev_priv->vgpu.pv_caps = PV_PPGTT | PV_GGTT;
 
 	if (intel_vgpu_pv_detect_caps(dev_priv, shared_area)) {
 		drm_info(&dev_priv->drm,
@@ -461,6 +461,33 @@ static void intel_vgpu_pv_ppgtt_unbind(struct i915_address_space *vm,
 		intel_vgpu_pv_vma_action(vm, vma, PV_CMD_UNBIND_PPGTT, 0, 0);
 }
 
+static void intel_vgpu_pv_ggtt_bind(struct i915_address_space *vm,
+				    struct i915_vm_pt_stash *stash,
+				    struct i915_vma *vma,
+				    enum i915_cache_level cache_level,
+				    u32 flags)
+{
+	struct drm_i915_gem_object *obj = vma->obj;
+	u32 pte_flags;
+
+	if (i915_vma_is_bound(vma, ~flags & I915_VMA_BIND_MASK))
+		return;
+
+	/* Applicable to VLV (gen8+ do not support RO in the GGTT) */
+	pte_flags = 0;
+	if (i915_gem_object_is_readonly(obj))
+		pte_flags |= PTE_READ_ONLY;
+
+	pte_flags = vma->vm->pte_encode(0, cache_level, 0);
+	intel_vgpu_pv_vma_action(vm, vma, PV_CMD_BIND_GGTT, 0, pte_flags);
+	vma->page_sizes.gtt = I915_GTT_PAGE_SIZE;
+}
+
+static void intel_vgpu_pv_ggtt_unbind_nop(struct i915_address_space *vm,
+					  struct i915_vma *vma)
+{
+}
+
 /**
  * intel_vgpu_pv_wait_desc_update - Wait the command buffer descriptor update.
  * @desc:	buffer descriptor
@@ -744,6 +771,7 @@ void intel_vgpu_pv_config_caps(struct drm_i915_private *i915,
 			       enum intel_vgpu_pv_caps cap, void *data)
 {
 	struct i915_ppgtt *ppgtt;
+	struct i915_ggtt *ggtt;
 
 	if (!intel_vgpu_pv_check_cap(i915, cap))
 		return;
@@ -753,6 +781,12 @@ void intel_vgpu_pv_config_caps(struct drm_i915_private *i915,
 		ppgtt->vm.vma_ops.bind_vma    = intel_vgpu_pv_ppgtt_bind;
 		ppgtt->vm.vma_ops.unbind_vma  = intel_vgpu_pv_ppgtt_unbind;
 	}
+
+	if (cap == PV_GGTT) {
+		ggtt = (struct i915_ggtt *)data;
+		ggtt->vm.vma_ops.bind_vma    = intel_vgpu_pv_ggtt_bind;
+		ggtt->vm.vma_ops.unbind_vma  = intel_vgpu_pv_ggtt_unbind_nop;
+	}
 }
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
index 49fc174..39acd93 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.h
+++ b/drivers/gpu/drm/i915/i915_vgpu.h
@@ -38,6 +38,7 @@ struct i915_ggtt;
 enum intel_vgpu_pv_caps {
 	PV_NONE = 0,
 	PV_PPGTT = BIT(0),
+	PV_GGTT = BIT(1),
 };
 
 /* vgpu PV commands */
@@ -45,6 +46,8 @@ enum intel_vgpu_pv_cmd {
 	PV_CMD_DEFAULT = 0x0,
 	PV_CMD_BIND_PPGTT,
 	PV_CMD_UNBIND_PPGTT,
+	PV_CMD_BIND_GGTT,
+	PV_CMD_UNBIND_GGTT,
 };
 
 /* A shared memory(4KB) between GVTg and vgpu allocated by guest */
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
