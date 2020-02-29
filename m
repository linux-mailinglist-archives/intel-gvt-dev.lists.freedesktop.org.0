Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306DB174548
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Feb 2020 06:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0EB6F4EA;
	Sat, 29 Feb 2020 05:54:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FFD6F4EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Feb 2020 05:54:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 21:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,498,1574150400"; 
 d="scan'208,223";a="231294041"
Received: from zhangya5-mobl1.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.255.29.74])
 by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2020 21:54:45 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix unnecessary schedule timer when no vGPU
 exits
Date: Sat, 29 Feb 2020 13:54:45 +0800
Message-Id: <20200229055445.31481-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Colin Xu <colin.xu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From commit f25a49ab8ab9 ("drm/i915/gvt: Use vgpu_lock to protect per
vgpu access") the vgpu idr destroy is moved later than vgpu resource
destroy, then it would fail to stop timer for schedule policy clean
which to check vgpu idr for any left vGPU. So this trys to destroy
vgpu idr earlier.

Cc: Colin Xu <colin.xu@intel.com>
Fixes: f25a49ab8ab9 ("drm/i915/gvt: Use vgpu_lock to protect per vgpu access")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 76fa0493228f..9213b64450c3 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -274,10 +274,17 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt *gvt = vgpu->gvt;
 
-	mutex_lock(&vgpu->vgpu_lock);
-
 	drm_WARN(&i915->drm, vgpu->active, "vGPU is still active!\n");
 
+	/*
+	 * remove idr first so later clean can judge if need to stop
+	 * service if no active vgpu.
+	 */
+	mutex_lock(&gvt->lock);
+	idr_remove(&gvt->vgpu_idr, vgpu->id);
+	mutex_unlock(&gvt->lock);
+
+	mutex_lock(&vgpu->vgpu_lock);
 	intel_gvt_debugfs_remove_vgpu(vgpu);
 	intel_vgpu_clean_sched_policy(vgpu);
 	intel_vgpu_clean_submission(vgpu);
@@ -292,7 +299,6 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 	mutex_unlock(&vgpu->vgpu_lock);
 
 	mutex_lock(&gvt->lock);
-	idr_remove(&gvt->vgpu_idr, vgpu->id);
 	if (idr_is_empty(&gvt->vgpu_idr))
 		intel_gvt_clean_irq(gvt);
 	intel_gvt_update_vgpu_types(gvt);
-- 
2.25.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
