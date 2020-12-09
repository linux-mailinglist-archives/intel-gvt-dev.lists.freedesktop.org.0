Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B863C2D39F5
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Dec 2020 05:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAB4899B0;
	Wed,  9 Dec 2020 04:54:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CA3899B0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Dec 2020 04:54:51 +0000 (UTC)
IronPort-SDR: +OVmy3iLq2QElu42ORU40BIipgK7d0Q1Zr9/7ky5tOpK3tCgJZo0+rnrV2fPwhal/NHmoY+P+B
 zyHZgkmdptFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="258727054"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="258727054"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:54:51 -0800
IronPort-SDR: AUjl2WDlF8QlaCOrUAqwjKFHvkyN34Kh3ezxHjMu5NGMAAfGmHAt4ferMsZE17faZpxp52g6sU
 BnVvvt4iAa9Q==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="542264109"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:54:47 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v3 10/11] drm/i915/gvt: update F_CMD_WRITE_PATCH flag when
 parsing init ctx
Date: Wed,  9 Dec 2020 12:42:09 +0800
Message-Id: <20201209044209.3006-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

if a vreg has write handler, set its flag F_CMD_WRITE_PATCH on when
parsing init ctx.

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 6f847e55820f..e716f9989cf5 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -951,7 +951,12 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 	}
 
 	if (is_init_ctx(s)) {
+		struct intel_gvt_mmio_info *mmio_info;
+
 		intel_gvt_mmio_set_cmd_accessible(gvt, offset);
+		mmio_info = intel_gvt_find_mmio_info(gvt, offset);
+		if (mmio_info && mmio_info->write)
+			intel_gvt_mmio_set_cmd_write_patch(gvt, offset);
 		return 0;
 	}
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
