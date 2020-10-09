Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63174288622
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Oct 2020 11:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF926EC99;
	Fri,  9 Oct 2020 09:42:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C1C6EC99;
 Fri,  9 Oct 2020 09:42:10 +0000 (UTC)
IronPort-SDR: m4lLJYWlKr7J/j5ve1usSdycaggY4O5IxYLjUIINnJSDTyeJwmW/dz2P/1OHsf4zWjx9YedIk5
 jXPwPZqfap1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165525990"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165525990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 02:42:10 -0700
IronPort-SDR: P/o0qvVH1XESVmrNYj40y6SfeNAqY73yqYCYzdVvwR0frKlFY7xnLu2tM6kOQGnJAZj3PRxD1w
 sqiGKZ0a486w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316982725"
Received: from unknown (HELO xzhan34-mobl2.bj.intel.com) ([10.238.154.62])
 by orsmga006.jf.intel.com with ESMTP; 09 Oct 2020 02:42:07 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/12] drm/i915: vgpu ppgtt page table pv support
Date: Fri,  9 Oct 2020 08:04:35 +0800
Message-Id: <1602201883-27829-5-git-send-email-xiaolin.zhang@intel.com>
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

to improve efficiency and reduce the complexsity of vgpu ppgtt support,
vgpu ppgtt page table operations are implemented in pv fashion and
implemented pv version of bind/unbind for ppgtt vma ops.

The pv version of ppgtt vma ops use the CTB protocol to communicate
pv ppgtt command along with data struct pv_vma from guest to GVT
and then GVT will implement command handler of PV_CMD_BIND_PPGTT and
PV_CMD_UBIND_PPGTT to support vgpu PPGTT feature.

new PV_PPGTT pv_cap is used to control this level of pv support in
both guest and host side.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c |  4 +-
 drivers/gpu/drm/i915/i915_vgpu.c     | 96 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vgpu.h     | 17 +++++++
 3 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index b236aa0..d5c6007 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -732,8 +732,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 
 	ppgtt->vm.pte_encode = gen8_pte_encode;
 
-	if (intel_vgpu_active(gt->i915))
+	if (intel_vgpu_active(gt->i915)) {
+		intel_vgpu_pv_config_caps(gt->i915, PV_PPGTT, ppgtt);
 		gen8_ppgtt_notify_vgt(ppgtt, true);
+	}
 
 	ppgtt->vm.cleanup = gen8_ppgtt_cleanup;
 
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index c833823..81be1db5 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -99,6 +99,9 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
 	dev_priv->vgpu.active = true;
 	mutex_init(&dev_priv->vgpu.lock);
 
