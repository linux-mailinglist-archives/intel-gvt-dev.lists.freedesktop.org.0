Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743D1E9BF2
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Jun 2020 05:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E812489E7B;
	Mon,  1 Jun 2020 03:05:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3213889E7B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Jun 2020 03:05:01 +0000 (UTC)
IronPort-SDR: TvqLM3Wo8sObscl5ROo/61v08V7+e5fPxDvJU1reDMHFcLk//nRdM+K8nlfAeHbzqo10rKryRs
 /vX+r7pFp0vQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 20:05:00 -0700
IronPort-SDR: 1+jQfpo0fPu4UCDjPR7ANeq9tasl3FxfY3uFNRq9LNlxX7TMzRoLwceFbnMTYoj+ZEVlB5ipLf
 RODFjemF5N9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="470168007"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.113])
 by fmsmga005.fm.intel.com with ESMTP; 31 May 2020 20:04:59 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
Date: Mon,  1 Jun 2020 11:04:57 +0800
Message-Id: <20200601030457.14002-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

_PLANE_CTL_3_A, _PLANE_CTL_3_B and _PLANE_SURF_3_A are handled, but
miss _PLANE_SURF_3_B.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index d2839cc036c1..f39a6b20bbaf 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3055,6 +3055,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
 	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
 	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
 
 	MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
 	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
