Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7018C592
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Mar 2020 04:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB3B6EABE;
	Fri, 20 Mar 2020 03:07:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301E6EA2F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Mar 2020 03:07:24 +0000 (UTC)
IronPort-SDR: v2vYVwuikVOmGbJ8BLeG7MaaJM/XZ3cCSfydTQnpLA/ipdPhM+MKUF8GjSXbx/uznKVU6D/K32
 v5MqHC/ZMQQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 20:07:24 -0700
IronPort-SDR: d+XsA/Qa/Mxh5qf/nBZ9VfwCmGidmok4nc1E4BlQhDO4G0R5he7vTa8+Wh1vHp6s2905hH2KFL
 HAZxkqMuyxfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; d="scan'208";a="237119910"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2020 20:07:22 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
Date: Fri, 20 Mar 2020 11:02:49 +0800
Message-Id: <20200320030249.5759-1-tina.zhang@intel.com>
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

GVT-g provides guest with dp type connectors and does the dp emulations.
For crtc timing, GVT-g just copys the parameters from host, which is fine
when host has dp type connectors as the vgpu's crtc timing never goes to
hardware and the reasonable data got by guest is mostly for the sanity
checking and clock related calculating.

But when host doesn't have any dp ports, GVT-g may get invalid data from dp
related timing registers on host. And those invalid data cannot let guest
pass the sanity checking.

So, solve the issue by providing reasonable defauts for the transcoder mn
registers no matter whether host has or has not dp type connectors.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index a83df2f84eb9..44185cda0905 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -167,6 +167,17 @@ static u8 dpcd_fix_data[DPCD_HEADER_SIZE] = {
 	0x12, 0x014, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
+/* Set defaults to transcoder nm registers to gererate reasonable crtc clock */
+#define PIPE_MN_REG_NUM	0x4
+
+static u32 trans_m_n[4] = {
+	/*
+	 * PIPE_LINK_M1, PIPE_LINK_N1, PIPE_DATA_M1, PIPE_DATA_N1
+	 * generate crtc.clock = 89099 kHz
+	 */
+	0x46666, 0x80000, 0x7e34cccc, 0x800000
+};
+
 static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
@@ -233,6 +244,10 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |= DDI_BUF_CTL_ENABLE;
 		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &= ~DDI_BUF_IS_IDLE;
 		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTB_HOTPLUG_CPT;
+		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) = trans_m_n[0];
+		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) = trans_m_n[1];
+		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) = trans_m_n[2];
+		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) = trans_m_n[3];
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
@@ -253,6 +268,10 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |= DDI_BUF_CTL_ENABLE;
 		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &= ~DDI_BUF_IS_IDLE;
 		vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIC_DETECTED;
+		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) = trans_m_n[0];
+		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) = trans_m_n[1];
+		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) = trans_m_n[2];
+		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) = trans_m_n[3];
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) {
@@ -273,6 +292,10 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) |= DDI_BUF_CTL_ENABLE;
 		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) &= ~DDI_BUF_IS_IDLE;
 		vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDID_DETECTED;
+		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) = trans_m_n[0];
+		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) = trans_m_n[1];
+		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) = trans_m_n[2];
+		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) = trans_m_n[3];
 	}
 
 	if ((IS_SKYLAKE(dev_priv) || IS_KABYLAKE(dev_priv) ||
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
