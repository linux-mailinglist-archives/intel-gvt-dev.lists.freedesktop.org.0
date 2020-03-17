Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD4187C7D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Mar 2020 10:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BBC89C85;
	Tue, 17 Mar 2020 09:40:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C1F89C85
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Mar 2020 09:40:50 +0000 (UTC)
IronPort-SDR: cPIdC3sJU56A4MfgV0fbkFeZS6r6HeTScoqlVkkw0Cnnl59Da9OXv3IA41WxQbtvL92gwGO1Fg
 MZrgsxJoOGEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 02:40:50 -0700
IronPort-SDR: v/fU/LKIky59H/pjIGdNbdegfyW9VY8deLMic/XxmWCzqRYPkRUpSGFGhestmedTfrPb7hZNjy
 7aa1SBuu+OxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="267903656"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2020 02:40:49 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Fix display port type issue
Date: Tue, 17 Mar 2020 17:36:15 +0800
Message-Id: <20200317093615.10538-1-tina.zhang@intel.com>
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

According to the vbt provided by GVT-g, the display output type should
be display port, instead of DVI. Currently, GVT-g display model only
supports display port emulation, not DVI or HDMI. This patch fixes this
by telling guest i915 the right output type supported by GVT-g.

v3: make port_b and port_c use dp type connector too. (Zhenyu)
v2: refine the commit message. (Zhenyu)

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 6e5c9885d9fe..a83df2f84eb9 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -221,7 +221,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
 			TRANS_DDI_PORT_MASK);
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
-			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
+			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 			(PORT_B << TRANS_DDI_PORT_SHIFT) |
 			TRANS_DDI_FUNC_ENABLE);
 		if (IS_BROADWELL(dev_priv)) {
@@ -241,7 +241,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
 			TRANS_DDI_PORT_MASK);
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
-			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
+			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
 			(PORT_C << TRANS_DDI_PORT_SHIFT) |
 			TRANS_DDI_FUNC_ENABLE);
 		if (IS_BROADWELL(dev_priv)) {
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
