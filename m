Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187122E17E9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 04:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FDE6E8C4;
	Wed, 23 Dec 2020 03:58:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006E86E8C4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 03:58:10 +0000 (UTC)
IronPort-SDR: 2GJ5b8Y89i4fOeJY5lRm/Y6i15mt39doPy3Z02ynndBG/eMEJDtA7u02tbiCMEfVLlhJp26H+P
 25Zyq3eCatzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="175182947"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="175182947"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:58:10 -0800
IronPort-SDR: 5CpMfIbC97BJLvwadmi/oi65rJrAI/gJfVxhOjzluWWFdN/d2p1gb5MKG4dvsxh7Es6jbqyvWm
 M40ytd6wjrtA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="564929878"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:58:09 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v5 05/11] drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
Date: Wed, 23 Dec 2020 11:45:26 +0800
Message-Id: <20201223034526.17128-1-yan.y.zhao@intel.com>
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

"pipe-ctrl" is still a TODO. allow it here.

Cc: Colin Xu <colin.xu@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index be0a7d4e8750..83fa4f17c943 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -999,6 +999,11 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		return -EPERM;
 	}
 
+	if (!strncmp(cmd, "pipe_ctrl", 9)) {
+		/* TODO: add LRI POST logic here */
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
