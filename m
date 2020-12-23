Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408262E11F9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 03:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2756E8B6;
	Wed, 23 Dec 2020 02:20:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5565E6E8B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 02:20:09 +0000 (UTC)
IronPort-SDR: YfXit9nQQSwWxTXTLC3+3NepqhkUzP2jfKcJ06ziKbX5DQXfMNyDkrDvhOe61IBOwa7eRfemWi
 0Y79wDI23lcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="173381388"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="173381388"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:20:08 -0800
IronPort-SDR: to9pczJtml5bBBN47QILOw7DcRT8f2NuTNuMng5hWQe0fsCeMXUAKeSBkMf7Nt/GCB0yzzBzs3
 QTY7gvFBz+gg==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="564909335"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:20:06 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v4 09/11] drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
Date: Wed, 23 Dec 2020 10:07:24 +0800
Message-Id: <20201223020724.11127-1-yan.y.zhao@intel.com>
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

statically set F_CMD_WRITE_PATCH flag for RING MODE registers and
force_nonpriv rgisters

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 2032996a5fa7..75e1242e83ef 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1965,7 +1965,8 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 
 	/* RING MODE */
 #define RING_REG(base) _MMIO((base) + 0x29c)
-	MMIO_RING_DFH(RING_REG, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL,
+	MMIO_RING_DFH(RING_REG, D_ALL,
+		F_MODE_MASK | F_CMD_ACCESS | F_CMD_WRITE_PATCH, NULL,
 		ring_mode_mmio_write);
 #undef RING_REG
 
@@ -2885,8 +2886,8 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS, NULL, NULL);
 	MMIO_D(_MMIO(0xb110), D_BDW);
 
-	MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS, 0, 0, D_BDW_PLUS,
-		NULL, force_nonpriv_write);
+	MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS | F_CMD_WRITE_PATCH, 0, 0,
+		D_BDW_PLUS, NULL, force_nonpriv_write);
 
 	MMIO_D(_MMIO(0x44484), D_BDW_PLUS);
 	MMIO_D(_MMIO(0x4448c), D_BDW_PLUS);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
