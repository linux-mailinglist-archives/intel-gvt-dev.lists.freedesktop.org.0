Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767843B8C70
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  1 Jul 2021 04:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3C6E9A9;
	Thu,  1 Jul 2021 02:54:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D436E9A9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  1 Jul 2021 02:54:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="195752814"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="195752814"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 19:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="558506840"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.30])
 by orsmga004.jf.intel.com with ESMTP; 30 Jun 2021 19:54:27 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Clear d3_entered on elsp cmd submission.
Date: Thu,  1 Jul 2021 10:54:23 +0800
Message-Id: <20210701025423.312943-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

d3_entered flag is used to mark for vgpu_reset a previous power
transition from D3->D0, typically for VM resume from S3, so that gvt
could skip PPGTT invalidation in current vgpu_reset during resuming.

In case S0ix exit, although there is D3->D0, guest driver continue to
use vgpu as normal, with d3_entered set, until next shutdown/reboot or
power transition.

If a reboot follows a S0ix exit, device power state transite as:
D0->D3->D0->D0(reboot), while system power state transites as:
S0->S0 (reboot). There is no vgpu_reset until D0(reboot), thus
d3_entered won't be cleared, the vgpu_reset will skip PPGTT invalidation
however those PPGTT entries are no longer valid. Err appears like:

gvt: vgpu 2: vfio_pin_pages failed for gfn 0xxxxx, ret -22
gvt: vgpu 2: fail: spt xxxx guest entry 0xxxxx type 2
gvt: vgpu 2: fail: shadow page xxxx guest entry 0xxxxx type 2.

Give gvt a chance to clear d3_entered on elsp cmd submission so that the
states before & after S0ix enter/exit are consistent.

Fixes: ba25d977571e ("drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.")

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 98eb48c24c46..f3e044521aa6 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1977,6 +1977,9 @@ static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	if (drm_WARN_ON(&i915->drm, !engine))
 		return -EINVAL;
 
+	if (vgpu->d3_entered)
+		vgpu->d3_entered = false;
+
 	execlist = &vgpu->submission.execlist[engine->id];
 
 	execlist->elsp_dwords.data[3 - execlist->elsp_dwords.index] = data;
-- 
2.32.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
