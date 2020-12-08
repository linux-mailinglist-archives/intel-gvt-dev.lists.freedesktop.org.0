Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB162D28DE
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 11:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B043289DB4;
	Tue,  8 Dec 2020 10:29:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BB889DB4;
 Tue,  8 Dec 2020 10:29:51 +0000 (UTC)
IronPort-SDR: 1BCIYgmPPg54clRfIxPJuJHU4ALUIZk5tD4tuxCVeCniM/JQgD55Nm9F3ziqP45VDl+jmfS35W
 /bEbnY3nBYdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="192151572"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="192151572"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:43 -0800
IronPort-SDR: mHDV87RM6oDn7Lv6e1RJtfeAgi45C+7dxqAz5GuKHOd/oWYhZq+O2/Go7V6q+1h+PDdyP9TSvB
 dT8i26J0UFVw==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="332472537"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915/gvt: make mmio_context.h self-contained
Date: Tue,  8 Dec 2020 12:29:11 +0200
Message-Id: <979ba0ea394e9589f7332b94e91ac200faf995c5.1607422863.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1607422863.git.jani.nikula@intel.com>
References: <cover.1607422863.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Add necessary #includes and forward declarations to make the header
compile on its own.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile           |  1 -
 drivers/gpu/drm/i915/gvt/mmio_context.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 082c0629f290..f91b5fd13eff 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -285,7 +285,6 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 no-header-test := \
 	display/intel_vbt_defs.h \
 	gvt/gvt.h \
-	gvt/mmio_context.h \
 	gvt/mpt.h \
 	gvt/scheduler.h
 
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.h b/drivers/gpu/drm/i915/gvt/mmio_context.h
index 3b25e7fe32f6..1421d3a70412 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.h
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.h
@@ -36,6 +36,17 @@
 #ifndef __GVT_RENDER_H__
 #define __GVT_RENDER_H__
 
+#include <linux/types.h>
+
+#include "gt/intel_engine_types.h"
+#include "i915_reg.h"
+
+struct i915_request;
+struct intel_context;
+struct intel_engine_cs;
+struct intel_gvt;
+struct intel_vgpu;
+
 struct engine_mmio {
 	enum intel_engine_id id;
 	i915_reg_t reg;
-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
