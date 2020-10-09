Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C403288620
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Oct 2020 11:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2146EC95;
	Fri,  9 Oct 2020 09:42:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74FA6EC95;
 Fri,  9 Oct 2020 09:42:07 +0000 (UTC)
IronPort-SDR: 8pazNktCwHv0VmQX6VFcM7hvNIN1gccZKY+X2+YiH8EmjGlXLElvU7R6XFdciazoe4zl6rerKi
 zGs6LxdEo+VQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165525979"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165525979"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 02:42:07 -0700
IronPort-SDR: K0AARgMgY02LRKOVaXGIB59zrhkv8bgeUz3Q6L3u4IxAOtTB+TzNVnpu3jhmqw+jNjQ7hl2j3Z
 FfAXLiSZdfQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316982711"
Received: from unknown (HELO xzhan34-mobl2.bj.intel.com) ([10.238.154.62])
 by orsmga006.jf.intel.com with ESMTP; 09 Oct 2020 02:42:04 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/12] drm/i915: vgpu pv command buffer transport protocol
Date: Fri,  9 Oct 2020 08:04:34 +0800
Message-Id: <1602201883-27829-4-git-send-email-xiaolin.zhang@intel.com>
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

based on the common shared memory, vgpu pv command transport buffer (CTB)
protocol is implemented which is a simple pv command buffer ring with pv
command descriptor used to perform guest-2-gvt single direction commucation
between guest and host GVTg.

with this CTB, guest can send PV command with PV data to host to perform PV
commands in host side.

v2: addressed dim checkpatch issues and Jani Nikula's comment.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/i915_pvinfo.h |   1 +
 drivers/gpu/drm/i915/i915_vgpu.c   | 202 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_vgpu.h   |  53 ++++++++++
 3 files changed, 254 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h b/drivers/gpu/drm/i915/i915_pvinfo.h
index 1d44876..ded93c5 100644
--- a/drivers/gpu/drm/i915/i915_pvinfo.h
+++ b/drivers/gpu/drm/i915/i915_pvinfo.h
@@ -49,6 +49,7 @@ enum vgt_g2v_type {
 	VGT_G2V_EXECLIST_CONTEXT_CREATE,
 	VGT_G2V_EXECLIST_CONTEXT_DESTROY,
 	VGT_G2V_SHARED_PAGE_REGISTER,
+	VGT_G2V_PV_SEND_TRIGGER,
 	VGT_G2V_MAX,
 };
 
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index 146877f..c833823 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -373,6 +373,189 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
  * i915 vgpu PV support for Linux
  */
 
