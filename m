Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C12D39F2
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Dec 2020 05:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABCE6E0EC;
	Wed,  9 Dec 2020 04:54:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8AC6E0EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Dec 2020 04:54:17 +0000 (UTC)
IronPort-SDR: D1+t/0Fx8AdBFsfs7mY5Sa9ssGiWj49+FcrcHhoIv0Ne63Rg8/oKxtAsRZ5dXftTels0aGnOh5
 cEoSFAWHUblg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174165687"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="174165687"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:54:16 -0800
IronPort-SDR: a+bSvXwlvFWtWsZShxokrJhYGxQ3pQjy0TOPEQ/QR3WvySX9KuYhV5swCvK9ZVnOcNoIzCd6/r
 p5WCckSg4k8Q==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="542264030"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 20:54:14 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v3 07/11] drm/i915/gvt: make width of mmio_attribute bigger
Date: Wed,  9 Dec 2020 12:41:36 +0800
Message-Id: <20201209044136.2861-1-yan.y.zhao@intel.com>
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