+	/* guest driver PV capability */
+	dev_priv->vgpu.pv_caps = PV_PPGTT;
+
 	if (intel_vgpu_pv_detect_caps(dev_priv, shared_area)) {
 		drm_info(&dev_priv->drm,
 			 "Virtual GPU for Intel GVT-g detected with PV Capabilities.\n");
@@ -373,6 +376,91 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
  * i915 vgpu PV support for Linux
  */
 
+static int intel_vgpu_pv_vma_action(struct i915_address_space *vm,
+				    struct i915_vma *vma, u32 action,
+				    u64 flags, u64 pte_flag)
+{
+	struct drm_i915_private *i915 = vma->vm->i915;
+	struct sgt_iter sgt_iter;
+	dma_addr_t addr;
+	struct intel_vgpu_pv_vma pvvma;
+	u32 num_pages;
+	u64 *gpas;
+	int i = 0;
+	u32 data[32];
+	int ret;
+	u32 size = sizeof(pvvma) / 4;
+
+	if (1 + size > ARRAY_SIZE(data))
+		return -EIO;
+
+	memset(&pvvma, 0, sizeof(pvvma));
+	num_pages = vma->node.size >> PAGE_SHIFT;
+	pvvma.size = num_pages;
+	pvvma.start = vma->node.start;
+	pvvma.flags = flags;
+
+	if (action == PV_CMD_BIND_PPGTT || action == PV_CMD_UNBIND_PPGTT)
+		pvvma.pml4 = px_dma(i915_vm_to_ppgtt(vm)->pd);
+
+	if (num_pages == 1) {
+		pvvma.dma_addrs = vma->pages->sgl->dma_address | pte_flag;
+		goto out;
+	}
+
+	gpas = kmalloc_array(num_pages, sizeof(u64), GFP_KERNEL);
+	if (!gpas)
+		return -ENOMEM;
+
+	pvvma.dma_addrs = virt_to_phys((void *)gpas);
+	for_each_sgt_daddr(addr, sgt_iter, vma->pages)
+		gpas[i++] = addr | pte_flag;
+
+	/* Fill the allocated but "unused" space beyond the end of the buffer */
+	while (i < num_pages)
+		gpas[i++] = vm->scratch[0]->encode;
+out:
+	data[0] = action;
+	memcpy(&data[1], &pvvma, sizeof(pvvma));
+	ret = i915->vgpu.pv->send(i915, data, 1 + size);
+
+	if (num_pages > 1)
+		kfree(gpas);
+
+	return ret;
+}
+
+static void intel_vgpu_pv_ppgtt_bind(struct i915_address_space *vm,
+				     struct i915_vm_pt_stash *stash,
+				     struct i915_vma *vma,
+				     enum i915_cache_level cache_level,
+				     u32 flags)
+{
+	u32 pte_flags;
+	u64 pte_encode;
+
+	if (!test_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma))) {
+		set_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma));
+		flags |= BIT(I915_VMA_ALLOC_BIT);
+	}
+
+	/* Applicable to VLV, and gen8+ */
+	pte_flags = 0;
+	if (i915_gem_object_is_readonly(vma->obj))
+		pte_flags |= PTE_READ_ONLY;
+
+	pte_encode = vma->vm->pte_encode(0, cache_level, pte_flags);
+
+	intel_vgpu_pv_vma_action(vm, vma, PV_CMD_BIND_PPGTT, flags, pte_encode);
+}
+
+static void intel_vgpu_pv_ppgtt_unbind(struct i915_address_space *vm,
+				       struct i915_vma *vma)
+{
+	if (test_and_clear_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma)))
+		intel_vgpu_pv_vma_action(vm, vma, PV_CMD_UNBIND_PPGTT, 0, 0);
+}
+
 /**
  * intel_vgpu_pv_wait_desc_update - Wait the command buffer descriptor update.
  * @desc:	buffer descriptor
@@ -655,8 +743,16 @@ static int intel_vgpu_pv_setup_shared_page(struct drm_i915_private *i915,
 void intel_vgpu_pv_config_caps(struct drm_i915_private *i915,
 			       enum intel_vgpu_pv_caps cap, void *data)
 {
+	struct i915_ppgtt *ppgtt;
+
 	if (!intel_vgpu_pv_check_cap(i915, cap))
 		return;
+
+	if (cap == PV_PPGTT) {
+		ppgtt = (struct i915_ppgtt *)data;
+		ppgtt->vm.vma_ops.bind_vma    = intel_vgpu_pv_ppgtt_bind;
+		ppgtt->vm.vma_ops.unbind_vma  = intel_vgpu_pv_ppgtt_unbind;
+	}
 }
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
index 18f2dd0..49fc174 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.h
+++ b/drivers/gpu/drm/i915/i915_vgpu.h
@@ -37,6 +37,14 @@ struct i915_ggtt;
 /* intel vGPU PV capabilities */
 enum intel_vgpu_pv_caps {
 	PV_NONE = 0,
+	PV_PPGTT = BIT(0),
+};
+
+/* vgpu PV commands */
+enum intel_vgpu_pv_cmd {
+	PV_CMD_DEFAULT = 0x0,
+	PV_CMD_BIND_PPGTT,
+	PV_CMD_UNBIND_PPGTT,
 };
 
 /* A shared memory(4KB) between GVTg and vgpu allocated by guest */
@@ -45,6 +53,15 @@ struct intel_vgpu_pv_shared_page {
 	u16 ver_minor;
 };
 
+/* PV virtual memory address for GGTT/PPGTT */
+struct intel_vgpu_pv_vma {
+	u32 size; /* num of pages */
+	u32 flags; /* bind or unbind flags */
+	u64 start; /* start of virtual address */
+	u64 dma_addrs; /* BO's dma address list */
+	u64 pml4; /* ppgtt handler */
+};
+
 /*
  * Definition of the command transport message header (DW0)
  *
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
