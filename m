Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39554FBEB3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4CC10EDC3;
	Mon, 11 Apr 2022 14:15:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EE610ED6E;
 Mon, 11 Apr 2022 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mTmo4HZmOxsqSBkamoQFJXpLMA7Hlpb5fzzGYdDeueg=; b=u3rIiz3U/Ztq1QEpWIdwYowYjM
 XxbK5+L/SMCJFY8aEMcB+oaFPeo3g/T2C7Dl2vr+JWbMGNUC6Xl8zCGLwCMSGGDLWOVkO8WhO+Ime
 LNIp53PZLSlx7hy/SfNuw+OhcupXEdpD2gC3ORaHEdM2wThWaVfsJ1z8i6ptvexjHY6uu5wEpc2I3
 s4tVUtC2ZEASxWw16q0muLEn4JpjMn0oMw0/1+Dxi5s4a+Owv+yL96FMhdVVacHX37mZc49Opa1bG
 SBG5XvrqlFL5OHYhVnl1AnSJPOyEgB5QSaXjpcbgVTvsl8/zV3GWTF0MPURys0JKgmHcnpXtlwWuB
 D1bpHmzw==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupK-009Kx7-6H; Mon, 11 Apr 2022 14:15:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 29/34] drm/i915/gvt: merge gvt.c into kvmgvt.c
Date: Mon, 11 Apr 2022 16:13:58 +0200
Message-Id: <20220411141403.86980-30-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411141403.86980-1-hch@lst.de>
References: <20220411141403.86980-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The code in both files is deeply interconnected, so merge it and
keep a bunch of structures and functions static.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/Makefile |   1 -
 drivers/gpu/drm/i915/gvt/gvt.c    | 291 ------------------------------
 drivers/gpu/drm/i915/gvt/gvt.h    |   6 -
 drivers/gpu/drm/i915/gvt/kvmgt.c  | 264 ++++++++++++++++++++++++++-
 4 files changed, 260 insertions(+), 302 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index cecedd9830f7c..2b08192930c18 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 kvmgt-y += \
