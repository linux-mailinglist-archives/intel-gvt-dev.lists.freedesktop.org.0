Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C906E2E11FD
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 03:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6CF6E8B6;
	Wed, 23 Dec 2020 02:20:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51726E8B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 02:20:20 +0000 (UTC)
IronPort-SDR: +b2baK3e6YWNP2xOnWURz9xJcnDIwEQ2cVOsLeTPCgmJ32iUM0Zpho7021p1yw8YMkHp3xPWrl
 CgD1S3y8gWig==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="163007181"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="163007181"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:20:17 -0800
IronPort-SDR: KxjoQhJ/00PzG8Y6tpVllP28+VSCSu1h25VWaQQGedOwbEHZbU/KxqrO6jljeTdmbNqg39O9rN
 dieglwCA5ECA==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="564909365"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:20:16 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v4 10/11] drm/i915/gvt: update F_CMD_WRITE_PATCH flag when
 parsing init ctx
Date: Wed, 23 Dec 2020 10:07:33 +0800
Message-Id: <20201223020733.11175-1-yan.y.zhao@intel.com>
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
index 4aef34304a98..f6b3f41700f2 100644
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
