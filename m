Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A8E9008CA
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C584610ECCB;
	Fri,  7 Jun 2024 15:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOe70mhQ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B86010ECBD;
 Fri,  7 Jun 2024 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773983; x=1749309983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ftHd3QZ9Vdnz7TCXB1WgaZmgOMVHy+mpWSFYvxVvVE0=;
 b=SOe70mhQINRoHqncupBQg3YqD5y0ERd+9/WejpU1n+hc4PAF44XH0Yn/
 4kP9TWWOK7+7ZAfZ6jANNOzBSko12Ed7toWRtKsXx+mPztp8adygmirwo
 WpFN/Buc6wvncoKXxyE49b665hI/5LqPTeokAt8NDdLqi94zLb7KgYZC8
 hhTseRh/MJbrI0uMC3Wo4ItSjUuoWtfq1nypSC5/WnPXR2zrTBq5kVwPU
 HFAG0g+L707QXqE3GZ2ckKCM3aqU3pQ7m001ha5bu20mf5SJo03LkloQj
 qEs8fDNvGDkPlFFL9NBUTnAJQXjbuK+Q3eStgxB0r6d6VGlPrn7rlO6dh g==;
X-CSE-ConnectionGUID: Uo5rWNu6Txu1MiwVlcXRPw==
X-CSE-MsgGUID: wAPphOv1SQaMhbw8cPOCuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14726142"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14726142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:23 -0700
X-CSE-ConnectionGUID: imL9Tp1tQUerMnmtDTA8rg==
X-CSE-MsgGUID: uWUaarQ7RA26Ywx/kxY4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="69516540"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 6/6] drm/i915: remove unused pipe/plane B register macros
Date: Fri,  7 Jun 2024 18:25:40 +0300
Message-Id: <16d278bea466a69cdce94fd83d98dd15ce1a8c89.1717773890.git.jani.nikula@intel.com>
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

None of these are used. The parametrized register macros all depend on
the pipe/plane A offset macros alone. Remove the unused ones.

v2: Rebase

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 2a14dd9ef4a0..a33f3a61a9a4 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2214,27 +2214,6 @@
 #define SWF3(dev_priv, i)	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x72414 + (i) * 4)
 #define SWF_ILK(i)	_MMIO(0x4F000 + (i) * 4)
 
-/* Pipe B */
-#define _PIPEBDSL		(DISPLAY_MMIO_BASE(dev_priv) + 0x71000)
-#define _TRANSBCONF		(DISPLAY_MMIO_BASE(dev_priv) + 0x71008)
-#define _PIPEBSTAT		(DISPLAY_MMIO_BASE(dev_priv) + 0x71024)
-#define _PIPEBFRAMEHIGH		0x71040
-#define _PIPEBFRAMEPIXEL	0x71044
-#define _PIPEB_FRMCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71040)
-#define _PIPEB_FLIPCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71044)
-
-
-/* Display B control */
-#define _DSPBCNTR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71180)
-#define _DSPBADDR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71184)
-#define _DSPBSTRIDE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71188)
-#define _DSPBPOS		(DISPLAY_MMIO_BASE(dev_priv) + 0x7118C)
-#define _DSPBSIZE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71190)
-#define _DSPBSURF		(DISPLAY_MMIO_BASE(dev_priv) + 0x7119C)
-#define _DSPBTILEOFF		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
-#define _DSPBOFFSET		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
-#define _DSPBSURFLIVE		(DISPLAY_MMIO_BASE(dev_priv) + 0x711AC)
-
 /* ICL DSI 0 and 1 */
 #define _PIPEDSI0CONF		0x7b008
 #define _PIPEDSI1CONF		0x7b808
-- 
2.39.2

