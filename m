Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7B2D28D7
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 11:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08586E92B;
	Tue,  8 Dec 2020 10:29:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371D76E950;
 Tue,  8 Dec 2020 10:29:31 +0000 (UTC)
IronPort-SDR: iJrHSBbHMbI9gndvv8QqjGN+IRa4DIm8gPY0u6gaTkJAMjyeABI9FTtNlbKaitgWMCzUtYRJj5
 fS0ywgtOwkWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="258576168"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="258576168"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:30 -0800
IronPort-SDR: Of/oZ/l2OwhZ4YBGBnoZLG2FpcBb+LpjdrfKX3TVvtLFWvEu+nyr/LXlCC7UKgGTTM/ntwMSCm
 L9SX3hdOLnog==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="347839317"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/gvt: make fb_decoder.h self-contained
Date: Tue,  8 Dec 2020 12:29:08 +0200
Message-Id: <46c2acf80f1d214182a96a97fa6322ab89a3de05.1607422863.git.jani.nikula@intel.com>
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

While at it, also remove a useless forward declaration.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile         | 1 -
 drivers/gpu/drm/i915/gvt/fb_decoder.h | 6 ++++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 40253c45f705..c22fff634d18 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -284,7 +284,6 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 # exclude some broken headers from the test coverage
 no-header-test := \
 	display/intel_vbt_defs.h \
-	gvt/fb_decoder.h \
 	gvt/gtt.h \
 	gvt/gvt.h \
 	gvt/interrupt.h \
diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.h b/drivers/gpu/drm/i915/gvt/fb_decoder.h
index 67b6ede9e707..0daa3931aef7 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.h
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.h
@@ -38,6 +38,10 @@
 
 #include <linux/types.h>
 
+#include "display/intel_display.h"
+
+struct intel_vgpu;
+
 #define _PLANE_CTL_FORMAT_SHIFT		24
 #define _PLANE_CTL_TILED_SHIFT		10
 #define _PIPE_V_SRCSZ_SHIFT		0
@@ -98,8 +102,6 @@ enum DDI_PORT {
 	DDI_PORT_E	= 4
 };
 
-struct intel_gvt;
-
 /* color space conversion and gamma correction are not included */
 struct intel_vgpu_primary_plane_format {
 	u8	enabled;	/* plane is enabled */
-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
