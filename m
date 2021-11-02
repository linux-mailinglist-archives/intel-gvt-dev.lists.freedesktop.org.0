Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A32442789
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A796FABF;
	Tue,  2 Nov 2021 07:06:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0381D6FABF;
 Tue,  2 Nov 2021 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=cFjj+YH2Fod/14fVfqa9c7+Rn8fz39MVQX9E4T283OA=; b=bjjLcWdCRSPx1q7wUGHhDVX36G
 p93RCP+v/EDUazmIlx3oJJl5u2NYdlSeJH0phAz8Fna6KZI4MJKBNwc83cKj0alUhFvZeRi1tFeyI
 LKeaVfg0V9jZG1iVCxnq3UXwB7EHuJLQYRr5APFui4PCXjjeVXh6ExIJeAYziUuJ3+qKULfjx+3Jm
 NUMrbFJdWoMYipseiWXC0/h2AF4oMbjGeKZSpJy1ar+7LAUnG+9bjm1XTpaHuNEqq/b5n6wUM7lfC
 ya21PLzqUXp8ocO/8bGb6vjzYnx9beLx3z3zxv2CEUoSP+r+3vNmbXHE7RHUxNaOzxhwKQZwGuSwy
 hkHAWjVQ==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnsX-000i4G-O2; Tue, 02 Nov 2021 07:06:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 06/29] drm/i915/gvt: move the gvt code into kvmgt.ko
Date: Tue,  2 Nov 2021 08:05:38 +0100
Message-Id: <20211102070601.155501-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
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

Instead of having an option to build the gvt code into the main i915
module, just move it into the kvmgt.ko module.  This only requires
a new struct with three entries that the KVMGT modules needs to register
with the main i915 module, and a proper list of GVT-enabled devices
instead of global device pointer.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/Kconfig     |  33 +++----
 drivers/gpu/drm/i915/Makefile    |   7 +-
 drivers/gpu/drm/i915/gvt/gvt.c   |  55 ++++-------
 drivers/gpu/drm/i915/gvt/gvt.h   |   6 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c |  13 ++-
 drivers/gpu/drm/i915/gvt/mpt.h   |   3 -
 drivers/gpu/drm/i915/i915_drv.c  |   7 --
 drivers/gpu/drm/i915/i915_drv.h  |   1 +
 drivers/gpu/drm/i915/intel_gvt.c | 162 ++++++++++++++++++++++---------
 drivers/gpu/drm/i915/intel_gvt.h |  17 ++--
 10 files changed, 172 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index f960f5d7664e6..e83af6b9d9088 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -99,38 +99,27 @@ config DRM_I915_USERPTR
 	  If in doubt, say "Y".
 
 config DRM_I915_GVT
-	bool "Enable Intel GVT-g graphics virtualization host support"
+	bool
+
+config DRM_I915_GVT_KVMGT
+	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
 	depends on DRM_I915
 	depends on 64BIT
-	default n
+	depends on KVM
+	depends on VFIO_MDEV
+	select DRM_I915_GVT
 	help
 	  Choose this option if you want to enable Intel GVT-g graphics
 	  virtualization technology host support with integrated graphics.
 	  With GVT-g, it's possible to have one integrated graphics
-	  device shared by multiple VMs under different hypervisors.
-
-	  Note that at least one hypervisor like Xen or KVM is required for
-	  this driver to work, and it only supports newer device from
-	  Broadwell+. For further information and setup guide, you can
-	  visit: http://01.org/igvt-g.
+	  device shared by multiple VMs under KVM.
 
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
index 63523032eea26..d972cb6ccaaa3 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -296,7 +296,10 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
 # virtual gpu code
 i915-y += i915_vgpu.o
 i915-$(CONFIG_DRM_I915_GVT) += \
-	intel_gvt.o \
+	intel_gvt.o
+
+kvmgt-y += \
+	gvt/kvmgt.o \
 	gvt/gvt.o \
 	gvt/aperture_gm.o \
 	gvt/handlers.o \
@@ -321,7 +324,7 @@ i915-$(CONFIG_DRM_I915_GVT) += \
 	gvt/page_track.o
 
 obj-$(CONFIG_DRM_I915) += i915.o
-obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
+obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
 
 # header test
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index ee09bba970af6..ba3eb43a11575 100644
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
@@ -281,39 +286,17 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
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
+const struct intel_vgpu_ops intel_gvt_vgpu_ops = {
+	.init_device	= intel_gvt_init_device,
+	.clean_device	= intel_gvt_clean_device,
+	.pm_resume	= intel_gvt_pm_resume,
+};
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 9b9fdbf9df10d..fa56f49bb55eb 100644
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
 
+extern const struct intel_vgpu_ops intel_gvt_vgpu_ops;
+
 #endif
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 80809866cf743..75e2f11418ab5 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -47,8 +47,11 @@
 #include <linux/nospec.h>
 
 #include "i915_drv.h"
+#include "intel_gvt.h"
 #include "gvt.h"
 
