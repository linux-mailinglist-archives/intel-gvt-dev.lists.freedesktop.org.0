Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518212D39EF
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Dec 2020 05:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183AF6E0ED;
	Wed,  9 Dec 2020 04:53:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066A76E0ED
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Dec 2020 04:53:40 +0000 (UTC)
IronPort-SDR: TME13jBuTKMCQs3d4/yDW7URfWCk3bjAUBfxbS5a1CWYph56KVOR4hUaZDrelmO/Xkpewgfh9t
 J3QROjJY9QFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153828152"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="153828152"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:53:40 -0800
IronPort-SDR: zqi8Ahz/jT1q5H852HQejR2SLALElTZniOM+nyEDz4QGinT4tHIK2ELk0YPo4tMV35vC4Cpv9f
 b7NNAKHk06KQ==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="542263947"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:53:39 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v3 04/11] drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in
 cmd_handler
Date: Wed,  9 Dec 2020 12:41:01 +0800
Message-Id: <20201209044101.2671-1-yan.y.zhao@intel.com>
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

do not allow "lrr-src" and "lrr-dst"

Cc: Colin Xu <colin.xu@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index fa928707ad8c..35dbf98adbec 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -991,6 +991,12 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 			return 0;
 	}
 
+	if (!strncmp(cmd, "lrr-src", 7) ||
+			!strncmp(cmd, "lrr-dst", 7)) {
+		gvt_vgpu_err("not allowed cmd %s\n", cmd);
+		return -EPERM;
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
