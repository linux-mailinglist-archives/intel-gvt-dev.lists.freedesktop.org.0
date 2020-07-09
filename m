Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFA21998A
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jul 2020 09:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD396E9E5;
	Thu,  9 Jul 2020 07:12:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A526E9E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jul 2020 07:11:59 +0000 (UTC)
IronPort-SDR: 2jUhu1PCFQeUpabCaU/8Yz88he1JJm7d4NZLR6bJXtZc8L7xe+6m94qCw1Kgy+MBPT6t/bFxWD
 +0yREvW2bm0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="212863953"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="212863953"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 00:11:59 -0700
IronPort-SDR: LXDxLNrY2uOGDuTnjhHJ/bjD7YBbTZYg8kOeKB8mOJnBAyqwtzWoJUSsyY6MOW3VPASTIosfd1
 vNFu6gCmTPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="358355348"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga001.jf.intel.com with ESMTP; 09 Jul 2020 00:11:58 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915/gvt: Do not reset pv_notified when vGPU
 transit from D3->D0
Date: Thu,  9 Jul 2020 15:09:57 +0800
Message-Id: <20200709071002.247960-3-colin.xu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709071002.247960-1-colin.xu@intel.com>
References: <20200709071002.247960-1-colin.xu@intel.com>
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
Cc: kevin.tian@intel.com, colin.xu@intel.com, zhenyuw@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Unlike full initialization like normal boot, guest driver won't
pv_notified GVT when vGPU transit from D3->D0. If pv_notified is reset,
later vGPU operations will trigger enter into failsafe mode.

Considering the fact that vGPU will at least notify GVT pv_notified once
before D3/D0 transition, it's safe to skip reset pv_notified in D3->D0.

To test this feature, make sure S3 is enabled in QEMU parameters:
i440fx: PIIX4_PM.disable_s3=0
q35: ICH9-LPC.disable_s3=0
Also need enable sleep option in guest OS if it's disabled.

v2:
- Revise commit message to more accurate description. (Kevin)
- Split patch by logic. (Zhenyu)

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index fb12448fe353..8fa9b31a2484 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -579,13 +579,14 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 			intel_vgpu_reset_cfg_space(vgpu);
 			/* only reset the failsafe mode when dmlr reset */
 			vgpu->failsafe = false;
-			vgpu->pv_notified = false;
 			/*
 			 * PCI_D0 is set before dmlr, so reset d3_entered here
 			 * after done using.
 			 */
 			if(vgpu->d3_entered)
 				vgpu->d3_entered = false;
+			else
+				vgpu->pv_notified = false;
 		}
 	}
 
-- 
2.27.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
