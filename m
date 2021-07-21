Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673E3D1302
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1D66E9B4;
	Wed, 21 Jul 2021 15:57:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C2D6E9A5;
 Wed, 21 Jul 2021 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=fjIXClszHpEC6jJOXcJlGPz2Q+g9Cl1uIvy0qN1FEF8=; b=vbGLr7DyXtxFpsW3253XKhzdBd
 2/9NruGPn9K85vDKeXZ25XM04t4GqlrVQrCJztCVwOgrftMNSDTzGCUfoBiWy6tKkT7meoA0ZeApR
 YXCw5bz6Crw5oerrvLUmvHojtBlHTD/po2vIoUlj0Rhi1MP6QFLqr+Y2hLbnBuLjNWi8HRkt7TYtA
 gwbzGPLYbtJWrvOV/8mI6gtM1LWPShYFjgkctv9FSeBNlHx05hKSNSSqvqfDAUZl1PHVIPW6oTePN
 2R7hmdJ1RdAi/TcwZJL9GMA61XnyULRtpVpRCEGQvbYxpw2dUiScFgFbZ4/A6Skr/iJqaff7oU59J
 gWutpiQQ==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Eb6-009MVL-Bg; Wed, 21 Jul 2021 15:57:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 10/21] drm/i915/gvt: remove vgpu->handle
Date: Wed, 21 Jul 2021 17:53:44 +0200
Message-Id: <20210721155355.173183-11-hch@lst.de>
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

