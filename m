Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB362C35C8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Nov 2020 01:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8B66E7D7;
	Wed, 25 Nov 2020 00:53:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3756C6E7D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Nov 2020 00:53:35 +0000 (UTC)
IronPort-SDR: e/ccawSPoNjiKXfDorj+532pHuClsO5LpH/bWk1NVhgF+zxOOnlJ9+v/EwRWXB5IjcYzsu/0zh
 wzc73KQJ3lBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="159085426"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="159085426"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:53:34 -0800
IronPort-SDR: 1IBfx4yDR+enRu6sT9TY2A3L4RaIsUifCG/NRpC/gNvwjyvbUFf1GEgwB8GTQJ5csQLhkonuui
 fxnqwDTC1xYg==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="312773095"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:53:33 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 07/10] drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
Date: Wed, 25 Nov 2020 08:41:00 +0800
Message-Id: <20201125004100.18231-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125003626.17806-1-yan.y.zhao@intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

F_CMD_WRITE_PATCH means command write to this register needs to be patched

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index c470e185bc00..27878a18e6b4 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -255,6 +255,8 @@ struct intel_gvt_mmio {
 #define F_CMD_ACCESS	(1 << 3)
 /* This reg has been accessed by a VM */
 #define F_ACCESSED	(1 << 4)
+/* Value of command write of this reg needs to be patched */
+#define F_CMD_WRITE_PATCH	(1 << 5)
 /* This reg could be accessed by unaligned address */
 #define F_UNALIGN	(1 << 6)
 /* This reg is in GVT's mmio save-restor list and in hardware
@@ -685,11 +687,39 @@ static inline void intel_gvt_mmio_set_sr_in_ctx(
 }
 
 void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
+/**
+ * intel_gvt_mmio_set_cmd_fix_write -
+ *				mark an MMIO if its cmd write needs to be
+ *				patched
+ * @gvt: a GVT device
+ * @offset: register offset
+ *
+ */
+static inline void intel_gvt_mmio_set_cmd_fix_write(
+			struct intel_gvt *gvt, unsigned int offset)
+{
+	gvt->mmio.mmio_attribute[offset >> 2] |= F_CMD_WRITE_PATCH;
+}
+
+/**
+ * intel_gvt_mmio_is_cmd_fix_write - check if an mmio's cmd access needs to
+ * be patched
+ * @gvt: a GVT device
+ * @offset: register offset
+ *
+ * Returns:
+ * True if GPU commmand write to an MMIO should be patched
+ */
+static inline bool intel_gvt_mmio_is_cmd_fix_write(
+			struct intel_gvt *gvt, unsigned int offset)
+{
+	return gvt->mmio.mmio_attribute[offset >> 2] & F_CMD_WRITE_PATCH;
+}
+
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
-
 #include "trace.h"
 #include "mpt.h"
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
