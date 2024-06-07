Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C5190013B
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 12:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EDE10EBC9;
	Fri,  7 Jun 2024 10:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHKi1vmf";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A410EBC6;
 Fri,  7 Jun 2024 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717757524; x=1749293524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DNgc7F4WzCL2tRkf25GFqCdHb22+anV34UcNBsCVl7o=;
 b=YHKi1vmfD4zcgVm2+7jpzrmRk3md80vOXftyRG2OBzG8BwvAQUV6TMvJ
 XXirWe87OVeB46fEyfYZB4UKk4nf1dYDgDfZMfOmHfbDEPS/AvC6v3CkZ
 A5eV/goOJxAKUIQfdr+U9NKVOEoZRA6KkWpZM9xyHoPT5y6cP6PSe1YfL
 jAD+H+x13UWPCzG/n9NGqIQOdIOvV3bxrmzOdvyOvkZp7yImb5DEQIEwn
 nT6KCiSWNxkyq5q52ZYINa6M0M96ovJP0Aek3JD6JxnB+mIYTA6PPZL+4
 MT4lnACwK/eaj+JNfEVRXWvkYeUMCA1elWWyAalsZb6ZQIr4L3nQU1rXX g==;
X-CSE-ConnectionGUID: X2GTVr5xTi6HXqFjev5GIQ==
X-CSE-MsgGUID: T9VkEBy2RACuNu/BSsJfUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14215138"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14215138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:52:03 -0700
X-CSE-ConnectionGUID: z3xFWf4vTnmoxJPHO7HaBw==
X-CSE-MsgGUID: XM7r8y7DTeyA1jVuI7CnTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38864497"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:51:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH 4/6] drm/i915/gvt: do not use implict dev_priv in
 DSPSURF_TO_PIPE()
Date: Fri,  7 Jun 2024 13:51:27 +0300
Message-Id: <72a659d5f49deab4d956abbce04cfc8a78f97b4f.1717757337.git.jani.nikula@intel.com>
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

Do not rely on having dev_priv local variable, pass it to the macro.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index f79dd6cfc75b..0f09344d3c20 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1009,14 +1009,14 @@ static int south_chicken2_mmio_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-#define DSPSURF_TO_PIPE(offset) \
+#define DSPSURF_TO_PIPE(dev_priv, offset) \
 	calc_index(offset, DSPSURF(dev_priv, PIPE_A), DSPSURF(dev_priv, PIPE_B), DSPSURF(dev_priv, PIPE_C))
 
 static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
-	u32 pipe = DSPSURF_TO_PIPE(offset);
+	u32 pipe = DSPSURF_TO_PIPE(dev_priv, offset);
 	int event = SKL_FLIP_EVENT(pipe, PLANE_PRIMARY);
 
 	write_vreg(vgpu, offset, p_data, bytes);
-- 
2.39.2

