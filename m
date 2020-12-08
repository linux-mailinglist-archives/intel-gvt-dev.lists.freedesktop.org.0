Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B22D28DC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 11:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316566E92B;
	Tue,  8 Dec 2020 10:29:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5CE6E973;
 Tue,  8 Dec 2020 10:29:43 +0000 (UTC)
IronPort-SDR: cpefgX2BrsBcW5EBwVNCYynEnX7UnP1SBa4YVUjVQEXgirWlqTprlalVDUX4PCnJA9XacvmESc
 dptV3k6x6BGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173103192"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="173103192"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:39 -0800
IronPort-SDR: v2a6/pLnvOnytJ7ySU31Nsgo7XAAS/rTPWgX99z9ffuEYVoIh84wjwJGoQazGakRjfDrv6c4Uz
 TGm+ZLlhRH9g==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="370336506"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915/gvt: make interrupt.h self-contained
Date: Tue,  8 Dec 2020 12:29:10 +0200
Message-Id: <3a1060d0e9b951d76815745f466efc17a7c85741.1607422863.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/Makefile        | 1 -
 drivers/gpu/drm/i915/gvt/interrupt.h | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 33fdcd81e352..082c0629f290 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -285,7 +285,6 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 no-header-test := \
 	display/intel_vbt_defs.h \
 	gvt/gvt.h \
-	gvt/interrupt.h \
 	gvt/mmio_context.h \
 	gvt/mpt.h \
 	gvt/scheduler.h
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.h b/drivers/gpu/drm/i915/gvt/interrupt.h
index fcd663811d37..287cd142629e 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.h
+++ b/drivers/gpu/drm/i915/gvt/interrupt.h
@@ -32,7 +32,10 @@
 #ifndef _GVT_INTERRUPT_H_
 #define _GVT_INTERRUPT_H_
 
-#include <linux/types.h>
+#include <linux/hrtimer.h>
+#include <linux/kernel.h>
+
+#include "i915_reg.h"
 
 enum intel_gvt_event_type {
 	RCS_MI_USER_INTERRUPT = 0,
-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
