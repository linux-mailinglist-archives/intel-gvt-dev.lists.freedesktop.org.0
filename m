Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048C4285EF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Oct 2021 06:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C461C6E40A;
	Mon, 11 Oct 2021 04:32:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCCB6E40A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Oct 2021 04:32:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="250178899"
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; d="scan'208";a="250178899"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2021 21:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; d="scan'208";a="479691561"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by orsmga007.jf.intel.com with ESMTP; 10 Oct 2021 21:32:54 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Cc: Terrence Xu <terrence.xu@intel.com>
Subject: [PATCH] drm/i915/gvt: Fix cmd parser error for Passmark9
Date: Mon, 11 Oct 2021 12:33:29 +0800
Message-Id: <20211011043329.3519093-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is to add one new register required for windows guest driver
update when running Passmark9, otherwise cmd parser would complain
and fail guest workload.

Cc: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cde0a477fb49..805fee4e91ef 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3436,6 +3436,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 
 	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
+	MMIO_DFH(_MMIO(0xe4cc), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
 
 	return 0;
 }
-- 
2.33.0

