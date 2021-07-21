Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F23D12EE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D4E6E9AB;
	Wed, 21 Jul 2021 15:55:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D686E97A;
 Wed, 21 Jul 2021 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7I579GypQLYEVh+6zoCesHj8dA7m7g5kDfHc+VPf3Ok=; b=XMrI5vkeal3hOA0WE3+XgekGME
 E1Cpk44izATLqvjqTUYmlQvRFlQgcPmrbTsdbeyrX4v+VZ3S9rYq4TntdoDylV6wQGkWu+y9pj6SE
 RyO/iAFdw9Zc1dMrKIWsOEhUe134WLWpvzm/lUqMIaoH3NhWk0IQQbIpC14uipB8MVw/7n/1Lggmj
 r997XO1oSHFlLyXuA6J5fCS9zRaIoJUXHYygw3GxhFrajr+A97nlcTpGqRnp20Tf0E7V5HzjeoiRw
 YFTwvhmt3vXzE0ZZM99NUB6w11EWX46PYvA3gnneKYGhqirYiqeKU6YZIw9C0nsiaXO+CI2ouwkwA
 I3zAgZqQ==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EYk-009MHH-6X; Wed, 21 Jul 2021 15:55:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 04/21] drm/i915/gvt: move the gvt code into kvmgt.ko
Date: Wed, 21 Jul 2021 17:53:38 +0200
Message-Id: <20210721155355.173183-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210721155355.173183-1-hch@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Instead of having an option to build the gvt code into the main i915
module, just move it into the kvmgt.ko module.  This only requires
a new struct with three entries that the main i915 module needs to
request before enabling VGPU passthrough operations.

This also conveniently streamlines the GVT initialization and avoids
the need for the global device pointer.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/Kconfig                  | 31 +++------
 drivers/gpu/drm/i915/Makefile                 |  7 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  4 +-
 drivers/gpu/drm/i915/gvt/gvt.c                | 56 ++++++----------
 drivers/gpu/drm/i915/gvt/gvt.h                |  6 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 19 ++----
 drivers/gpu/drm/i915/gvt/mpt.h                |  3 -
 drivers/gpu/drm/i915/i915_drv.h               |  7 ++
 drivers/gpu/drm/i915/i915_params.c            |  2 +-
 drivers/gpu/drm/i915/intel_gvt.c              | 64 +++++++++++++++++--
 drivers/gpu/drm/i915/intel_gvt.h              |  4 +-
 11 files changed, 107 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index f960f5d7664e..46e37238b2e4 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -98,39 +98,24 @@ config DRM_I915_USERPTR
 
 	  If in doubt, say "Y".
 
-config DRM_I915_GVT
-	bool "Enable Intel GVT-g graphics virtualization host support"
+config DRM_I915_GVT_KVMGT
+	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
 	depends on DRM_I915
 	depends on 64BIT
-	default n
+	depends on KVM
+	depends on VFIO_MDEV
 	help
 	  Choose this option if you want to enable Intel GVT-g graphics
 	  virtualization technology host support with integrated graphics.
 	  With GVT-g, it's possible to have one integrated graphics
-	  device shared by multiple VMs under different hypervisors.
+	  device shared by multiple VMs under KVM.
 
-	  Note that at least one hypervisor like Xen or KVM is required for
-	  this driver to work, and it only supports newer device from
-	  Broadwell+. For further information and setup guide, you can
-	  visit: http://01.org/igvt-g.
-
-	  Now it's just a stub to support the modifications of i915 for
-	  GVT device model. It requires at least one MPT modules for Xen/KVM
-	  and other components of GVT device model to work. Use it under
-	  you own risk.
+	  Note that this driver only supports newer device from Broadwell on.
+	  For further information and setup guide, you can visit:
+	  http://01.org/igvt-g.
 
 	  If in doubt, say "N".
 
-config DRM_I915_GVT_KVMGT
-	tristate "Enable KVM/VFIO support for Intel GVT-g"
-	depends on DRM_I915_GVT
-	depends on KVM
-	depends on VFIO_MDEV
-	default n
-	help
-	  Choose this option if you want to enable KVMGT support for
-	  Intel GVT-g.
-
 menu "drm/i915 Debugging"
 depends on DRM_I915
 depends on EXPERT
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 2153f67705b8..45cdb94363c7 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -289,8 +289,9 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
 
 # virtual gpu code
 i915-y += i915_vgpu.o
