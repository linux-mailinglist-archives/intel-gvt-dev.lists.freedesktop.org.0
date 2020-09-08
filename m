Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC74260BDF
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 09:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2226E542;
	Tue,  8 Sep 2020 07:22:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F19A6E542;
 Tue,  8 Sep 2020 07:22:01 +0000 (UTC)
IronPort-SDR: DMCmvGoq8CFdsIzdUphGPppgqu1drESyaekOi11BhekIXzGr/qJ9exqp5QadoqTpka45mOuZ66
 osG5Ij14EBBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="157353184"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="157353184"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 00:22:01 -0700
IronPort-SDR: kAzjYOAT2LWdyPiT3bkGxWEBWWHBlwoGlL4YJTvQ6Z4P1JB2giS8U6OVsPMHxoyiM93kTnoWB9
 hzbKH/tjlUkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="336312349"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2020 00:22:00 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915
Date: Tue,  8 Sep 2020 15:21:57 +0800
Message-Id: <20200908072157.774111-1-colin.xu@intel.com>
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

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index d66fe09d337e..28055dc65ecd 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1090,6 +1090,8 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	drm_kms_helper_poll_disable(dev);
 
+	intel_gvt_suspend(dev_priv);
+
 	pci_save_state(pdev);
 
 	intel_display_suspend(dev);
@@ -1267,6 +1269,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
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
