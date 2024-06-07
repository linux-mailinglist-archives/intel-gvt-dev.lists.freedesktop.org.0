Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976C90013E
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 12:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9D710EBD3;
	Fri,  7 Jun 2024 10:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iazXrhuK";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FD010EBD3;
 Fri,  7 Jun 2024 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717757528; x=1749293528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VQKwtHWCWF5L1E8REYsmqIXaUZ8M9/Ampax8NYrAKMA=;
 b=iazXrhuK7V605x9RPE6th/nEhMjB07DSFuxlqeUHGRJ/gscHmd7PbPMr
 aFY76J5UtcPhzU9UJEUfp5xi5TptqSH6RnRwzhuuwhRU28wnHOwEh1LNT
 at2WXa6lVqKPzUKfRYUv6+NWmIhUXfRVOKGMz+6m+3VlCgEcTw3Dk4UWg
 H2aT5rYrzhIrVaxELUyzKcyGWaF1BKQmRiLXs9KI2n9KHhXMO1TuCMREQ
 KGR4EnWkjlny+0F2ithbttOETW6weeAYGowVuPAtBm38XhXc7MawvI76g
 +aVTUKye6lmsmGAS9kkjqtXAYvUK+dyJsuX4tYWpqJgnko1o8iDB0XoNY Q==;
X-CSE-ConnectionGUID: obUnSz4kR3Gx/Xn1+oeF+w==
X-CSE-MsgGUID: XYCP4ln4SUm+g3u3ul4s6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14215145"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14215145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:52:07 -0700
X-CSE-ConnectionGUID: I0gcxLrgT32G5WX7j+snFw==
X-CSE-MsgGUID: +i06F0dORPOLWNYpCovIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38864511"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:52:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH 5/6] drm/i915: remove unused pipe/plane B register macros
Date: Fri,  7 Jun 2024 13:51:28 +0300
Message-Id: <cd207b8bcaf883bded4178e2b54f9463c0eb7b36.1717757337.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717757337.git.jani.nikula@intel.com>
References: <cover.1717757337.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 15ad35178f1a..2d834c32a3fa 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2214,29 +2214,6 @@
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
-#define   DISP_ALPHA_TRANS_ENABLE	REG_BIT(15)
-#define   DISP_SPRITE_ABOVE_OVERLAY	REG_BIT(0)
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

