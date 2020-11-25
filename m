Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C842C35C7
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Nov 2020 01:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764206E7D7;
	Wed, 25 Nov 2020 00:52:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E906E7D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Nov 2020 00:52:45 +0000 (UTC)
IronPort-SDR: fcvkvGImX5ytzmEuwOvtat30pYPfm+FERodwChR53lurW7pAhmmuFTiCO9msdVOIwz7LfhIy9S
 HeKHTwYooM/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="169480857"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="169480857"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:52:45 -0800
IronPort-SDR: UdrC9oAhm5M1X/fama13Nhzv6COL4oS5pYKv7ClX7DA9Z7PJejP7FaaBR38+/n0ufq19Zztyyd
 HsHnNMDfD1bQ==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="312772904"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:52:44 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 06/10] drm/i915/gvt: export find_mmio_info
Date: Wed, 25 Nov 2020 08:40:11 +0800
Message-Id: <20201125004011.18155-1-yan.y.zhao@intel.com>
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

export find_mmio_info to be accessible by other gvt components

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 6 +++---
 drivers/gpu/drm/i915/gvt/mmio.h     | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index ce93079cf933..e373b5fc5ae9 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -83,7 +83,7 @@ static void write_vreg(struct intel_vgpu *vgpu, unsigned int offset,
 	memcpy(&vgpu_vreg(vgpu, offset), p_data, bytes);
 }
 
-static struct intel_gvt_mmio_info *find_mmio_info(struct intel_gvt *gvt,
+struct intel_gvt_mmio_info *intel_gvt_find_mmio_info(struct intel_gvt *gvt,
 						  unsigned int offset)
 {
 	struct intel_gvt_mmio_info *e;
@@ -118,7 +118,7 @@ static int new_mmio_info(struct intel_gvt *gvt,
 			return -ENOMEM;
 
 		info->offset = i;
-		p = find_mmio_info(gvt, info->offset);
+		p = intel_gvt_find_mmio_info(gvt, info->offset);
 		if (p) {
 			WARN(1, "dup mmio definition offset %x\n",
 				info->offset);
@@ -3625,7 +3625,7 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 	/*
 	 * Normal tracked MMIOs.
 	 */
-	mmio_info = find_mmio_info(gvt, offset);
+	mmio_info = intel_gvt_find_mmio_info(gvt, offset);
 	if (!mmio_info) {
 		gvt_dbg_mmio("untracked MMIO %08x len %d\n", offset, bytes);
 		goto default_rw;
diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/mmio.h
index cc4812648bf4..0851b2dc732c 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.h
+++ b/drivers/gpu/drm/i915/gvt/mmio.h
@@ -80,6 +80,9 @@ int intel_gvt_for_each_tracked_mmio(struct intel_gvt *gvt,
 	int (*handler)(struct intel_gvt *gvt, u32 offset, void *data),
 	void *data);
 
+struct intel_gvt_mmio_info *intel_gvt_find_mmio_info(struct intel_gvt *gvt,
+						  unsigned int offset);
+
 int intel_vgpu_init_mmio(struct intel_vgpu *vgpu);
 void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu, bool dmlr);
 void intel_vgpu_clean_mmio(struct intel_vgpu *vgpu);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
