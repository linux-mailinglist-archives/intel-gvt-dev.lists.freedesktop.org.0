Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7099008C3
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD3C10ECB9;
	Fri,  7 Jun 2024 15:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kq4sfSyd";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0147D10ECB9;
 Fri,  7 Jun 2024 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773964; x=1749309964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h+DZEJlPOsUNPqJu0yGmIJNI0JvAMkJYYXC44pqnD9M=;
 b=kq4sfSydwsGh+9wMd9OYPhOmQ83UIJ1fGebOG1RW0ZVbIc2HTWMdY5ef
 EBC1ri4GMa6U1LDOA21MvFJBDd/v/n6AqCjOa1/TGIdvQfExpcTRb9FlL
 GACVGrAvCsRUBEcv3nOpkqzFefyQFkRJkFx6T6VdD0wulmh/7Ko69smMO
 uUfXTnWi+Tr57K28cguaY+XPI1fStF4LhWCea4WpdiR5xNk22xNkgtvUw
 QhwrkGp3u8t0w+J1DMvNNuxC2PNB+razwKEIMIMaPxmVLbzE1ibS/YdiZ
 dq/TLEuwns4JzBLajdS0d2SmzkE1WvSsKTzBLW0VZpSuFxsF/3pjv422F w==;
X-CSE-ConnectionGUID: cnbgdEW0TOaaqp20i5uRMg==
X-CSE-MsgGUID: WsDfl9+lTba5FS3jdjhnNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14633388"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14633388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:04 -0700
X-CSE-ConnectionGUID: /lQM3hSDQ6W3ljeGAXCzYA==
X-CSE-MsgGUID: hBG9H/QLSZme6LQuDOqflw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43491234"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:26:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH v2 3/6] drm/i915/gvt: rename range variable to stride
Date: Fri,  7 Jun 2024 18:25:37 +0300
Message-Id: <8b8d4acee15da07845ed1779d6856d5c3f50a132.1717773890.git.jani.nikula@intel.com>
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

