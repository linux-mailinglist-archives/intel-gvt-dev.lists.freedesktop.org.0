Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32098187BD6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Mar 2020 10:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83FF89DA2;
	Tue, 17 Mar 2020 09:18:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35189DA2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Mar 2020 09:18:50 +0000 (UTC)
IronPort-SDR: s9YyjAt63pDcW+9LL/BYJRX88y9OOta8pqdE3gjaZl70F9BwkPUgNayhv9o27FM3l9yvnEOFAX
 Cxv3ZU3kIAiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 02:18:50 -0700
IronPort-SDR: 0T2LbPPKzeUX75tPSTK7z32zH1QcK0CWViJCwDZNW7Vj9gFpxJ7SmykMuTBFYdA3lfXlpqlomS
 1iy34Jz7Wg/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,563,1574150400"; d="scan'208";a="262968112"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2020 02:18:49 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
Date: Tue, 17 Mar 2020 17:14:14 +0800
Message-Id: <20200317091414.10246-1-tina.zhang@intel.com>
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

v2: give name to 0x64844 mmio (zhenyu)

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 0182e2a5acff..35f432e68364 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -462,11 +462,16 @@ static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	return 0;
 }
 
-/* ascendingly sorted */
+#define SRD_PERF_CNT _MMIO(0x64844)
+
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
@@ -491,6 +496,7 @@ static i915_reg_t force_nonpriv_white_list[] = {
 	_MMIO(0xe18c),
 	_MMIO(0xe48c),
 	_MMIO(0xe5f4),
+	SRD_PERF_CNT, //_MMIO(0x64844),
 };
 
 /* a simple bsearch */
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
