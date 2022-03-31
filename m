Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E74ED55A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Mar 2022 10:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73B210F607;
	Thu, 31 Mar 2022 08:21:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F6510F605;
 Thu, 31 Mar 2022 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648714899; x=1680250899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CyO8FsM8tZgUaBkDtVMI1v27hxk0lpBU5WnbEc98PhQ=;
 b=ZsFUz9T0uuPRrNRuxu7LzLDY2NujlvS4qGXQOUBQ5oE0vYOFQgG9RGfY
 GI5rs9wvbsuEjMBTOv8dEZOicam4TmpPW8ngrLkFo0/VvEv03jRyp4fqJ
 axNSTb3ZAT8XcJcmCL51hEDA3Q4jSLaGzaZkWD/0sy0VkdT2XYxbYmIBi
 nsIgBcQYKxXWaOcC6ZggA3MEBdT/slFAq+yI+2YNqx82kgMg/y9uozncf
 hZPs6sarGoMJ2VnkGqsxU9MTtGT5znz7K09aA2IOFf4aB2q/zMKF9lzQo
 +1cTPj3EndX4K3YuhqWC8fg9q8kQA/MD/2o0OzfbG3MRNhWGiRyOJ2fuB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="240346752"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="240346752"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:21:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="547219718"
Received: from cgarnier-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.224])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:21:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: better align the Makefile with i915 Makefile
Date: Thu, 31 Mar 2022 11:21:27 +0300
Message-Id: <20220331082127.432171-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220331082127.432171-1-jani.nikula@intel.com>
References: <20220331082127.432171-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.wang.linux@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Drop extra ccflags, drop extra intermediate variables, list object files
one per line alphabetically.

Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile     |  4 +---
 drivers/gpu/drm/i915/gvt/Makefile | 30 +++++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c1d5540f6052..27d4e0f8b31c 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -324,10 +324,8 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
 # virtual gpu code
 i915-y += i915_vgpu.o
 
-ifeq ($(CONFIG_DRM_I915_GVT),y)
-i915-y += intel_gvt.o
+i915-$(CONFIG_DRM_I915_GVT) += intel_gvt.o
 include $(src)/gvt/Makefile
-endif
 
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..584661047945 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -1,9 +1,25 @@
 # SPDX-License-Identifier: GPL-2.0
-GVT_DIR := gvt
-GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
-	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
-	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
-	fb_decoder.o dmabuf.o page_track.o
 
-ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
-i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
+i915-$(CONFIG_DRM_I915_GVT) += \
+	gvt/aperture_gm.o \
+	gvt/cfg_space.o \
+	gvt/cmd_parser.o \
+	gvt/debugfs.o \
+	gvt/display.o \
+	gvt/dmabuf.o \
+	gvt/edid.o \
+	gvt/execlist.o \
+	gvt/fb_decoder.o \
+	gvt/firmware.o \
+	gvt/gtt.o \
+	gvt/gvt.o \
+	gvt/handlers.o \
+	gvt/interrupt.o \
+	gvt/mmio.o \
+	gvt/mmio_context.o \
+	gvt/opregion.o \
+	gvt/page_track.o \
+	gvt/sched_policy.o \
+	gvt/scheduler.o \
+	gvt/trace_points.o \
+	gvt/vgpu.o
-- 
2.30.2

