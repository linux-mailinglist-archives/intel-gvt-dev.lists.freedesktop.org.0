Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E94725F14B
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Sep 2020 02:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187968911B;
	Mon,  7 Sep 2020 00:56:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C048911B;
 Mon,  7 Sep 2020 00:56:06 +0000 (UTC)
IronPort-SDR: NZtfPkBtSAnJqrVyYYdE+CmKdsEjcPhPOsft62YppIA4L6j9Grla7f5drpXTh0EPxtLv2wEZWr
 GMuNsjiNzrsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157950689"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157950689"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 17:56:06 -0700
IronPort-SDR: iadDbWYKWC5JGwJrnxE7Kz7JKy9Ld9kNhncKo91ptft8lasldkLDuPSYeAn6aFcBeuroobi59E
 nsbtz2EXh95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="479444072"
Received: from xzhan34-mobl2.bj.intel.com ([10.238.154.74])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2020 17:56:04 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 12/12] drm/i915/gvt: GVTg support pv workload submssion
Date: Sat,  5 Sep 2020 00:21:45 +0800
Message-Id: <1599236505-9086-13-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: kevin.tian@intel.com, Xiaolin Zhang <xiaolin.zhang@intel.com>,
 joonas.lahtinen@linux.intel.com, zhenyuw@linux.intel.com,
 chris@chris-wilson.co.uk, zhiyuan.lv@intel.com, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

implemented pv workload submission support within GVTg.

GVTg to read engine submission data (engine lrc) from the shared_page
with pv interface to reduce mmio trap cost and then eliminate
execlist HW behavior emulation by removing injecting context switch
interrupt to guest under workload submisison pv mode to improve efficiency.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h      |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c | 101 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/vgpu.c     |   1 +
 3 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 05c2f13..18c0926 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -217,6 +217,7 @@ struct intel_vgpu {
 	u32 pv_caps;
 	u64 shared_page_gpa;
 	bool shared_page_enabled;
+	u64 pv_sub_gpa;
 };
 
 static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index f1ad024..399427d 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1323,6 +1323,7 @@ static int pv_command_buffer_read(struct intel_vgpu *vgpu,
 
 static int handle_pv_commands(struct intel_vgpu *vgpu)
 {
+	struct pv_cap_addr *cap_addr;
 	struct intel_vgpu_mm *mm;
 	struct pv_vma *vma;
 	u64 pdp;
@@ -1336,6 +1337,17 @@ static int handle_pv_commands(struct intel_vgpu *vgpu)
 		return ret;
 
 	switch (cmd) {
+	case PV_CMD_REGISTER_CAP_GPA:
+		cap_addr = (struct pv_cap_addr *)data;
+		switch (cap_addr->cap) {
+		case PV_SUBMISSION:
+			vgpu->pv_sub_gpa = cap_addr->gpa;
+			break;
+		default:
+			gvt_vgpu_err("invalid pv cap 0x%x\n", cap_addr->cap);
+			break;
+		}
+		break;
 	case PV_CMD_BIND_PPGTT:
 	case PV_CMD_UNBIND_PPGTT:
 		vma = (struct pv_vma *)data;
@@ -1858,6 +1870,91 @@ static int mmio_read_from_hw(struct intel_vgpu *vgpu,
 	return intel_vgpu_default_mmio_read(vgpu, offset, p_data, bytes);
 }
 
+static int pv_prepare_workload(struct intel_vgpu_workload *workload)
+{
+	return 0;
+}
+
+static int pv_complete_workload(struct intel_vgpu_workload *workload)
+{
+	return 0;
+}
+
+static int submit_context_pv(struct intel_vgpu *vgpu,
+			  const struct intel_engine_cs *engine,
+			  struct execlist_ctx_descriptor_format *desc,
+			  bool emulate_schedule_in)
+{
+	struct intel_vgpu_workload *workload = NULL;
+
+	workload = intel_vgpu_create_workload(vgpu, engine, desc);
+	if (IS_ERR(workload))
+		return PTR_ERR(workload);
+
+	workload->prepare = pv_prepare_workload;
+	workload->complete = pv_complete_workload;
+
+	intel_vgpu_queue_workload(workload);
+	return 0;
+}
+
+#define get_desc_from_elsp_dwords(ed, i) \
+	((struct execlist_ctx_descriptor_format *)&((ed)->data[i * 2]))
+
+static int handle_pv_submission(struct intel_vgpu *vgpu,
+		const struct intel_engine_cs *engine)
+{
+	struct intel_vgpu_execlist *execlist;
+	struct pv_submission subdata;
+	struct execlist_ctx_descriptor_format *desc[2];
+	u32 ring_id = engine->id;
+	u64 base = vgpu->pv_sub_gpa + ring_id * sizeof(struct pv_submission);
+	u64 submit_off = offsetof(struct pv_submission, submitted) + base;
+	bool submitted = false;
+	int i, ret;
+
+	execlist = &vgpu->submission.execlist[ring_id];
+	if (intel_gvt_hypervisor_read_gpa(vgpu, base, &subdata, sizeof(subdata)))
+		return -EINVAL;
+
+	desc[0] = (struct execlist_ctx_descriptor_format *)&(subdata.descs[0]);
+	desc[1] = (struct execlist_ctx_descriptor_format *)&(subdata.descs[1]);
+
+	if (!desc[0]->valid) {
+		gvt_vgpu_err("invalid elsp submission, desc0 is invalid\n");
+		goto inv_desc;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(desc); i++) {
+		if (!desc[i]->valid)
+			continue;
+		if (!desc[i]->privilege_access) {
+			gvt_vgpu_err("unexpected GGTT elsp submission\n");
+			goto inv_desc;
+		}
+	}
+
+	/* submit workload */
+	for (i = 0; i < ARRAY_SIZE(desc); i++) {
+		if (!desc[i]->valid)
+			continue;
+
+		ret = submit_context_pv(vgpu, engine, desc[i], i == 0);
+		if (ret) {
+			gvt_vgpu_err("failed to submit desc %d\n", i);
+			return ret;
+		}
+	}
+
+	ret = intel_gvt_hypervisor_write_gpa(vgpu, submit_off, &submitted, 1);
+	return ret;
+
+inv_desc:
+	gvt_vgpu_err("descriptors content: desc0 %08x %08x desc1 %08x %08x\n",
+		     desc[0]->udw, desc[0]->ldw, desc[1]->udw, desc[1]->ldw);
+	return -EINVAL;
+}
+
 static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
@@ -1870,6 +1967,10 @@ static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	if (drm_WARN_ON(&i915->drm, !engine))
 		return -EINVAL;
 
+	if (intel_vgpu_enabled_pv_cap(vgpu, PV_SUBMISSION) &&
+			data == PV_CMD_SUBMIT_WORKLOAD)
+		return handle_pv_submission(vgpu, engine);
+
 	execlist = &vgpu->submission.execlist[engine->id];
 
 	execlist->elsp_dwords.data[3 - execlist->elsp_dwords.index] = data;
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 1411c7b5..6737cf7 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -51,6 +51,7 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 	vgpu_vreg_t(vgpu, vgtif_reg(vgt_caps)) |= VGT_CAPS_PV;
 
 	vgpu_vreg_t(vgpu, vgtif_reg(pv_caps)) = PV_PPGTT | PV_GGTT;
+	vgpu_vreg_t(vgpu, vgtif_reg(pv_caps)) |= PV_SUBMISSION;
 
 	vgpu_vreg_t(vgpu, vgtif_reg(avail_rs.mappable_gmadr.base)) =
 		vgpu_aperture_gmadr_base(vgpu);
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
