Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56F16B92F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 25 Feb 2020 06:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B456E0E4;
	Tue, 25 Feb 2020 05:40:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182026E0E4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 25 Feb 2020 05:40:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 21:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,482,1574150400"; d="scan'208";a="410124446"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2020 21:40:20 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Fix drm_WARN issue where vgpu ptr is unavailable
Date: Tue, 25 Feb 2020 13:35:26 +0800
Message-Id: <20200225053527.8336-1-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

When vgpu ptr is unavailable, the drm_WARN* can hang the whole system
due to the drm pointer is NULL. This patch fixes this issue by using
WARN directly which won't care about the drm pointer.

Fixes: 12d5861973c70 ("drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available")
Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/mmio_context.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 46c291e4926b..1213c8e23317 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -392,7 +392,6 @@ static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_id)
 static void switch_mocs(struct intel_vgpu *pre, struct intel_vgpu *next,
 			int ring_id)
 {
-	struct drm_i915_private *i915 = pre->gvt->dev_priv;
 	struct drm_i915_private *dev_priv;
 	i915_reg_t offset, l3_offset;
 	u32 old_v, new_v;
@@ -407,7 +406,7 @@ static void switch_mocs(struct intel_vgpu *pre, struct intel_vgpu *next,
 	int i;
 
 	dev_priv = pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
-	if (drm_WARN_ON(&i915->drm, ring_id >= ARRAY_SIZE(regs)))
+	if (drm_WARN_ON(&dev_priv->drm, ring_id >= ARRAY_SIZE(regs)))
 		return;
 
 	if (ring_id == RCS0 && IS_GEN(dev_priv, 9))
@@ -552,10 +551,9 @@ static void switch_mmio(struct intel_vgpu *pre,
 void intel_gvt_switch_mmio(struct intel_vgpu *pre,
 			   struct intel_vgpu *next, int ring_id)
 {
-	struct drm_i915_private *i915 = pre->gvt->dev_priv;
 	struct drm_i915_private *dev_priv;
 
-	if (drm_WARN_ON(&i915->drm, !pre && !next))
+	if (WARN(!pre && !next, "switch ring %d from host to HOST\n", ring_id))
 		return;
 
 	gvt_dbg_render("switch ring %d from %s to %s\n", ring_id,
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
