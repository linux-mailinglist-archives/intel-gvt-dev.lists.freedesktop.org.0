Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218094018E6
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Sep 2021 11:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA0489B12;
	Mon,  6 Sep 2021 09:34:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5689B12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Sep 2021 09:34:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="283638864"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="283638864"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 02:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="463894239"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.56])
 by fmsmga007.fm.intel.com with ESMTP; 06 Sep 2021 02:34:50 -0700
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Cc: Hang Yuan <hang.yuan@linux.intel.com>
Subject: [PATCH] drm/i915/gvt: Fix one klocwork issue about pointer engine
Date: Mon,  6 Sep 2021 17:10:23 +0800
Message-Id: <1630919423-5622-1-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
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

From: Hang Yuan <hang.yuan@linux.intel.com>

Pointer 'engine' returned from 'intel_gvt_render_mmio_to_engine' may
be NULL. Add a pointer check to avoid deference from it later.

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cde0a47..2f5e76a 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2016,6 +2016,11 @@ static int ring_mode_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	bool enable_execlist;
 	int ret;
 
+	if (unlikely(!engine)) {
+		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
+		return 0;
+	}
+
 	(*(u32 *)p_data) &= ~_MASKED_BIT_ENABLE(1);
 	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) ||
 	    IS_COMETLAKE(vgpu->gvt->gt->i915))
-- 
2.7.4