-	gvt/gvt.o \
 	gvt/aperture_gm.o \
 	gvt/handlers.o \
 	gvt/vgpu.o \
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
deleted file mode 100644
index 047fb6c41788b..0000000000000
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ /dev/null
@@ -1,291 +0,0 @@
-/*
- * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- * Authors:
- *    Kevin Tian <kevin.tian@intel.com>
- *    Eddie Dong <eddie.dong@intel.com>
- *
- * Contributors:
- *    Niu Bing <bing.niu@intel.com>
- *    Zhi Wang <zhi.a.wang@intel.com>
- *
- */
-
-#include <linux/types.h>
-#include <linux/kthread.h>
-
-#include "i915_drv.h"
-#include "intel_gvt.h"
-#include "gvt.h"
-#include <linux/vfio.h>
-#include <linux/mdev.h>
-
-static void init_device_info(struct intel_gvt *gvt)
-{
-	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
-
-	info->max_support_vgpus = 8;
-	info->cfg_space_size = PCI_CFG_SPACE_EXP_SIZE;
-	info->mmio_size = 2 * 1024 * 1024;
-	info->mmio_bar = 0;
-	info->gtt_start_offset = 8 * 1024 * 1024;
-	info->gtt_entry_size = 8;
-	info->gtt_entry_size_shift = 3;
-	info->gmadr_bytes_in_cmd = 8;
-	info->max_surface_size = 36 * 1024 * 1024;
-	info->msi_cap_offset = pdev->msi_cap;
-}
-
-static void intel_gvt_test_and_emulate_vblank(struct intel_gvt *gvt)
-{
-	struct intel_vgpu *vgpu;
-	int id;
-
-	mutex_lock(&gvt->lock);
-	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) {
-		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK + id,
-				       (void *)&gvt->service_request)) {
-			if (vgpu->active)
-				intel_vgpu_emulate_vblank(vgpu);
-		}
-	}
-	mutex_unlock(&gvt->lock);
-}
-
-static int gvt_service_thread(void *data)
-{
-	struct intel_gvt *gvt = (struct intel_gvt *)data;
-	int ret;
-
-	gvt_dbg_core("service thread start\n");
-
-	while (!kthread_should_stop()) {
-		ret = wait_event_interruptible(gvt->service_thread_wq,
-				kthread_should_stop() || gvt->service_request);
-
-		if (kthread_should_stop())
-			break;
-
-		if (WARN_ONCE(ret, "service thread is waken up by signal.\n"))
-			continue;
-
-		intel_gvt_test_and_emulate_vblank(gvt);
-
-		if (test_bit(INTEL_GVT_REQUEST_SCHED,
-				(void *)&gvt->service_request) ||
-			test_bit(INTEL_GVT_REQUEST_EVENT_SCHED,
-					(void *)&gvt->service_request)) {
-			intel_gvt_schedule(gvt);
-		}
-	}
-
-	return 0;
-}
-
-static void clean_service_thread(struct intel_gvt *gvt)
-{
-	kthread_stop(gvt->service_thread);
-}
-
-static int init_service_thread(struct intel_gvt *gvt)
-{
-	init_waitqueue_head(&gvt->service_thread_wq);
-
-	gvt->service_thread = kthread_run(gvt_service_thread,
-			gvt, "gvt_service_thread");
-	if (IS_ERR(gvt->service_thread)) {
-		gvt_err("fail to start service thread.\n");
-		return PTR_ERR(gvt->service_thread);
-	}
-	return 0;
-}
-
-/**
- * intel_gvt_clean_device - clean a GVT device
- * @i915: i915 private
- *
- * This function is called at the driver unloading stage, to free the
- * resources owned by a GVT device.
- *
- */
-static void intel_gvt_clean_device(struct drm_i915_private *i915)
-{
-	struct intel_gvt *gvt = fetch_and_zero(&i915->gvt);
-
-	if (drm_WARN_ON(&i915->drm, !gvt))
-		return;
-
-	mdev_unregister_device(i915->drm.dev);
-	intel_gvt_cleanup_vgpu_type_groups(gvt);
-	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
-	intel_gvt_clean_vgpu_types(gvt);
-
-	intel_gvt_debugfs_clean(gvt);
-	clean_service_thread(gvt);
-	intel_gvt_clean_cmd_parser(gvt);
-	intel_gvt_clean_sched_policy(gvt);
-	intel_gvt_clean_workload_scheduler(gvt);
-	intel_gvt_clean_gtt(gvt);
-	intel_gvt_free_firmware(gvt);
-	intel_gvt_clean_mmio_info(gvt);
-	idr_destroy(&gvt->vgpu_idr);
-
-	kfree(i915->gvt);
-}
-
-/**
- * intel_gvt_init_device - initialize a GVT device
- * @i915: drm i915 private data
- *
- * This function is called at the initialization stage, to initialize
- * necessary GVT components.
- *
- * Returns:
- * Zero on success, negative error code if failed.
- *
- */
-static int intel_gvt_init_device(struct drm_i915_private *i915)
-{
-	struct intel_gvt *gvt;
-	struct intel_vgpu *vgpu;
-	int ret;
-
-	if (drm_WARN_ON(&i915->drm, i915->gvt))
-		return -EEXIST;
-
-	gvt = kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
-	if (!gvt)
-		return -ENOMEM;
-
-	gvt_dbg_core("init gvt device\n");
-
-	idr_init_base(&gvt->vgpu_idr, 1);
-	spin_lock_init(&gvt->scheduler.mmio_context_lock);
-	mutex_init(&gvt->lock);
-	mutex_init(&gvt->sched_lock);
-	gvt->gt = to_gt(i915);
-	i915->gvt = gvt;
-
-	init_device_info(gvt);
-
-	ret = intel_gvt_setup_mmio_info(gvt);
-	if (ret)
-		goto out_clean_idr;
-
-	intel_gvt_init_engine_mmio_context(gvt);
-
-	ret = intel_gvt_load_firmware(gvt);
-	if (ret)
-		goto out_clean_mmio_info;
-
-	ret = intel_gvt_init_irq(gvt);
-	if (ret)
-		goto out_free_firmware;
-
-	ret = intel_gvt_init_gtt(gvt);
-	if (ret)
-		goto out_free_firmware;
-
-	ret = intel_gvt_init_workload_scheduler(gvt);
-	if (ret)
-		goto out_clean_gtt;
-
-	ret = intel_gvt_init_sched_policy(gvt);
-	if (ret)
-		goto out_clean_workload_scheduler;
-
-	ret = intel_gvt_init_cmd_parser(gvt);
-	if (ret)
-		goto out_clean_sched_policy;
-
-	ret = init_service_thread(gvt);
-	if (ret)
-		goto out_clean_cmd_parser;
-
-	ret = intel_gvt_init_vgpu_types(gvt);
-	if (ret)
-		goto out_clean_thread;
-
-	vgpu = intel_gvt_create_idle_vgpu(gvt);
-	if (IS_ERR(vgpu)) {
-		ret = PTR_ERR(vgpu);
-		gvt_err("failed to create idle vgpu\n");
-		goto out_clean_types;
-	}
-	gvt->idle_vgpu = vgpu;
-
-	intel_gvt_debugfs_init(gvt);
-
-	ret = intel_gvt_init_vgpu_type_groups(gvt);
-	if (ret)
-		goto out_destroy_idle_vgpu;
-
-	ret = mdev_register_device(i915->drm.dev, &intel_vgpu_mdev_ops);
-	if (ret)
-		goto out_cleanup_vgpu_type_groups;
-
-	gvt_dbg_core("gvt device initialization is done\n");
-	return 0;
-
-out_cleanup_vgpu_type_groups:
-	intel_gvt_cleanup_vgpu_type_groups(gvt);
-out_destroy_idle_vgpu:
-	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
-	intel_gvt_debugfs_clean(gvt);
-out_clean_types:
-	intel_gvt_clean_vgpu_types(gvt);
-out_clean_thread:
-	clean_service_thread(gvt);
-out_clean_cmd_parser:
-	intel_gvt_clean_cmd_parser(gvt);
-out_clean_sched_policy:
-	intel_gvt_clean_sched_policy(gvt);
-out_clean_workload_scheduler:
-	intel_gvt_clean_workload_scheduler(gvt);
-out_clean_gtt:
-	intel_gvt_clean_gtt(gvt);
-out_free_firmware:
-	intel_gvt_free_firmware(gvt);
-out_clean_mmio_info:
-	intel_gvt_clean_mmio_info(gvt);
-out_clean_idr:
-	idr_destroy(&gvt->vgpu_idr);
-	kfree(gvt);
-	i915->gvt = NULL;
-	return ret;
-}
-
-static void intel_gvt_pm_resume(struct drm_i915_private *i915)
-{
-	struct intel_gvt *gvt = i915->gvt;
-
-	intel_gvt_restore_fence(gvt);
-	intel_gvt_restore_mmio(gvt);
-	intel_gvt_restore_ggtt(gvt);
-}
-
-const struct intel_vgpu_ops intel_gvt_vgpu_ops = {
-	.init_device	= intel_gvt_init_device,
-	.clean_device	= intel_gvt_clean_device,
-	.pm_resume	= intel_gvt_pm_resume,
-};
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index c32e8eb199f10..03ecffc2ba56a 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -765,12 +765,6 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 		dma_addr_t dma_addr);
 
