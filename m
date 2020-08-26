Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35530252713
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Aug 2020 08:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8096EA03;
	Wed, 26 Aug 2020 06:35:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3D16EA03;
 Wed, 26 Aug 2020 06:35:41 +0000 (UTC)
IronPort-SDR: qmqtKOfhgQW4zRMee0ezHG8gX+L9UyEYosVIbVHXuiCZfGT9tApTPeBiRgmZfxih8rv6tSGaBf
 eOuqWG4WgwfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="220504211"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="220504211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 23:35:40 -0700
IronPort-SDR: LDA8BFjLHhSN2CURMGIhCWtTnvkHT39fYZUvsx/ntsR5GJqoQbb6BJovrTccKqAzMl0HEBMZV3
 zxrZ/WnK+7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="336754665"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2020 23:35:39 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915
Date: Wed, 26 Aug 2020 14:35:36 +0800
Message-Id: <20200826063536.681295-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.28.0
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

This patch add gvt suspend/resume wrapper into i915: i915_drm_suspend()
and i915_drm_resume(). GVT relies on i915 so suspend gvt ahead of other
i915 sub-routine and resume gvt at last.

V2:
- Direct call into gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c.
The wrapper and implementation will check and call gvt routine. (zhenyu)

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 00292a849c34..99c15a9183c2 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1177,6 +1177,8 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	drm_kms_helper_poll_disable(dev);
 
+	intel_gvt_suspend(dev_priv);
+
 	pci_save_state(pdev);
 
 	intel_display_suspend(dev);
@@ -1354,6 +1356,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	intel_power_domains_enable(dev_priv);
 
+	intel_gvt_resume(dev_priv);
+
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
 	return 0;
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
