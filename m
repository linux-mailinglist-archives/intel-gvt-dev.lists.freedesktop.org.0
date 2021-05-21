Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CE38CCFE
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 May 2021 20:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBA46E82A;
	Fri, 21 May 2021 18:12:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E326E82A;
 Fri, 21 May 2021 18:12:30 +0000 (UTC)
IronPort-SDR: 1YbmicpOUPdEoxSX0r8pK3/yIyQMhAgIbGUZEoL0Rej0aRdhrmX10aXXXelE/p5fKbbv4MkF0n
 GxTkDdWjDmbw==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="198459323"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="198459323"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 11:12:30 -0700
IronPort-SDR: jIjWaSeYmv2PDyMm0CRg8ibOW4TLBvxc2/lYIJ9X8V8lvfijbWlW3PoB1dtcPgIy7ODAZGl0lg
 ju6EiCgBaSsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="544177939"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by fmsmga001.fm.intel.com with ESMTP; 21 May 2021 11:12:30 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Add missing macro name changes
Date: Fri, 21 May 2021 11:12:29 -0700
Message-Id: <20210521181229.4700-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Propagate changes to macros name containing CSR_*
to DMC_* from display side.

Cc: intel-gvt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index dda320749c65..33496397a74f 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3342,9 +3342,9 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
 	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
 
-	MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
-	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
-	MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
+	MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
+	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
+	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
 
 	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
 
@@ -3655,7 +3655,7 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
  * otherwise, need to update cmd_reg_handler in cmd_parser.c
  */
 static struct gvt_mmio_block mmio_blocks[] = {
-	{D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
+	{D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
 	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
 	{D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
 		pvinfo_mmio_read, pvinfo_mmio_write},
-- 
2.25.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
