Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A562C35C1
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Nov 2020 01:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058346E7D7;
	Wed, 25 Nov 2020 00:51:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBD36E7D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Nov 2020 00:51:10 +0000 (UTC)
IronPort-SDR: ysfxM0xU72xnPfdzruh4G4yXwVrIVcUaLEBQPfG/q1tLlwZIU+77ZCz8wAMyEYIa6G/2RUU9i5
 3LK8lyaPUCtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="171262310"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="171262310"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:51:09 -0800
IronPort-SDR: gwE4Fj8kCAIMGMjDZ54m3hD2KKK/zul0hR++1pRHJoJVbkHfLOt6/ay4DM7INEp6GUOyvGDmJD
 Gj9CcJMAbatQ==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="312772587"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:51:08 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 03/10] drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
Date: Wed, 25 Nov 2020 08:38:33 +0800
Message-Id: <20201125003833.17965-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125003626.17806-1-yan.y.zhao@intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

do not allow "srm" and "lrm" except for GEN8_L3SQCREG4 and 0x21f0.

Cc: Colin Xu <colin.xu@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index a51ff27ff6a8..efd0f7dd22de 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -980,6 +980,17 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
 	}
 
+	if (!strncmp(cmd, "srm", 3) ||
+			!strncmp(cmd, "lrm", 3)) {
+		if (offset != i915_mmio_reg_offset(GEN8_L3SQCREG4) &&
+				offset != 0x21f0) {
+			gvt_vgpu_err("%s access to register (%x)\n",
+					cmd, offset);
+			return -EPERM;
+		} else
+			return 0;
+	}
+
 	if (is_cmd_update_pdps(offset, s) &&
 	    cmd_pdp_mmio_update_handler(s, offset, index))
 		return -EINVAL;
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
