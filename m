Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA302682D3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Sep 2020 05:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12989F5F;
	Mon, 14 Sep 2020 03:02:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DD589C9D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Sep 2020 03:02:08 +0000 (UTC)
IronPort-SDR: SppF3Uu7QbioUweeY9CB3UacIuj1zLbCQrnKOwUMa94QMhg3tr09d3UQuMPKC5neqyxsCqUpju
 jJa92l4udSTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="156414433"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; d="scan'208";a="156414433"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 20:02:08 -0700
IronPort-SDR: MoSOihpu0C999rr63Ia5A2JEN7y1vMSsX7DkMDiOzQBID/1Yqvec1/bn8cRV1p5pRlS/G02fgW
 F2kvkXoZaBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; d="scan'208";a="306014050"
Received: from debian-skl.sh.intel.com ([10.239.160.44])
 by orsmga006.jf.intel.com with ESMTP; 13 Sep 2020 20:02:07 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix port number for BDW on EDID region setup
Date: Mon, 14 Sep 2020 11:03:02 +0800
Message-Id: <20200914030302.2775505-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Alejandro Sior <aho@sior.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Current BDW virtual display port is initialized as PORT_B, so need
to use same port for VFIO EDID region, otherwise invalid EDID blob
pointer is assigned which caused kernel null pointer reference. We
might evaluate actual display hotplug for BDW to make this function
work as expected, anyway this is always required to be fixed first.

Reported-by: Alejandro Sior <aho@sior.be>
Cc: Alejandro Sior <aho@sior.be>
Fixes: 0178f4ce3c3b ("drm/i915/gvt: Enable vfio edid for all GVT supported platform")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 8fa9b31a2484..f6d7e33c7099 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -368,6 +368,7 @@ void intel_gvt_destroy_idle_vgpu(struct intel_vgpu *vgpu)
 static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 		struct intel_vgpu_creation_params *param)
 {
+	struct drm_i915_private *dev_priv = gvt->gt->i915;
 	struct intel_vgpu *vgpu;
 	int ret;
 
@@ -436,7 +437,10 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	if (ret)
 		goto out_clean_sched_policy;
 
-	ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
+	if (IS_BROADWELL(dev_priv))
+		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
+	else
+		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
 	if (ret)
 		goto out_clean_sched_policy;
 
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
