Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E821B28FFD5
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 10:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682456EAAB;
	Fri, 16 Oct 2020 08:13:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E87D6EA96;
 Fri, 16 Oct 2020 08:13:58 +0000 (UTC)
IronPort-SDR: N1devoT67sc3fWQHcRrQDRT5baMis7LEI+HY0coaF2AXxt6tMVfLJBHigzKBs0GU5zeOQvVEhC
 pEgvTm04Jnjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="230751062"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="230751062"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 01:13:57 -0700
IronPort-SDR: waT+eyiBs7kqvSza7PFj+CplwnwOJFsvidgGIPl8D3X7sw3oMtVD4OeHDFTxdEQ4tAGVUcH0yi
 o/JVLWTwOzFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="531625204"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.24])
 by orsmga005.jf.intel.com with ESMTP; 16 Oct 2020 01:13:56 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 zhenyuw@linux.intel.com
Subject: [PATCH v5 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915
Date: Fri, 16 Oct 2020 16:13:53 +0800
Message-Id: <20201016081353.376670-1-colin.xu@intel.com>
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

V3:
Refresh.

V4:
Rebase.

V5:
Fail intel_gvt_suspend() if fail to save GGTT.

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 8bb7e2dcfaaa..b3203292b0ee 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1104,6 +1104,9 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	drm_kms_helper_poll_disable(dev);
 
+	if (intel_gvt_suspend(dev_priv))
+		drm_err(&dev_priv->drm, "failed to suspend GVT\n");
+
 	pci_save_state(pdev);
 
 	intel_display_suspend(dev);
@@ -1281,6 +1284,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
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
