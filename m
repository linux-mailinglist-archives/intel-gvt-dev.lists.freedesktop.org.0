Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F164A241741
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 09:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4E16E14D;
	Tue, 11 Aug 2020 07:37:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C473B6E14D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Aug 2020 07:37:42 +0000 (UTC)
IronPort-SDR: brYxs8apYCxagVtIqUbDtbA7HchrhYaaJMee5kT8iylJ4YY0jj4HpNH35U5Jq+JjvrI2J/TXOK
 W2JFsaLu6sgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="141297449"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="141297449"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 00:37:41 -0700
IronPort-SDR: hMof4UHotP4LeEsbVl2Z13QfbSwT+dJco6yUMUK/pHKEshd1MgaSb37zIG7LSpl55tos+ickhj
 Qbv91kKW0Qew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="324687249"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 11 Aug 2020 00:37:40 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH 3/4] drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
Date: Tue, 11 Aug 2020 15:02:33 +0800
Message-Id: <20200811070233.3387-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811055140.29123-1-yan.y.zhao@intel.com>
References: <20200811055140.29123-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

flag F_CMD_ACCESS represents whether an MMIO is able to be accessed by
GPU commands.
In this patch,
1. add interface to set this flag
2. rename intel_gvt_mmio_is_cmd_access() to
intel_gvt_mmio_is_cmd_accessible() and update its description message.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c |  2 +-
 drivers/gpu/drm/i915/gvt/gvt.h        | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 0292e3c1deb4..affd05d2c201 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -936,7 +936,7 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		return -EFAULT;
 	}
 
-	if (!intel_gvt_mmio_is_cmd_access(gvt, offset)) {
+	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
 		gvt_vgpu_err("%s access to non-render register (%x)\n",
 				cmd, offset);
 		return -EBADRQC;
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 8fbe65471c01..d7279cd654ca 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -594,17 +594,32 @@ static inline void intel_gvt_mmio_set_accessed(
 }
 
 /**
- * intel_gvt_mmio_is_cmd_accessed - mark a MMIO could be accessed by command
+ * intel_gvt_mmio_is_cmd_accessible - if a MMIO could be accessed by command
  * @gvt: a GVT device
  * @offset: register offset
  *
+ * Returns:
+ * True if an MMIO is able to be accessed by GPU commands
  */
-static inline bool intel_gvt_mmio_is_cmd_access(
+static inline bool intel_gvt_mmio_is_cmd_accessible(
 			struct intel_gvt *gvt, unsigned int offset)
 {
 	return gvt->mmio.mmio_attribute[offset >> 2] & F_CMD_ACCESS;
 }
 
+/**
+ * intel_gvt_mmio_set_cmd_accessible -
+ *				mark a MMIO could be accessible by command
+ * @gvt: a GVT device
+ * @offset: register offset
+ *
+ */
+static inline void intel_gvt_mmio_set_cmd_accessible(
+			struct intel_gvt *gvt, unsigned int offset)
+{
+	gvt->mmio.mmio_attribute[offset >> 2] |= F_CMD_ACCESS;
+}
+
 /**
  * intel_gvt_mmio_is_unalign - mark a MMIO could be accessed unaligned
  * @gvt: a GVT device
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
