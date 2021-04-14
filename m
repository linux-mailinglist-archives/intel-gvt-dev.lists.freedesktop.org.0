Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8EE35F00E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 14 Apr 2021 10:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1906E8F5;
	Wed, 14 Apr 2021 08:47:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD0A6E486
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 14 Apr 2021 08:47:12 +0000 (UTC)
IronPort-SDR: ThGQcIimp0M2DQZ9OM+uG2Xm2bI1BC0OA9ptlbyouZQyH6F7vysPh/VeH65FFsCVaGPGYlwFJ8
 bD7Ln6pDjqAg==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="279909905"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="279909905"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 01:47:12 -0700
IronPort-SDR: GS+CmRPrOqkAvkSXK+89L3PAW/rWfDpW3opYyIcLUR8bvnz3tsPoQ6JB5Htk6wP2hQlZHmdV2c
 n/IfYeV/Aycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="532706961"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by orsmga004.jf.intel.com with ESMTP; 14 Apr 2021 01:47:11 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: Remove duplicated register accessible check
Date: Wed, 14 Apr 2021 16:48:13 +0800
Message-Id: <20210414084813.3763353-2-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
References: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Looks this duplication was missed in code rebase. Remove extra check.

Cc: Yan Zhao <yan.y.zhao@intel.com>
Fixes: 02dd2b12a685 ("drm/i915/gvt: unify lri cmd handler and mmio handlers")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 01c1d1b36acd..ca9c9e27a43d 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -948,11 +948,6 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 
 	/* below are all lri handlers */
 	vreg = &vgpu_vreg(s->vgpu, offset);
-	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
-		gvt_vgpu_err("%s access to non-render register (%x)\n",
-				cmd, offset);
-		return -EBADRQC;
-	}
 
 	if (is_cmd_update_pdps(offset, s) &&
 	    cmd_pdp_mmio_update_handler(s, offset, index))
-- 
2.31.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
