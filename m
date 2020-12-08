Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F82D239E
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 07:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411BE6E94A;
	Tue,  8 Dec 2020 06:31:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BF76E94A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Dec 2020 06:31:58 +0000 (UTC)
IronPort-SDR: 8N3aaM87jkQrViXh5VzS1L6Hhl8xMs5rhp06IMFCFdraX6ydCWf1Cen7WTFdvb064IrTwdXrZz
 uzpT8alBe9/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="153650160"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="153650160"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:31:58 -0800
IronPort-SDR: 44qDmSLovOBxIoFCqLqbEP2M+6OjrTAaK2Y4x09J611eCvXgtNkO9sUx2mU9Ht/7ifLDcafq1Q
 yoOHDjkVFKMw==
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="541905914"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:31:56 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v2 06/11] drm/i915/gvt: export find_mmio_info
Date: Tue,  8 Dec 2020 14:19:19 +0800
Message-Id: <20201208061919.4335-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208061211.3942-1-yan.y.zhao@intel.com>
References: <20201208061211.3942-1-yan.y.zhao@intel.com>
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
