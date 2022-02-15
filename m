Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611D4B6BE9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Feb 2022 13:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1CB892D5;
	Tue, 15 Feb 2022 12:20:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F36B10E45F;
 Tue, 15 Feb 2022 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644927643; x=1676463643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DUSYKsrpkTrISyFfZQ72cAIve1h9tYeSIEpqJ7y8UlU=;
 b=R+aemugphP0JKX3RTG+HyHcSlo+CFVVk2ezODsPvBgDhxd03p9u+Wdrc
 mxJtNf5zfHDKLc1wJNLz8DZD/92/oj1PRSB8wrgVzYnRiYjTlZB2h0+OL
 U5gc7ZjFPRClUoxYBOF+ssmaYig67G1GMMTQg35sW+avwrIvereS2gKlQ
 WDkCoAJ6ZKUDXMUxEakB7kFh7fICPwSV9PzCiAc9OCpNVyCDiunbBxLlQ
 y4mir+GwKHtePUCjoqCaFj4TL5MldUdc44KaGmBrvYTsuuSNKXGZf0aC0
 SPmUhEQYu3jXNjycml4YWZV8bylZi6JfcezNGrurCfO21p8G4GrKMCXxp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230302554"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="230302554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 04:20:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="544277370"
Received: from ylian16-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.20.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 04:20:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: #include drm_edid.h for drm_edid_block_valid()
Date: Tue, 15 Feb 2022 14:20:30 +0200
Message-Id: <20220215122030.2741656-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

As the excessive #includes from i915_drv.h were axed, kvmgt.c build
started failing. Add the necessary #include where needed.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 14da21cc4671 ("drm/i915: axe lots of unnecessary includes from i915_drv.h")
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Going to merge this via drm-intel-next along with the regressing commit.
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 20b82fb036f8..e8d6c76e9234 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -46,6 +46,8 @@
 
 #include <linux/nospec.h>
 
+#include <drm/drm_edid.h>
+
 #include "i915_drv.h"
 #include "gvt.h"
 
-- 
2.30.2

