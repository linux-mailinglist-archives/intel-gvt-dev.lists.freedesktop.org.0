Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170861C6D64
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 May 2020 11:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE946E038;
	Wed,  6 May 2020 09:43:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6665D6E038
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 May 2020 09:43:21 +0000 (UTC)
IronPort-SDR: FNq6oTUOfdV8HHc/Dz4kFyZvE9FcSOuCuAvNwznhiLX+V74TRhScbvrJXzRL97l2cgLyUspEny
 ayLgp7VnwoWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 02:43:20 -0700
IronPort-SDR: ZZtjgDGcvGIKNBYbVnSN1yX0fH5czkQqdXgUTHMGxCC6wiXK96NJf9smhmkK16wLnKmwzXyBtm
 kS+bntg+tyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="369741012"
Received: from xiaobo4x-mobl1.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.254.214.128])
 by fmsmga001.fm.intel.com with ESMTP; 06 May 2020 02:43:19 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/i915/gvt: move workload destroy out of execlist
 complete
Date: Wed,  6 May 2020 17:43:17 +0800
Message-Id: <20200506094318.105604-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200318135322.13788-1-tina.zhang@intel.com>
References: <20200318135322.13788-1-tina.zhang@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

To let execlist.c only handle execlist handling and keep other
workload cleanup function in scheduler.c to align with other
workload specific handling there. This doesn't change current
code behavior.

Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/execlist.c  | 2 --
 drivers/gpu/drm/i915/gvt/scheduler.c | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index dd25c3024370..158873f269b1 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -424,8 +424,6 @@ static int complete_execlist_workload(struct intel_vgpu_workload *workload)
 
 	ret = emulate_execlist_ctx_schedule_out(execlist, &workload->ctx_desc);
 out:
-	intel_vgpu_unpin_mm(workload->shadow_mm);
-	intel_vgpu_destroy_workload(workload);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 35ad540622ac..6e59c7d61397 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1013,6 +1013,9 @@ static void complete_current_workload(struct intel_gvt *gvt, int ring_id)
 
 	workload->complete(workload);
 
+	intel_vgpu_unpin_mm(workload->shadow_mm);
+	intel_vgpu_destroy_workload(workload);
+
 	atomic_dec(&s->running_workload_num);
 	wake_up(&scheduler->workload_complete_wq);
 
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
