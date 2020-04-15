Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7CA1A958B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 10:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E8A6E8FF;
	Wed, 15 Apr 2020 08:06:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D686E8FF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 08:06:05 +0000 (UTC)
IronPort-SDR: +JlWi/d1/3Yh7QZfftxJW3FUtcvj6NdLeIreNVqq+vmHiPC78uhDO6v1vimU90BRc9l0wbt4mv
 YCrOa44v60VA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:06:05 -0700
IronPort-SDR: f7bomtJaMXGRXPr/7WGNx4wSyDvFd6ijQuYmCpNlszKtE/o3jNHv0bu2Ms1co+YqZ/bkqbzrdD
 PBVPfIIWcfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="277539098"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 01:06:03 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/i915/gvt: turn on shadow context skipping
Date: Wed, 15 Apr 2020 03:56:24 -0400
Message-Id: <20200415075624.23459-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415075355.23308-1-yan.y.zhao@intel.com>
References: <20200415075355.23308-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

turnning on skipping of population of the shadow context

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 717d2a110a40..1f0b15b9a846 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -200,9 +200,6 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	atomic_set(&s->last_ctx[ring_id].lrca, workload->ctx_desc.lrca);
 	s->last_ctx[ring_id].ring_context_gpa = workload->ring_context_gpa;
 
-	/* intentionally set it to false now. will turn it on in later patch */
-	skip = false;
-
 	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
 		return 0;
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
