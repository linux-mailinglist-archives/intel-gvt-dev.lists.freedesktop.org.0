Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35CCBD7FC
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB02710E44B;
	Mon, 15 Dec 2025 11:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVBLvICR";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B30110E449;
 Mon, 15 Dec 2025 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765798269; x=1797334269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxEjI+LCn+ieUCPHDBWvK4+Ibk69Wnb/GQigcNXwKxg=;
 b=jVBLvICRdM0K+ahTQkSRo5gu2E3alHIswJ5XoQ2mIIpx7SFywTk86uhd
 sDfbFKw22lg3B+6lhDMRtsB21DaOmvPaKp2gq5xS6evbaFq+sDLTOVLir
 Whx2Blaji2DrlUwc/j2Z9nZQlh2jP+vth629AdHGeClJk3B6c0bWi1aVp
 BEdCsi/mi2C1dY82MR62S3hY0LGGFaQ9PUADCFoZ9DfcRQFTPR0E/1wvK
 ixA/BRZ7YImQsuclF1pBss6UiNb589hQB64S5UBEU/azYuISu6W+oN4/t
 D4rMeZSRAykP3DdLWp4dCMb83YWXONlLoHOnFq1OZUEHmtlyPOnPLDAwF A==;
X-CSE-ConnectionGUID: W4c066edR7GycIlev3CdAg==
X-CSE-MsgGUID: ES8W97VwQlqXtz+WMWI9Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67732762"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67732762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:08 -0800
X-CSE-ConnectionGUID: ozMrsk2GRhC6/CX9TroW0g==
X-CSE-MsgGUID: RX6hAuL+TM2cbqPJEvX+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235090408"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:08 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/5] drm/i915/display: Add APIs to be used by gvt to get the
 register offsets
Date: Mon, 15 Dec 2025 16:48:38 +0530
Message-ID: <20251215111842.2099789-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

GVT code uses macros for register offsets that require display internal
structures. This makes clean separation of display code and
modularization difficult.

Introduce APIs to abstract offset calculations:
- intel_display_device_pipe_offset()
- intel_display_device_trans_offset()
- intel_display_device_cursor_offset()
- intel_display_device_mmio_base()

These APIs return absolute base offsets for the respective register
groups, allowing GVT to compute MMIO addresses without using internal
macros or struct fields. This prepares the path to separate
display-dependent code from i915/gvt/*.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../drm/i915/display/intel_display_limits.c   |  0
 drivers/gpu/drm/i915/display/intel_gvt_api.c  | 34 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gvt_api.h  | 20 +++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index f01b5d8a07c7..7974f017f263 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -360,6 +360,7 @@ i915-y += \
 	display/intel_dvo.o \
 	display/intel_encoder.o \
 	display/intel_gmbus.o \
+	display/intel_gvt_api.o \
 	display/intel_hdmi.o \
 	display/intel_lspcon.o \
 	display/intel_lt_phy.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.c b/drivers/gpu/drm/i915/display/intel_display_limits.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
new file mode 100644
index 000000000000..8abea318fbc2
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+#include "intel_display_core.h"
+#include "intel_display_regs.h"
+#include "intel_gvt_api.h"
+
+u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pipe)
+{
+	return INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe);
+}
+EXPORT_SYMBOL_GPL(intel_display_device_pipe_offset);
+
+u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans)
+{
+	return INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans);
+}
+EXPORT_SYMBOL_GPL(intel_display_device_trans_offset);
+
+u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe)
+{
+	return INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe);
+}
+EXPORT_SYMBOL_GPL(intel_display_device_cursor_offset);
+
+u32 intel_display_device_mmio_base(struct intel_display *display)
+{
+	return DISPLAY_MMIO_BASE(display);
+}
+EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
new file mode 100644
index 000000000000..e9a1122a988d
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_GVT_API_H__
+#define __INTEL_GVT_API_H__
+
+#include <linux/types.h>
+
+enum pipe;
+enum transcoder;
+struct intel_display;
+
+u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pipe);
+u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
+u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
+u32 intel_display_device_mmio_base(struct intel_display *display);
+
+#endif /* __INTEL_GVT_API_H__ */
-- 
2.45.2

