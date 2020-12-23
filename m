Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF32E11E6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 03:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CDC6E8B4;
	Wed, 23 Dec 2020 02:18:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE006E8B4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 02:18:51 +0000 (UTC)
IronPort-SDR: dSNVlfsu37/JQ5ZbIz4iY9QvtzP++BmOMNQtyNBOh8vFIaR5CUcpTym2E680WP/++LsKh1jpmz
 npbPQpduInbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="260683265"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="260683265"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:18:50 -0800
IronPort-SDR: o9y6EJ/sN3PRhJH/Wo/W3m1WH31IH6SNTYzv80BihLXvVfGV1z1Na3oGse0LPZ/qlIXkm19Ntb
 6WAl9wvxN1wA==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="564909137"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:18:48 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v4 03/11] drm/i915/gvt: filter cmds "srm" and "lrm" in
 cmd_handler
Date: Wed, 23 Dec 2020 10:06:05 +0800
Message-Id: <20201223020605.10839-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223020324.10672-1-yan.y.zhao@intel.com>
References: <20201223020324.10672-1-yan.y.zhao@intel.com>
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
index ba642f7e3bdb..d008da48f998 100644
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
