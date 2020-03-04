Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359117891B
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Mar 2020 04:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EF66E9A8;
	Wed,  4 Mar 2020 03:23:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4EA6E9A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Mar 2020 03:23:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 19:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="240311460"
Received: from deyangko-mobl.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.249.171.210])
 by orsmga003.jf.intel.com with ESMTP; 03 Mar 2020 19:23:09 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gvt: cleanup debugfs scan_nonprivbb
Date: Wed,  4 Mar 2020 11:23:05 +0800
Message-Id: <20200304032307.2983-1-zhenyuw@linux.intel.com>
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
Cc: Ding Zhuocheng <zhuocheng.ding@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Remove extra chatty message for debugfs scan_nonprivbb which is used
to enable scan for non privileged batch on specific engine. Just write
target i915 engine mask instead.

Cc: Ding Zhuocheng <zhuocheng.ding@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 36 +-----------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index 285f6011a537..874ee1de6b49 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -128,6 +128,7 @@ static int
 vgpu_scan_nonprivbb_get(void *data, u64 *val)
 {
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)data;
+
 	*val = vgpu->scan_nonprivbb;
 	return 0;
 }
@@ -142,42 +143,7 @@ static int
 vgpu_scan_nonprivbb_set(void *data, u64 val)
 {
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)data;
-	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
-	enum intel_engine_id id;
-	char buf[128], *s;
-	int len;
-
-	val &= (1 << I915_NUM_ENGINES) - 1;
-
-	if (vgpu->scan_nonprivbb == val)
-		return 0;
-
-	if (!val)
-		goto done;
-
-	len = sprintf(buf,
-		"gvt: vgpu %d turns on non-privileged batch buffers scanning on Engines:",
-		vgpu->id);
-
-	s = buf + len;
-
-	for (id = 0; id < I915_NUM_ENGINES; id++) {
-		struct intel_engine_cs *engine;
-
-		engine = dev_priv->engine[id];
-		if (engine && (val & (1 << id))) {
-			len = snprintf(s, 4, "%d, ", engine->id);
-			s += len;
-		} else
-			val &=  ~(1 << id);
-	}
-
-	if (val)
-		sprintf(s, "low performance expected.");
-
-	pr_warn("%s\n", buf);
 
-done:
 	vgpu->scan_nonprivbb = val;
 	return 0;
 }
-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
