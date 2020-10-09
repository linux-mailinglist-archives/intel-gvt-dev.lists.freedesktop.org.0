Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83C328862D
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Oct 2020 11:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756656EC99;
	Fri,  9 Oct 2020 09:42:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA39B6EC9E;
 Fri,  9 Oct 2020 09:42:25 +0000 (UTC)
IronPort-SDR: vhGXTr7CRORK2TakAZOC5iRLAsQrinIjJK0mrr4m85c22A/07Jex9OYBxa2zKv4uOKzJYGIh0/
 1Ts5Fudv6raw==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165526009"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165526009"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 02:42:25 -0700
IronPort-SDR: 3HRvnx+lMB4dMqGFSKS6pygfbCjmK59YYGdt7UD501tAO9Zmuq6ZWXgYBz1KHpiGZ9LYqmZL62
 FCtuZkGe748g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316982864"
Received: from unknown (HELO xzhan34-mobl2.bj.intel.com) ([10.238.154.62])
 by orsmga006.jf.intel.com with ESMTP; 09 Oct 2020 02:42:22 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/12] drm/i915/gvt: GVTg support vgpu pv CTB protocol
Date: Fri,  9 Oct 2020 08:04:40 +0800
Message-Id: <1602201883-27829-10-git-send-email-xiaolin.zhang@intel.com>
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

host side to implement vgpu PV CTB protocol. based on the protocol,
CTB read functionality is implemented to handle pv command from guest.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 118 +++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 67cdae4..a9f91da 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1218,6 +1218,118 @@ static int pvinfo_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
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
+				   struct intel_vgpu_pv_ct_buf_desc *desc,
+				   u32 *fence, u32 *action, u32 *data)
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
+	head = desc->head / 4;
+	tail = desc->tail / 4;
+	size = desc->size / 4;
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
+						 (len - avail) * 4);
+		head = (head + len - avail) % size;
+	}
+
+err:
+	desc->head = head * 4;
+	return ret;
+}
+
+static int pv_command_buffer_read(struct intel_vgpu *vgpu,
+				  u32 *cmd, u32 *data)
+{
+	struct intel_vgpu_pv_ct_buf_desc desc;
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
@@ -1226,6 +1338,7 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 	unsigned long gpa, gfn;
 	u16 ver_major = PV_MAJOR;
 	u16 ver_minor = PV_MINOR;
+	int ret = 0;
 
 	pdps = (u64 *)&vgpu_vreg64_t(vgpu, vgtif_reg(pdp[0]));
 
@@ -1252,6 +1365,9 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 		intel_gvt_write_shared_page(vgpu, 0, &ver_major, 2);
 		intel_gvt_write_shared_page(vgpu, 2, &ver_minor, 2);
 		break;
+	case VGT_G2V_PV_SEND_TRIGGER:
+		ret = handle_pv_commands(vgpu);
+		break;
 	case VGT_G2V_EXECLIST_CONTEXT_CREATE:
 	case VGT_G2V_EXECLIST_CONTEXT_DESTROY:
 	case 1:	/* Remove this in guest driver. */
@@ -1259,7 +1375,7 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
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
