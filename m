Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593034FF6BD
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 14:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2DA10E77E;
	Wed, 13 Apr 2022 12:25:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8458A10E77A;
 Wed, 13 Apr 2022 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649852758; x=1681388758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZ8JvskQu4ZBJlSQrKKGzxwSsCTwof68W/2CjL2htrg=;
 b=MDtEfAGwQ/f/qKHGe7bPG5sRrKtA+s+96f+D8r+Vze9PGH7jSBM5zxQw
 HtDdNWRJS7f5Kin1wlH8zb3ureGb6Ib0zCEWLPq+zIqo9oH1xO6YCBqU9
 8LVPOuQ6ynTj6Jmef8bUTCmpvIf1trZCdGsPwCoB+AzVU5o568jLT3pWz
 lq1iLAV4xQQ++Vlcpdkcw++y00rtsOPJqehBfgMgddkEAEIz9Ctrp0cGK
 EMbYWA6osLZ+zlVTUibfVS5Uu7jlYkul/Hdna7ZoMmcnk8NRyrXz7toy5
 r2CpzeDP1dU2D4iltBk35UDrYTEGGWEXcwVnXh/28ZLWJmu2UoLUj9HZD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262829889"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="262829889"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 05:25:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="724879585"
Received: from psoltysi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 05:25:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: better align the Makefile with i915 Makefile
Date: Wed, 13 Apr 2022 15:25:39 +0300
Message-Id: <8bc0895376c077156a671e24ac6a5c75b7db4c9c.1649852517.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649852517.git.jani.nikula@intel.com>
References: <cover.1649852517.git.jani.nikula@intel.com>
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
 Zhi Wang <zhi.wang.linux@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Drop extra ccflags, drop extra intermediate variables, list object files
one per line alphabetically.

Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile     |  6 +++---
 drivers/gpu/drm/i915/gvt/Makefile | 30 +++++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 75546b5f6994..b36864fae741 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -321,10 +321,10 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
 # virtual gpu code
 i915-y += i915_vgpu.o
 
-ifeq ($(CONFIG_DRM_I915_GVT),y)
-i915-y += intel_gvt.o intel_gvt_mmio_table.o
+i915-$(CONFIG_DRM_I915_GVT) += \
+	intel_gvt.o \
+	intel_gvt_mmio_table.o
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

