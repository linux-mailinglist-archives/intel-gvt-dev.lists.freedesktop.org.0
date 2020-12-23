Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB012E11F3
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 03:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF3D6E8B6;
	Wed, 23 Dec 2020 02:19:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEFD6E8B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 02:19:49 +0000 (UTC)
IronPort-SDR: VrBP0WImCoFOP6hpdvdQf4C7hExmnydXrUK6n4C1kIZWMGStMIZdouSSAwTgRmlng24Tuw6Nh4
 yT+ek7Otdg1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155738929"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="155738929"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:19:48 -0800
IronPort-SDR: 9rYwqtLRInxYjeLiU0hgJ8sft4M/35m7UFjrWGZxQSDKshvXQPFf+swwnuYz9Zsp1QtUO92JXg
 rSJVtNdgoNIw==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="564909257"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:19:47 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v4 07/11] drm/i915/gvt: make width of mmio_attribute bigger
Date: Wed, 23 Dec 2020 10:07:04 +0800
Message-Id: <20201223020704.11031-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

8 bits are all used up. extend it to 16 bits to hold more flags.

Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h      | 2 +-
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index fad412d19f9c..000ebb993e1b 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -244,7 +244,7 @@ struct gvt_mmio_block {
 #define INTEL_GVT_MMIO_HASH_BITS 11
 
 struct intel_gvt_mmio {
-	u8 *mmio_attribute;
+	u16 *mmio_attribute;
 /* Register contains RO bits */
 #define F_RO		(1 << 0)
 /* Register contains graphics address */
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 0ab28832711e..2032996a5fa7 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -96,7 +96,7 @@ struct intel_gvt_mmio_info *intel_gvt_find_mmio_info(struct intel_gvt *gvt,
 }
 
 static int new_mmio_info(struct intel_gvt *gvt,
-		u32 offset, u8 flags, u32 size,
+		u32 offset, u16 flags, u32 size,
 		u32 addr_mask, u32 ro_mask, u32 device,
 		gvt_mmio_func read, gvt_mmio_func write)
 {
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