-int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt);
-void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt);
-
 #include "trace.h"
 
-extern const struct intel_vgpu_ops intel_gvt_vgpu_ops;
-extern const struct mdev_parent_ops intel_vgpu_mdev_ops;
-
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 4113f850bf92d..f033031c676da 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1,7 +1,7 @@
 /*
  * KVMGT - the implementation of Intel mediated pass-through framework for KVM
  *
- * Copyright(c) 2014-2016 Intel Corporation. All rights reserved.
+ * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -26,6 +26,11 @@
  *    Kevin Tian <kevin.tian@intel.com>
  *    Jike Song <jike.song@intel.com>
  *    Xiaoguang Chen <xiaoguang.chen@intel.com>
+ *    Eddie Dong <eddie.dong@intel.com>
+ *
+ * Contributors:
+ *    Niu Bing <bing.niu@intel.com>
+ *    Zhi Wang <zhi.a.wang@intel.com>
  */
 
 #include <linux/init.h>
@@ -182,7 +187,7 @@ static struct attribute_group *gvt_vgpu_type_groups[] = {
 	[0 ... NR_MAX_INTEL_VGPU_TYPES - 1] = NULL,
 };
 
-int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
+static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
 {
 	int i, j;
 	struct intel_vgpu_type *type;
@@ -211,7 +216,7 @@ int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
 	return -ENOMEM;
 }
 
