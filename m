Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D8A7AEC5E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Sep 2023 14:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32E610E3C4;
	Tue, 26 Sep 2023 12:19:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C4F10E3C3;
 Tue, 26 Sep 2023 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695730761; x=1727266761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=csnqNR1nuw1dHxkrI8FYLIcYFFEpj72l8KuOcQ61jvI=;
 b=k+dBSxEKbX0FoK/cA7ukdYtfTAPzHlSZQuZDhm7GbWjx9MHoVyGqGYVz
 BvSYgsLn5mbirdNoDYYs8xFiMUKr9JZZvvB8tmux/o+GdcrDmn/jm7gQf
 nbxg7k6k8gCXhVFXG+3NK+dMx3foulTn4y9rMctlxXmjFh4yeTpZgJbod
 3G3o/xN8PKoZy0A8Rqh5LqUK2YHLR8MkYj1H8FzxoqHqXPLBvv72bTgod
 zDV3uVDoZoEOmIVtK14olsq4wKU+DwouSyulczUFhNr1ERiZ+flMAiqrF
 h40yjiws8g8OEsIzv0EI9xVHT2rATVHiKtjWk2xZSMfJEigbmwPQpwG0G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412467666"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412467666"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079681341"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="1079681341"
Received: from wagnert-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:19:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/gvt: move structs intel_gvt_irq_info and
 intel_gvt_irq_map to interrupt.c
Date: Tue, 26 Sep 2023 15:19:04 +0300
Message-Id: <20230926121904.499888-4-jani.nikula@intel.com>
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

Structs intel_gvt_irq_info and intel_gvt_irq_map are not used outside of
interrupt.c. Hide them, and reduce includes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/interrupt.c | 17 +++++++++++++++
 drivers/gpu/drm/i915/gvt/interrupt.h | 31 ++++++----------------------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index 68eca023bbc6..de3f5903d1a7 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -36,6 +36,23 @@
 #include "gvt.h"
 #include "trace.h"
 
+struct intel_gvt_irq_info {
+	char *name;
+	i915_reg_t reg_base;
+	enum intel_gvt_event_type bit_to_event[INTEL_GVT_IRQ_BITWIDTH];
+	unsigned long warned;
+	int group;
+	DECLARE_BITMAP(downstream_irq_bitmap, INTEL_GVT_IRQ_BITWIDTH);
+	bool has_upstream_irq;
+};
+
+struct intel_gvt_irq_map {
+	int up_irq_group;
+	int up_irq_bit;
+	int down_irq_group;
+	u32 down_irq_bitmask;
+};
+
 /* common offset among interrupt control registers */
 #define regbase_to_isr(base)	(base)
 #define regbase_to_imr(base)	(base + 0x4)
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.h b/drivers/gpu/drm/i915/gvt/interrupt.h
index b62f04ab47cb..e60ad476fe60 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.h
+++ b/drivers/gpu/drm/i915/gvt/interrupt.h
@@ -32,10 +32,13 @@
 #ifndef _GVT_INTERRUPT_H_
 #define _GVT_INTERRUPT_H_
 
-#include <linux/hrtimer.h>
-#include <linux/kernel.h>
+#include <linux/bitops.h>
 
-#include "i915_reg_defs.h"
+struct intel_gvt;
+struct intel_gvt_irq;
+struct intel_gvt_irq_info;
+struct intel_gvt_irq_map;
+struct intel_vgpu;
 
 enum intel_gvt_event_type {
 	RCS_MI_USER_INTERRUPT = 0,
@@ -138,10 +141,6 @@ enum intel_gvt_event_type {
 	INTEL_GVT_EVENT_MAX,
 };
 
-struct intel_gvt_irq;
-struct intel_gvt;
-struct intel_vgpu;
-
 typedef void (*gvt_event_virt_handler_t)(struct intel_gvt_irq *irq,
 	enum intel_gvt_event_type event, struct intel_vgpu *vgpu);
 
@@ -175,17 +174,6 @@ enum intel_gvt_irq_type {
 
 #define INTEL_GVT_IRQ_BITWIDTH	32
 
-/* device specific interrupt bit definitions */
-struct intel_gvt_irq_info {
-	char *name;
-	i915_reg_t reg_base;
-	enum intel_gvt_event_type bit_to_event[INTEL_GVT_IRQ_BITWIDTH];
-	unsigned long warned;
-	int group;
-	DECLARE_BITMAP(downstream_irq_bitmap, INTEL_GVT_IRQ_BITWIDTH);
-	bool has_upstream_irq;
-};
-
 /* per-event information */
 struct intel_gvt_event_info {
 	int bit;				/* map to register bit */
@@ -194,13 +182,6 @@ struct intel_gvt_event_info {
 	gvt_event_virt_handler_t v_handler;	/* for v_event */
 };
 
-struct intel_gvt_irq_map {
-	int up_irq_group;
-	int up_irq_bit;
-	int down_irq_group;
-	u32 down_irq_bitmask;
-};
-
 /* structure containing device specific IRQ state */
 struct intel_gvt_irq {
 	const struct intel_gvt_irq_ops *ops;
-- 
2.39.2

