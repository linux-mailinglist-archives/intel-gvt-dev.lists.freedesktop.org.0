Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5A2D39EE
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Dec 2020 05:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AEA6E0EC;
	Wed,  9 Dec 2020 04:53:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA626E0ED
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Dec 2020 04:53:31 +0000 (UTC)
IronPort-SDR: YvNsrLBZLMwBAswWH6b7f8Uopxn2aTgB+FRPLe5Bd9hxuDQ5mLT08xmahm4T6k00EqmhHMvm2W
 do1bdRVd+vIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="161780913"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="161780913"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:53:30 -0800
IronPort-SDR: DaR5uVURgijFd1IzG+bpU9GJAFmGCMcxo2jJImbcvyY2FVU5/RVAo6+SSsdHKXw6DgEhgz8F01
 7D46bztroG+w==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="542263915"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:53:29 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v3 03/11] drm/i915/gvt: filter cmds "srm" and "lrm" in
 cmd_handler
Date: Wed,  9 Dec 2020 12:40:50 +0800
Message-Id: <20201209044050.2621-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209043949.2454-1-yan.y.zhao@intel.com>
References: <20201209043949.2454-1-yan.y.zhao@intel.com>
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
