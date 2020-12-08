Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7952B2D23A9
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 07:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005F6E94A;
	Tue,  8 Dec 2020 06:34:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8D96E94A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Dec 2020 06:34:07 +0000 (UTC)
IronPort-SDR: KtTsHAFRxRnRjaQVbmRKJQHVRqah4dSuA24SxP7Wa5V8ln5BqhEX3jA48c2Ifk+gXJP/v1YFoa
 eDYiAQpoS3dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="170331448"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="170331448"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:34:07 -0800
IronPort-SDR: r9eGaRIUxYzjXDGP/MpUUZgaSix9MSPYTL06xuR/lygRsmtkWPjLz9xnoVku+4e/QJcrL/MSGL
 AJqSs4oRBA0Q==
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="541906508"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:34:05 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v2 10/11] drm/i915/gvt: update F_CMD_WRITE_PATCH flag when
 parsing init ctx
Date: Tue,  8 Dec 2020 14:21:28 +0800
Message-Id: <20201208062128.4592-1-yan.y.zhao@intel.com>
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
