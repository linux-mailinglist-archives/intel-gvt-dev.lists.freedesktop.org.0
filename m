Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978572E17E5
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 04:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA806E8C4;
	Wed, 23 Dec 2020 03:57:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BD26E8C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 03:57:46 +0000 (UTC)
IronPort-SDR: ySu6+x1ZOBXea/npyCcCPwfTm+4TabGgwdn/+6726yAIhb958WsbJZwBSOkpKLa5PBPZxCa4s7
 Og4ZfP5I5+6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="172448612"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="172448612"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:57:44 -0800
IronPort-SDR: KaGNWrH1My3NLLIelLzQZEVDnAmsrIgR/o6Kh+CtUTkz98YccIwvgLYP2lSNX86Kjs6JFgZ+oS
 K4etHv0UN6xg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="564929730"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:57:42 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v5 02/11] drm/i915/gvt: scan VM ctx pages
Date: Wed, 23 Dec 2020 11:45:00 +0800
Message-Id: <20201223034500.16983-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223034353.16882-1-yan.y.zhao@intel.com>
References: <20201223034353.16882-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Wang Zhi <zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Logical Context is actually a big batch buffer consisting of multiple
LRI commands + saved registers. It comprises Ring Context (the first
0x50 dwords) and Engine Context. The registers defined in Engine Context
are command accessible, and safe to execute in VM Context.
This patch
1. stops copy Ring Context and only copys Engine Context from VM Context
2. audits VM Engine Contexts to disallow undesired LRIs
(if accessing registers out of Engine Context that hardware generates).

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Wang Zhi <zhi.a.wang@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 52 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/cmd_parser.h |  2 ++
 drivers/gpu/drm/i915/gvt/reg.h        |  2 ++
 drivers/gpu/drm/i915/gvt/scheduler.c  | 22 +++++++++---
 4 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 2e6d46246f76..a598329a3354 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -3193,6 +3193,58 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
 	}
 }
 
+int intel_gvt_scan_engine_context(struct intel_vgpu_workload *workload)
+{
+	struct intel_vgpu *vgpu = workload->vgpu;
+	unsigned long gma_head, gma_tail, gma_start, ctx_size;
+	struct parser_exec_state s;
+	int ring_id = workload->engine->id;
+	struct intel_context *ce = vgpu->submission.shadow[ring_id];
+	int ret;
+
+	GEM_BUG_ON(atomic_read(&ce->pin_count) < 0);
+
+	ctx_size = workload->engine->context_size - PAGE_SIZE;
+
+	/* Only ring contxt is loaded to HW for inhibit context, no need to
+	 * scan engine context
+	 */
+	if (is_inhibit_context(ce))
+		return 0;
+
+	gma_start = i915_ggtt_offset(ce->state) + LRC_STATE_PN*PAGE_SIZE;
+	gma_head = 0;
+	gma_tail = ctx_size;
+
+	s.buf_type = RING_BUFFER_CTX;
+	s.buf_addr_type = GTT_BUFFER;
+	s.vgpu = workload->vgpu;
+	s.engine = workload->engine;
+	s.ring_start = gma_start;
+	s.ring_size = ctx_size;
+	s.ring_head = gma_start + gma_head;
+	s.ring_tail = gma_start + gma_tail;
+	s.rb_va = ce->lrc_reg_state;
+	s.workload = workload;
+	s.is_ctx_wa = false;
+	s.is_init_ctx = false;
+
+	/* don't scan the first RING_CTX_SIZE(0x50) dwords, as it's ring
+	 * context
+	 */
+	ret = ip_gma_set(&s, gma_start + gma_head + RING_CTX_SIZE);
+	if (ret)
+		goto out;
+
+	ret = command_scan(&s, gma_head, gma_tail,
+		gma_start, ctx_size);
+out:
+	if (ret)
+		gvt_vgpu_err("scan shadow ctx error\n");
+
+	return ret;
+}
+
 static int init_cmd_table(struct intel_gvt *gvt)
 {
 	unsigned int gen_type = intel_gvt_get_device_type(gvt);
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.h b/drivers/gpu/drm/i915/gvt/cmd_parser.h
index 09ca2b8a63c8..d5e95b7026a1 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.h
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.h
@@ -52,4 +52,6 @@ int intel_gvt_scan_and_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx);
 
 void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu);
 
+int intel_gvt_scan_engine_context(struct intel_vgpu_workload *workload);
+
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/reg.h b/drivers/gpu/drm/i915/gvt/reg.h
index b58860dee970..244cc7320b54 100644
--- a/drivers/gpu/drm/i915/gvt/reg.h
+++ b/drivers/gpu/drm/i915/gvt/reg.h
@@ -133,4 +133,6 @@
 #define RING_GFX_MODE(base)	_MMIO((base) + 0x29c)
 #define VF_GUARDBAND		_MMIO(0x83a4)
 
+
+#define BCS_TILE_REGISTER_VAL_OFFSET (0x43*4)
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 6af5c06caee0..43f31c2eab14 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -137,6 +137,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 	int i;
 	bool skip = false;
 	int ring_id = workload->engine->id;
+	int ret;
 
 	GEM_BUG_ON(!intel_context_is_pinned(ctx));
 
@@ -163,16 +164,24 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		COPY_REG(bb_per_ctx_ptr);
 		COPY_REG(rcs_indirect_ctx);
 		COPY_REG(rcs_indirect_ctx_offset);
-	}
+	} else if (workload->engine->id == BCS0)
+		intel_gvt_hypervisor_read_gpa(vgpu,
+				workload->ring_context_gpa +
+				BCS_TILE_REGISTER_VAL_OFFSET,
+				(void *)shadow_ring_context +
+				BCS_TILE_REGISTER_VAL_OFFSET, 4);
 #undef COPY_REG
 #undef COPY_REG_MASKED
 
+	/* don't copy Ring Context (the first 0x50 dwords),
+	 * only copy the Engine Context part from guest
+	 */
 	intel_gvt_hypervisor_read_gpa(vgpu,
 			workload->ring_context_gpa +
-			sizeof(*shadow_ring_context),
+			RING_CTX_SIZE,
 			(void *)shadow_ring_context +
-			sizeof(*shadow_ring_context),
-			I915_GTT_PAGE_SIZE - sizeof(*shadow_ring_context));
+			RING_CTX_SIZE,
+			I915_GTT_PAGE_SIZE - RING_CTX_SIZE);
 
 	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
 
@@ -239,6 +248,11 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		gpa_size = I915_GTT_PAGE_SIZE;
 		dst = context_base + (i << I915_GTT_PAGE_SHIFT);
 	}
+	ret = intel_gvt_scan_engine_context(workload);
+	if (ret) {
+		gvt_vgpu_err("invalid cmd found in guest context pages\n");
+		return ret;
+	}
 	s->last_ctx[ring_id].valid = true;
 	return 0;
 }
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
