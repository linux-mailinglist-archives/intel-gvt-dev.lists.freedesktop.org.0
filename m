Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F2122533
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Dec 2019 08:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBC86E947;
	Tue, 17 Dec 2019 07:12:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7B76E947;
 Tue, 17 Dec 2019 07:12:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 23:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,324,1571727600"; d="scan'208";a="415350865"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2019 23:12:24 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix vGPU kernel context kmemleak
Date: Tue, 17 Dec 2019 15:13:54 +0800
Message-Id: <20191217071354.20006-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.24.0
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
Cc: intel-gvt-dev@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Current GVT allocates kernel context as vGPU submission context.
For vGPU destroy, the kernel context needs to be close then released,
otherwise context's vm ppgtt resource would cause memleak issue like
below. This trys to add new helper to destroy kernel context for that.

unreferenced object 0xffff8ff6a3b46400 (size 1024):
  comm "type.sh", pid 2078, jiffies 4294909812 (age 89732.440s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 e0 ff ff ff 0f 00 00 00  ................
    10 64 b4 a3 f6 8f ff ff 10 64 b4 a3 f6 8f ff ff  .d.......d......
  backtrace:
    [<000000009d45297c>] kmem_cache_alloc_trace+0x131/0x240
    [<00000000a6e3cc58>] gen8_ppgtt_create+0x2f/0x580 [i915]
    [<0000000054e72785>] i915_ppgtt_create+0x1a/0x80 [i915]
    [<000000003bc414cd>] i915_gem_create_context+0x296/0x390 [i915]
    [<0000000017a40875>] i915_gem_context_create_kernel+0x13/0x40 [i915]
    [<00000000124aecff>] intel_vgpu_setup_submission+0x2d/0x370 [i915]
    [<00000000b6be72ee>] intel_gvt_create_vgpu+0x298/0x360 [i915]
    [<00000000527d88ad>] intel_vgpu_create+0x5d/0x130 [kvmgt]
    [<000000000d912742>] mdev_device_create+0x1cd/0x290 [mdev]
    [<000000001231e5d2>] create_store+0x92/0xd0 [mdev]
    [<00000000408c3c74>] mdev_type_attr_store+0x1e/0x30 [mdev]
    [<0000000035d8e9cd>] sysfs_kf_write+0x3c/0x50
    [<0000000084ce74a8>] kernfs_fop_write+0x125/0x1a0
    [<0000000019db1653>] __vfs_write+0x1b/0x40
    [<00000000a72bac26>] vfs_write+0xb1/0x1a0
    [<0000000036135673>] ksys_write+0xa7/0xe0

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 +++++
 drivers/gpu/drm/i915/gem/i915_gem_context.h | 1 +
 drivers/gpu/drm/i915/gvt/gvt.h              | 1 +
 drivers/gpu/drm/i915/gvt/scheduler.c        | 5 +++--
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 46b4d1d643f8..de1d753731c6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -742,6 +742,11 @@ i915_gem_context_create_kernel(struct drm_i915_private *i915, int prio)
 	return ctx;
 }
 
+void i915_gem_context_destroy_kernel(struct i915_gem_context *ctx)
+{
+	destroy_kernel_context(&ctx);
+}
+
 static void init_contexts(struct i915_gem_contexts *gc)
 {
 	spin_lock_init(&gc->lock);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index 18e50a769a6e..611754744437 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -180,6 +180,7 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
 
 struct i915_gem_context *
 i915_gem_context_create_kernel(struct drm_i915_private *i915, int prio);
+void i915_gem_context_destroy_kernel(struct i915_gem_context *ctx);
 
 static inline struct i915_gem_context *
 i915_gem_context_get(struct i915_gem_context *ctx)
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 0081b051d3e0..ece22a199551 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -149,6 +149,7 @@ struct intel_vgpu_submission_ops {
 struct intel_vgpu_submission {
 	struct intel_vgpu_execlist execlist[I915_NUM_ENGINES];
 	struct list_head workload_q_head[I915_NUM_ENGINES];
+	struct i915_gem_context *ctx;
 	struct intel_context *shadow[I915_NUM_ENGINES];
 	struct kmem_cache *workloads;
 	atomic_t running_workload_num;
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 5b2a7d072ec9..4f5d8f48de28 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1166,6 +1166,7 @@ void intel_vgpu_clean_submission(struct intel_vgpu *vgpu)
 	for_each_engine(engine, vgpu->gvt->dev_priv, id)
 		intel_context_unpin(s->shadow[id]);
 
+	i915_gem_context_destroy_kernel(s->ctx);
 	kmem_cache_destroy(s->workloads);
 }
 
@@ -1276,12 +1277,12 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 		ret = -ENOMEM;
 		goto out_shadow_ctx;
 	}
-
+	s->ctx = ctx;
 	atomic_set(&s->running_workload_num, 0);
 	bitmap_zero(s->tlb_handle_pending, I915_NUM_ENGINES);
 
 	i915_vm_put(&ppgtt->vm);
-	i915_gem_context_put(ctx);
+
 	return 0;
 
 out_shadow_ctx:
-- 
2.24.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
