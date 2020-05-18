Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47E91D70FC
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 08:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9756C6E151;
	Mon, 18 May 2020 06:30:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B504C6E151
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 06:30:09 +0000 (UTC)
IronPort-SDR: jcaS+LQTiopmI/vJYWkL7QS8RM+t5gNEskPqp7URuR/CBU2CJgSkRCRs0SUdj6lbnm2Yd4VqHR
 BmsHQJ/ZT/4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 23:30:09 -0700
IronPort-SDR: yLP3NZNCQNogrjHQLZ53ZLXV7UnpG9hr/dwh57dfGjOVfSXNwISrVV1FikZLojD4JzehooTI/X
 mPoUrCE4CwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="465464566"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.118])
 by fmsmga005.fm.intel.com with ESMTP; 17 May 2020 23:30:08 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915.
Date: Mon, 18 May 2020 14:28:52 +0800
Message-Id: <20200518062852.158709-3-colin.xu@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518062852.158709-1-colin.xu@intel.com>
References: <20200518062852.158709-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Add GVT suspend/resume routine to i915.
GVT relies on i915 so suspend ahead of other i915 routine, and resume
at last vice versa.

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 34ee12f3f02d..c5d7d58df67e 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -87,6 +87,10 @@
 #include "intel_pm.h"
 #include "vlv_suspend.h"
 
+#if IS_ENABLED(CONFIG_DRM_I915_GVT)
+#include "gvt.h"
+#endif
+
 static struct drm_driver driver;
 
 static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
@@ -1177,6 +1181,11 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	drm_kms_helper_poll_disable(dev);
 
+#if IS_ENABLED(CONFIG_DRM_I915_GVT)
+	if (dev_priv->gvt)
+		intel_gvt_pm_suspend(dev_priv->gvt);
+#endif
+
 	pci_save_state(pdev);
 
 	intel_display_suspend(dev);
@@ -1354,6 +1363,12 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	intel_power_domains_enable(dev_priv);
 
+#if IS_ENABLED(CONFIG_DRM_I915_GVT)
+	if (dev_priv->gvt) {
+		return intel_gvt_pm_resume(dev_priv->gvt);
+	}
+#endif
+
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
 	return 0;
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
