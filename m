Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126ACCEA07
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Dec 2025 07:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CAA10EE18;
	Fri, 19 Dec 2025 06:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2kkj1HK";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0416510EE18;
 Fri, 19 Dec 2025 06:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766124934; x=1797660934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6KrtgYK9Zk1akntEtshtwnOWHpkGB5QAgsuhOwBTRtI=;
 b=G2kkj1HKu1nyP2LlLSmxn/hgiOAVo5G2+eYrWYwMySn5ESVskm/5MFqb
 TaBt0uMjWRfN28ptw3lNgMNlZAhlT6nedjcc8eDsc/wJkvqk8/OEWjLQO
 PcX07/+NGn8HWtvENvAme3pNd70cE98yAnjK/ahW59zne45YZT7UcwuAr
 RtakV8YOfoX1si3VM8KhIgzNq7ZqJk5niSsKqWtj8kbgqsrWJIv79kDa0
 qQmluWfBZAKttAk8cdrTY7W6P9KgFlS0/j9ljDEdRJ7WrA8AuwoadHz85
 QqRBzLfC9g+hlfrcwbYjvwhzDBbFpAKG08OxBWVt0Swjkn91bblp11pK6 g==;
X-CSE-ConnectionGUID: qhPiDta2RJ+tAQ1b1opoJw==
X-CSE-MsgGUID: BF6YCvjqRfizXiK51Ld4pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68058624"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68058624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:34 -0800
X-CSE-ConnectionGUID: lRgPKriWRY+4jtcFAlsknw==
X-CSE-MsgGUID: hpZrDC6ATVGeKinLbwFprg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229464704"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:32 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 5/6] drm/i915/gvt: Use the appropriate header for the DPLL
 macro
Date: Fri, 19 Dec 2025 11:32:58 +0530
Message-ID: <20251219060302.2365123-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
References: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The macro `DPLL_ID_SKL_DPLL0` is defined in
display/intel_dpll_mgr.h. Previously, GVT included the header
display/intel_display_core.h` because other macros also depended on it.
After porting those macros to use the new APIs, the only remaining
dependency was for the DPLL macro.

Replace the indirect include with the correct header and drop
intel_display_core.h to reduce unnecessary dependencies.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 1d0c581a8ccc..f230b07a12ae 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -45,9 +45,9 @@
 #include "display/intel_crt_regs.h"
 #include "display/intel_cursor_regs.h"
 #include "display/intel_display.h"
-#include "display/intel_display_core.h"
 #include "display_helpers.h"
 #include "display/intel_dpio_phy.h"
+#include "display/intel_dpll_mgr.h"
 #include "display/intel_sprite_regs.h"
 
 static int get_edp_pipe(struct intel_vgpu *vgpu)
-- 
2.45.2

