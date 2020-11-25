Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F72C35C3
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Nov 2020 01:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262846E7D7;
	Wed, 25 Nov 2020 00:52:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6FD6E7D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Nov 2020 00:52:18 +0000 (UTC)
IronPort-SDR: wuUy1YN+rotQSQRnBkrBFuZXSLvxWWDP1H344OA/kGxXaM9WwIZUVKV4Hh1C/FZIn/YR/JgS+r
 LkUAmrKaVftg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="169480823"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="169480823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:52:17 -0800
IronPort-SDR: ckYKDtSkpCj0GOLixqADMSHTEiQapV9Ws25nyiLvW+x3VPbjQkpnJCeKriy/Sp67f9iohPog9i
 K1+mrXHK9dbg==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="312772834"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:52:16 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 05/10] drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
Date: Wed, 25 Nov 2020 08:39:43 +0800
Message-Id: <20201125003943.18081-1-yan.y.zhao@intel.com>
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

"pipe-ctrl" is still a TODO. allow it here.

Cc: Colin Xu <colin.xu@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index f898c8b2064d..e9013b9f3344 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -997,6 +997,11 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		return -EPERM;
 	}
 
+	if (!strncmp(cmd, "pipe_ctrl", 9)) {
+		//TODO
+		return 0;
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
