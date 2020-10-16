Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C540528FDF2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 08:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730106E9AD;
	Fri, 16 Oct 2020 06:00:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09376E9AC;
 Fri, 16 Oct 2020 06:00:49 +0000 (UTC)
IronPort-SDR: GkgqbKBh+kvh0pg4BpnNOYNi4JTAs9liP0V9s6/G6C1q2lP3GOgx7b/1x8D9ZeXDOj5lpCV9vi
 SNUPu87+rjLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="153459767"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="153459767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 23:00:47 -0700
IronPort-SDR: SYOodcUAHxe3Rsqm3ylTVU9kRPstJSa2dr04n7l3+ZTGg+UIhse+rSDnaSIsuNasrTj4ZhzcXC
 AXxqJs33OQXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="521063268"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.24])
 by fmsmga006.fm.intel.com with ESMTP; 15 Oct 2020 23:00:46 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 zhenyuw@linux.intel.com
Subject: [PATCH v4 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915
Date: Fri, 16 Oct 2020 14:00:44 +0800
Message-Id: <20201016060044.296280-1-colin.xu@intel.com>
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

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 8bb7e2dcfaaa..1fd05e15b54f 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1104,6 +1104,8 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	drm_kms_helper_poll_disable(dev);
 
+	intel_gvt_suspend(dev_priv);
+
 	pci_save_state(pdev);
 
 	intel_display_suspend(dev);
@@ -1281,6 +1283,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
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
