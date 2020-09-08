Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDBE260B24
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 08:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E9B6E415;
	Tue,  8 Sep 2020 06:45:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459CD6E415
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Sep 2020 06:45:18 +0000 (UTC)
IronPort-SDR: RlStFlRinxOwuheJThway/LT1O5fV3gABCwPH1o8AMdglQ1Gjoz64yk1qYtg7gOqaWft6NvFI5
 MCiWmZq8uNgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="155571970"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="155571970"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 23:45:17 -0700
IronPort-SDR: 99WYbHT+5eBnpZZFRLDWrzAlFfEhpBplLROgBXqQFezPKkmXCb+cftk34pHUpLLsJ8cKJ5cYbO
 Z7OiEl5Z06Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="341074274"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2020 23:45:16 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Only pin/unpin intel_context along with workload
Date: Tue,  8 Sep 2020 14:45:10 +0800
Message-Id: <20200908064510.550352-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

One issue exposed after e6ba76480299 is that the system will freeze
at suspend after vGPU is created (no need to activate the vGPU).

Old implementation pin the intel_context at setup_submission and
unpin it at clean_submission. So after some vGPU is created, the
intel_context is always pinned there although no workload using it.
It will then block i915 enter suspend state.

There is no need to pin it all the time. Pin/unpin it around workload
lifecycle is more reasonable. After GVT enabled suspend/resume, the
pinned intel_context will also get unpined when userspace put VM process
into suspend state since all workloads are retired, then it's safe to
unpin all intel_context for workloads created. So move the pin/unpin to
create_workload and destroy_workload, while still keep the
create/destroy in old place.

Fixes: e6ba76480299 (drm/i915: Remove i915->kernel_context)
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 1570eb8aa978..aed2ef6466a2 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1277,7 +1277,7 @@ void intel_vgpu_clean_submission(struct intel_vgpu *vgpu)
 
 	i915_context_ppgtt_root_restore(s, i915_vm_to_ppgtt(s->shadow[0]->vm));
 	for_each_engine(engine, vgpu->gvt->gt, id)
-		intel_context_unpin(s->shadow[id]);
+		intel_context_put(s->shadow[id]);
 
 	kmem_cache_destroy(s->workloads);
 }
@@ -1369,11 +1369,6 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 			ce->ring = __intel_context_ring_size(ring_size);
 		}
 
-		ret = intel_context_pin(ce);
-		intel_context_put(ce);
-		if (ret)
-			goto out_shadow_ctx;
-
 		s->shadow[i] = ce;
 	}
 
@@ -1405,7 +1400,6 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 		if (IS_ERR(s->shadow[i]))
 			break;
 
-		intel_context_unpin(s->shadow[i]);
 		intel_context_put(s->shadow[i]);
 	}
 	i915_vm_put(&ppgtt->vm);
@@ -1479,6 +1473,7 @@ void intel_vgpu_destroy_workload(struct intel_vgpu_workload *workload)
 {
 	struct intel_vgpu_submission *s = &workload->vgpu->submission;
 
+	intel_context_unpin(s->shadow[workload->engine->id]);
 	release_shadow_batch_buffer(workload);
 	release_shadow_wa_ctx(&workload->wa_ctx);
 
@@ -1724,6 +1719,12 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
 		return ERR_PTR(ret);
 	}
 
+	ret = intel_context_pin(s->shadow[engine->id]);
+	if (ret) {
+		intel_vgpu_destroy_workload(workload);
+		return ERR_PTR(ret);
+	}
+
 	return workload;
 }
 
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
