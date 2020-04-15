Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B873F1A91BB
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 06:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E366E834;
	Wed, 15 Apr 2020 04:08:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB936E834
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 04:08:09 +0000 (UTC)
IronPort-SDR: GDkjR1UDiz2CV1/8QrojKxBMFgOEhmDypTQAreCQhgJv/4EK7u9XVjVQvjh5tK3ET1dJpGsA/w
 jYY206qmxsOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 21:08:08 -0700
IronPort-SDR: E+xsRnr0ZXeeSDvbt2Jl4VB7xk23BXXyWFpkFTyvkqcvZBAZVaqq23/xsCaWaELstM1mgotiP/
 2EJnn+yCbAtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="277488174"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2020 21:08:07 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: combine access to consecutive guest context
 pages
Date: Tue, 14 Apr 2020 23:58:27 -0400
Message-Id: <20200415035827.26476-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415035633.26373-1-yan.y.zhao@intel.com>
References: <20200415035633.26373-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

IOVA(GPA)s of context pages are checked and if they are consecutive,
read/write them together in one intel_gvt_hypervisor_read_gpa() /
intel_gvt_hypervisor_write_gpa().

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 58 +++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 81a06f69835e..f939ec3be39e 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -133,6 +133,8 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	void *dst;
 	void *context_base;
 	unsigned long context_gpa, context_page_num;
+	unsigned long gpa_base; /* first gpa of consecutive GPAs */
+	unsigned long gpa_size; /* size of consecutive GPAs */
 	int i;
 
 	GEM_BUG_ON(!intel_context_is_pinned(ctx));
@@ -186,8 +188,11 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	if (IS_BROADWELL(gvt->gt->i915) && workload->engine->id == RCS0)
 		context_page_num = 19;
 
-	i = 2;
-	while (i < context_page_num) {
+	/* find consecutive GPAs from gma until the first inconsecutive GPA.
+	 * read from the continuous GPAs into dst virtual address
+	 */
+	gpa_size = 0;
+	for (i = 2; i < context_page_num; i++) {
 		context_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
 				(u32)((workload->ctx_desc.lrca + i) <<
 				I915_GTT_PAGE_SHIFT));
@@ -196,10 +201,24 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			return -EFAULT;
 		}
 
+		if (gpa_size == 0) {
+			gpa_base = context_gpa;
+			dst = context_base + (i << I915_GTT_PAGE_SHIFT);
+		} else if (context_gpa != gpa_base + gpa_size)
+			goto read;
+
+		gpa_size += I915_GTT_PAGE_SIZE;
+
+		if (i == context_page_num - 1)
+			goto read;
+
+		continue;
+
+read:
+		intel_gvt_hypervisor_read_gpa(vgpu, gpa_base, dst, gpa_size);
+		gpa_base = context_gpa;
+		gpa_size = I915_GTT_PAGE_SIZE;
 		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
-		intel_gvt_hypervisor_read_gpa(vgpu, context_gpa, dst,
-				I915_GTT_PAGE_SIZE);
-		i++;
 	}
 	return 0;
 }
@@ -789,6 +808,8 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	void *context_base;
 	void *src;
 	unsigned long context_gpa, context_page_num;
+	unsigned long gpa_base; /* first gpa of consecutive GPAs */
+	unsigned long gpa_size; /* size of consecutive GPAs*/
 	int i;
 	u32 ring_base;
 	u32 head, tail;
@@ -822,11 +843,14 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	if (IS_BROADWELL(rq->i915) && rq->engine->id == RCS0)
 		context_page_num = 19;
 
-	i = 2;
 	context_base = (void *) ctx->lrc_reg_state -
 			(LRC_STATE_PN << I915_GTT_PAGE_SHIFT);
 
-	while (i < context_page_num) {
+	/* find consecutive GPAs from gma until the first inconsecutive GPA.
+	 * write to the consecutive GPAs from src virtual address
+	 */
+	gpa_size = 0;
+	for (i = 2; i < context_page_num; i++) {
 		context_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
 				(u32)((workload->ctx_desc.lrca + i) <<
 					I915_GTT_PAGE_SHIFT));
@@ -835,10 +859,24 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 			return;
 		}
 
+		if (gpa_size == 0) {
+			gpa_base = context_gpa;
+			src = context_base + (i << I915_GTT_PAGE_SHIFT);
+		} else if (context_gpa != gpa_base + gpa_size)
+			goto write;
+
+		gpa_size += I915_GTT_PAGE_SIZE;
+
+		if (i == context_page_num - 1)
+			goto write;
+
+		continue;
+
+write:
+		intel_gvt_hypervisor_write_gpa(vgpu, gpa_base, src, gpa_size);
+		gpa_base = context_gpa;
+		gpa_size = I915_GTT_PAGE_SIZE;
 		src = context_base + (i << I915_GTT_PAGE_SHIFT);
-		intel_gvt_hypervisor_write_gpa(vgpu, context_gpa, src,
-				I915_GTT_PAGE_SIZE);
-		i++;
 	}
 
 	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa +
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
