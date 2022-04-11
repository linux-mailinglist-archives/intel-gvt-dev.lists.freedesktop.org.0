Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783E4FBEA6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C622210ED94;
	Mon, 11 Apr 2022 14:15:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F4F10EC2C;
 Mon, 11 Apr 2022 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7RoXxDSS7p2pSEZONvSSZnUBGGD1hwsx/HfD9JfYXsM=; b=1t3BKaaXfYr0slJ7c6iraiMdM4
 jW0axcM7n/WsYP3MbgdvbbO/uWpjHCDa8ndQjMXp7cI/SkV+Lp1XvFb/k9lE3MNvQK7vzkjSjzamN
 I4Ez7mrlORpscqsWJ5dUAgkGwE3jeshlfs9mCJh2Dqz19LQXD9/r0hsvXfTXzVLZX05yjBYyJGSRG
 aRtfgYJitGqda6OW748SLQ40U3uDzusMxawQIkXA4wykfwgMedW6A5Vtn5LVxbN90fiYUHcMzyUNi
 +3bMf0h1r6kZLNCsiXIKUY4n+QtXxop09EJnG6I5X+NaAzEJgHMV53OxziITET4tzf2HC7h2NquFs
 xuwquRjQ==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndup3-009Kqu-5w; Mon, 11 Apr 2022 14:15:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 23/34] drm/i915/gvt: remove struct intel_gvt_mpt
Date: Mon, 11 Apr 2022 16:13:52 +0200
Message-Id: <20220411141403.86980-24-hch@lst.de>
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

Just call the initializion and exit functions directly and remove
this abstraction entirely.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.c       | 11 ++++-
 drivers/gpu/drm/i915/gvt/gvt.h       | 12 ++---
 drivers/gpu/drm/i915/gvt/hypercall.h | 50 -------------------
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 39 ++-------------
 drivers/gpu/drm/i915/gvt/mpt.h       | 74 ----------------------------
 5 files changed, 17 insertions(+), 169 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
 delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 9259f2a17398d..047fb6c41788b 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -135,7 +135,8 @@ static void intel_gvt_clean_device(struct drm_i915_private *i915)
 	if (drm_WARN_ON(&i915->drm, !gvt))
 		return;
 
-	intel_gvt_hypervisor_host_exit(i915->drm.dev, gvt);
+	mdev_unregister_device(i915->drm.dev);
+	intel_gvt_cleanup_vgpu_type_groups(gvt);
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
 	intel_gvt_clean_vgpu_types(gvt);
 
@@ -235,13 +236,19 @@ static int intel_gvt_init_device(struct drm_i915_private *i915)
 
 	intel_gvt_debugfs_init(gvt);
 
-	ret = intel_gvt_hypervisor_host_init(i915->drm.dev, gvt);
+	ret = intel_gvt_init_vgpu_type_groups(gvt);
 	if (ret)
 		goto out_destroy_idle_vgpu;
 
+	ret = mdev_register_device(i915->drm.dev, &intel_vgpu_mdev_ops);
+	if (ret)
+		goto out_cleanup_vgpu_type_groups;
+
 	gvt_dbg_core("gvt device initialization is done\n");
 	return 0;
 
+out_cleanup_vgpu_type_groups:
+	intel_gvt_cleanup_vgpu_type_groups(gvt);
 out_destroy_idle_vgpu:
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
 	intel_gvt_debugfs_clean(gvt);
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 938f572717377..865997c5005d5 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -41,7 +41,6 @@
 #include "intel_gvt.h"
 
 #include "debug.h"
-#include "hypercall.h"
 #include "mmio.h"
 #include "reg.h"
 #include "interrupt.h"
@@ -59,12 +58,6 @@
 
 #define GVT_MAX_VGPU 8
 
-struct intel_gvt_host {
-	const struct intel_gvt_mpt *mpt;
-};
-
-extern struct intel_gvt_host intel_gvt_host;
-
 /* Describe per-platform limitations. */
 struct intel_gvt_device_info {
 	u32 max_support_vgpus;
@@ -773,9 +766,12 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 		dma_addr_t dma_addr);
 
+int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt);
+void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt);
+
 #include "trace.h"
-#include "mpt.h"
 
 extern const struct intel_vgpu_ops intel_gvt_vgpu_ops;
