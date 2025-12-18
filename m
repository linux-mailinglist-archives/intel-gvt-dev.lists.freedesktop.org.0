Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF51CCAE94
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 09:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212C410E730;
	Thu, 18 Dec 2025 08:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzamOPEE";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494C910E730;
 Thu, 18 Dec 2025 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766046926; x=1797582926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=toGbFnu/ifknRf0arxA48NyhG4MMs/L6q9rBYC2o6I0=;
 b=nzamOPEEOvRvdtRl+mGgTTtG5iU1f3efKQcOaq6ZMAlojReq8YpU/3YT
 i1PqzQdbQoL1OOQAhJvAL2KKLr3VnGRWDUMBAAbAw6jiBflZabFxpMNRF
 Ga2s2znSTog40/bzAdYRuSDXTYx5fH3UjLkK1wbNUbKsD2O0O0wS5a2YF
 yN60AXtm8b7dPciO6cyEunmAPl02YYFv1ghTAB9ZR+V/xQIDMyOvkfVC8
 CO1EtF8vNMwCNZR9lxiWfLoLGos6OsoaMOm+vDlV8XvZ3OpcE68ZFvYFf
 2A4kjqIkUYeYFW4MXte6U/V2oZqhrkqZcosedPkFWRH1/KFVaW6Sd8DD2 A==;
X-CSE-ConnectionGUID: m+sGq4jNQMOwV+y/5cHyKw==
X-CSE-MsgGUID: 7BH3gNiMSrK0P0fgmp4fPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79365786"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79365786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:26 -0800
X-CSE-ConnectionGUID: 23QP2GK1SreUM61xxtHVLA==
X-CSE-MsgGUID: XeBgNdCqQUecigX9ErxlOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203597734"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:24 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/7] drm/i915/display: Add APIs to be used by gvt to get the
 register offsets
Date: Thu, 18 Dec 2025 13:52:55 +0530
Message-ID: <20251218082302.2327243-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

