Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D82E11F0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 03:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4466C6E8B4;
	Wed, 23 Dec 2020 02:19:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCA26E8B4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 02:19:40 +0000 (UTC)
IronPort-SDR: yt+0w6cFzFBedCKs62TtPmux0A76KcUg5qDq3i+oYMw7XrjDqJh7rs022vHEOn/QXZE+y7xnAf
 iKL+rpZge7zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="163672519"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="163672519"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:19:39 -0800
IronPort-SDR: 1+03EsdaA6iiVLViscFmEmeZ/6mB5vHXtP6cZVkNGlhDpx6/chMXF/6GOzP7hozGfbXz/UlL6U
 FnllLftL0XKA==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="564909246"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:19:38 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v4 06/11] drm/i915/gvt: export find_mmio_info
Date: Wed, 23 Dec 2020 10:06:55 +0800
Message-Id: <20201223020655.10983-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223020324.10672-1-yan.y.zhao@intel.com>
References: <20201223020324.10672-1-yan.y.zhao@intel.com>
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
