Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B9B2D23A8
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 07:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DBC6E94A;
	Tue,  8 Dec 2020 06:33:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3376E94A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Dec 2020 06:33:42 +0000 (UTC)
IronPort-SDR: VP3dnEX0yVjZWGWnhzT8ZaBZuUWe1BXw5Fi9vXGRDLSE50fsfZz00UProTrdrwhjrBI7v+8HzH
 K/Dn4vIr/azA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="153650332"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="153650332"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:33:42 -0800
IronPort-SDR: yYJ95ltho2oOosW1DpNKS0nLtFl/ucQlyxwSZKLHQKQ+3Qc84xmC9EmebApGOZTo756BbVn5aD
 0QqK20ah1U2w==
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="541906400"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 22:33:40 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v2 09/11] drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
Date: Tue,  8 Dec 2020 14:21:03 +0800
Message-Id: <20201208062103.4535-1-yan.y.zhao@intel.com>
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

statically set F_CMD_WRITE_PATCH flag for RING MODE registers and
force_nonpriv rgisters

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 1f6f5adbf54c..e1f63a29224d 100644
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
