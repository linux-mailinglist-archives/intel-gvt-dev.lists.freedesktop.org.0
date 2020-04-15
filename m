Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA41A9588
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 10:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9787E6E8FF;
	Wed, 15 Apr 2020 08:05:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731226E8FF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 08:05:36 +0000 (UTC)
IronPort-SDR: 99LwbQUplHiUIxRPBNYAkWKml0fhxeGqs0rIeHj0YcS2g+g3kQBnhXtxJCPzoEH/NhYlYEYe3o
 v/65IPtggj2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:05:35 -0700
IronPort-SDR: a1nDBofpngIGJg3baxmWX3pJR/UE9z5rbf0pSjFUV6aDTxIsJa96p9BRJvUcn10Yu1EMP4egpn
 s4Wyi7EWWfKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="277538979"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 01:05:34 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/i915/gvt: check ggtt entry modification status for
 guest ctxs
Date: Wed, 15 Apr 2020 03:55:54 -0400
Message-Id: <20200415075554.23408-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415075355.23308-1-yan.y.zhao@intel.com>
References: <20200415075355.23308-1-yan.y.zhao@intel.com>
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

for guest context, if its ggtt entry is modified after last context
shadowing, it is deemed as not the same context as last shadowed one.

v4: move valid bit and definiton of lrca type to first patch. (Kevin Tian)
v3: no change
v2: rebased to 5.6.0-rc4+

Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 2a4b23f8aa74..b1b6a51c006a 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2341,12 +2341,29 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
 {
 	const struct intel_gvt_device_info *info = &vgpu->gvt->device_info;
 	int ret;
+	struct intel_vgpu_submission *s = &vgpu->submission;
+	struct intel_engine_cs *engine;
+	int i;
 
 	if (bytes != 4 && bytes != 8)
 		return -EINVAL;
 
 	off -= info->gtt_start_offset;
 	ret = emulate_ggtt_mmio_write(vgpu, off, p_data, bytes);
+
+	/* if ggtt of last submitted context is written,
+	 * that context is probably got unpinned.
+	 * Set last shadowed ctx to invalid.
+	 */
+	for_each_engine(engine, vgpu->gvt->gt->i915, i) {
+		if (!s->last_ctx[i].valid)
+			continue;
+
+		if (atomic_read(&s->last_ctx[i].lrca) ==
+				off >> info->gtt_entry_size_shift) {
+			s->last_ctx[i].valid = false;
+		}
+	}
 	return ret;
 }
 
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
