Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85085175610
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Mar 2020 09:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D97E89A94;
	Mon,  2 Mar 2020 08:36:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380589A94
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Mar 2020 08:36:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 00:36:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="239473673"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by orsmga003.jf.intel.com with ESMTP; 02 Mar 2020 00:36:26 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
Date: Mon,  2 Mar 2020 16:31:30 +0800
Message-Id: <20200302083130.17831-1-tina.zhang@intel.com>
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

Those regs are added in order to slove the following complains:

 [70811.201818] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2341 at offset 24d8
 [70811.201825] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2351 at offset 24dc
 [70811.201831] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10000d82 at offset 24e0
 [70811.201837] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10064844 at offset 24e4

So solve them by adding the required regs to the whitelist.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 1793f6991fa8..0946d5618d29 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -460,11 +460,14 @@ static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	return 0;
 }
 
-/* ascendingly sorted */
+/* sorted in ascending order */
 static i915_reg_t force_nonpriv_white_list[] = {
+	_MMIO(0xd80),
 	GEN9_CS_DEBUG_MODE1, //_MMIO(0x20ec)
 	GEN9_CTX_PREEMPT_REG,//_MMIO(0x2248)
-	PS_INVOCATION_COUNT,//_MMIO(0x2348)
+	CL_PRIMITIVES_COUNT, //_MMIO(0x2340)
+	PS_INVOCATION_COUNT, //_MMIO(0x2348)
+	PS_DEPTH_COUNT, //_MMIO(0x2350)
 	GEN8_CS_CHICKEN1,//_MMIO(0x2580)
 	_MMIO(0x2690),
 	_MMIO(0x2694),
@@ -489,6 +492,7 @@ static i915_reg_t force_nonpriv_white_list[] = {
 	_MMIO(0xe18c),
 	_MMIO(0xe48c),
 	_MMIO(0xe5f4),
+	_MMIO(0x64844),
 };
 
 /* a simple bsearch */
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
