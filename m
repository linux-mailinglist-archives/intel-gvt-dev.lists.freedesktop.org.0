Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D17900140
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 12:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C095E10EBD3;
	Fri,  7 Jun 2024 10:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGtNo8Cg";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E64B10EBD8;
 Fri,  7 Jun 2024 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717757534; x=1749293534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jv0rr/RYBCi1g2izGzbJT0aDBqxOBz8h3IMOrx9TwCk=;
 b=bGtNo8CgYIHxiogps8gGDN45yKkcqfTWb0jcdi+bllr04o77fA0Tyxn4
 RmLoqwuTWwDAKgK/H74jm8NZ+JpATdRki0rJTbcqFZnXN0nZczR0+vKEJ
 gCXWosPPPip5/J/Fe309uv52BsdoyzsXS3ykAN7Zz1FpqZFdowiuJCcR9
 pK5T3RUMxgybKEATby/bJ52fRaiWgSNzfAxUjttmHxut1CJSUgxgZVM1X
 0tnoJpqL74mcw+q9EUHuxxx+/hZPAcrQR9ZSG9XmfiLwJ1BHJTNX9sSha
 qDZoFO+WY+4A2yqx5j35FDE42nuR4H+TkUjdrSYzM11QNBhcIJFmdSuf5 g==;
X-CSE-ConnectionGUID: GVopV2hfSP6oayPfFZDwRg==
X-CSE-MsgGUID: jBJEswvkTjCO7MU7ll1V2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14215160"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14215160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:52:13 -0700
X-CSE-ConnectionGUID: ClfjMHdVQ7y2I9QBf6HrHA==
X-CSE-MsgGUID: W2rURR4dTuayUatZiD5yFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38864547"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:52:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH 6/6] drm/i915: remove unused HSW_STEREO_3D_CTL register macros
Date: Fri,  7 Jun 2024 13:51:29 +0300
Message-Id: <991806d10ff182220c0b2f4681ee5a76a1b3ef8b.1717757337.git.jani.nikula@intel.com>
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

Remove the unused HSW_STEREO_3D_CTL register macros.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 2d834c32a3fa..127b113189ef 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3385,12 +3385,6 @@
 #define ADL_TVIDEO_DIP_AS_SDP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans,\
 							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
 
-#define _HSW_STEREO_3D_CTL_A		0x70020
-#define   S3D_ENABLE			(1 << 31)
-#define _HSW_STEREO_3D_CTL_B		0x71020
-
-#define HSW_STEREO_3D_CTL(trans)	_MMIO_PIPE2(dev_priv, trans, _HSW_STEREO_3D_CTL_A)
-
 #define _PCH_TRANS_HTOTAL_B          0xe1000
 #define _PCH_TRANS_HBLANK_B          0xe1004
 #define _PCH_TRANS_HSYNC_B           0xe1008
-- 
2.39.2

