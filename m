Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937864ED55B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Mar 2022 10:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3567510F606;
	Thu, 31 Mar 2022 08:21:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184F10F608;
 Thu, 31 Mar 2022 08:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648714901; x=1680250901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=myVCPXLKnE2azmLhkrDxrF54mH1jpd2DeSM054qRZdo=;
 b=cnq+wzNWjW8Pf9fWCz3j5pG7rXw6w5+fs9C13OzZwHpZQSCGdp0sOObC
 WxgnV5LpsfiD+AoW8tIETh6HrqhpYukDMb25pDmTWxy4wPby1gavhmxY0
 0ZPDTeOoVQ20HAGRYO2p1lfA5hG43tM3Cbpf2rSsHa6+Bbo6BL1i+p5Jf
 +xCXMUHifjFOTDBZNbQqetj0sxnswTwVXqj9whTbPAwTrcffqsfZkiiAa
 lHSIO8m4EO4Lgh3k02B/VBZXvcW0W2sY90QZdvpJCUAVwTUgaGX/bSEWh
 xttysfGMhLw0OcDw2W/ey1e7/pgdW4J9AQ4YB4FnNDDDa9WC44bvRoNB5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284669980"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="284669980"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:21:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="566266485"
Received: from cgarnier-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:21:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
Date: Thu, 31 Mar 2022 11:21:26 +0300
Message-Id: <20220331082127.432171-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.wang.linux@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TRACE_INCLUDE_PATH should be a path relative to define_trace.h, not the
file including it. (See the comment in include/trace/define_trace.h.)

Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
index 6d787750d279..020f1aa28322 100644
--- a/drivers/gpu/drm/i915/gvt/trace.h
+++ b/drivers/gpu/drm/i915/gvt/trace.h
@@ -377,7 +377,7 @@ TRACE_EVENT(render_mmio,
 
 /* This part must be out of protection */
 #undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH .
 #undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/gvt
 #define TRACE_INCLUDE_FILE trace
 #include <trace/define_trace.h>
-- 
2.30.2

