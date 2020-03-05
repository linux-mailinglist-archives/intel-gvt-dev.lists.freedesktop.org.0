Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5617A63B
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Mar 2020 14:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100CC6E326;
	Thu,  5 Mar 2020 13:21:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4F06E326
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Mar 2020 13:20:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 05:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="352360577"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 05:20:56 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH v2] drm/i915/gvt: Fix emulated vbt size issue
Date: Thu,  5 Mar 2020 21:15:59 +0800
Message-Id: <20200305131600.29640-1-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The emulated vbt doesn't tell its size correctly. According to the
intel_vbt_defs.h, vbt_header.vbt_size should the size of VBT (VBT Header,
BDB Header and data blocks), and bdb_header.bdb_size should be the size
of BDB (BDB Header and data blocks).

This patch fixes the issue and lets vbt provided by GVT-g pass the guest
i915's sanity test.

v2: refine the commit message. (Zhenyu)

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 867e7629025b..33569b910ed5 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -147,15 +147,14 @@ static void virt_vbt_generation(struct vbt *v)
 	/* there's features depending on version! */
 	v->header.version = 155;
 	v->header.header_size = sizeof(v->header);
-	v->header.vbt_size = sizeof(struct vbt) - sizeof(v->header);
+	v->header.vbt_size = sizeof(struct vbt);
 	v->header.bdb_offset = offsetof(struct vbt, bdb_header);
 
 	strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
 	v->bdb_header.version = 186; /* child_dev_size = 33 */
 	v->bdb_header.header_size = sizeof(v->bdb_header);
 
-	v->bdb_header.bdb_size = sizeof(struct vbt) - sizeof(struct vbt_header)
-		- sizeof(struct bdb_header);
+	v->bdb_header.bdb_size = sizeof(struct vbt) - sizeof(struct vbt_header);
 
 	/* general features */
 	v->general_features_header.id = BDB_GENERAL_FEATURES;
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
