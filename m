Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54B2E17E8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 04:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B1F6E8C2;
	Wed, 23 Dec 2020 03:58:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0403B6E8C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 03:58:01 +0000 (UTC)
IronPort-SDR: KT1zFGCtc7K+66OA6UidQ558I8xWeIXg+Qa/wsViiEaouRoz2w93fuNmcqhqUcJdxBH8kLKCZc
 BgDII8m1XpJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="240042704"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="240042704"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:58:01 -0800
IronPort-SDR: Xci456CICvv20jBTVAajxsWO5/PJTMK6Jw3vI6/pDmp68wEVHPszkGpJibfz3QZzZdDvNNeUl+
 Je1zSUkAX1pA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="564929817"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:57:59 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v5 04/11] drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in
 cmd_handler
Date: Wed, 23 Dec 2020 11:45:17 +0800
Message-Id: <20201223034517.17080-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223034353.16882-1-yan.y.zhao@intel.com>
References: <20201223034353.16882-1-yan.y.zhao@intel.com>
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
index 7ee101644e75..be0a7d4e8750 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -993,6 +993,12 @@ static int cmd_reg_handler(struct parser_exec_state *s,
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
