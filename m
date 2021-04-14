Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760B35F00D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 14 Apr 2021 10:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060226E486;
	Wed, 14 Apr 2021 08:47:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F006E486
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 14 Apr 2021 08:47:11 +0000 (UTC)
IronPort-SDR: k6GPrQ59MFrjKQSNFBs0GE15/MCnvh8hakZCOaykMZ7D+26rlkUPYCJHoGmnGTloCLRiOK7VSO
 wNKCMPgRfq+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="279909899"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="279909899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 01:47:11 -0700
IronPort-SDR: uEdT/HUJP9UTAtjpkt0iJDUKjtuXRkAsemqgOvWYm4Vk6St1V4I0OLAq1a3hmvi8Gf7/yPTwVP
 15bcv4zNbMCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="532706954"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by orsmga004.jf.intel.com with ESMTP; 14 Apr 2021 01:47:09 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Fix BDW command parser regression
Date: Wed, 14 Apr 2021 16:48:12 +0800
Message-Id: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On BDW new Windows driver has brought extra registers to handle for
LRM/LRR command in WA ctx. Add allowed registers in cmd parser for BDW.

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: stable@vger.kernel.org
Fixes: 73a37a43d1b0 ("drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index fef1e857cefc..01c1d1b36acd 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -916,19 +916,26 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 
 	if (!strncmp(cmd, "srm", 3) ||
 			!strncmp(cmd, "lrm", 3)) {
-		if (offset != i915_mmio_reg_offset(GEN8_L3SQCREG4) &&
-				offset != 0x21f0) {
+		if (offset == i915_mmio_reg_offset(GEN8_L3SQCREG4) ||
+		    offset == 0x21f0 ||
+		    (IS_BROADWELL(gvt->gt->i915) &&
+		     offset == i915_mmio_reg_offset(INSTPM)))
+			return 0;
+		else {
 			gvt_vgpu_err("%s access to register (%x)\n",
 					cmd, offset);
 			return -EPERM;
-		} else
-			return 0;
+		}
 	}
 
 	if (!strncmp(cmd, "lrr-src", 7) ||
 			!strncmp(cmd, "lrr-dst", 7)) {
-		gvt_vgpu_err("not allowed cmd %s\n", cmd);
-		return -EPERM;
+		if (IS_BROADWELL(gvt->gt->i915) && offset == 0x215c)
+			return 0;
+		else {
+			gvt_vgpu_err("not allowed cmd %s reg (%x)\n", cmd, offset);
+			return -EPERM;
+		}
 	}
 
 	if (!strncmp(cmd, "pipe_ctrl", 9)) {
-- 
2.31.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
