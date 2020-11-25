Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F6E2C35CD
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Nov 2020 01:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729726E7D7;
	Wed, 25 Nov 2020 00:54:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8906E7D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Nov 2020 00:54:29 +0000 (UTC)
IronPort-SDR: 59xJ3RZNarIpIMejZ3nuoracPVxUlqYaMMNHxT16m/xNbhv6Cxt/UFdwnrqceTAl5XW+Nieh6w
 Zk0zkuTIj1kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151300757"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="151300757"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:54:29 -0800
IronPort-SDR: C98ggMtGD9VFd2BSaoVcJfKisxfJpUXZpuUIUrYig1JByPTz6uEzBCQUVDVSxoWHAAAB6Jl7zz
 0HaUrtHVOePg==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="312773236"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:54:28 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 09/10] drm/i915/gvt: update F_CMD_WRITE_PATCH flag when
 parsing init ctx
Date: Wed, 25 Nov 2020 08:41:55 +0800
Message-Id: <20201125004155.18336-1-yan.y.zhao@intel.com>
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
index e9013b9f3344..ee195057aa6e 100644
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
+			intel_gvt_mmio_set_cmd_fix_write(gvt, offset);
 		return 0;
 	}
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
