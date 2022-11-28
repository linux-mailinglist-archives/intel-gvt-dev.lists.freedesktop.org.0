Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443663A55A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 28 Nov 2022 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3F610E1F1;
	Mon, 28 Nov 2022 09:47:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1B910E1F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 28 Nov 2022 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669628834; x=1701164834;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XwycmA1JXMXcKrYeVkEaFpNdQBHL+UBrqJzVUWDWXDQ=;
 b=GQiP14+sOhvAp1w5ugnIYqXrgwpnQuSguA9AB/P4iZdGiYwRMNGIQkOY
 kOWggh1DURvhIhf+DybeycnFK7l0X444lKz8r+Z6CAvT6I5EzGKisPlZO
 vnDciTS40dKZUKbJMpDA3KDBEEVEj8xbPa2dNcwNY+Ng4fmm3+DVTjiv5
 7TUVAvr5k8SYq/CN1wp6ZdGChWuD21NwE2tml4Fhb/0wgzWceHLA42Zt2
 aKsq3W/P4b5KtsR1ZWAOV4PatPpYg51gu2DFbAuMcABlUMLe7m+CeQuhM
 GfRjcUbYo0BJeh1YYnudnJ+hxOa/NwC+9+1gFhqfqg2SSWprB2wyiljpG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="316618838"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="316618838"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 01:47:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="817759058"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="817759058"
Received: from debian-skl.sh.intel.com ([10.239.159.40])
 by orsmga005.jf.intel.com with ESMTP; 28 Nov 2022 01:47:12 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Replace open coded hash table definition
Date: Mon, 28 Nov 2022 17:56:45 +0800
Message-Id: <20221128095645.672028-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Replace open coded vgpu write protect page's internal hash table
definition with generic helper.

Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index dbf8d7470b2c..51aa82445ed7 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -230,9 +230,7 @@ struct intel_vgpu {
 	atomic_t released;
 
 	struct kvm_page_track_notifier_node track_node;
-#define NR_BKT (1 << 18)
-	struct hlist_head ptable[NR_BKT];
-#undef NR_BKT
+	DECLARE_HASHTABLE(ptable, 18);
 };
 
 /* validating GM healthy status*/
-- 
2.35.2

