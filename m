Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF92AAEC6
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Nov 2020 02:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D415892BC;
	Mon,  9 Nov 2020 01:39:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17661892BC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  9 Nov 2020 01:39:31 +0000 (UTC)
IronPort-SDR: pk3Tvf34zuNNiDZnDLiq1Q7R2SUkSwM+cTukGjjOyn9XhiKZbykzOpardlHFvHSQkZDpnbEMpD
 8chqyPBidPjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="149016423"
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; d="scan'208";a="149016423"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2020 17:39:30 -0800
IronPort-SDR: usVmXVJl/hKLtaFtQ2JzrtNiSuXU/c0SAMO59WChQcVksz41i80ReCDJwXOk4+Bz3pg/EDkgV+
 eWdAIofwdOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; d="scan'208";a="530524118"
Received: from test.bj.intel.com ([10.238.158.62])
 by fmsmga005.fm.intel.com with ESMTP; 08 Nov 2020 17:39:27 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] i915/gvt: Set ENHANCED_FRAME_CAP bit
Date: Mon, 21 Sep 2020 02:58:07 -0400
Message-Id: <20200921065807.247847-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Specification says the bit7 of the DPCD MAX_LANE_COUNT (offset 0x02) must
be set to 1 when comes to the displayport version 1.2. This patch respects
the definition.

W/o this patch, guest i915 driver can only set the resolution to 1024*768,
and complains about the unsuccessful link training:

[    5.692193] i915 0000:00:02.0: [drm] *ERROR* index 0, lane_count 1 Link Training Unsuccessful

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 7ba16ddfe75f..d7898e87791f 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -164,7 +164,7 @@ static unsigned char virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE] = {
 
 /* let the virtual display supports DP1.2 */
 static u8 dpcd_fix_data[DPCD_HEADER_SIZE] = {
-	0x12, 0x014, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+	0x12, 0x014, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
 static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
