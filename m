Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400529A3B5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Oct 2020 05:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FD56EACB;
	Tue, 27 Oct 2020 04:54:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E02D6EACB;
 Tue, 27 Oct 2020 04:54:10 +0000 (UTC)
IronPort-SDR: BghWiBv/+X2tM97JxAQKICjtHBXmYMiJ0D8KxXKoiBop+36Ye6O3QmTdmXauhAwMxl7za75On0
 Ck9TzTogxpjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="155806319"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="155806319"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 21:54:10 -0700
IronPort-SDR: 4DTltbszClgv0KRbZNJOfN0Bm+xtymeGEE945nx2Vz2LlaADTXcbotbz2Tg27A+ATQTjcN2lFG
 ayBbUh7P/KxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="322797528"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2020 21:54:08 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v7 2/2] drm/i915/gvt: Add GVT resume routine to i915
Date: Tue, 27 Oct 2020 12:54:06 +0800
Message-Id: <20201027045406.159566-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.29.1
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This patch add gvt resume wrapper into i915_drm_resume().
GVT relies on i915 so resume gvt at last.

V2:
- Direct call into gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c.
The wrapper and implementation will check and call gvt routine. (zhenyu)

V3:
Refresh.

V4:
Rebase.

V5:
Fail intel_gvt_suspend() if fail to save GGTT.

V6:
Save host entry to per-vGPU gtt.ggtt_mm on each host_entry update so
only need the resume routine.

V7:
Refresh.

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index d3237b0d821d..2c15c9440f8a 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1270,6 +1270,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	intel_power_domains_enable(dev_priv);
 
+	intel_gvt_resume(dev_priv);
+
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
 	return 0;
-- 
2.29.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