+extern const struct mdev_parent_ops intel_vgpu_mdev_ops;
 
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
deleted file mode 100644
index d49437aeabac8..0000000000000
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ /dev/null
@@ -1,50 +0,0 @@
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
- *    Eddie Dong <eddie.dong@intel.com>
- *    Dexuan Cui
- *    Jike Song <jike.song@intel.com>
- *
- * Contributors:
- *    Zhi Wang <zhi.a.wang@intel.com>
- *
- */
-
-#ifndef _GVT_HYPERCALL_H_
-#define _GVT_HYPERCALL_H_
-
-#include <linux/types.h>
-
-struct device;
-struct intel_vgpu;
-
-/*
- * Specific GVT-g MPT modules function collections. Currently GVT-g supports
- * both Xen and KVM by providing dedicated hypervisor-related MPT modules.
- */
-struct intel_gvt_mpt {
-	int (*host_init)(struct device *dev, void *gvt);
-	void (*host_exit)(struct device *dev, void *gvt);
-};
-
-#endif /* _GVT_HYPERCALL_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 606b2cb923d8e..f908867223aec 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -172,7 +172,7 @@ static struct attribute_group *gvt_vgpu_type_groups[] = {
 	[0 ... NR_MAX_INTEL_VGPU_TYPES - 1] = NULL,
 };
 
-static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
+int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
 {
 	int i, j;
 	struct intel_vgpu_type *type;
@@ -201,7 +201,7 @@ static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
 	return -ENOMEM;
 }
 
-static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
+void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 {
 	int i;
 	struct attribute_group *group;
@@ -1665,8 +1665,9 @@ static const struct attribute_group *intel_vgpu_groups[] = {
 	NULL,
 };
 
-static struct mdev_parent_ops intel_vgpu_mdev_ops = {
+const struct mdev_parent_ops intel_vgpu_mdev_ops = {
 	.mdev_attr_groups       = intel_vgpu_groups,
+	.supported_type_groups	= gvt_vgpu_type_groups,
 	.create			= intel_vgpu_create,
 	.remove			= intel_vgpu_remove,
 
@@ -1679,29 +1680,6 @@ static struct mdev_parent_ops intel_vgpu_mdev_ops = {
 	.ioctl			= intel_vgpu_ioctl,
 };
 
-static int kvmgt_host_init(struct device *dev, void *gvt)
-{
-	int ret;
-
-	ret = intel_gvt_init_vgpu_type_groups((struct intel_gvt *)gvt);
-	if (ret)
-		return ret;
-
-	intel_vgpu_mdev_ops.supported_type_groups = gvt_vgpu_type_groups;
-
-	ret = mdev_register_device(dev, &intel_vgpu_mdev_ops);
-	if (ret)
-		intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
-
-	return ret;
-}
-
-static void kvmgt_host_exit(struct device *dev, void *gvt)
-{
-	mdev_unregister_device(dev);
-	intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
-}
-
 int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 {
 	struct kvm *kvm = info->kvm;
@@ -1964,15 +1942,6 @@ void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 	mutex_unlock(&vgpu->cache_lock);
 }
 
-static const struct intel_gvt_mpt kvmgt_mpt = {
-	.host_init = kvmgt_host_init,
-	.host_exit = kvmgt_host_exit,
-};
-
-struct intel_gvt_host intel_gvt_host = {
-	.mpt		= &kvmgt_mpt,
-};
-
 static int __init kvmgt_init(void)
 {
 	return intel_gvt_set_ops(&intel_gvt_vgpu_ops);
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
deleted file mode 100644
index 3be602a3f764a..0000000000000
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ /dev/null
@@ -1,74 +0,0 @@
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
- *    Eddie Dong <eddie.dong@intel.com>
- *    Dexuan Cui
- *    Jike Song <jike.song@intel.com>
- *
- * Contributors:
- *    Zhi Wang <zhi.a.wang@intel.com>
- *
- */
-
-#ifndef _GVT_MPT_H_
-#define _GVT_MPT_H_
-
-#include "gvt.h"
-
-/**
- * DOC: Hypervisor Service APIs for GVT-g Core Logic
- *
- * This is the glue layer between specific hypervisor MPT modules and GVT-g core
- * logic. Each kind of hypervisor MPT module provides a collection of function
- * callbacks and will be attached to GVT host when the driver is loading.
- * GVT-g core logic will call these APIs to request specific services from
- * hypervisor.
- */
-
-/**
- * intel_gvt_hypervisor_host_init - init GVT-g host side
- *
- * Returns:
- * Zero on success, negative error code if failed
- */
-static inline int intel_gvt_hypervisor_host_init(struct device *dev, void *gvt)
-{
-	if (!intel_gvt_host.mpt->host_init)
-		return -ENODEV;
-
-	return intel_gvt_host.mpt->host_init(dev, gvt);
-}
-
-/**
- * intel_gvt_hypervisor_host_exit - exit GVT-g host side
- */
-static inline void intel_gvt_hypervisor_host_exit(struct device *dev, void *gvt)
-{
-	/* optional to provide */
-	if (!intel_gvt_host.mpt->host_exit)
-		return;
-
-	intel_gvt_host.mpt->host_exit(dev, gvt);
-}
-
-#endif /* _GVT_MPT_H_ */
-- 
2.30.2

