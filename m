Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F832C35C9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Nov 2020 01:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088BB6E7D9;
	Wed, 25 Nov 2020 00:53:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6408D6E7D9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Nov 2020 00:53:48 +0000 (UTC)
IronPort-SDR: Px9AZzNxAt5iN3ouYbdsEig7/rnc2TwtVdqiFOq0TJ34R3lINPEKeoX/xEQloJcmQihevXHBsf
 GPFL3+6L2vYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="171262543"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="171262543"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:53:48 -0800
IronPort-SDR: F7JCgQBW6haM3V1y1yiKm3shflnuIS9++mTyfM9PcA800tjBfBE/O1mjghPlqEaNQkS7E30ARQ
 PbMVf+49GC9g==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="312773148"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:53:46 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 08/10] drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
Date: Wed, 25 Nov 2020 08:41:14 +0800
Message-Id: <20201125004114.18281-1-yan.y.zhao@intel.com>
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

statically set F_CMD_WRITE_PATCH flag for RING MODE registers and
force_nonpriv rgisters

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index e373b5fc5ae9..fbc76216765e 100644
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