+/**
+ * intel_vgpu_pv_wait_desc_update - Wait the command buffer descriptor update.
+ * @desc:	buffer descriptor
+ * @fence:	response fence
+ * @status:	placeholder for status
+ *
+ * GVTg will update command buffer descriptor with new fence and status
+ * after processing the command identified by the fence. Wait for
+ * specified fence and then read from the descriptor status of the
+ * command.
+ *
+ * Return:
+ * *	0 response received (status is valid)
+ * *	-ETIMEDOUT no response within hardcoded timeout
+ */
+static int
+intel_vgpu_pv_wait_desc_update(struct drm_i915_private *i915,
+			       struct intel_vgpu_pv_ct_buf_desc *desc,
+			       u32 fence, u32 *status)
+{
+	int err;
+
+#define done (READ_ONCE(desc->fence) == fence)
+	err = wait_for_us(done, 5);
+	if (err)
+		err = wait_for(done, 10);
+#undef done
+
+	if (unlikely(err)) {
+		drm_err(&i915->drm, "CT: fence %u failed; reported fence=%u\n",
+			fence, desc->fence);
+	}
+
+	*status = desc->status;
+
+	return err;
+}
+
+/*
+ * CTB Guest to GVT request
+ *
+ * Format of the CTB Guest to GVT request message is as follows::
+ *
+ *      +------------+---------+---------+---------+---------+
+ *      |   msg[0]   |   [1]   |   [2]   |   ...   |  [n-1]  |
+ *      +------------+---------+---------+---------+---------+
+ *      |   MESSAGE  |       MESSAGE PAYLOAD                 |
+ *      +   HEADER   +---------+---------+---------+---------+
+ *      |            |    0    |    1    |   ...   |    n    |
+ *      +============+=========+=========+=========+=========+
+ *      |  len >= 1  |  FENCE  |     request specific data   |
+ *      +------+-----+---------+---------+---------+---------+
+ *
+ *                   ^-----------------len-------------------^
+ */
+static int intel_vgpu_pv_cmd_buf_write(struct intel_vgpu_pv *pv,
+				       const u32 *action,
+				       u32 len /* in dwords */, u32 fence)
+{
+	struct intel_vgpu_pv_ct_buf_desc *desc = pv->ctb.desc;
+	u32 head = desc->head / 4;	/* in dwords */
+	u32 tail = desc->tail / 4;	/* in dwords */
+	u32 size = desc->size / 4;	/* in dwords */
+	u32 used;			/* in dwords */
+	u32 header;
+	u32 *cmds = pv->ctb.cmds;
+	unsigned int i;
+
+	GEM_BUG_ON(desc->size % 4);
+	GEM_BUG_ON(desc->head % 4);
+	GEM_BUG_ON(desc->tail % 4);
+	GEM_BUG_ON(tail >= size);
+
+	 /* tail == head condition indicates empty */
+	if (tail < head)
+		used = (size - head) + tail;
+	else
+		used = tail - head;
+
+	/* make sure there is a space including extra dw for the fence */
+	if (unlikely(used + len + 1 >= size))
+		return -ENOSPC;
+
+	/*
+	 * Write the message. The format is the following:
+	 * DW0: header (including action code)
+	 * DW1: fence
+	 * DW2+: action data
+	 */
+	header = (len << PV_CT_MSG_LEN_SHIFT) |
+		 (PV_CT_MSG_WRITE_FENCE_TO_DESC) |
+		 (action[0] << PV_CT_MSG_ACTION_SHIFT);
+
+	cmds[tail] = header;
+	tail = (tail + 1) % size;
+
+	cmds[tail] = fence;
+	tail = (tail + 1) % size;
+
+	for (i = 1; i < len; i++) {
+		cmds[tail] = action[i];
+		tail = (tail + 1) % size;
+	}
+
+	/* now update desc tail (back in bytes) */
+	desc->tail = tail * 4;
+	GEM_BUG_ON(desc->tail > desc->size);
+
+	return 0;
+}
+
+static u32 intel_vgpu_pv_get_next_fence(struct intel_vgpu_pv *pv)
+{
+	/* For now it's trivial */
+	return ++pv->next_fence;
+}
+
+static int intel_vgpu_pv_send(struct drm_i915_private *i915,
+			      const u32 *action, u32 len, u32 *status)
+{
+	struct i915_virtual_gpu *vgpu = &i915->vgpu;
+	struct intel_vgpu_pv *pv = vgpu->pv;
+
+	struct intel_vgpu_pv_ct_buf_desc *desc = pv->ctb.desc;
+
+	u32 fence;
+	int err;
+
+	GEM_BUG_ON(!len);
+	GEM_BUG_ON(len & ~PV_CT_MSG_LEN_MASK);
+
+	fence = intel_vgpu_pv_get_next_fence(pv);
+	err = intel_vgpu_pv_cmd_buf_write(pv, action, len, fence);
+	if (unlikely(err))
+		goto unlink;
+
+	i915->vgpu.pv->notify(i915);
+
+	err = intel_vgpu_pv_wait_desc_update(i915, desc, fence, status);
+	if (unlikely(err))
+		goto unlink;
+
+	if ((*status)) {
+		err = -EIO;
+		goto unlink;
+	}
+
+	err = (*status);
+
+unlink:
+	return err;
+}
+
+static int intel_vgpu_pv_send_cmd_buf(struct drm_i915_private *i915,
+				      u32 *action, u32 len)
+{
+	struct i915_virtual_gpu *vgpu = &i915->vgpu;
+	unsigned long flags;
+
+	u32 status = ~0; /* undefined */
+	int ret;
+
+	spin_lock_irqsave(&vgpu->pv->lock, flags);
+
+	ret = intel_vgpu_pv_send(i915, action, len, &status);
+	if (unlikely(ret < 0)) {
+		drm_err(&i915->drm, "PV: send action %#X failed; err=%d status=%#X\n",
+			action[0], ret, status);
+	} else if (unlikely(ret)) {
+		drm_err(&i915->drm, "PV: send action %#x returned %d (%#x)\n",
+			action[0], ret, ret);
+	}
+
+	spin_unlock_irqrestore(&vgpu->pv->lock, flags);
+	return ret;
+}
+
+static void intel_vgpu_pv_notify_mmio(struct drm_i915_private *dev_priv)
+{
+	intel_uncore_write(&dev_priv->uncore,
+			   vgtif_reg(g2v_notify), VGT_G2V_PV_SEND_TRIGGER);
+}
+
 /*
  * shared_page setup for VGPU PV features
  */
