Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D382D39F1
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Dec 2020 05:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FBE6E0ED;
	Wed,  9 Dec 2020 04:54:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290E26E0ED
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Dec 2020 04:54:03 +0000 (UTC)
IronPort-SDR: PNu0XU205s6g3lkeslia2BRmLOVQ+04VRiPyfUAOoEk/bmXHgnVqQWEA3kVrCkNLej73CUVYAJ
 YbCsBSWl6RIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174137537"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="174137537"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:54:02 -0800
IronPort-SDR: /P46RNV/reFbIeua2Zlbb/R9Al5UV/4Zxtrp17O3KS3xMYW09sCgTgvzlqA85YS3E65gII3cb/
 KMnb3PeWMqlg==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="542263997"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:54:00 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v3 06/11] drm/i915/gvt: export find_mmio_info
Date: Wed,  9 Dec 2020 12:41:22 +0800
Message-Id: <20201209044122.2767-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209043949.2454-1-yan.y.zhao@intel.com>
References: <20201209043949.2454-1-yan.y.zhao@intel.com>
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
index 6f0706e885cb..0ab28832711e 100644
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
@@ -3626,7 +3626,7 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 	/*
 	 * Normal tracked MMIOs.
 	 */
-	mmio_info = find_mmio_info(gvt, offset);
+	mmio_info = intel_gvt_find_mmio_info(gvt, offset);
 	if (!mmio_info) {
 		gvt_dbg_mmio("untracked MMIO %08x len %d\n", offset, bytes);
 		goto default_rw;
diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/mmio.h
index 9e862dc73579..7c26af39fbfc 100644
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