Always pass the actual vgpu structure instead of encoding it as a
"handle" and add a bool flag to denote if a VGPU is attached.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h       |   3 +-
 drivers/gpu/drm/i915/gvt/hypercall.h |  32 +++----
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 126 +++++++++------------------
 drivers/gpu/drm/i915/gvt/mpt.h       |  20 ++---
 drivers/gpu/drm/i915/gvt/vgpu.c      |   6 +-
 5 files changed, 71 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index a4691f0607e6..ad10ef2377e7 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -180,8 +180,8 @@ struct intel_vgpu {
 	struct intel_gvt *gvt;
 	struct mutex vgpu_lock;
 	int id;
-	unsigned long handle; /* vGPU handle used by hypervisor MPT modules */
 	bool active;
+	bool attached;
 	bool pv_notified;
 	bool failsafe;
 	unsigned int resetting_eng;
@@ -448,7 +448,6 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
 #define RING_CTX_SIZE 320
 
 struct intel_vgpu_creation_params {
-	__u64 handle;
 	__u64 low_gm_sz;  /* in MB */
 	__u64 high_gm_sz; /* in MB */
 	__u64 fence_sz;
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index eacee6f41f9c..9f0475759825 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -36,6 +36,7 @@
 #include <linux/types.h>
 
 struct device;
+struct intel_vgpu;
 
 /*
  * Specific GVT-g MPT modules function collections. Currently GVT-g supports
@@ -44,27 +45,28 @@ struct device;
 struct intel_gvt_mpt {
 	int (*host_init)(struct device *dev, void *gvt);
 	void (*host_exit)(struct device *dev, void *gvt);
-	void (*detach_vgpu)(void *vgpu);
-	int (*inject_msi)(unsigned long handle, u32 addr, u16 data);
-	int (*enable_page_track)(unsigned long handle, u64 gfn);
-	int (*disable_page_track)(unsigned long handle, u64 gfn);
-	int (*read_gpa)(unsigned long handle, unsigned long gpa, void *buf,
+	void (*detach_vgpu)(struct intel_vgpu *vgpu);
+	int (*inject_msi)(struct intel_vgpu *vgpu, u32 addr, u16 data);
+	int (*enable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
+	int (*disable_page_track)(struct intel_vgpu *vgpu, u64 gfn);
+	int (*read_gpa)(struct intel_vgpu *vgpu, unsigned long gpa, void *buf,
 			unsigned long len);
-	int (*write_gpa)(unsigned long handle, unsigned long gpa, void *buf,
+	int (*write_gpa)(struct intel_vgpu *vgpu, unsigned long gpa, void *buf,
 			 unsigned long len);
-	unsigned long (*gfn_to_mfn)(unsigned long handle, unsigned long gfn);
+	unsigned long (*gfn_to_mfn)(struct intel_vgpu *vgpu, unsigned long gfn);
 
-	int (*dma_map_guest_page)(unsigned long handle, unsigned long gfn,
+	int (*dma_map_guest_page)(struct intel_vgpu *vgpu, unsigned long gfn,
 				  unsigned long size, dma_addr_t *dma_addr);
-	void (*dma_unmap_guest_page)(unsigned long handle, dma_addr_t dma_addr);
+	void (*dma_unmap_guest_page)(struct intel_vgpu *vgpu,
+				dma_addr_t dma_addr);
 
-	int (*dma_pin_guest_page)(unsigned long handle, dma_addr_t dma_addr);
+	int (*dma_pin_guest_page)(struct intel_vgpu *vgpu, dma_addr_t dma_addr);
 
-	int (*set_opregion)(void *vgpu);
-	int (*set_edid)(void *vgpu, int port_num);
-	int (*get_vfio_device)(void *vgpu);
-	void (*put_vfio_device)(void *vgpu);
-	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);
+	int (*set_opregion)(struct intel_vgpu *vgpu);
+	int (*set_edid)(struct intel_vgpu *vgpu, int port_num);
+	int (*get_vfio_device)(struct intel_vgpu *vgpu);
+	void (*put_vfio_device)(struct intel_vgpu *vgpu);
+	bool (*is_valid_gfn)(struct intel_vgpu *vgpu, unsigned long gfn);
 };
 
 #endif /* _GVT_HYPERCALL_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 785647e776d2..bd08c2927c75 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -97,11 +97,6 @@ struct gvt_dma {
 	struct kref ref;
 };
 
-static inline bool handle_valid(unsigned long handle)
-{
-	return !!(handle & ~0xff);
-}
-
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -649,10 +644,8 @@ static int intel_vgpu_register_reg(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-static int kvmgt_get_vfio_device(void *p_vgpu)
+static int kvmgt_get_vfio_device(struct intel_vgpu *vgpu)
 {
-	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
-
 	vgpu->vfio_device = vfio_device_get_from_dev(
 		mdev_dev(vgpu->mdev));
 	if (!vgpu->vfio_device) {
@@ -663,9 +656,8 @@ static int kvmgt_get_vfio_device(void *p_vgpu)
 }
 
 
-static int kvmgt_set_opregion(void *p_vgpu)
+static int kvmgt_set_opregion(struct intel_vgpu *vgpu)
 {
-	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
 	void *base;
 	int ret;
 
@@ -691,9 +683,8 @@ static int kvmgt_set_opregion(void *p_vgpu)
 	return ret;
 }
 
-static int kvmgt_set_edid(void *p_vgpu, int port_num)
+static int kvmgt_set_edid(struct intel_vgpu *vgpu, int port_num)
 {
-	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
 	struct intel_vgpu_port *port = intel_vgpu_port(vgpu, port_num);
 	struct vfio_edid_region *base;
 	int ret;
@@ -721,10 +712,8 @@ static int kvmgt_set_edid(void *p_vgpu, int port_num)
 	return ret;
 }
 
-static void kvmgt_put_vfio_device(void *data)
+static void kvmgt_put_vfio_device(struct intel_vgpu *vgpu)
 {
-	struct intel_vgpu *vgpu = data;
-
 	if (WARN_ON(!vgpu->vfio_device))
 		return;
 
@@ -772,7 +761,7 @@ static int intel_vgpu_remove(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 
-	if (handle_valid(vgpu->handle))
+	if (vgpu->attached)
 		return -EBUSY;
 
 	intel_gvt_destroy_vgpu(vgpu);
@@ -910,7 +899,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	int ret;
 
-	if (!handle_valid(vgpu->handle))
+	if (!vgpu->attached)
 		return;
 
 	if (atomic_cmpxchg(&vgpu->released, 0, 1))
@@ -937,7 +926,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	vfio_group_put_external_user(vgpu->vfio_group);
 
 	vgpu->kvm = NULL;
-	vgpu->handle = 0;
+	vgpu->attached = false;
 }
 
 static void intel_vgpu_release(struct mdev_device *mdev)
@@ -1715,19 +1704,15 @@ static void kvmgt_host_exit(struct device *dev, void *gvt)
 	intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
 }
 
-static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
+static int kvmgt_page_track_add(struct intel_vgpu *info, u64 gfn)
 {
-	struct intel_vgpu *info;
-	struct kvm *kvm;
+	struct kvm *kvm = info->kvm;
 	struct kvm_memory_slot *slot;
 	int idx;
 
-	if (!handle_valid(handle))
+	if (!info->attached)
 		return -ESRCH;
 
-	info = (struct intel_vgpu *)handle;
-	kvm = info->kvm;
-
 	idx = srcu_read_lock(&kvm->srcu);
 	slot = gfn_to_memslot(kvm, gfn);
 	if (!slot) {
@@ -1749,19 +1734,15 @@ static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 	return 0;
 }
 
-static int kvmgt_page_track_remove(unsigned long handle, u64 gfn)
+static int kvmgt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 {
-	struct intel_vgpu *info;
-	struct kvm *kvm;
+	struct kvm *kvm = info->kvm;
 	struct kvm_memory_slot *slot;
 	int idx;
 
-	if (!handle_valid(handle))
+	if (!info->attached)
 		return 0;
 
-	info = (struct intel_vgpu *)handle;
-	kvm = info->kvm;
-
 	idx = srcu_read_lock(&kvm->srcu);
 	slot = gfn_to_memslot(kvm, gfn);
 	if (!slot) {
@@ -1824,7 +1805,7 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
 
 	mutex_lock(&vgpu->gvt->lock);
 	for_each_active_vgpu(vgpu->gvt, itr, id) {
-		if (!handle_valid(itr->handle))
+		if (!itr->attached)
 			continue;
 
 		if (kvm && kvm == itr->kvm) {
@@ -1839,14 +1820,12 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
 
 static int kvmgt_guest_init(struct mdev_device *mdev)
 {
-	struct intel_vgpu *vgpu;
-	struct kvm *kvm;
+	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct kvm *kvm = vgpu->kvm;
 
-	vgpu = mdev_get_drvdata(mdev);
-	if (handle_valid(vgpu->handle))
+	if (vgpu->attached)
 		return -EEXIST;
 
-	kvm = vgpu->kvm;
 	if (!kvm || kvm->mm != current->mm) {
 		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
 		return -ESRCH;
@@ -1855,7 +1834,7 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	if (__kvmgt_vgpu_exist(vgpu, kvm))
 		return -EEXIST;
 
-	vgpu->handle = (unsigned long)vgpu;
+	vgpu->attached = true;
 	kvm_get_kvm(vgpu->kvm);
 
 	kvmgt_protect_table_init(vgpu);
@@ -1881,10 +1860,9 @@ static bool kvmgt_guest_exit(struct intel_vgpu *info)
 	return true;
 }
 
-static void kvmgt_detach_vgpu(void *p_vgpu)
+static void kvmgt_detach_vgpu(struct intel_vgpu *vgpu)
 {
 	int i;
-	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
 
 	if (!vgpu->region)
 		return;
@@ -1898,15 +1876,11 @@ static void kvmgt_detach_vgpu(void *p_vgpu)
 	vgpu->region = NULL;
 }
 
-static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
+static int kvmgt_inject_msi(struct intel_vgpu *vgpu, u32 addr, u16 data)
 {
-	struct intel_vgpu *vgpu;
-
-	if (!handle_valid(handle))
+	if (!vgpu->attached)
 		return -ESRCH;
 
-	vgpu = (struct intel_vgpu *)handle;
-
 	/*
 	 * When guest is poweroff, msi_trigger is set to NULL, but vgpu's
 	 * config and mmio register isn't restored to default during guest
@@ -1925,16 +1899,14 @@ static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
 	return -EFAULT;
 }
 
-static unsigned long kvmgt_gfn_to_pfn(unsigned long handle, unsigned long gfn)
+static unsigned long kvmgt_gfn_to_pfn(struct intel_vgpu *vgpu,
+		unsigned long gfn)
 {
-	struct intel_vgpu *vgpu;
 	kvm_pfn_t pfn;
 
-	if (!handle_valid(handle))
+	if (!vgpu->attached)
 		return INTEL_GVT_INVALID_ADDR;
 
-	vgpu = (struct intel_vgpu *)handle;
-
 	pfn = gfn_to_pfn(vgpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return INTEL_GVT_INVALID_ADDR;
@@ -1942,18 +1914,15 @@ static unsigned long kvmgt_gfn_to_pfn(unsigned long handle, unsigned long gfn)
 	return pfn;
 }
 
-static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
+static int kvmgt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, dma_addr_t *dma_addr)
 {
-	struct intel_vgpu *vgpu;
 	struct gvt_dma *entry;
 	int ret;
 
-	if (!handle_valid(handle))
+	if (!vgpu->attached)
 		return -EINVAL;
 
-	vgpu = (struct intel_vgpu *)handle;
-
 	mutex_lock(&vgpu->cache_lock);
 
 	entry = __gvt_cache_find_gfn(vgpu, gfn);
@@ -1992,17 +1961,15 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 	return ret;
 }
 
-static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma_addr)
+static int kvmgt_dma_pin_guest_page(struct intel_vgpu *vgpu,
+		dma_addr_t dma_addr)
 {
-	struct intel_vgpu *vgpu;
 	struct gvt_dma *entry;
 	int ret = 0;
 
-	if (!handle_valid(handle))
+	if (!vgpu->attached)
 		return -ENODEV;
 
-	vgpu = (struct intel_vgpu *)handle;
-
 	mutex_lock(&vgpu->cache_lock);
 	entry = __gvt_cache_find_dma_addr(vgpu, dma_addr);
 	if (entry)
@@ -2023,16 +1990,14 @@ static void __gvt_dma_release(struct kref *ref)
 	__gvt_cache_remove_entry(entry->vgpu, entry);
 }
 
-static void kvmgt_dma_unmap_guest_page(unsigned long handle, dma_addr_t dma_addr)
+static void kvmgt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
+		dma_addr_t dma_addr)
 {
-	struct intel_vgpu *vgpu;
 	struct gvt_dma *entry;
 
-	if (!handle_valid(handle))
+	if (!vgpu->attached)
 		return;
 
-	vgpu = (struct intel_vgpu *)handle;
-
 	mutex_lock(&vgpu->cache_lock);
 	entry = __gvt_cache_find_dma_addr(vgpu, dma_addr);
 	if (entry)
@@ -2040,44 +2005,35 @@ static void kvmgt_dma_unmap_guest_page(unsigned long handle, dma_addr_t dma_addr
 	mutex_unlock(&vgpu->cache_lock);
 }
 
-static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
+static int kvmgt_rw_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
 			void *buf, unsigned long len, bool write)
 {
-	struct intel_vgpu *vgpu;
-
-	if (!handle_valid(handle))
+	if (!vgpu->attached)
 		return -ESRCH;
-
-	vgpu = (struct intel_vgpu *)handle;
-
 	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, write);
 }
 
-static int kvmgt_read_gpa(unsigned long handle, unsigned long gpa,
+static int kvmgt_read_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
 			void *buf, unsigned long len)
 {
-	return kvmgt_rw_gpa(handle, gpa, buf, len, false);
+	return kvmgt_rw_gpa(vgpu, gpa, buf, len, false);
 }
 
-static int kvmgt_write_gpa(unsigned long handle, unsigned long gpa,
+static int kvmgt_write_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
 			void *buf, unsigned long len)
 {
-	return kvmgt_rw_gpa(handle, gpa, buf, len, true);
+	return kvmgt_rw_gpa(vgpu, gpa, buf, len, true);
 }
 
-static bool kvmgt_is_valid_gfn(unsigned long handle, unsigned long gfn)
+static bool kvmgt_is_valid_gfn(struct intel_vgpu *vgpu, unsigned long gfn)
 {
-	struct intel_vgpu *vgpu;
-	struct kvm *kvm;
+	struct kvm *kvm = vgpu->kvm;
 	int idx;
 	bool ret;
 
-	if (!handle_valid(handle))
+	if (!vgpu->attached)
 		return false;
 
-	vgpu = (struct intel_vgpu *)handle;
-	kvm = vgpu->kvm;
-
 	idx = srcu_read_lock(&kvm->srcu);
 	ret = kvm_is_visible_gfn(kvm, gfn);
 	srcu_read_unlock(&kvm->srcu, idx);
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 8a659301d78b..ba0c31c4a705 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -118,7 +118,7 @@ static inline int intel_gvt_hypervisor_inject_msi(struct intel_vgpu *vgpu)
 
 	trace_inject_msi(vgpu->id, addr, data);
 
-	ret = intel_gvt_host.mpt->inject_msi(vgpu->handle, addr, data);
+	ret = intel_gvt_host.mpt->inject_msi(vgpu, addr, data);
 	if (ret)
 		return ret;
 	return 0;
@@ -135,7 +135,7 @@ static inline int intel_gvt_hypervisor_inject_msi(struct intel_vgpu *vgpu)
 static inline int intel_gvt_hypervisor_enable_page_track(
 		struct intel_vgpu *vgpu, unsigned long gfn)
 {
-	return intel_gvt_host.mpt->enable_page_track(vgpu->handle, gfn);
+	return intel_gvt_host.mpt->enable_page_track(vgpu, gfn);
 }
 
 /**
@@ -149,7 +149,7 @@ static inline int intel_gvt_hypervisor_enable_page_track(
 static inline int intel_gvt_hypervisor_disable_page_track(
 		struct intel_vgpu *vgpu, unsigned long gfn)
 {
-	return intel_gvt_host.mpt->disable_page_track(vgpu->handle, gfn);
+	return intel_gvt_host.mpt->disable_page_track(vgpu, gfn);
 }
 
 /**
@@ -165,7 +165,7 @@ static inline int intel_gvt_hypervisor_disable_page_track(
 static inline int intel_gvt_hypervisor_read_gpa(struct intel_vgpu *vgpu,
 		unsigned long gpa, void *buf, unsigned long len)
 {
-	return intel_gvt_host.mpt->read_gpa(vgpu->handle, gpa, buf, len);
+	return intel_gvt_host.mpt->read_gpa(vgpu, gpa, buf, len);
 }
 
 /**
@@ -181,7 +181,7 @@ static inline int intel_gvt_hypervisor_read_gpa(struct intel_vgpu *vgpu,
 static inline int intel_gvt_hypervisor_write_gpa(struct intel_vgpu *vgpu,
 		unsigned long gpa, void *buf, unsigned long len)
 {
-	return intel_gvt_host.mpt->write_gpa(vgpu->handle, gpa, buf, len);
+	return intel_gvt_host.mpt->write_gpa(vgpu, gpa, buf, len);
 }
 
 /**
@@ -195,7 +195,7 @@ static inline int intel_gvt_hypervisor_write_gpa(struct intel_vgpu *vgpu,
 static inline unsigned long intel_gvt_hypervisor_gfn_to_mfn(
 		struct intel_vgpu *vgpu, unsigned long gfn)
 {
-	return intel_gvt_host.mpt->gfn_to_mfn(vgpu->handle, gfn);
+	return intel_gvt_host.mpt->gfn_to_mfn(vgpu, gfn);
 }
 
 /**
@@ -212,7 +212,7 @@ static inline int intel_gvt_hypervisor_dma_map_guest_page(
 		struct intel_vgpu *vgpu, unsigned long gfn, unsigned long size,
 		dma_addr_t *dma_addr)
 {
-	return intel_gvt_host.mpt->dma_map_guest_page(vgpu->handle, gfn, size,
+	return intel_gvt_host.mpt->dma_map_guest_page(vgpu, gfn, size,
 						      dma_addr);
 }
 
@@ -224,7 +224,7 @@ static inline int intel_gvt_hypervisor_dma_map_guest_page(
 static inline void intel_gvt_hypervisor_dma_unmap_guest_page(
 		struct intel_vgpu *vgpu, dma_addr_t dma_addr)
 {
-	intel_gvt_host.mpt->dma_unmap_guest_page(vgpu->handle, dma_addr);
+	intel_gvt_host.mpt->dma_unmap_guest_page(vgpu, dma_addr);
 }
 
 /**
@@ -239,7 +239,7 @@ static inline int
 intel_gvt_hypervisor_dma_pin_guest_page(struct intel_vgpu *vgpu,
 					dma_addr_t dma_addr)
 {
-	return intel_gvt_host.mpt->dma_pin_guest_page(vgpu->handle, dma_addr);
+	return intel_gvt_host.mpt->dma_pin_guest_page(vgpu, dma_addr);
 }
 
 /**
@@ -318,7 +318,7 @@ static inline bool intel_gvt_hypervisor_is_valid_gfn(
 	if (!intel_gvt_host.mpt->is_valid_gfn)
 		return true;
 
-	return intel_gvt_host.mpt->is_valid_gfn(vgpu->handle, gfn);
+	return intel_gvt_host.mpt->is_valid_gfn(vgpu, gfn);
 }
 
 #endif /* _GVT_MPT_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 7b9a571c0dc9..9e8fa9f388eb 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -370,8 +370,8 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	struct intel_vgpu *vgpu;
 	int ret;
 
-	gvt_dbg_core("handle %llu low %llu MB high %llu MB fence %llu\n",
-			param->handle, param->low_gm_sz, param->high_gm_sz,
+	gvt_dbg_core("low %llu MB high %llu MB fence %llu\n",
+			param->low_gm_sz, param->high_gm_sz,
 			param->fence_sz);
 
 	vgpu = vzalloc(sizeof(*vgpu));
@@ -384,7 +384,6 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 		goto out_free_vgpu;
 
 	vgpu->id = ret;
-	vgpu->handle = param->handle;
 	vgpu->gvt = gvt;
 	vgpu->sched_ctl.weight = param->weight;
 	mutex_init(&vgpu->vgpu_lock);
@@ -477,7 +476,6 @@ struct intel_vgpu *intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	struct intel_vgpu_creation_params param;
 	struct intel_vgpu *vgpu;
 
-	param.handle = 0;
 	param.primary = 1;
 	param.low_gm_sz = type->low_gm_size;
 	param.high_gm_sz = type->high_gm_size;
-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
