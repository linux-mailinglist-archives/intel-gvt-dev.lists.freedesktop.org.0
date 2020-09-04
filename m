Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395E25F145
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Sep 2020 02:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCFD89F2D;
	Mon,  7 Sep 2020 00:55:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509189E5F;
 Mon,  7 Sep 2020 00:55:54 +0000 (UTC)
IronPort-SDR: MpPhLKekJSWFZtCWg8cOxt5B5S/1InkYzOE7KYtb0cEFekHyXDahhY5C3BKs4vPbdV9z2Jgs7f
 vtu7Wjmef06w==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157950653"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157950653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 17:55:54 -0700
IronPort-SDR: m4YMUTnBN6zDJTptwViMEpN9P0MH2Mr2gSi1uDgQmjnJp92WnaIZIPBV1MRubQMnunY8D4HS73
 RZcoFBTTM1Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="479443989"
Received: from xzhan34-mobl2.bj.intel.com ([10.238.154.74])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2020 17:55:51 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 09/12] drm/i915/gvt: GVTg support vgpu pv CTB protocol
Date: Sat,  5 Sep 2020 00:21:42 +0800
Message-Id: <1599236505-9086-10-git-send-email-xiaolin.zhang@intel.com>
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

host side to implement vgpu PV CTB protocol. based on the protocol,
CTB read functionality is implemented to handle pv command from guest.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 119 +++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 295e43a..b9c9f62 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1218,6 +1218,119 @@ static int pvinfo_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 	return 0;
 }
 
+static inline unsigned int ct_header_get_len(u32 header)
+{
+	return (header >> PV_CT_MSG_LEN_SHIFT) & PV_CT_MSG_LEN_MASK;
+}
+
+static inline unsigned int ct_header_get_action(u32 header)
+{
+	return (header >> PV_CT_MSG_ACTION_SHIFT) & PV_CT_MSG_ACTION_MASK;
+}
+
+static int fetch_pv_command_buffer(struct intel_vgpu *vgpu,
+		struct vgpu_pv_ct_buffer_desc *desc,
+		u32 *fence, u32 *action, u32 *data)
+{
+	u32 head, tail, len, size, off;
+	u32 cmd_head;
+	u32 avail;
+	u32 ret;
+
+	/* fetch command descriptor */
+	off = PV_DESC_OFF;
+	ret = intel_gvt_read_shared_page(vgpu, off, desc, sizeof(*desc));
+	if (ret)
+		return ret;
+
+	GEM_BUG_ON(desc->size % 4);
+	GEM_BUG_ON(desc->head % 4);
+	GEM_BUG_ON(desc->tail % 4);
+	GEM_BUG_ON(tail >= size);
+	GEM_BUG_ON(head >= size);
+
+	/* tail == head condition indicates empty */
+	head = desc->head/4;
+	tail = desc->tail/4;
+	size = desc->size/4;
+
+	if (unlikely((tail - head) == 0))
+		return -ENODATA;
+
+	/* fetch command head */
+	off = desc->addr + head * 4;
+	ret = intel_gvt_read_shared_page(vgpu, off, &cmd_head, 4);
+	head = (head + 1) % size;
+	if (ret)
+		goto err;
+
+	len = ct_header_get_len(cmd_head) - 1;
+	*action = ct_header_get_action(cmd_head);
+
+	/* fetch command fence */
+	off = desc->addr + head * 4;
+	ret = intel_gvt_read_shared_page(vgpu, off, fence, 4);
+	head = (head + 1) % size;
+	if (ret)
+		goto err;
+
+	/* no command data */
+	if (len == 0)
+		goto err;
+
+	/* fetch command data */
+	avail = size - head;
+	if (len <= avail) {
+		off =  desc->addr + head * 4;
+		ret = intel_gvt_read_shared_page(vgpu, off, data, len * 4);
+		head = (head + len) % size;
+	} else {
+		/* swap case */
+		off =  desc->addr + head * 4;
+		ret = intel_gvt_read_shared_page(vgpu, off, data, avail * 4);
+		head = (head + avail) % size;
+		if (ret)
+			goto err;
+
+		off = desc->addr;
+		ret = intel_gvt_read_shared_page(vgpu, off, &data[avail],
+				(len - avail) * 4);
+		head = (head + len - avail) % size;
+	}
+
+err:
+	desc->head = head * 4;
+	return ret;
+}
+
+static int pv_command_buffer_read(struct intel_vgpu *vgpu,
+		u32 *cmd, u32 *data)
+{
+	struct vgpu_pv_ct_buffer_desc desc;
+	u32 fence, off = PV_DESC_OFF;
+	int ret;
+
+	ret = fetch_pv_command_buffer(vgpu, &desc, &fence, cmd, data);
+
+	/* write command descriptor back */
+	desc.fence = fence;
+	desc.status = ret;
+
+	ret = intel_gvt_write_shared_page(vgpu, off, &desc, sizeof(desc));
+	return ret;
+
+}
+
+static int handle_pv_commands(struct intel_vgpu *vgpu)
+{
+	u32 cmd;
+	u32 data[32];
+	int ret;
+
+	ret = pv_command_buffer_read(vgpu, &cmd, data);
+	return ret;
+}
+
 static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 {
 	enum intel_gvt_gtt_type root_entry_type = GTT_TYPE_PPGTT_ROOT_L4_ENTRY;
@@ -1226,6 +1339,7 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 	unsigned long gpa, gfn;
 	u16 ver_major = PV_MAJOR;
 	u16 ver_minor = PV_MINOR;
+	int ret = 0;
 
 	pdps = (u64 *)&vgpu_vreg64_t(vgpu, vgtif_reg(pdp[0]));
 
@@ -1252,6 +1366,9 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 		intel_gvt_write_shared_page(vgpu, 0, &ver_major, 2);
 		intel_gvt_write_shared_page(vgpu, 2, &ver_minor, 2);
 		break;
+	case VGT_G2V_PV_SEND_TRIGGER:
+		ret = handle_pv_commands(vgpu);
+		break;
 	case VGT_G2V_EXECLIST_CONTEXT_CREATE:
 	case VGT_G2V_EXECLIST_CONTEXT_DESTROY:
 	case 1:	/* Remove this in guest driver. */
@@ -1259,7 +1376,7 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 	default:
 		gvt_vgpu_err("Invalid PV notification %d\n", notification);
 	}
-	return 0;
+	return ret;
 }
 
 static int send_display_ready_uevent(struct intel_vgpu *vgpu, int ready)
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
