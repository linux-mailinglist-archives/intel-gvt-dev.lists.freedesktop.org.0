Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4C3D12F0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F3F6E98C;
	Wed, 21 Jul 2021 15:56:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5030F6E98C;
 Wed, 21 Jul 2021 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=F6zmZdoQEpDNqAkiwEvwpaY+U34MG0vMNRiv3qWpt/c=; b=tvfmyL47/SWVpLe3eLDiA4V+5A
 bSts6g5IbrZaooG+bFufygW2IhuSQvdKsXMdZjuJIPkDw2vcjhgM6G6tEoTuD20wdM989cfauu/z9
 Zp4XOat/EKBWpLEKIje6rfE8/+j47fCOaIS2SCrXweoJL4P4PkNLuiqnclxRuvBMN4vuuIUvLuKE9
 GPNFylrp3z7moiIsQjJb5jxLaFJBNt7tXngvAomJXtMPRQ+yPdyRUMfLqQwuSXBZCMvIljgHBh9Pq
 T0WB3rxyVia1oxXiTjh3DzKY9U1CwKHbROGAZtc+I/SEahqD+PXXihQq9nAzWYMAFnkXxZsb+LEMY
 zu2pF6KA==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EZ7-009MJZ-By; Wed, 21 Jul 2021 15:55:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 05/21] drm/i915/gvt: remove intel_gvt_ops
Date: Wed, 21 Jul 2021 17:53:39 +0200
Message-Id: <20210721155355.173183-6-hch@lst.de>
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

Remove these pointless indirect alls by just calling the only instance
of each method directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.c       | 20 +--------------
 drivers/gpu/drm/i915/gvt/gvt.h       | 24 ------------------
 drivers/gpu/drm/i915/gvt/hypercall.h |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 37 +++++++++++-----------------
 drivers/gpu/drm/i915/gvt/mpt.h       |  5 ++--
 5 files changed, 19 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 3671a076bd7a..2b59e79f5e3b 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -39,23 +39,6 @@
 #include <linux/vfio.h>
 #include <linux/mdev.h>
 
-static const struct intel_gvt_ops intel_gvt_ops = {
-	.emulate_cfg_read = intel_vgpu_emulate_cfg_read,
-	.emulate_cfg_write = intel_vgpu_emulate_cfg_write,
-	.emulate_mmio_read = intel_vgpu_emulate_mmio_read,
-	.emulate_mmio_write = intel_vgpu_emulate_mmio_write,
-	.vgpu_create = intel_gvt_create_vgpu,
-	.vgpu_destroy = intel_gvt_destroy_vgpu,
-	.vgpu_release = intel_gvt_release_vgpu,
-	.vgpu_reset = intel_gvt_reset_vgpu,
-	.vgpu_activate = intel_gvt_activate_vgpu,
-	.vgpu_deactivate = intel_gvt_deactivate_vgpu,
-	.vgpu_query_plane = intel_vgpu_query_plane,
-	.vgpu_get_dmabuf = intel_vgpu_get_dmabuf,
-	.write_protect_handler = intel_vgpu_page_track_handler,
-	.emulate_hotplug = intel_vgpu_emulate_hotplug,
-};
-
 static void init_device_info(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
@@ -252,8 +235,7 @@ static int intel_gvt_init_device(struct drm_i915_private *i915)
 
 	intel_gvt_debugfs_init(gvt);
 
-	ret = intel_gvt_hypervisor_host_init(i915->drm.dev, gvt,
-					     &intel_gvt_ops);
+	ret = intel_gvt_hypervisor_host_init(i915->drm.dev, gvt);
 	if (ret)
 		goto out_destroy_idle_vgpu;
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index c346111f0300..40643fe14383 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -555,30 +555,6 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu);
 int intel_gvt_scan_and_shadow_workload(struct intel_vgpu_workload *workload);
 void enter_failsafe_mode(struct intel_vgpu *vgpu, int reason);
 
