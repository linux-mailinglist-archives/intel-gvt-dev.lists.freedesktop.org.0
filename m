Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B798B900138
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 12:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905FE10EBC9;
	Fri,  7 Jun 2024 10:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYhJ3gvs";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BBF10EBB1;
 Fri,  7 Jun 2024 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717757516; x=1749293516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h+DZEJlPOsUNPqJu0yGmIJNI0JvAMkJYYXC44pqnD9M=;
 b=PYhJ3gvsrJ2ZdVq9GrFgOdkOYHBio/pv5EF2gN5Yu26Tjm1rm/OPiUBg
 pIjWB2afT+rRy1NEwbwQNWeSD3I9zHWyA+g8ioHXC8kEEFP5FvM6yI2Jk
 YVGKYmbvZRYXpsynlbwp2tWKga8lI/AzsGOGBqkq5qfLcn3GXraM7QvDL
 xtF02k02Y4WhUGvaPnGQL7xRxzqV5g/PypUxYWFUz8+AL28qEt1WY9F1s
 niUVq4S7ZVESdolvRGLabMUxLDy6k9UZI8oj2pOfSm1cuh9bLbBGbZr/L
 ngLiQRpb2ecdbiwAtrtzViIPcJOidwDiHLKEmfkQtco+VRA+QFu5RmEyJ A==;
X-CSE-ConnectionGUID: tpClYdr3TmafXzsFcGqytw==
X-CSE-MsgGUID: FIHwm2GPQTypopSQCvzS7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39873287"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="39873287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:51:55 -0700
X-CSE-ConnectionGUID: zPpQm9yvTDGQHjOc1ANRgQ==
X-CSE-MsgGUID: ClkWoozrS+mh4KmzaT9bog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38367222"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:51:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH 3/6] drm/i915/gvt: rename range variable to stride
Date: Fri,  7 Jun 2024 13:51:26 +0300
Message-Id: <5978d8139a99943e221845ce06a67c45e0472e84.1717757337.git.jani.nikula@intel.com>
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

Range is a bit odd name for what really is stride. Rename. Switch to u32
while at it.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index b005ab0104ee..f79dd6cfc75b 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -887,12 +887,12 @@ static unsigned int calc_index(unsigned int offset, i915_reg_t _start,
 	u32 start = i915_mmio_reg_offset(_start);
 	u32 next = i915_mmio_reg_offset(_next);
 	u32 end = i915_mmio_reg_offset(_end);
-	unsigned int range = next - start;
+	u32 stride = next - start;
 
 	if (offset < start || offset > end)
 		return INVALID_INDEX;
 	offset -= start;
-	return offset / range;
+	return offset / stride;
 }
 
 #define FDI_RX_CTL_TO_PIPE(offset) \
-- 
2.39.2

