Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A425F13B
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Sep 2020 02:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148DA6E03F;
	Mon,  7 Sep 2020 00:55:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2625C6E03F;
 Mon,  7 Sep 2020 00:55:34 +0000 (UTC)
IronPort-SDR: 8WpYPH0fUWCHCQXauM+8DIIAtfThmYrNphojC7r9YRU3ULX5zVmkUQJ4XAwPI6LVZaVhOmvf8W
 ooxxv1rDvPvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157950629"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157950629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 17:55:33 -0700
IronPort-SDR: zr4/ZyuFHjW5xoaTmbrawxWF5iAmw1+dKLCqt1ecczbDF3sqJbeM7210ednU27FkbcDoqOlkbk
 XA6Bg8IsnOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="479443883"
Received: from xzhan34-mobl2.bj.intel.com ([10.238.154.74])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2020 17:55:30 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 04/12] drm/i915: vgpu ppgtt page table pv support
Date: Sat,  5 Sep 2020 00:21:37 +0800
Message-Id: <1599236505-9086-5-git-send-email-xiaolin.zhang@intel.com>
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
 drivers/gpu/drm/i915/i915_vgpu.c     | 95 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vgpu.h     | 17 +++++++
 3 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index eb64f47..de0eb6d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -729,8 +729,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 
 	ppgtt->vm.pte_encode = gen8_pte_encode;
 
-	if (intel_vgpu_active(gt->i915))
+	if (intel_vgpu_active(gt->i915)) {
+		intel_vgpu_config_pv_caps(gt->i915, PV_PPGTT, ppgtt);
 		gen8_ppgtt_notify_vgt(ppgtt, true);
+	}
 
 	ppgtt->vm.cleanup = gen8_ppgtt_cleanup;
 
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index e856eff..9875e2f 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -99,6 +99,9 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
 	dev_priv->vgpu.active = true;
 	mutex_init(&dev_priv->vgpu.lock);
 
+	/* guest driver PV capability */
+	dev_priv->vgpu.pv_caps = PV_PPGTT;
+
 	if (!intel_vgpu_detect_pv_caps(dev_priv, shared_area)) {
 		DRM_INFO("Virtual GPU for Intel GVT-g detected.\n");
 		goto out;
@@ -370,6 +373,91 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
  * i915 vgpu PV support for Linux
  */
 
+static int vgpu_pv_vma_action(struct i915_address_space *vm,
+		struct i915_vma *vma,
+		u32 action, u64 flags, u64 pte_flag)
+{
+	struct drm_i915_private *i915 = vma->vm->i915;
+	struct sgt_iter sgt_iter;
+	dma_addr_t addr;
+	struct pv_vma pvvma;
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
+	if (gpas == NULL)
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
+static void ppgtt_bind_vma_pv(struct i915_address_space *vm,
+		    struct i915_vm_pt_stash *stash,
+		    struct i915_vma *vma,
+		    enum i915_cache_level cache_level,
+		    u32 flags)
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
+	vgpu_pv_vma_action(vm, vma, PV_CMD_BIND_PPGTT, flags, pte_encode);
+}
+
+static void ppgtt_unbind_vma_pv(struct i915_address_space *vm,
+		struct i915_vma *vma)
+{
+	if (test_and_clear_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma)))
+		vgpu_pv_vma_action(vm, vma, PV_CMD_UNBIND_PPGTT, 0, 0);
+}
+
 /**
  * wait_for_desc_update - Wait for the command buffer descriptor update.
  * @desc:	buffer descriptor
@@ -644,9 +732,16 @@ static int intel_vgpu_setup_shared_page(struct drm_i915_private *i915,
 void intel_vgpu_config_pv_caps(struct drm_i915_private *i915,
 		enum pv_caps cap, void *data)
 {
+	struct i915_ppgtt *ppgtt;
 
 	if (!intel_vgpu_check_pv_cap(i915, cap))
 		return;
+
+	if (cap == PV_PPGTT) {
+		ppgtt = (struct i915_ppgtt *)data;
+		ppgtt->vm.vma_ops.bind_vma    = ppgtt_bind_vma_pv;
+		ppgtt->vm.vma_ops.unbind_vma  = ppgtt_unbind_vma_pv;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
index f2826f9..7e4ea99 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.h
+++ b/drivers/gpu/drm/i915/i915_vgpu.h
@@ -37,6 +37,14 @@ struct i915_ggtt;
 /* define different PV capabilities */
 enum pv_caps {
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
 
 /* A common shared page(4KB) between GVTg and vgpu allocated by guest */
@@ -45,6 +53,15 @@ struct gvt_shared_page {
 	u16 ver_minor;
 };
 
+/* PV virtual memory address for GGTT/PPGTT */
+struct pv_vma {
+	u32 size; /* num of pages */
+	u32 flags; /* bind or unbind flags */
+	u64 start; /* start of virtual address */
+	u64 dma_addrs; /* BO's dma address list */
+	u64 pml4; /* ppgtt handler */
+} __packed;
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