-struct intel_gvt_ops {
-	int (*emulate_cfg_read)(struct intel_vgpu *, unsigned int, void *,
-				unsigned int);
-	int (*emulate_cfg_write)(struct intel_vgpu *, unsigned int, void *,
-				unsigned int);
-	int (*emulate_mmio_read)(struct intel_vgpu *, u64, void *,
-				unsigned int);
-	int (*emulate_mmio_write)(struct intel_vgpu *, u64, void *,
-				unsigned int);
-	struct intel_vgpu *(*vgpu_create)(struct intel_gvt *,
-				struct intel_vgpu_type *);
-	void (*vgpu_destroy)(struct intel_vgpu *vgpu);
-	void (*vgpu_release)(struct intel_vgpu *vgpu);
-	void (*vgpu_reset)(struct intel_vgpu *);
-	void (*vgpu_activate)(struct intel_vgpu *);
-	void (*vgpu_deactivate)(struct intel_vgpu *);
-	int (*vgpu_query_plane)(struct intel_vgpu *vgpu, void *);
-	int (*vgpu_get_dmabuf)(struct intel_vgpu *vgpu, unsigned int);
-	int (*write_protect_handler)(struct intel_vgpu *, u64, void *,
-				     unsigned int);
-	void (*emulate_hotplug)(struct intel_vgpu *vgpu, bool connected);
-};
-
-
 enum {
 	GVT_FAILSAFE_UNSUPPORTED_GUEST,
 	GVT_FAILSAFE_INSUFFICIENT_RESOURCE,
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 317983153645..395bce9633fa 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -42,7 +42,7 @@ struct device;
  * both Xen and KVM by providing dedicated hypervisor-related MPT modules.
  */
 struct intel_gvt_mpt {
-	int (*host_init)(struct device *dev, void *gvt, const void *ops);
+	int (*host_init)(struct device *dev, void *gvt);
 	void (*host_exit)(struct device *dev, void *gvt);
 	int (*attach_vgpu)(void *vgpu, unsigned long *handle);
 	void (*detach_vgpu)(void *vgpu);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 65659094eee6..935d1c8287a4 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -51,8 +51,6 @@
 
 MODULE_IMPORT_NS(I915_GVT);
 
-static const struct intel_gvt_ops *intel_gvt_ops;
-
 /* helper macros copied from vfio-pci */
 #define VFIO_PCI_OFFSET_SHIFT   40
 #define VFIO_PCI_OFFSET_TO_INDEX(off)   (off >> VFIO_PCI_OFFSET_SHIFT)
@@ -602,9 +600,9 @@ static int handle_edid_regs(struct intel_vgpu *vgpu,
 					gvt_vgpu_err("invalid EDID blob\n");
 					return -EINVAL;
 				}
-				intel_gvt_ops->emulate_hotplug(vgpu, true);
+				intel_vgpu_emulate_hotplug(vgpu, true);
 			} else if (data == VFIO_DEVICE_GFX_LINK_STATE_DOWN)
-				intel_gvt_ops->emulate_hotplug(vgpu, false);
+				intel_vgpu_emulate_hotplug(vgpu, false);
 			else {
 				gvt_vgpu_err("invalid EDID link state %d\n",
 					regs->link_state);
@@ -806,7 +804,7 @@ static int intel_vgpu_create(struct mdev_device *mdev)
 		goto out;
 	}
 
-	vgpu = intel_gvt_ops->vgpu_create(gvt, type);
+	vgpu = intel_gvt_create_vgpu(gvt, type);
 	if (IS_ERR_OR_NULL(vgpu)) {
 		ret = vgpu == NULL ? -EFAULT : PTR_ERR(vgpu);
 		gvt_err("failed to create intel vgpu: %d\n", ret);
@@ -833,7 +831,7 @@ static int intel_vgpu_remove(struct mdev_device *mdev)
 	if (handle_valid(vgpu->handle))
 		return -EBUSY;
 
-	intel_gvt_ops->vgpu_destroy(vgpu);
+	intel_gvt_destroy_vgpu(vgpu);
 	return 0;
 }
 
@@ -936,7 +934,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	if (ret)
 		goto undo_group;
 
-	intel_gvt_ops->vgpu_activate(vgpu);
+	intel_gvt_activate_vgpu(vgpu);
 
 	atomic_set(&vdev->released, 0);
 	return ret;
@@ -981,7 +979,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	if (atomic_cmpxchg(&vdev->released, 0, 1))
 		return;
 
-	intel_gvt_ops->vgpu_release(vgpu);
+	intel_gvt_release_vgpu(vgpu);
 
 	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_IOMMU_NOTIFY,
 					&vdev->iommu_notifier);
