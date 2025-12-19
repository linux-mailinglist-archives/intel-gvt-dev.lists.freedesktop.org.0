Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4BCCE9F5
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Dec 2025 07:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A81910EE04;
	Fri, 19 Dec 2025 06:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpAaMxPc";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79A210EE02;
 Fri, 19 Dec 2025 06:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766124927; x=1797660927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7u4EvxT2zNpqSzPnfeyEeWrnH1Nf04SOLT0Fj2C9EHw=;
 b=IpAaMxPc3eJ4uFsLyXkBiDXj1s0llrHGI1rf95Oi0GidGRNh0RRr1lVc
 QKrPMG09GJQF18Ka90VpgTA++6WPi9g7K+KLnksqnc2ZvgOgxwghbhsa/
 QqrX2yXuFytfcO/GcgIDOtvRICM4IWq7u80bb+U8fM8bN5WuwCuCICsDn
 bn79gLQDduLChSrpySL06RQCwd8VoBnqjRLzOQ1AUYiqemcAyNizW0cXO
 5cDCX1Suik7ZgRJFhe/tXpHXP+M01HYdtKSi361s0GbQ+KSv38GhG7UBJ
 tWWryhtMIcmK33C9PjlcFoK04iqUOdNe0AdnXadxBrK1bVFCiu4KsHKJN g==;
X-CSE-ConnectionGUID: G3ljH0+AT5mtlCpg5XR0xw==
X-CSE-MsgGUID: iBrydthuRQ+jF9Em53sLdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68058617"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68058617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:27 -0800
X-CSE-ConnectionGUID: MGWOI0piRM2kbbwNJfyPTQ==
X-CSE-MsgGUID: i+uliFltTRu1XxppABIgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229464678"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:24 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/6] drm/i915/display: Add APIs to be used by gvt to get the
 register offsets
Date: Fri, 19 Dec 2025 11:32:55 +0530
Message-ID: <20251219060302.2365123-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
References: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
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

v2:
- Build GVT APIs only when GVT is actually enabled. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com> (#v1)
---
 drivers/gpu/drm/i915/Makefile                 |  3 ++
 .../drm/i915/display/intel_display_limits.c   |  0
 drivers/gpu/drm/i915/display/intel_gvt_api.c  | 34 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gvt_api.h  | 20 +++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index f01b5d8a07c7..2c00d74415f8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -380,6 +380,9 @@ i915-y += \
 i915-$(CONFIG_DRM_I915_DP_TUNNEL) += \
 	display/intel_dp_tunnel.o
 
+i915-$(CONFIG_DRM_I915_GVT) += \
+	display/intel_gvt_api.o
+
 i915-y += \
 	i915_perf.o
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.c b/drivers/gpu/drm/i915/display/intel_display_limits.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
new file mode 100644
index 000000000000..b1bfe4843135
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
+EXPORT_SYMBOL_NS_GPL(intel_display_device_pipe_offset, "I915_GVT");
+
+u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans)
+{
+	return INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans);
+}
+EXPORT_SYMBOL_NS_GPL(intel_display_device_trans_offset, "I915_GVT");
+
+u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe)
+{
+	return INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe);
+}
+EXPORT_SYMBOL_NS_GPL(intel_display_device_cursor_offset, "I915_GVT");
+
+u32 intel_display_device_mmio_base(struct intel_display *display)
+{
+	return DISPLAY_MMIO_BASE(display);
+}
+EXPORT_SYMBOL_NS_GPL(intel_display_device_mmio_base, "I915_GVT");
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