-void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
+static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 {
 	int i;
 	struct attribute_group *group;
@@ -1720,7 +1725,7 @@ static struct mdev_driver intel_vgpu_mdev_driver = {
 	.remove		= intel_vgpu_remove,
 };
 
-const struct mdev_parent_ops intel_vgpu_mdev_ops = {
+static const struct mdev_parent_ops intel_vgpu_mdev_ops = {
 	.owner			= THIS_MODULE,
 	.supported_type_groups	= gvt_vgpu_type_groups,
 	.device_driver		= &intel_vgpu_mdev_driver,
@@ -1925,6 +1930,257 @@ void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 	mutex_unlock(&vgpu->cache_lock);
 }
 
+static void init_device_info(struct intel_gvt *gvt)
+{
+	struct intel_gvt_device_info *info = &gvt->device_info;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
+
+	info->max_support_vgpus = 8;
+	info->cfg_space_size = PCI_CFG_SPACE_EXP_SIZE;
+	info->mmio_size = 2 * 1024 * 1024;
+	info->mmio_bar = 0;
+	info->gtt_start_offset = 8 * 1024 * 1024;
+	info->gtt_entry_size = 8;
+	info->gtt_entry_size_shift = 3;
+	info->gmadr_bytes_in_cmd = 8;
+	info->max_surface_size = 36 * 1024 * 1024;
+	info->msi_cap_offset = pdev->msi_cap;
+}
+
+static void intel_gvt_test_and_emulate_vblank(struct intel_gvt *gvt)
+{
+	struct intel_vgpu *vgpu;
+	int id;
+
+	mutex_lock(&gvt->lock);
+	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) {
+		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK + id,
+				       (void *)&gvt->service_request)) {
+			if (vgpu->active)
+				intel_vgpu_emulate_vblank(vgpu);
+		}
+	}
+	mutex_unlock(&gvt->lock);
+}
+
+static int gvt_service_thread(void *data)
+{
+	struct intel_gvt *gvt = (struct intel_gvt *)data;
+	int ret;
+
+	gvt_dbg_core("service thread start\n");
+
+	while (!kthread_should_stop()) {
+		ret = wait_event_interruptible(gvt->service_thread_wq,
+				kthread_should_stop() || gvt->service_request);
+
+		if (kthread_should_stop())
+			break;
+
+		if (WARN_ONCE(ret, "service thread is waken up by signal.\n"))
+			continue;
+
+		intel_gvt_test_and_emulate_vblank(gvt);
+
+		if (test_bit(INTEL_GVT_REQUEST_SCHED,
+				(void *)&gvt->service_request) ||
+			test_bit(INTEL_GVT_REQUEST_EVENT_SCHED,
+					(void *)&gvt->service_request)) {
+			intel_gvt_schedule(gvt);
+		}
+	}
+
+	return 0;
+}
+
+static void clean_service_thread(struct intel_gvt *gvt)
+{
+	kthread_stop(gvt->service_thread);
+}
+
+static int init_service_thread(struct intel_gvt *gvt)
+{
+	init_waitqueue_head(&gvt->service_thread_wq);
+
+	gvt->service_thread = kthread_run(gvt_service_thread,
+			gvt, "gvt_service_thread");
+	if (IS_ERR(gvt->service_thread)) {
+		gvt_err("fail to start service thread.\n");
+		return PTR_ERR(gvt->service_thread);
+	}
+	return 0;
+}
+
+/**
+ * intel_gvt_clean_device - clean a GVT device
+ * @i915: i915 private
+ *
+ * This function is called at the driver unloading stage, to free the
+ * resources owned by a GVT device.
+ *
+ */
+static void intel_gvt_clean_device(struct drm_i915_private *i915)
+{
+	struct intel_gvt *gvt = fetch_and_zero(&i915->gvt);
+
+	if (drm_WARN_ON(&i915->drm, !gvt))
+		return;
+
+	mdev_unregister_device(i915->drm.dev);
+	intel_gvt_cleanup_vgpu_type_groups(gvt);
+	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
+	intel_gvt_clean_vgpu_types(gvt);
+
+	intel_gvt_debugfs_clean(gvt);
+	clean_service_thread(gvt);
+	intel_gvt_clean_cmd_parser(gvt);
+	intel_gvt_clean_sched_policy(gvt);
+	intel_gvt_clean_workload_scheduler(gvt);
+	intel_gvt_clean_gtt(gvt);
+	intel_gvt_free_firmware(gvt);
+	intel_gvt_clean_mmio_info(gvt);
+	idr_destroy(&gvt->vgpu_idr);
+
+	kfree(i915->gvt);
+}
+
+/**
+ * intel_gvt_init_device - initialize a GVT device
+ * @i915: drm i915 private data
+ *
+ * This function is called at the initialization stage, to initialize
+ * necessary GVT components.
+ *
+ * Returns:
+ * Zero on success, negative error code if failed.
+ *
+ */
+static int intel_gvt_init_device(struct drm_i915_private *i915)
+{
+	struct intel_gvt *gvt;
+	struct intel_vgpu *vgpu;
+	int ret;
+
+	if (drm_WARN_ON(&i915->drm, i915->gvt))
+		return -EEXIST;
+
+	gvt = kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
+	if (!gvt)
+		return -ENOMEM;
+
+	gvt_dbg_core("init gvt device\n");
+
+	idr_init_base(&gvt->vgpu_idr, 1);
+	spin_lock_init(&gvt->scheduler.mmio_context_lock);
+	mutex_init(&gvt->lock);
+	mutex_init(&gvt->sched_lock);
+	gvt->gt = to_gt(i915);
+	i915->gvt = gvt;
+
+	init_device_info(gvt);
+
+	ret = intel_gvt_setup_mmio_info(gvt);
+	if (ret)
+		goto out_clean_idr;
+
+	intel_gvt_init_engine_mmio_context(gvt);
+
+	ret = intel_gvt_load_firmware(gvt);
+	if (ret)
+		goto out_clean_mmio_info;
+
+	ret = intel_gvt_init_irq(gvt);
+	if (ret)
+		goto out_free_firmware;
+
+	ret = intel_gvt_init_gtt(gvt);
+	if (ret)
+		goto out_free_firmware;
+
+	ret = intel_gvt_init_workload_scheduler(gvt);
+	if (ret)
+		goto out_clean_gtt;
+
+	ret = intel_gvt_init_sched_policy(gvt);
+	if (ret)
+		goto out_clean_workload_scheduler;
+
+	ret = intel_gvt_init_cmd_parser(gvt);
+	if (ret)
+		goto out_clean_sched_policy;
+
+	ret = init_service_thread(gvt);
+	if (ret)
+		goto out_clean_cmd_parser;
+
+	ret = intel_gvt_init_vgpu_types(gvt);
+	if (ret)
+		goto out_clean_thread;
+
+	vgpu = intel_gvt_create_idle_vgpu(gvt);
+	if (IS_ERR(vgpu)) {
+		ret = PTR_ERR(vgpu);
+		gvt_err("failed to create idle vgpu\n");
+		goto out_clean_types;
+	}
+	gvt->idle_vgpu = vgpu;
+
+	intel_gvt_debugfs_init(gvt);
+
+	ret = intel_gvt_init_vgpu_type_groups(gvt);
+	if (ret)
+		goto out_destroy_idle_vgpu;
+
+	ret = mdev_register_device(i915->drm.dev, &intel_vgpu_mdev_ops);
+	if (ret)
+		goto out_cleanup_vgpu_type_groups;
+
+	gvt_dbg_core("gvt device initialization is done\n");
+	return 0;
+
+out_cleanup_vgpu_type_groups:
+	intel_gvt_cleanup_vgpu_type_groups(gvt);
+out_destroy_idle_vgpu:
+	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
+	intel_gvt_debugfs_clean(gvt);
+out_clean_types:
+	intel_gvt_clean_vgpu_types(gvt);
+out_clean_thread:
+	clean_service_thread(gvt);
+out_clean_cmd_parser:
+	intel_gvt_clean_cmd_parser(gvt);
+out_clean_sched_policy:
+	intel_gvt_clean_sched_policy(gvt);
+out_clean_workload_scheduler:
+	intel_gvt_clean_workload_scheduler(gvt);
+out_clean_gtt:
+	intel_gvt_clean_gtt(gvt);
+out_free_firmware:
+	intel_gvt_free_firmware(gvt);
+out_clean_mmio_info:
+	intel_gvt_clean_mmio_info(gvt);
+out_clean_idr:
+	idr_destroy(&gvt->vgpu_idr);
+	kfree(gvt);
+	i915->gvt = NULL;
+	return ret;
+}
+
+static void intel_gvt_pm_resume(struct drm_i915_private *i915)
+{
+	struct intel_gvt *gvt = i915->gvt;
+
+	intel_gvt_restore_fence(gvt);
+	intel_gvt_restore_mmio(gvt);
+	intel_gvt_restore_ggtt(gvt);
+}
+
+static const struct intel_vgpu_ops intel_gvt_vgpu_ops = {
+	.init_device	= intel_gvt_init_device,
+	.clean_device	= intel_gvt_clean_device,
+	.pm_resume	= intel_gvt_pm_resume,
+};
+
 static int __init kvmgt_init(void)
 {
 	int ret;
-- 
2.30.2

