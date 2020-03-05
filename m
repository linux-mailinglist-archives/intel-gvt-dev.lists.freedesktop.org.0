Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A988817A63C
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Mar 2020 14:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4E26EBC0;
	Thu,  5 Mar 2020 13:21:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAD86EBC0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Mar 2020 13:20:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 05:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="352360581"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 05:20:57 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH v2] drm/i915/gvt: Fix display port type issue.
Date: Thu,  5 Mar 2020 21:16:00 +0800
Message-Id: <20200305131600.29640-2-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200305131600.29640-1-tina.zhang@intel.com>
References: <20200305131600.29640-1-tina.zhang@intel.com>
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

According to the vbt provided by GVT-g, the display output type should
be display port, instead of DVI. Currently, GVT-g display model only
supports display port emulation, not DVI or HDMI. This patch fixes this
by telling guest i915 the right output type supported by GVT-g.

v2: refine the commit message. (Zhenyu)

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 14e139e66e45..86dc80405977 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -261,7 +261,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
 			TRANS_DDI_PORT_MASK);
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
-			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
+			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 			(PORT_D << TRANS_DDI_PORT_SHIFT) |
 			TRANS_DDI_FUNC_ENABLE);
 		if (IS_BROADWELL(dev_priv)) {
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
