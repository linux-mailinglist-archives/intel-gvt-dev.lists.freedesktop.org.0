Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F59008C7
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F6810ECB8;
	Fri,  7 Jun 2024 15:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFsg5tuw";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D580E10ECB8;
 Fri,  7 Jun 2024 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773977; x=1749309977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AiQWcW36Rsf8BX9yjLxuUHa8h9YCVnqH8y7OVrPu/Zk=;
 b=PFsg5tuw+CaBF10aBm6OXDQGqJVxEoqL80V7TVIQ/Kbwfn4cVtznE/5T
 N6TqzURo/iyB7pmSSkN/nwbNTMUpxxySoi5hwP7P4i7dwc7F7I+JtSfFC
 ZEvhsB7D8DmIDWRGbe1PnxyTGtkte2IYoeh0DAQcSEEctGP9kXwCHJ3io
 gUHPCnWSAQ/W2B5pKC63eG8yyOUiwLIuOdbseTJcQLs/RgkH6uDgd4uUN
 QHyg3cgsFb8IivJLmzmgO18OJCECoi55A70WVrit9gr6kis9fTyD3Bhka
 RGrR7Cct8IZfelYUQMdXiQ/LShvr5W8dgtMS6Zg9rbckrp4K4T/tH9+xC g==;
X-CSE-ConnectionGUID: 9DDi2iDORROtFC7kPPdRhg==
X-CSE-MsgGUID: Ei/up+AeTTulnb4uzKAXsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14726097"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14726097"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:16 -0700
X-CSE-ConnectionGUID: pj8EoihFQPiRsytBKI0vrg==
X-CSE-MsgGUID: pXkIb8sKS1K/xIBvOK2QHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="69516492"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 5/6] drm/i915: relocate some DSPCNTR reg bit definitions
Date: Fri,  7 Jun 2024 18:25:39 +0300
Message-Id: <85409fbe5073797c0dc17df43eeb25abe9ff889f.1717773890.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717773890.git.jani.nikula@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Some plane B/C specific bits were left next to the unused _DSPBCNTR
macro. Move them next to the DSPCNTR() macro.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane_regs.h | 2 ++
 drivers/gpu/drm/i915/i915_reg.h                | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane_regs.h b/drivers/gpu/drm/i915/display/i9xx_plane_regs.h
index a2ba55fa2b30..5d7ba824f354 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane_regs.h
+++ b/drivers/gpu/drm/i915/display/i9xx_plane_regs.h
@@ -38,10 +38,12 @@
 #define   DISP_STEREO_POLARITY_SECOND	REG_BIT(18)
 #define   DISP_ALPHA_PREMULTIPLY	REG_BIT(16) /* CHV pipe B */
 #define   DISP_ROTATE_180		REG_BIT(15) /* i965+ */
+#define   DISP_ALPHA_TRANS_ENABLE	REG_BIT(15) /* pre-g4x plane B */
 #define   DISP_TRICKLE_FEED_DISABLE	REG_BIT(14) /* g4x+ */
 #define   DISP_TILED			REG_BIT(10) /* i965+ */
 #define   DISP_ASYNC_FLIP		REG_BIT(9) /* g4x+ */
 #define   DISP_MIRROR			REG_BIT(8) /* CHV pipe B */
+#define   DISP_SPRITE_ABOVE_OVERLAY	REG_BIT(0) /* pre-g4x plane B/C */
 
 #define _DSPAADDR				0x70184 /* pre-i965 */
 #define DSPADDR(dev_priv, plane)		_MMIO_PIPE2(dev_priv, plane, _DSPAADDR)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 7daf902772e4..2a14dd9ef4a0 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2226,8 +2226,6 @@
 
 /* Display B control */
 #define _DSPBCNTR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71180)
-#define   DISP_ALPHA_TRANS_ENABLE	REG_BIT(15)
-#define   DISP_SPRITE_ABOVE_OVERLAY	REG_BIT(0)
 #define _DSPBADDR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71184)
 #define _DSPBSTRIDE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71188)
 #define _DSPBPOS		(DISPLAY_MMIO_BASE(dev_priv) + 0x7118C)
-- 
2.39.2

