Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B72D239B
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 07:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6836E94A;
	Tue,  8 Dec 2020 06:30:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1686E94A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Dec 2020 06:30:16 +0000 (UTC)
IronPort-SDR: /M/yf/IDwdHpbQl3DMY9zOvYGy4TED71aO7frr4l20Yg7riA5htQVw3NnqM9EiqrA1gj1A0NXs
 G2+kuNvGq9Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="153649991"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="153649991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:30:16 -0800
IronPort-SDR: m6JtnYPD6KcczS4V2xqD8uCRbpbE0B61HZRbad+aaUU1zVQM3WTw/StCaLdedL68mienSsQ+4o
 hjHfjcwtTn+Q==
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="541905135"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:30:14 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v2 03/11] drm/i915/gvt: filter cmds "srm" and "lrm" in
 cmd_handler
Date: Tue,  8 Dec 2020 14:17:36 +0800
Message-Id: <20201208061736.4147-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208061211.3942-1-yan.y.zhao@intel.com>
References: <20201208061211.3942-1-yan.y.zhao@intel.com>
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
index 8fdc83da0638..fa928707ad8c 100644
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
