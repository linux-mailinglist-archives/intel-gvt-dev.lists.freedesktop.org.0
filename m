Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B11D513CB8
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 22:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9C910EC1E;
	Thu, 28 Apr 2022 20:41:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E814610EC0E;
 Thu, 28 Apr 2022 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651178461; x=1682714461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NSXjMn8UsrEUxteyznqMGubS6NCu0PHbWWsOLPi1Euw=;
 b=ctijM+Z0SguK5c788xA8kE6l4XZbusb0ZHFs3TcoKvAg5pXZbqhvRCqM
 WQICfLWiaWvD3dkXhNXReyxgh4LsW215qbpnbiBj22ABHOBB+37ylrPbc
 3PoZrUSzXSpsIzpbZEFcKlpvBIrqvA4FPUNl2THyemWRPj9AhAu0Hmx4w
 +bclACvs0Na6fqxwzByN2BAORouEwv65r9w8+ZkyfpNYjR36n/lFvM5C8
 U6WjqNheM4/yZf1lt9ogP1mXwOz0utoHZgpYKR+XjTEN5cSZHCZPPMGA/
 UNEpCP1/b5ZZD1seXBr8kyZAMvKd+L5cMIqZPfLbjxvhOz9wlOSOvomjT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="326910167"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="326910167"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 13:41:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="534086836"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 13:41:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Fix missing static
Date: Thu, 28 Apr 2022 13:40:10 -0700
Message-Id: <20220428204011.3365653-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, zhenyuw@linux.intel.com,
 zhi.a.wang@intel.com, jani.nikula@linux.intel.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Fix broken build:

	$ make W=1 drivers/gpu/drm/i915/gvt/handlers.o
	  ...
	  CC [M]  drivers/gpu/drm/i915/gvt/handlers.o
	drivers/gpu/drm/i915/gvt/handlers.c:75:6: error: no previous prototype for ‘intel_gvt_match_device’ [-Werror=missing-prototypes]
	   75 | bool intel_gvt_match_device(struct intel_gvt *gvt,
	      |      ^~~~~~~~~~~~~~~~~~~~~~
	cc1: all warnings being treated as errors

Commit e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from
GVT-g") removed the prototype from the header due to the function being
used only in this single compilation unit, but forgot to make it static.

Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT-g")
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cf00398c2870..e4358aa01048 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -72,8 +72,8 @@ unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
 	return 0;
 }
 
-bool intel_gvt_match_device(struct intel_gvt *gvt,
-		unsigned long device)
+static bool intel_gvt_match_device(struct intel_gvt *gvt,
+				   unsigned long device)
 {
 	return intel_gvt_get_device_type(gvt) & device;
 }
-- 
2.36.0