@@ -1055,10 +1053,10 @@ static int intel_vgpu_bar_rw(struct intel_vgpu *vgpu, int bar, u64 off,
 	int ret;
 
 	if (is_write)
-		ret = intel_gvt_ops->emulate_mmio_write(vgpu,
+		ret = intel_vgpu_emulate_mmio_write(vgpu,
 					bar_start + off, buf, count);
 	else
-		ret = intel_gvt_ops->emulate_mmio_read(vgpu,
+		ret = intel_vgpu_emulate_mmio_read(vgpu,
 					bar_start + off, buf, count);
 	return ret;
 }
@@ -1114,10 +1112,10 @@ static ssize_t intel_vgpu_rw(struct mdev_device *mdev, char *buf,
 	switch (index) {
 	case VFIO_PCI_CONFIG_REGION_INDEX:
 		if (is_write)
-			ret = intel_gvt_ops->emulate_cfg_write(vgpu, pos,
+			ret = intel_vgpu_emulate_cfg_write(vgpu, pos,
 						buf, count);
 		else
-			ret = intel_gvt_ops->emulate_cfg_read(vgpu, pos,
+			ret = intel_vgpu_emulate_cfg_read(vgpu, pos,
 						buf, count);
 		break;
 	case VFIO_PCI_BAR0_REGION_INDEX:
@@ -1685,7 +1683,7 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 
 		return ret;
 	} else if (cmd == VFIO_DEVICE_RESET) {
-		intel_gvt_ops->vgpu_reset(vgpu);
+		intel_gvt_reset_vgpu(vgpu);
 		return 0;
 	} else if (cmd == VFIO_DEVICE_QUERY_GFX_PLANE) {
 		struct vfio_device_gfx_plane_info dmabuf;
@@ -1698,7 +1696,7 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 		if (dmabuf.argsz < minsz)
 			return -EINVAL;
 
-		ret = intel_gvt_ops->vgpu_query_plane(vgpu, &dmabuf);
+		ret = intel_vgpu_query_plane(vgpu, &dmabuf);
 		if (ret != 0)
 			return ret;
 
@@ -1706,14 +1704,10 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 								-EFAULT : 0;
 	} else if (cmd == VFIO_DEVICE_GET_GFX_DMABUF) {
 		__u32 dmabuf_id;
-		__s32 dmabuf_fd;
 
 		if (get_user(dmabuf_id, (__u32 __user *)arg))
 			return -EFAULT;
-
-		dmabuf_fd = intel_gvt_ops->vgpu_get_dmabuf(vgpu, dmabuf_id);
-		return dmabuf_fd;
-
+		return intel_vgpu_get_dmabuf(vgpu, dmabuf_id);
 	}
 
 	return -ENOTTY;
@@ -1764,7 +1758,7 @@ static struct mdev_parent_ops intel_vgpu_ops = {
 	.ioctl			= intel_vgpu_ioctl,
 };
 
-static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
+static int kvmgt_host_init(struct device *dev, void *gvt)
 {
 	int ret;
 
@@ -1772,7 +1766,6 @@ static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
 	if (ret)
 		return ret;
 
-	intel_gvt_ops = ops;
 	intel_vgpu_ops.supported_type_groups = gvt_vgpu_type_groups;
 
 	ret = mdev_register_device(dev, &intel_vgpu_ops);
@@ -1864,7 +1857,7 @@ static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
 					struct kvmgt_guest_info, track_node);
 
 	if (kvmgt_gfn_is_write_protected(info, gpa_to_gfn(gpa)))
-		intel_gvt_ops->write_protect_handler(info->vgpu, gpa,
+		intel_vgpu_page_track_handler(info->vgpu, gpa,
 						     (void *)val, len);
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 1b5617bb2745..0e3966e1fec8 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -51,13 +51,12 @@
  * Returns:
  * Zero on success, negative error code if failed
  */
-static inline int intel_gvt_hypervisor_host_init(struct device *dev,
-						 void *gvt, const void *ops)
+static inline int intel_gvt_hypervisor_host_init(struct device *dev, void *gvt)
 {
 	if (!intel_gvt_host.mpt->host_init)
 		return -ENODEV;
 
-	return intel_gvt_host.mpt->host_init(dev, gvt, ops);
+	return intel_gvt_host.mpt->host_init(dev, gvt);
 }
 
 /**
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
