Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5837AEC53
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Sep 2023 14:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87A810E3B9;
	Tue, 26 Sep 2023 12:19:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809F810E3B9;
 Tue, 26 Sep 2023 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695730750; x=1727266750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZM1JxfLa9X55Px8XyMwAwckX2mPOZmdLl0t/5gX7hEs=;
 b=WDxIOLovWQiuZhThYxsUy5lQYa4IIJx+LHQNhAb5z1mA17d44GC1ceDC
 Dpjy1TVTh1Jb8btTpOCQMFZa4puGXvuw/zGxD5VEB1R/uJx1+KM4twsz/
 u3oz8ttE8oJ4YQrbPRMXsBk9u7Jq3+9zBDUOi7ubMStle/6f1kH4ejlt9
 fjKTEFJ1WiaqUoJ2UNsMPzBx/P8T0ZgQyXxCM8BnKlPTsx6TuibrSb8wJ
 eHaCIQF/2OD9WmMNlSBKvoFteH9VLOLT80tNuF0gTcPJOiM4P/gMcuR4N
 bFDRKqA8x4YalRH10JSc18SgDYQjHr9sXVgytjC/TOobkj8P7HdAjtdn3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412467626"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412467626"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079681330"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="1079681330"
Received: from wagnert-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:19:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce includes
Date: Tue, 26 Sep 2023 15:19:01 +0300
Message-Id: <20230926121904.499888-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

gvt.h has no need to include i915_drv.h once the unused to_gvt() has
been removed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 53a0a42a50db..3a0624fe63bf 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -39,7 +39,7 @@
 
 #include <asm/kvm_page_track.h>
 
-#include "i915_drv.h"
+#include "gt/intel_gt.h"
 #include "intel_gvt.h"
 
 #include "debug.h"
@@ -368,11 +368,6 @@ struct intel_gvt {
 	struct dentry *debugfs_root;
 };
 
-static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
-{
-	return i915->gvt;
-}
-
 enum {
 	/* Scheduling trigger by timer */
 	INTEL_GVT_REQUEST_SCHED = 0,
-- 
2.39.2

