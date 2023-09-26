Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1027AEC5C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Sep 2023 14:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4318410E3C8;
	Tue, 26 Sep 2023 12:19:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A962E10E3C3;
 Tue, 26 Sep 2023 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695730757; x=1727266757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cc9mPRb6FxlH3GuugnfFplhL0n41m6haSldICOGULIM=;
 b=RVNZIvEDvEupYGQnsRpNre4QuQkRT60HN436N8h/s3MHWNPvUEqx6/oL
 RMoO5qbJxM1v2IltMV5IlYloGJwrIq+17lUhTbJZIk650P7BxDyFpYNtb
 jHUiRO11NsvtP5RZiaL96tDci1yRD4paUFP1eFWxI8c/ZubhFhRvh7PLt
 LakuW4QJ4VNHgJo7CzEyn+O8qLoE1ntTajWAmZ3lGQAv2jxPozbJFRvaM
 m4GttlswXMIkdx3mHRi/k+W41F2q5NKxvjEm5yVmIR7fr1SYrZhEr5cuV
 iRtLse6fOrd7BsDAZEVqK2gB5ed521D2EpcoFOMKb40qwhle86xxaZZSS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371884680"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="371884680"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="819012447"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="819012447"
Received: from wagnert-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:19:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/gvt: move struct engine_mmio to mmio_context.c
Date: Tue, 26 Sep 2023 15:19:03 +0300
Message-Id: <20230926121904.499888-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230926121904.499888-1-jani.nikula@intel.com>
References: <20230926121904.499888-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

struct engine_mmio is not used outside of mmio_context.c. Hide it, and
reduce includes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h          |  2 ++
 drivers/gpu/drm/i915/gvt/mmio_context.c |  8 ++++++++
 drivers/gpu/drm/i915/gvt/mmio_context.h | 10 ----------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 3a0624fe63bf..c57aba09091f 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -60,6 +60,8 @@
 
 #define GVT_MAX_VGPU 8
 
+struct engine_mmio;
+
 /* Describe per-platform limitations. */
 struct intel_gvt_device_info {
 	u32 max_support_vgpus;
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 490e8ae51228..273db14fd5fc 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -45,6 +45,14 @@
 
 #define GEN9_MOCS_SIZE		64
 
+struct engine_mmio {
+	enum intel_engine_id id;
+	i915_reg_t reg;
+	u32 mask;
+	bool in_context;
+	u32 value;
+};
+
 /* Raw offset is appened to each line for convenience. */
 static struct engine_mmio gen8_engine_mmio_list[] __cacheline_aligned = {
 	{RCS0, RING_MODE_GEN7(RENDER_RING_BASE), 0xffff, false}, /* 0x229c */
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.h b/drivers/gpu/drm/i915/gvt/mmio_context.h
index 9540813b88e5..a821edf574dd 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.h
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.h
@@ -39,8 +39,6 @@
 #include <linux/types.h>
 
 #include "gt/intel_engine_regs.h"
-#include "gt/intel_engine_types.h"
-#include "gt/intel_lrc_reg.h"
 
 struct i915_request;
 struct intel_context;
@@ -48,14 +46,6 @@ struct intel_engine_cs;
 struct intel_gvt;
 struct intel_vgpu;
 
-struct engine_mmio {
-	enum intel_engine_id id;
-	i915_reg_t reg;
-	u32 mask;
-	bool in_context;
-	u32 value;
-};
-
 void intel_gvt_switch_mmio(struct intel_vgpu *pre,
 			   struct intel_vgpu *next,
 			   const struct intel_engine_cs *engine);
-- 
2.39.2

