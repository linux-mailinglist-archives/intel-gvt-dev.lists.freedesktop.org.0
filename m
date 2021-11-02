Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C1044277B
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E56FAAA;
	Tue,  2 Nov 2021 07:06:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEB96FAAA;
 Tue,  2 Nov 2021 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=e81KOE1ep+DFAQI68Mx0R/F2gRdbpQ3LYl2620+jREw=; b=gTZAW10a633i1sS3ziKAcqATdS
 Q/aA4R5VEMtAdUAVxa2UwwyQHr9L/fkVVvtxSNYgCDrEzH1u6EPyslo2w91U1xwGjThl4ArdRatcl
 TflpRsh+FAHhYcOU2wetsniqVNikXXPMl39ADspctJQ6okRohkZXHT/dYhwzt58HebpYPd4Q52/Po
 KwmyJURvyqBQTh4PEgYUjqYplTAXXZVv2Jm0JmR7reyvZVcmwewPUXa9nye84iQG+GQAM6eR4ufyg
 TzXjH7mBUBTLTC6OfgDls9GFZPzWUdfu/v/xg59qyB9uXhJAtz8hrH55jfDvubVBfZuKEE0fIK+IC
 lB98XWrw==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnsA-000hze-GC; Tue, 02 Nov 2021 07:06:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 02/29] drm/i915/gvt: integrate into the main Makefile
Date: Tue,  2 Nov 2021 08:05:34 +0100
Message-Id: <20211102070601.155501-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Remove the separately included Makefile and just use the relative
reference from the main i915 Makefile as for source files in other
subdirectories.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/Makefile     | 29 ++++++++++++++++++++++++-----
 drivers/gpu/drm/i915/gvt/Makefile |  9 ---------
 drivers/gpu/drm/i915/gvt/trace.h  |  2 +-
 3 files changed, 25 insertions(+), 15 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/Makefile

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 335ba9f43d8f7..63523032eea26 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -295,11 +295,30 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
 
 # virtual gpu code
 i915-y += i915_vgpu.o
-
-ifeq ($(CONFIG_DRM_I915_GVT),y)
-i915-y += intel_gvt.o
-include $(src)/gvt/Makefile
-endif
+i915-$(CONFIG_DRM_I915_GVT) += \
+	intel_gvt.o \
+	gvt/gvt.o \
+	gvt/aperture_gm.o \
+	gvt/handlers.o \
+	gvt/vgpu.o \
+	gvt/trace_points.o \
+	gvt/firmware.o \
+	gvt/interrupt.o \
+	gvt/gtt.o \
+	gvt/cfg_space.o \
+	gvt/opregion.o \
+	gvt/mmio.o \
+	gvt/display.o \
+	gvt/edid.o \
+	gvt/execlist.o \
+	gvt/scheduler.o \
+	gvt/sched_policy.o \
+	gvt/mmio_context.o \
+	gvt/cmd_parser.o \
+	gvt/debugfs.o \
+	gvt/fb_decoder.o \
+	gvt/dmabuf.o \
+	gvt/page_track.o
 
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
deleted file mode 100644
index ea8324abc784a..0000000000000
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ /dev/null
@@ -1,9 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-GVT_DIR := gvt
-GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
-	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
-	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
-	fb_decoder.o dmabuf.o page_track.o
-
-ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
-i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
index 6d787750d279f..348f57f8301db 100644
--- a/drivers/gpu/drm/i915/gvt/trace.h
+++ b/drivers/gpu/drm/i915/gvt/trace.h
@@ -379,5 +379,5 @@ TRACE_EVENT(render_mmio,
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
 #undef TRACE_INCLUDE_FILE
-#define TRACE_INCLUDE_FILE trace
+#define TRACE_INCLUDE_FILE gvt/trace
 #include <trace/define_trace.h>
-- 
2.30.2

