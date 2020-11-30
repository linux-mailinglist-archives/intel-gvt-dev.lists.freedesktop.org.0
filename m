Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329062C82F1
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 30 Nov 2020 12:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BFB6E456;
	Mon, 30 Nov 2020 11:14:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A4E6E456;
 Mon, 30 Nov 2020 11:14:03 +0000 (UTC)
IronPort-SDR: +cTkn/DdAF9CKUzhd2TQK5aZODtaHkkg3fHP46Xh4ov6pzf2wn28KN5rYZNty1+2CyFdh+v/00
 9qEPO7pIWMoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170055129"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="170055129"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:14:02 -0800
IronPort-SDR: TYFx5HNBoi/7OXOwHF1pAM3+FEPYN7eGuw7klinqmSmtaRWRdxU3Mx3kFkFkuuwt4O2g94Q06z
 TrVrtSPhyhaQ==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="549055991"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:13:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: avoid useless use of inline
Date: Mon, 30 Nov 2020 13:13:53 +0200
Message-Id: <20201130111353.25406-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, Colin Xu <colin.xu@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

In most cases, we are better off letting the compiler decide whether to
inline static functions in .c files or not. In this case, the inline
will be ignored anyway as mmio_pm_restore_handler() is passed as a
function pointer.

Fixes: 5f60b12edcd0 ("drm/i915/gvt: Save/restore HW status to support GVT suspend/resume")
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Hang Yuan <hang.yuan@linux.intel.com>
Cc: Colin Xu <colin.xu@intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 6f0706e885cb..69e725b95bcf 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3686,8 +3686,7 @@ void intel_gvt_restore_fence(struct intel_gvt *gvt)
 	}
 }
 
-static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
-					  u32 offset, void *data)
+static int mmio_pm_restore_handler(struct intel_gvt *gvt, u32 offset, void *data)
 {
 	struct intel_vgpu *vgpu = data;
 	struct drm_i915_private *dev_priv = gvt->gt->i915;
-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