-i915-$(CONFIG_DRM_I915_GVT) += \
-	intel_gvt.o \
+i915-$(CONFIG_DRM_I915_GVT_KVMGT) += intel_gvt.o
+
+kvmgt-y += gvt/kvmgt.o \
 	gvt/gvt.o \
 	gvt/aperture_gm.o \
 	gvt/handlers.o \
@@ -315,7 +316,7 @@ i915-$(CONFIG_DRM_I915_GVT) += \
 	gvt/page_track.o
 
 obj-$(CONFIG_DRM_I915) += i915.o
-obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
+obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
 
 # header test
 
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index fc77592d88a9..8b23c63db7ba 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -417,7 +417,7 @@ execlists_context_status_change(struct i915_request *rq, unsigned long status)
 	 * Only used when GVT-g is enabled now. When GVT-g is disabled,
 	 * The compiler should eliminate this function as dead-code.
 	 */
-	if (!IS_ENABLED(CONFIG_DRM_I915_GVT))
+	if (!IS_ENABLED(CONFIG_DRM_I915_GVT_KVMGT))
 		return;
 
 	atomic_notifier_call_chain(&rq->engine->context_status_notifier,
@@ -911,7 +911,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
 
 static bool ctx_single_port_submission(const struct intel_context *ce)
 {
-	return (IS_ENABLED(CONFIG_DRM_I915_GVT) &&
+	return (IS_ENABLED(CONFIG_DRM_I915_GVT_KVMGT) &&
 		intel_context_force_single_submission(ce));
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index ee09bba970af..3671a076bd7a 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -39,8 +39,6 @@
 #include <linux/vfio.h>
 #include <linux/mdev.h>
 
-struct intel_gvt_host intel_gvt_host;
-
 static const struct intel_gvt_ops intel_gvt_ops = {
 	.emulate_cfg_read = intel_vgpu_emulate_cfg_read,
 	.emulate_cfg_write = intel_vgpu_emulate_cfg_write,
@@ -147,13 +145,14 @@ static int init_service_thread(struct intel_gvt *gvt)
  * resources owned by a GVT device.
  *
  */
-void intel_gvt_clean_device(struct drm_i915_private *i915)
+static void intel_gvt_clean_device(struct drm_i915_private *i915)
 {
 	struct intel_gvt *gvt = fetch_and_zero(&i915->gvt);
 
 	if (drm_WARN_ON(&i915->drm, !gvt))
 		return;
 
+	intel_gvt_hypervisor_host_exit(i915->drm.dev, gvt);
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
 	intel_gvt_clean_vgpu_types(gvt);
 
@@ -181,7 +180,7 @@ void intel_gvt_clean_device(struct drm_i915_private *i915)
  * Zero on success, negative error code if failed.
  *
  */
-int intel_gvt_init_device(struct drm_i915_private *i915)
+static int intel_gvt_init_device(struct drm_i915_private *i915)
 {
 	struct intel_gvt *gvt;
 	struct intel_vgpu *vgpu;
@@ -253,11 +252,17 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 
 	intel_gvt_debugfs_init(gvt);
 
+	ret = intel_gvt_hypervisor_host_init(i915->drm.dev, gvt,
+					     &intel_gvt_ops);
+	if (ret)
+		goto out_destroy_idle_vgpu;
+
 	gvt_dbg_core("gvt device initialization is done\n");
-	intel_gvt_host.dev = i915->drm.dev;
-	intel_gvt_host.initialized = true;
 	return 0;
 
+out_destroy_idle_vgpu:
+	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
+	intel_gvt_debugfs_clean(gvt);
 out_clean_types:
 	intel_gvt_clean_vgpu_types(gvt);
 out_clean_thread:
@@ -281,39 +286,18 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	return ret;
 }
 
-int
-intel_gvt_pm_resume(struct intel_gvt *gvt)
+static void intel_gvt_pm_resume(struct drm_i915_private *i915)
 {
+	struct intel_gvt *gvt = i915->gvt;
+
 	intel_gvt_restore_fence(gvt);
 	intel_gvt_restore_mmio(gvt);
 	intel_gvt_restore_ggtt(gvt);
-	return 0;
-}
-
-int
-intel_gvt_register_hypervisor(const struct intel_gvt_mpt *m)
-{
-	int ret;
-	void *gvt;
-
-	if (!intel_gvt_host.initialized)
-		return -ENODEV;
-
-	intel_gvt_host.mpt = m;
-	gvt = (void *)kdev_to_i915(intel_gvt_host.dev)->gvt;
-
-	ret = intel_gvt_hypervisor_host_init(intel_gvt_host.dev, gvt,
-					     &intel_gvt_ops);
-	if (ret < 0)
-		return -ENODEV;
-	return 0;
 }
-EXPORT_SYMBOL_GPL(intel_gvt_register_hypervisor);
 
-void
-intel_gvt_unregister_hypervisor(void)
-{
-	void *gvt = (void *)kdev_to_i915(intel_gvt_host.dev)->gvt;
-	intel_gvt_hypervisor_host_exit(intel_gvt_host.dev, gvt);
-}
-EXPORT_SYMBOL_GPL(intel_gvt_unregister_hypervisor);
+const struct i915_virtual_gpu_ops intel_gvt_vgpu_ops = {
+	.init_device	= intel_gvt_init_device,
+	.clean_device	= intel_gvt_clean_device,
+	.pm_resume	= intel_gvt_pm_resume,
+};
+EXPORT_SYMBOL_GPL(intel_gvt_vgpu_ops);
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 9b9fdbf9df10..c346111f0300 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -57,8 +57,6 @@
 #define GVT_MAX_VGPU 8
 
 struct intel_gvt_host {
-	struct device *dev;
-	bool initialized;
 	const struct intel_gvt_mpt *mpt;
 };
 
@@ -727,9 +725,9 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
-int intel_gvt_pm_resume(struct intel_gvt *gvt);
-
 #include "trace.h"
 #include "mpt.h"
 
+extern const struct i915_virtual_gpu_ops intel_gvt_vgpu_ops;
+
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 0d0902d7405d..65659094eee6 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -49,6 +49,8 @@
 #include "i915_drv.h"
 #include "gvt.h"
 
+MODULE_IMPORT_NS(I915_GVT);
+
 static const struct intel_gvt_ops *intel_gvt_ops;
 
 /* helper macros copied from vfio-pci */
@@ -2225,20 +2227,9 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.is_valid_gfn = kvmgt_is_valid_gfn,
 };
 
-static int __init kvmgt_init(void)
-{
-	if (intel_gvt_register_hypervisor(&kvmgt_mpt) < 0)
-		return -ENODEV;
-	return 0;
-}
-
-static void __exit kvmgt_exit(void)
-{
-	intel_gvt_unregister_hypervisor();
-}
-
-module_init(kvmgt_init);
-module_exit(kvmgt_exit);
+struct intel_gvt_host intel_gvt_host = {
+	.mpt		= &kvmgt_mpt,
+};
 
 MODULE_LICENSE("GPL and additional rights");
 MODULE_AUTHOR("Intel Corporation");
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index e6c5a792a49a..1b5617bb2745 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -394,7 +394,4 @@ static inline bool intel_gvt_hypervisor_is_valid_gfn(
 	return intel_gvt_host.mpt->is_valid_gfn(vgpu->handle, gfn);
 }
 
-int intel_gvt_register_hypervisor(const struct intel_gvt_mpt *);
-void intel_gvt_unregister_hypervisor(void);
-
 #endif /* _GVT_MPT_H_ */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 38ff2fb89744..37afbe2d9563 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -750,10 +750,17 @@ struct i915_frontbuffer_tracking {
 	unsigned flip_bits;
 };
 
+struct i915_virtual_gpu_ops {
+	int (*init_device)(struct drm_i915_private *dev_priv);
+	void (*clean_device)(struct drm_i915_private *dev_priv);
+	void (*pm_resume)(struct drm_i915_private *i915);
+};
+
 struct i915_virtual_gpu {
 	struct mutex lock; /* serialises sending of g2v_notify command pkts */
 	bool active;
 	u32 caps;
+	const struct i915_virtual_gpu_ops *ops;
 };
 
 struct intel_cdclk_config {
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index e07f4cfea63a..a7394294c010 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -187,7 +187,7 @@ i915_param_named(enable_dpcd_backlight, int, 0400,
 	"Enable support for DPCD backlight control"
 	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enable, 2=force VESA interface, 3=force Intel interface)");
 
-#if IS_ENABLED(CONFIG_DRM_I915_GVT)
+#if IS_ENABLED(CONFIG_DRM_I915_GVT_KVMGT)
 i915_param_named(enable_gvt, bool, 0400,
 	"Enable support for Intel GVT-g graphics virtualization host support(default:false)");
 #endif
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 4e70c1a9ef2e..315707624d9f 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -25,6 +25,9 @@
 #include "i915_vgpu.h"
 #include "intel_gvt.h"
 #include "gvt/gvt.h"
+#include "gt/intel_context.h"
+#include "gt/intel_ring.h"
+#include "gt/shmem_utils.h"
 
 /**
  * DOC: Intel GVT-g host support
@@ -115,14 +118,23 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
 		return -EIO;
 	}
 
-	ret = intel_gvt_init_device(dev_priv);
+	request_module("kvmgt");
+	dev_priv->vgpu.ops = symbol_get(intel_gvt_vgpu_ops);
+	if (!dev_priv->vgpu.ops) {
+		drm_dbg(&dev_priv->drm, "Fail to find GVT ops\n");
+		goto bail;
+	}
+
+	ret = dev_priv->vgpu.ops->init_device(dev_priv);
 	if (ret) {
 		drm_dbg(&dev_priv->drm, "Fail to init GVT device\n");
-		goto bail;
+		goto bail_put_ops;
 	}
 
 	return 0;
 
+bail_put_ops:
+	symbol_put(gvt_ops);
 bail:
 	dev_priv->params.enable_gvt = 0;
 	return 0;
@@ -143,10 +155,10 @@ static inline bool intel_gvt_active(struct drm_i915_private *dev_priv)
  */
 void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 {
-	if (!intel_gvt_active(dev_priv))
-		return;
-
-	intel_gvt_clean_device(dev_priv);
+	if (intel_gvt_active(dev_priv)) {
+		dev_priv->vgpu.ops->clean_device(dev_priv);
+		symbol_put(dev_priv->vgpu.ops);
+	}
 }
 
 /**
@@ -160,5 +172,43 @@ void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 void intel_gvt_resume(struct drm_i915_private *dev_priv)
 {
 	if (intel_gvt_active(dev_priv))
-		intel_gvt_pm_resume(dev_priv->gvt);
+		dev_priv->vgpu.ops->pm_resume(dev_priv);
 }
+
+/*
+ * Exported here so that the exports only get created when GVT support is
+ * actually enabled.
+ */
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_alloc, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_create_shmem, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_init, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_ggtt_pin_ww, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_pin_map, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_set_to_cpu_domain, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(__i915_gem_object_flush_map, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(__i915_gem_object_set_pages, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_gtt_insert, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_prime_export, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_init, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_backoff, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_fini, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_ppgtt_create, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_request_add, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_request_create, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_request_wait, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_reserve_fence, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_unreserve_fence, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_vm_release, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_vma_move_to_active, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_context_create, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_context_unpin, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(shmem_pin_map, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(__px_dma, I915_GVT);
diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/intel_gvt.h
index d7d3fb6186fd..389589f006ad 100644
--- a/drivers/gpu/drm/i915/intel_gvt.h
+++ b/drivers/gpu/drm/i915/intel_gvt.h
@@ -26,11 +26,9 @@
 
 struct drm_i915_private;
 
-#ifdef CONFIG_DRM_I915_GVT
+#if IS_ENABLED(CONFIG_DRM_I915_GVT_KVMGT)
 int intel_gvt_init(struct drm_i915_private *dev_priv);
 void intel_gvt_driver_remove(struct drm_i915_private *dev_priv);
-int intel_gvt_init_device(struct drm_i915_private *dev_priv);
-void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
 int intel_gvt_init_host(void);
 void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
 void intel_gvt_resume(struct drm_i915_private *dev_priv);
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
