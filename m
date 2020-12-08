Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2FE2D28D5
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 11:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E266E0BF;
	Tue,  8 Dec 2020 10:29:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243D16E0BF;
 Tue,  8 Dec 2020 10:29:29 +0000 (UTC)
IronPort-SDR: 7jvP+359upOwchBSATki2q2OQ8X0YfthcK8RjinDe9dPWFACph1nccpmlPSS/J4z7VS3uc/3kM
 sNmMxBwcf+QA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="258576162"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="258576162"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:26 -0800
IronPort-SDR: 3U+ftHYpSJ/UZGw/yCw49LZAI1zl1qnwJCmmftWMongK6qKAtrs4G7gmiD35hEefeM6Yh7XoBC
 8cR4dtOW91XA==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="437333025"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915/gvt: make execlist.h self-contained
Date: Tue,  8 Dec 2020 12:29:07 +0200
Message-Id: <e201af3bcf8e1bc389ae501ea5e3572b95e66f55.1607422863.git.jani.nikula@intel.com>
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

Remove unused declaration.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile       | 1 -
 drivers/gpu/drm/i915/gvt/execlist.h | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index e5574e506a5c..40253c45f705 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -284,7 +284,6 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 # exclude some broken headers from the test coverage
 no-header-test := \
 	display/intel_vbt_defs.h \
-	gvt/execlist.h \
 	gvt/fb_decoder.h \
 	gvt/gtt.h \
 	gvt/gvt.h \
diff --git a/drivers/gpu/drm/i915/gvt/execlist.h b/drivers/gpu/drm/i915/gvt/execlist.h
index d62cd14605a3..84ad74b37d66 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.h
+++ b/drivers/gpu/drm/i915/gvt/execlist.h
@@ -182,7 +182,4 @@ int intel_vgpu_init_execlist(struct intel_vgpu *vgpu);
 int intel_vgpu_submit_execlist(struct intel_vgpu *vgpu,
 			       const struct intel_engine_cs *engine);
 
-void intel_vgpu_reset_execlist(struct intel_vgpu *vgpu,
-			       intel_engine_mask_t engine_mask);
-
 #endif /*_GVT_EXECLIST_H_*/
-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