+MODULE_IMPORT_NS(I915_GVT);
+
 static const struct intel_gvt_ops *intel_gvt_ops;
 
 /* helper macros copied from vfio-pci */
@@ -2225,16 +2228,18 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.is_valid_gfn = kvmgt_is_valid_gfn,
 };
 
+struct intel_gvt_host intel_gvt_host = {
+	.mpt		= &kvmgt_mpt,
+};
+
 static int __init kvmgt_init(void)
 {
-	if (intel_gvt_register_hypervisor(&kvmgt_mpt) < 0)
-		return -ENODEV;
-	return 0;
+	return intel_gvt_set_ops(&intel_gvt_vgpu_ops);
 }
 
 static void __exit kvmgt_exit(void)
 {
-	intel_gvt_unregister_hypervisor();
+	intel_gvt_clear_ops(&intel_gvt_vgpu_ops);
 }
 
 module_init(kvmgt_init);
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index e6c5a792a49a5..1b5617bb27450 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -394,7 +394,4 @@ static inline bool intel_gvt_hypervisor_is_valid_gfn(
 	return intel_gvt_host.mpt->is_valid_gfn(vgpu->handle, gfn);
 }
 
-int intel_gvt_register_hypervisor(const struct intel_gvt_mpt *);
-void intel_gvt_unregister_hypervisor(void);
-
 #endif /* _GVT_MPT_H_ */
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 59fb4c710c8ca..23138bf2af50b 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -449,11 +449,6 @@ static void i915_driver_mmio_release(struct drm_i915_private *dev_priv)
 	pci_dev_put(dev_priv->bridge_dev);
 }
 
