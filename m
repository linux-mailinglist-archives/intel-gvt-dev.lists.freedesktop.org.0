Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBBD76952A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 31 Jul 2023 13:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A583710E269;
	Mon, 31 Jul 2023 11:47:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9910E269;
 Mon, 31 Jul 2023 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690804051; x=1722340051;
 h=from:to:cc:subject:date:message-id;
 bh=BuF2V2QBl8j3/eWUrzyOnJ939tHmLzmjmmYv3gOvdPY=;
 b=QW7hNkPzJHHf+TJ8z90EUg6inFAuAcTA+hDy3XT4Fl3GsuPuKnT3zP1U
 VJUfsNol9FokMwlogSflrsp9mIOjRdaqkVijE1K7loPDweh3mmoos27Kj
 LRtyVtaJ0CCWkMifaYabm30YQeiLCTD7Ibk6OZOpuAW+JV2/MjUB7Qvqg
 obvOLrnzYIE7nVU8EV2Q9Bn+CbZKRxAyCXL3yS6+aOy8BweQ6xwOQ3nrA
 YSMUOFnZ63kUq6JD9n+nySU8vW5bAknYlQTJS6vSgknPIuPwJIq1WHkvR
 iGHCqIix9XtU6+wgA2kB7944sjUmpjhKMoVRC7TojWCd5zOgLiddTLwau A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="372624148"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="372624148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 04:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="763357271"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="763357271"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 04:47:28 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix bug in getting msg length in AUX CH
 registers handler
Date: Mon, 31 Jul 2023 19:20:33 +0800
Message-Id: <20230731112033.7275-1-yan.y.zhao@intel.com>
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
Cc: linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>,
 zhi.a.wang@intel.com, zhenyuw@linux.intel.com, kvm@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Msg length should be obtained from value written to AUX_CH_CTL register
rather than from enum type of the register.

Commit 0cad796a2269  ("drm/i915: Use REG_BIT() & co. for AUX CH registers")
incorrectly calculates the msg_length from reg type and yields below
warning in intel_gvt_i2c_handle_aux_ch_write():
"i915 0000:00:02.0: drm_WARN_ON(msg_length != 4)".

Fixes: 0cad796a2269 ("drm/i915: Use REG_BIT() & co. for AUX CH registers")
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index 2a0438f12a14..af9afdb53c7f 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -491,7 +491,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 		return;
 	}
 
-	msg_length = REG_FIELD_GET(DP_AUX_CH_CTL_MESSAGE_SIZE_MASK, reg);
+	msg_length = REG_FIELD_GET(DP_AUX_CH_CTL_MESSAGE_SIZE_MASK, value);
 
 	// check the msg in DATA register.
 	msg = vgpu_vreg(vgpu, offset + 4);
-- 
2.17.1

