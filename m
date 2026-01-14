Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD871D1C35A
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 14 Jan 2026 04:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022F110E213;
	Wed, 14 Jan 2026 03:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMAhUAF9";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54E810E002;
 Wed, 14 Jan 2026 03:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768360256; x=1799896256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5y56OksY9B1oKiFWb8cqXbT1btFFkWU0cSAIJvSlNos=;
 b=HMAhUAF94DFoPUO30kyW7BfayYrV+/K+SimgLJVLUfblIqg/SdZBRDmb
 vqKsf0NNP8P6C90SSnt4ETHTTQ4lxlS7VF8+JsWHdedcvocz0JDlrOs6v
 32WKb4F3OQEnfqHnQ3e2HggRR3YMRjs7MBsB+D+Ztlgy1qb97ckmYe6TX
 Ly8qx2Qs1A3z50JzrG1Wg5AuQLh9BCBmIuU7cmasMLM5nfn7ja1S2DrsB
 vmWeb3LHmg0I/YLNiMaQCvPpnym9tmJPhRXQbWgb3K4+uhTRUWPAIc5LL
 th3IOiDbNPXeTWET9NG7MWIaCVFkcfjd7kBeBPsLSDmysO1KYgXfpPyWP A==;
X-CSE-ConnectionGUID: jfbJljXrRSmk8ffhJaNR0Q==
X-CSE-MsgGUID: l6v0+yvQSkiU7U2l9I+LLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73496320"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="73496320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:10:55 -0800
X-CSE-ConnectionGUID: j+XXvZLvTjS2zr58Od9S4A==
X-CSE-MsgGUID: QKKGyT9sRei4fn5fkFF7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="242089517"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:10:53 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH] drm/i915/gvt_mmio_table: Use the gvt versions of the display
 macros
Date: Wed, 14 Jan 2026 08:24:56 +0530
Message-ID: <20260114025456.1639171-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Include gvt/display_helpers.h so that the display register macros in
intel_gvt_mmio_table.c expand through the exported display functions.
This lets us keep the existing macro calls while avoiding direct
access to display internals, helping the display modularization work.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 478d00f89a4b..052596ac83a0 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -11,12 +11,12 @@
 #include "display/intel_color_regs.h"
 #include "display/intel_crt_regs.h"
 #include "display/intel_cursor_regs.h"
-#include "display/intel_display_core.h"
 #include "display/intel_display_regs.h"
 #include "display/intel_display_types.h"
 #include "display/intel_dmc_regs.h"
 #include "display/intel_dp_aux_regs.h"
 #include "display/intel_dpio_phy.h"
+#include "display/intel_fbc.h"
 #include "display/intel_fbc_regs.h"
 #include "display/intel_fdi_regs.h"
 #include "display/intel_lvds_regs.h"
@@ -32,6 +32,7 @@
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
+#include "gvt/display_helpers.h"
 #include "gvt/reg.h"
 
 #include "i915_drv.h"
-- 
2.45.2

