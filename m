Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540EF178DEF
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Mar 2020 11:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155D89BF5;
	Wed,  4 Mar 2020 10:00:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765EF89BF5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Mar 2020 10:00:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 02:00:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,513,1574150400"; d="scan'208";a="233977729"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 04 Mar 2020 02:00:49 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: do not check len & max_len for lri
Date: Wed,  4 Mar 2020 04:51:21 -0500
Message-Id: <20200304095121.21609-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

lri ususally of variable len and far exceeding 127 dwords.

Fixes: 00a33be40634 (drm/i915/gvt: Add valid length check for MI variable
commands)

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 73a2891114a4..151fea215e5c 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -965,18 +965,6 @@ static int cmd_handler_lri(struct parser_exec_state *s)
 	int i, ret = 0;
 	int cmd_len = cmd_length(s);
 	struct intel_gvt *gvt = s->vgpu->gvt;
-	u32 valid_len = CMD_LEN(1);
-
-	/*
-	 * Official intel docs are somewhat sloppy , check the definition of
-	 * MI_LOAD_REGISTER_IMM.
-	 */
-	#define MAX_VALID_LEN 127
-	if ((cmd_len < valid_len) || (cmd_len > MAX_VALID_LEN)) {
-		gvt_err("len is not valid:  len=%u  valid_len=%u\n",
-			cmd_len, valid_len);
-		return -EFAULT;
-	}
 
 	for (i = 1; i < cmd_len; i += 2) {
 		if (IS_BROADWELL(gvt->dev_priv) && s->ring_id != RCS0) {
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
