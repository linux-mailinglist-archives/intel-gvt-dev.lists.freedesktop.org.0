Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41EB6258E8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 11:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8056B10E7FF;
	Fri, 11 Nov 2022 10:57:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B39010E7FE;
 Fri, 11 Nov 2022 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668164248; x=1699700248;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=z+C69Y9MYwYBkL7n0zgCNzMBgSh88lPHbyHq9bc80sM=;
 b=YaHkUB+NCBfiFB9pJaXnrj/VgwPSsKNfVdU8kb1n6D1r7lrrNTL0Pnh7
 YdTBXYbRBgy3TuFCdwxZIHo3rSLOlt7sr8BSeGxvkCVHqKJ/l6sRroehD
 36Uel2pD2PsXMdJGViD1kHRDUDdcttxjiVwfEJE56VViweYbgFqcAfMOa
 Mi0hLHa8YCDqMgcrT9Van6SRneMCKzz1QwM9olNGA00TE9r+MXhp2gwY0
 02qkwRbsc/mnLgDRk+0crvDWGbvMLTDoyIiejQzXzQmTymqT6RdwPW8JX
 EtPEL9jsIPuEjQCHsY1OSapkqmLvORx+CHt05SZPgRC3/JGDBUlPfiNcq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="375838735"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="375838735"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:57:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="631998597"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="631998597"
Received: from yzhao56-desk.sh.intel.com ([10.238.200.254])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:57:25 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915/gvt: switch from track_flush_slot to
 track_remove_slot
Date: Fri, 11 Nov 2022 18:34:36 +0800
Message-Id: <20221111103436.22381-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111103247.22275-1-yan.y.zhao@intel.com>
References: <20221111103247.22275-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org, seanjc@google.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pbonzini@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

KVMGT only cares about when a slot is indeed removed.
So switch to use track_remove_slot which is called when a slot is removed.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 714221f9a131..9582d047471f 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -109,7 +109,7 @@ struct gvt_dma {
 static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
 		const u8 *val, int len,
 		struct kvm_page_track_notifier_node *node);
-static void kvmgt_page_track_flush_slot(struct kvm *kvm,
+static void kvmgt_page_track_remove_slot(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		struct kvm_page_track_notifier_node *node);
 
@@ -673,7 +673,7 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	gvt_cache_init(vgpu);
 
 	vgpu->track_node.track_write = kvmgt_page_track_write;
-	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
+	vgpu->track_node.track_remove_slot = kvmgt_page_track_remove_slot;
 	kvm_get_kvm(vgpu->vfio_device.kvm);
 	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
 					 &vgpu->track_node);
@@ -1617,7 +1617,7 @@ static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
 						     (void *)val, len);
 }
 
-static void kvmgt_page_track_flush_slot(struct kvm *kvm,
+static void kvmgt_page_track_remove_slot(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		struct kvm_page_track_notifier_node *node)
 {
-- 
2.17.1

