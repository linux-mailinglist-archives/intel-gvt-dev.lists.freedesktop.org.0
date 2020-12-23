Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B732E11F7
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 03:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A8B6E8B7;
	Wed, 23 Dec 2020 02:19:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9831D6E8B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 02:19:58 +0000 (UTC)
IronPort-SDR: 84tJMH9Gt03XQIw1M/GBc3Av7FUaNPfsJkHe0WRqaz7GujF4DFSRizo7PJNkQ4X/JwQ6dAETp7
 Z/kF58fs8ECg==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="260683349"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="260683349"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:19:58 -0800
IronPort-SDR: x+nzqIg8GTNVoPxkBgqSljalulSkxoPixRQfRs05HjQh3HHONGazBR0H7LSOu+8FhE/XFn5t1E
 eyNnkji2t53w==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="564909276"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:19:57 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v4 08/11] drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
Date: Wed, 23 Dec 2020 10:07:14 +0800
Message-Id: <20201223020714.11079-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223020324.10672-1-yan.y.zhao@intel.com>
References: <20201223020324.10672-1-yan.y.zhao@intel.com>
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
 drivers/gpu/drm/i915/gvt/gvt.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 000ebb993e1b..835e64152f32 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -263,6 +263,8 @@ struct intel_gvt_mmio {
  * logical context image
  */
 #define F_SR_IN_CTX	(1 << 7)
+/* Value of command write of this reg needs to be patched */
+#define F_CMD_WRITE_PATCH	(1 << 8)
 
 	struct gvt_mmio_block *mmio_block;
 	unsigned int num_mmio_block;
@@ -687,6 +689,35 @@ static inline void intel_gvt_mmio_set_sr_in_ctx(
 }
 
 void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
+/**
+ * intel_gvt_mmio_set_cmd_write_patch -
+ *				mark an MMIO if its cmd write needs to be
+ *				patched
+ * @gvt: a GVT device
+ * @offset: register offset
+ *
+ */
+static inline void intel_gvt_mmio_set_cmd_write_patch(
+			struct intel_gvt *gvt, unsigned int offset)
+{
+	gvt->mmio.mmio_attribute[offset >> 2] |= F_CMD_WRITE_PATCH;
+}
+
+/**
+ * intel_gvt_mmio_is_cmd_write_patch - check if an mmio's cmd access needs to
+ * be patched
+ * @gvt: a GVT device
+ * @offset: register offset
+ *
+ * Returns:
+ * True if GPU commmand write to an MMIO should be patched
+ */
+static inline bool intel_gvt_mmio_is_cmd_write_patch(
+			struct intel_gvt *gvt, unsigned int offset)
+{
+	return gvt->mmio.mmio_attribute[offset >> 2] & F_CMD_WRITE_PATCH;
+}
+
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
