Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA1249225
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 03:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854D16E194;
	Wed, 19 Aug 2020 01:09:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B306E194
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 01:09:04 +0000 (UTC)
IronPort-SDR: zpfrc8cPuegX3QKgJlPZA0t2oEEkTT/kzaJxApcLd0hBZRm4UfNtHY5QrsLObxzax6hoQ+eceW
 uKEyLFNtQp9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152444811"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="152444811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 18:09:03 -0700
IronPort-SDR: R+4UiJi1xxTbQU+cVCgXxuGsptVqGi2AlTJZsGZcczatKVRmgS25S/pthrzgCLAUNvzydxLTXD
 HGQ4Z+dsEeCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="334525001"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2020 18:09:03 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET
Date: Wed, 19 Aug 2020 09:09:00 +0800
Message-Id: <20200819010900.54598-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.28.0
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

Although GVT doesnt' support guest GuC, MIA core is still expected
to be GS_MIA_IN_RESET after uc HW reset.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/mmio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index 291993615af9..b6811f6a230d 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -251,6 +251,9 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu, bool dmlr)
 		/* set the bit 0:2(Core C-State ) to C0 */
 		vgpu_vreg_t(vgpu, GEN6_GT_CORE_STATUS) = 0;
 
+		/* uc reset hw expect GS_MIA_IN_RESET */
+		vgpu_vreg_t(vgpu, GUC_STATUS) |= GS_MIA_IN_RESET;
+
 		if (IS_BROXTON(vgpu->gvt->gt->i915)) {
 			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &=
 				    ~(BIT(0) | BIT(1));
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