-static void intel_sanitize_options(struct drm_i915_private *dev_priv)
-{
-	intel_gvt_sanitize_options(dev_priv);
-}
-
 /**
  * i915_set_dma_info - set all relevant PCI dma info as configured for the
  * platform
@@ -547,8 +542,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 		}
 	}
 
-	intel_sanitize_options(dev_priv);
-
 	/* needs to be done before ggtt probe */
 	intel_dram_edram_detect(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 005b1cec70075..a495da296fe2e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -814,6 +814,7 @@ struct i915_virtual_gpu {
 	struct mutex lock; /* serialises sending of g2v_notify command pkts */
 	bool active;
 	u32 caps;
+	struct list_head entry;
 };
 
 struct intel_cdclk_config {
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 4e70c1a9ef2ed..53893107807b8 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -24,7 +24,9 @@
 #include "i915_drv.h"
 #include "i915_vgpu.h"
 #include "intel_gvt.h"
-#include "gvt/gvt.h"
+#include "gt/intel_context.h"
+#include "gt/intel_ring.h"
+#include "gt/shmem_utils.h"
 
 /**
  * DOC: Intel GVT-g host support
@@ -41,6 +43,10 @@
  * doc is available on https://01.org/group/2230/documentation-list.
  */
 
+static LIST_HEAD(intel_gvt_devices);
+static const struct intel_vgpu_ops *intel_gvt_ops;
+static DEFINE_MUTEX(intel_gvt_mutex);
+
 static bool is_supported_device(struct drm_i915_private *dev_priv)
 {
 	if (IS_BROADWELL(dev_priv))
@@ -59,32 +65,77 @@ static bool is_supported_device(struct drm_i915_private *dev_priv)
 	return false;
 }
 
-/**
- * intel_gvt_sanitize_options - sanitize GVT related options
- * @dev_priv: drm i915 private data
- *
- * This function is called at the i915 options sanitize stage.
- */
-void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
+static void intel_gvt_init_device(struct drm_i915_private *dev_priv)
 {
-	if (!dev_priv->params.enable_gvt)
+	if (!dev_priv->params.enable_gvt) {
+		drm_dbg(&dev_priv->drm,
+			"GVT-g is disabled by kernel params\n");
 		return;
+	}
 
 	if (intel_vgpu_active(dev_priv)) {
 		drm_info(&dev_priv->drm, "GVT-g is disabled for guest\n");
-		goto bail;
+		return;
 	}
 
 	if (!is_supported_device(dev_priv)) {
 		drm_info(&dev_priv->drm,
 			 "Unsupported device. GVT-g is disabled\n");
-		goto bail;
+		return;
+	}
+
+	if (intel_uc_wants_guc_submission(&dev_priv->gt.uc)) {
+		drm_err(&dev_priv->drm,
+			"Graphics virtualization is not yet supported with GuC submission\n");
+		return;
+	}
+
+	if (intel_gvt_ops->init_device(dev_priv))
+		drm_dbg(&dev_priv->drm, "Fail to init GVT device\n");
+}
+
+static void intel_gvt_clean_device(struct drm_i915_private *dev_priv)
+{
+	if (dev_priv->gvt)
+		intel_gvt_ops->clean_device(dev_priv);
+}
+
+int intel_gvt_set_ops(const struct intel_vgpu_ops *ops)
+{
+	struct drm_i915_private *dev_priv;
+
+	mutex_lock(&intel_gvt_mutex);
+	if (intel_gvt_ops) {
+		mutex_unlock(&intel_gvt_mutex);
+		return -EINVAL;
+	}
+	intel_gvt_ops = ops;
+
+	list_for_each_entry(dev_priv, &intel_gvt_devices, vgpu.entry)
+		intel_gvt_init_device(dev_priv);
+	mutex_unlock(&intel_gvt_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(intel_gvt_set_ops, I915_GVT);
+
+void intel_gvt_clear_ops(const struct intel_vgpu_ops *ops)
+{
+	struct drm_i915_private *dev_priv;
+
+	mutex_lock(&intel_gvt_mutex);
+	if (intel_gvt_ops != ops) {
+		mutex_unlock(&intel_gvt_mutex);
+		return;
 	}
 
-	return;
-bail:
-	dev_priv->params.enable_gvt = 0;
+	list_for_each_entry(dev_priv, &intel_gvt_devices, vgpu.entry)
+		intel_gvt_clean_device(dev_priv);
+
+	intel_gvt_ops = NULL;
+	mutex_unlock(&intel_gvt_mutex);
 }
+EXPORT_SYMBOL_NS_GPL(intel_gvt_clear_ops, I915_GVT);
 
 /**
  * intel_gvt_init - initialize GVT components
@@ -98,39 +149,16 @@ void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
  */
 int intel_gvt_init(struct drm_i915_private *dev_priv)
 {
-	int ret;
-
 	if (i915_inject_probe_failure(dev_priv))
 		return -ENODEV;
 
-	if (!dev_priv->params.enable_gvt) {
-		drm_dbg(&dev_priv->drm,
-			"GVT-g is disabled by kernel params\n");
-		return 0;
-	}
-
-	if (intel_uc_wants_guc_submission(&dev_priv->gt.uc)) {
-		drm_err(&dev_priv->drm,
-			"i915 GVT-g loading failed due to Graphics virtualization is not yet supported with GuC submission\n");
-		return -EIO;
-	}
-
-	ret = intel_gvt_init_device(dev_priv);
-	if (ret) {
-		drm_dbg(&dev_priv->drm, "Fail to init GVT device\n");
-		goto bail;
-	}
+	mutex_lock(&intel_gvt_mutex);
+	list_add_tail(&dev_priv->vgpu.entry, &intel_gvt_devices);
+	if (intel_gvt_ops)
+		intel_gvt_init_device(dev_priv);
+	mutex_unlock(&intel_gvt_mutex);
 
 	return 0;
-
-bail:
-	dev_priv->params.enable_gvt = 0;
-	return 0;
-}
-
-static inline bool intel_gvt_active(struct drm_i915_private *dev_priv)
-{
-	return dev_priv->gvt;
 }
 
 /**
@@ -143,10 +171,10 @@ static inline bool intel_gvt_active(struct drm_i915_private *dev_priv)
  */
 void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 {
-	if (!intel_gvt_active(dev_priv))
-		return;
-
+	mutex_lock(&intel_gvt_mutex);
 	intel_gvt_clean_device(dev_priv);
+	list_del(&dev_priv->vgpu.entry);
+	mutex_unlock(&intel_gvt_mutex);
 }
 
 /**
@@ -159,6 +187,46 @@ void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
  */
 void intel_gvt_resume(struct drm_i915_private *dev_priv)
 {
-	if (intel_gvt_active(dev_priv))
-		intel_gvt_pm_resume(dev_priv->gvt);
+	mutex_lock(&intel_gvt_mutex);
+	if (dev_priv->gvt)
+		intel_gvt_ops->pm_resume(dev_priv);
+	mutex_unlock(&intel_gvt_mutex);
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
+EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
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
index d7d3fb6186fdd..9e4da62258e91 100644
--- a/drivers/gpu/drm/i915/intel_gvt.h
+++ b/drivers/gpu/drm/i915/intel_gvt.h
@@ -29,11 +29,18 @@ struct drm_i915_private;
 #ifdef CONFIG_DRM_I915_GVT
 int intel_gvt_init(struct drm_i915_private *dev_priv);
 void intel_gvt_driver_remove(struct drm_i915_private *dev_priv);
-int intel_gvt_init_device(struct drm_i915_private *dev_priv);
-void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
 int intel_gvt_init_host(void);
-void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
 void intel_gvt_resume(struct drm_i915_private *dev_priv);
+
+struct intel_vgpu_ops {
+	int (*init_device)(struct drm_i915_private *dev_priv);
+	void (*clean_device)(struct drm_i915_private *dev_priv);
+	void (*pm_resume)(struct drm_i915_private *i915);
+};
+
+int intel_gvt_set_ops(const struct intel_vgpu_ops *ops);
+void intel_gvt_clear_ops(const struct intel_vgpu_ops *ops);
+
 #else
 static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
 {
@@ -44,10 +51,6 @@ static inline void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 {
 }
 
-static inline void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
-{
-}
-
 static inline void intel_gvt_resume(struct drm_i915_private *dev_priv)
 {
 }
-- 
2.30.2

