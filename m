Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0952C8303
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 30 Nov 2020 12:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3CA6E47B;
	Mon, 30 Nov 2020 11:16:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93C56E47B;
 Mon, 30 Nov 2020 11:16:52 +0000 (UTC)
IronPort-SDR: 7X0e19AxI2jq5UJ4z9p9Ra0jNjGSibDyrX4Uzu0r2uzhLDL8Qzdd+CSY1tccapn2Uq0maIfSMv
 Umg2iMkhPp/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="172718486"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="172718486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:16:52 -0800
IronPort-SDR: HLdbrYdLziLlgzzKgXFaW8HwhkDGtU99tyi07rvHKiEfm5VseXxYnitU34CNjZxdtf47A+tHFC
 yoSlUcW2sRng==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="536960955"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:16:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 09/10] drm/i915/gvt: replace I915_WRITE with
 intel_uncore_write
Date: Mon, 30 Nov 2020 13:16:00 +0200
Message-Id: <20201130111601.2817-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201130111601.2817-1-jani.nikula@intel.com>
References: <20201130111601.2817-1-jani.nikula@intel.com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, jani.nikula@intel.com,
 Zhenyu Wang <zhenyuw@linux.intel.com>, chris@chris-wilson.co.uk,
 Colin Xu <colin.xu@intel.com>, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Let's avoid adding new I915_WRITE uses while we try to get rid of them.

Fixes: 5f60b12edcd0 ("drm/i915/gvt: Save/restore HW status to support GVT suspend/resume")
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Hang Yuan <hang.yuan@linux.intel.com>
Cc: Colin Xu <colin.xu@intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 6f0706e885cb..eba626ba640f 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3693,7 +3693,7 @@ static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
 	struct drm_i915_private *dev_priv = gvt->gt->i915;
 
 	if (gvt->mmio.mmio_attribute[offset >> 2] & F_PM_SAVE)
-		I915_WRITE(_MMIO(offset), vgpu_vreg(vgpu, offset));
+		intel_uncore_write(&dev_priv->uncore, _MMIO(offset), vgpu_vreg(vgpu, offset));
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
