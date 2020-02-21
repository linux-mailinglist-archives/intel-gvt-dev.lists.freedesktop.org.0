Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE8166CF1
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 Feb 2020 03:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD496E147;
	Fri, 21 Feb 2020 02:37:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A646E147
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Feb 2020 02:37:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 18:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="435049473"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2020 18:37:24 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Separate display reset from ALL_ENGINES reset
Date: Fri, 21 Feb 2020 10:32:34 +0800
Message-Id: <20200221023234.28635-1-tina.zhang@intel.com>
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

ALL_ENGINES reset doesn't clobber display with the current gvt-g
supported platforms. Thus ALL_ENGINES reset shouldn't reset the
display engine registers emulated by gvt-g.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 1e0865905136..42ad6861eb14 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -558,9 +558,9 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 
 		intel_vgpu_reset_mmio(vgpu, dmlr);
 		populate_pvinfo_page(vgpu);
-		intel_vgpu_reset_display(vgpu);
 
 		if (dmlr) {
+			intel_vgpu_reset_display(vgpu);
 			intel_vgpu_reset_cfg_space(vgpu);
 			/* only reset the failsafe mode when dmlr reset */
 			vgpu->failsafe = false;
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
