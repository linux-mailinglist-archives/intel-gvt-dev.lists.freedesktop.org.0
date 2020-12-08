Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07942D28E2
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 11:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EE36E0BF;
	Tue,  8 Dec 2020 10:29:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9A56E0BF;
 Tue,  8 Dec 2020 10:29:57 +0000 (UTC)
IronPort-SDR: tKM2i9bEcXzm7Xj0cGzB5YfkVvV1B7uj2dosctx7dnnrI9ki22bx38EJs7CRxDCBHGfF2zvjik
 w8n0wUCso2jA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173103222"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="173103222"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:56 -0800
IronPort-SDR: SR52qsVi5koYOh4FZKlpmKDRiS82Gv0Yu1nT5IVfqvqJ0bH2XcOQwmCceVVz/Ph/YfzkDs6qGB
 TYbG+owbOVpw==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="437333068"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915/gvt: make mpt.h self-contained
Date: Tue,  8 Dec 2020 12:29:14 +0200
Message-Id: <73958c4ed1d94aa581acd91f7d7e82785b13d07e.1607422863.git.jani.nikula@intel.com>
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

Add necessary #includes	and forward declarations to make the header
compile on its own.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile  | 3 +--
 drivers/gpu/drm/i915/gvt/mpt.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 38c6d8257b0b..220c275aba84 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -283,8 +283,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 
 # exclude some broken headers from the test coverage
 no-header-test := \
-	display/intel_vbt_defs.h \
-	gvt/mpt.h
+	display/intel_vbt_defs.h
 
 extra-$(CONFIG_DRM_I915_WERROR) += \
 	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 6f92cde71971..550a456e936f 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -33,6 +33,8 @@
 #ifndef _GVT_MPT_H_
 #define _GVT_MPT_H_
 
+#include "gvt.h"
+
 /**
  * DOC: Hypervisor Service APIs for GVT-g Core Logic
  *
-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