@@ -388,7 +571,7 @@ static int intel_vgpu_pv_setup_shared_page(struct drm_i915_private *i915,
 
 	/* We allocate 1 page shared between guest and GVT for data exchange.
 	 *       _______________________________
-	 *      |version                        |
+	 *      |version|PV_DESCs(SEND)         |
 	 *      |_______________________________PAGE/8
 	 *      |                               |
 	 *      |_______________________________PAGE/4
@@ -396,7 +579,7 @@ static int intel_vgpu_pv_setup_shared_page(struct drm_i915_private *i915,
 	 *      |                               |
 	 *      |                               |
 	 *      |_______________________________PAGE/2
-	 *      |                               |
+	 *      |PV_CMDs(SEND)                  |
 	 *      |                               |
 	 *      |                               |
 	 *      |                               |
@@ -406,6 +589,8 @@ static int intel_vgpu_pv_setup_shared_page(struct drm_i915_private *i915,
 	 *      |_______________________________|
 	 *
 	 * 0 offset: PV version area
+	 * PAGE/256 offset: PV command buffer command descriptor area
+	 * PAGE/2 offset: PV command buffer command data area
 	 */
 
 	base = (struct intel_vgpu_pv_shared_page *)get_zeroed_page(GFP_KERNEL);
@@ -443,8 +628,21 @@ static int intel_vgpu_pv_setup_shared_page(struct drm_i915_private *i915,
 
 	drm_dbg(&i915->drm,
 		"vgpu PV version major %d and minor %d\n", ver_maj, ver_min);
+
 	i915->vgpu.pv = pv;
 	pv->mem = base;
+
+	/* setup PV command buffer ptr */
+	pv->ctb.cmds = (void *)base + PV_CMD_OFF;
+	pv->ctb.desc = (void *)base + PV_DESC_OFF;
+	pv->ctb.desc->size = PAGE_SIZE / 2;
+	pv->ctb.desc->addr = PV_CMD_OFF;
+
+	/* setup PV command buffer callback */
+	pv->send = intel_vgpu_pv_send_cmd_buf;
+	pv->notify = intel_vgpu_pv_notify_mmio;
+	spin_lock_init(&pv->lock);
+
 	return ret;
 err:
 	__free_page(virt_to_page(base));
diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
index ab8d25b..18f2dd0 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.h
+++ b/drivers/gpu/drm/i915/i915_vgpu.h
@@ -31,6 +31,8 @@ struct i915_ggtt;
 
 #define PV_MAJOR        0
 #define PV_MINOR        1
+#define PV_DESC_OFF     (PAGE_SIZE / 256)
+#define PV_CMD_OFF      (PAGE_SIZE / 2)
 
 /* intel vGPU PV capabilities */
 enum intel_vgpu_pv_caps {
@@ -43,8 +45,59 @@ struct intel_vgpu_pv_shared_page {
 	u16 ver_minor;
 };
 
+/*
+ * Definition of the command transport message header (DW0)
+ *
+ * bit[0..4]	message len (in dwords)
+ * bit[5..7]	reserved
+ * bit[8..8]	write fence to desc
+ * bit[9..15]	reserved
+ * bit[16..31]	action code
+ */
+#define PV_CT_MSG_LEN_SHIFT             0
+#define PV_CT_MSG_LEN_MASK              0x1F
+#define PV_CT_MSG_WRITE_FENCE_TO_DESC   BIT(8)
+#define PV_CT_MSG_ACTION_SHIFT          16
+#define PV_CT_MSG_ACTION_MASK           0xFFFF
+
+/* PV command transport buffer descriptor */
+struct intel_vgpu_pv_ct_buf_desc {
+	u32 addr;		/* gpa address */
+	u32 size;		/* size in bytes */
+	u32 head;		/* offset updated by GVT */
+	u32 tail;		/* offset updated by owner */
+
+	u32 fence;		/* fence updated by GVT */
+	u32 status;		/* status updated by GVT */
+};
+
+/** PV single command transport buffer.
+ *
+ * A single command transport buffer consists of two parts, the header
+ * record (command transport buffer descriptor) and the actual buffer which
+ * holds the commands.
+ *
+ * @desc: pointer to the buffer descriptor
+ * @cmds: pointer to the commands buffer
+ */
+struct intel_vgpu_pv_ct_buf {
+	struct intel_vgpu_pv_ct_buf_desc *desc;
+	u32 *cmds;
+};
+
 struct intel_vgpu_pv {
 	struct intel_vgpu_pv_shared_page *mem;
+
+	/* PV command buffer support */
+	struct intel_vgpu_pv_ct_buf ctb;
+	u32 next_fence;
+
+	/* To serialize the vgpu PV send actions */
+	spinlock_t lock;
+
+	/* VGPU's PV specific send function */
+	int (*send)(struct drm_i915_private *dev_priv, u32 *data, u32 len);
+	void (*notify)(struct drm_i915_private *dev_priv);
 };
 
 void intel_vgpu_detect(struct drm_i915_private *i915);
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
