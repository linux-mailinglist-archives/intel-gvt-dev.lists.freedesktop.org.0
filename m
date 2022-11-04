Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2298F619AA5
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  4 Nov 2022 15:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3C310E0DB;
	Fri,  4 Nov 2022 14:57:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52E210E0C4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  4 Nov 2022 14:57:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z24so6732207ljn.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 04 Nov 2022 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gttb2jNv+Cgq64MP+eElqj+YyBdISTV6G0B4oaUT9Tc=;
 b=kw0dNZEy+TkrbSxIOj+H6CKYQjJtXeev1dMkUpbadtE19A5XUw70y4TcxK1IO9ysh/
 TPaCDwwr/3M+TlC6jQd05lJVyeyXHhbot6VhHkNBY1Dj8B3avr5PTlYJBy/QN9ccq2K/
 PjHuj9zxdohZ1Ay8FES+9IeqNGRAvzARJ3L66JffJF+1i4m+F0KY/poap/e/RUf7FR/M
 P4QAJuE4wfZp5dXYRWt45Ep83nebc0KXArHozdF8lNsgB+AKqagTPbBFhAJgzFLV+ydL
 rHaYO6aEpHnz0HIv81BkPJiaWqp1jFeB0H4H/QaD7K0YTLHZvBJ4WDThRBL5lfveEbcr
 zM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gttb2jNv+Cgq64MP+eElqj+YyBdISTV6G0B4oaUT9Tc=;
 b=7LmRDM+cBo35ZBwdCVvWXSovoDcz989b1K3q143AxwzYgjhvXhp7Un4MVbZLFJzSkc
 IwVrmXCTejzSK+evwwqJFIe7hCzhLo4iazGmS67sgcZPVp7mWKTHPl449OgnRu9XKIZ5
 dSNmKy/j1lao9R1d3bh9mdUYbJ/5ZXa7RPnDHVT86BbrV/kpPg05gdlixb5hVujQqnyn
 j5/RyvZZF33OLlGCgyf2F1oWh6slLzeneQZW+pI5OcHiIIs6NtZAUxjZSjH4dDOmN1SZ
 MJTbOski2i6uVyu/6pwMUnjlNMmfP/nbS8I1JAHh43Gjkpuv93cj2xKtruW7tPfIUM48
 Uosw==
X-Gm-Message-State: ACrzQf2EdCHn8RuEI3k91Kex1ytekQXatTX7a7E17a3jAbaGyk+c6wrM
 h+dNSLW4KiJJZm3vXxZALQhGPA/qN7w=
X-Google-Smtp-Source: AMsMyM51vC47EgAX2puFjSve5TqkGieDxq0Juu0GKqyDURsFUhoyuV46NuLqJT+Lw9X83NpkaKVKNw==
X-Received: by 2002:a2e:8793:0:b0:277:4b8:192f with SMTP id
 n19-20020a2e8793000000b0027704b8192fmr13212912lji.442.1667573825242; 
 Fri, 04 Nov 2022 07:57:05 -0700 (PDT)
Received: from localhost.localdomain (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 d9-20020a194f09000000b00492d064e8f8sm486026lfb.263.2022.11.04.07.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:57:04 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux2@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: 
Subject: [PATCH 2/3] drm/i915/gvt: use atomic operations to change the vGPU
 status
Date: Fri,  4 Nov 2022 14:56:51 +0000
Message-Id: <20221104145652.1570-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104145652.1570-1-zhi.a.wang@intel.com>
References: <20221104145652.1570-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Several vGPU status are used to decide the availability of GVT-g core logics
when creating a vGPU. Use atomic operations on chaning the vGPU status to
avoid the racing.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c   |  1 -
 drivers/gpu/drm/i915/gvt/dmabuf.c    |  3 ++-
 drivers/gpu/drm/i915/gvt/gtt.c       |  4 ++--
 drivers/gpu/drm/i915/gvt/gvt.h       | 15 ++++++++----
 drivers/gpu/drm/i915/gvt/interrupt.c |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 34 ++++++++++++----------------
 drivers/gpu/drm/i915/gvt/scheduler.c |  3 ++-
 drivers/gpu/drm/i915/gvt/vgpu.c      | 12 ++++------
 8 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index 9f1c209d9251..bb301bc974a4 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -162,7 +162,6 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
 	snprintf(name, 16, "vgpu%d", vgpu->id);
 	vgpu->debugfs = debugfs_create_dir(name, vgpu->gvt->debugfs_root);
 
-	debugfs_create_bool("active", 0444, vgpu->debugfs, &vgpu->active);
 	debugfs_create_file("mmio_diff", 0444, vgpu->debugfs, vgpu,
 			    &vgpu_mmio_diff_fops);
 	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 01e54b45c5c1..77f0522d2de9 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -134,7 +134,8 @@ static void dmabuf_gem_object_free(struct kref *kref)
 	struct list_head *pos;
 	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
 
-	if (vgpu && vgpu->active && !list_empty(&vgpu->dmabuf_obj_list_head)) {
+	if (vgpu && test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status) &&
+	    !list_empty(&vgpu->dmabuf_obj_list_head)) {
 		list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
 			dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 			if (dmabuf_obj == obj) {
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..55ab7abaf6df 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -55,7 +55,7 @@ static bool intel_gvt_is_valid_gfn(struct intel_vgpu *vgpu, unsigned long gfn)
 	int idx;
 	bool ret;
 
-	if (!vgpu->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return false;
 
 	idx = srcu_read_lock(&kvm->srcu);
@@ -1183,7 +1183,7 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
 		return 0;
 
-	if (!vgpu->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return -EINVAL;
 	pfn = gfn_to_pfn(vgpu->vfio_device.kvm, ops->get_pfn(entry));
 	if (is_error_noslot_pfn(pfn))
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 62823c0e13ab..2d65800d8e93 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -172,13 +172,18 @@ struct intel_vgpu_submission {
 
 #define KVMGT_DEBUGFS_FILENAME		"kvmgt_nr_cache_entries"
 
+enum {
+	INTEL_VGPU_STATUS_ATTACHED = 0,
+	INTEL_VGPU_STATUS_ACTIVE,
+	INTEL_VGPU_STATUS_NR_BITS,
+};
+
 struct intel_vgpu {
 	struct vfio_device vfio_device;
 	struct intel_gvt *gvt;
 	struct mutex vgpu_lock;
 	int id;
-	bool active;
-	bool attached;
+	DECLARE_BITMAP(status, INTEL_VGPU_STATUS_NR_BITS);
 	bool pv_notified;
 	bool failsafe;
 	unsigned int resetting_eng;
@@ -467,7 +472,7 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
 
 #define for_each_active_vgpu(gvt, vgpu, id) \
 	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) \
-		for_each_if(vgpu->active)
+		for_each_if(test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status))
 
 static inline void intel_vgpu_write_pci_bar(struct intel_vgpu *vgpu,
 					    u32 offset, u32 val, bool low)
@@ -725,7 +730,7 @@ static inline bool intel_gvt_mmio_is_cmd_write_patch(
 static inline int intel_gvt_read_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
 		void *buf, unsigned long len)
 {
-	if (!vgpu->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return -ESRCH;
 	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, false);
 }
@@ -743,7 +748,7 @@ static inline int intel_gvt_read_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
 static inline int intel_gvt_write_gpa(struct intel_vgpu *vgpu,
 		unsigned long gpa, void *buf, unsigned long len)
 {
-	if (!vgpu->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return -ESRCH;
 	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, true);
 }
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index a6b2021b665f..68eca023bbc6 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -433,7 +433,7 @@ static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
 	 * enabled by guest. so if msi_trigger is null, success is still
 	 * returned and don't inject interrupt into guest.
 	 */
-	if (!vgpu->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return -ESRCH;
 	if (vgpu->msi_trigger && eventfd_signal(vgpu->msi_trigger, 1) != 1)
 		return -EFAULT;
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 897b6fdbbaed..37c581dc6a58 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -638,7 +638,7 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
 
 	mutex_lock(&vgpu->gvt->lock);
 	for_each_active_vgpu(vgpu->gvt, itr, id) {
-		if (!itr->attached)
+		if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 			continue;
 
 		if (vgpu->vfio_device.kvm == itr->vfio_device.kvm) {
@@ -655,7 +655,7 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 {
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 
-	if (vgpu->attached)
+	if (test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return -EEXIST;
 
 	if (!vgpu->vfio_device.kvm ||
@@ -669,8 +669,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	if (__kvmgt_vgpu_exist(vgpu))
 		return -EEXIST;
 
-	vgpu->attached = true;
-
 	kvmgt_protect_table_init(vgpu);
 	gvt_cache_init(vgpu);
 
@@ -679,6 +677,8 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
 					 &vgpu->track_node);
 
+	set_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status);
+
 	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
 			     &vgpu->nr_cache_entries);
 
@@ -702,11 +702,12 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 {
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 
-	if (!vgpu->attached)
-		return;
+	WARN_ON_ONCE(!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status));
 
 	intel_gvt_release_vgpu(vgpu);
 
+	clear_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status);
+
 	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
 
 	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
@@ -716,8 +717,6 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
 
-	vgpu->attached = false;
-
 	if (vgpu->vfio_device.kvm)
 		kvm_put_kvm(vgpu->vfio_device.kvm);
 }
@@ -1502,9 +1501,6 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = dev_get_drvdata(&mdev->dev);
 
-	if (WARN_ON_ONCE(vgpu->attached))
-		return;
-
 	vfio_unregister_group_dev(&vgpu->vfio_device);
 	vfio_put_device(&vgpu->vfio_device);
 }
@@ -1549,7 +1545,7 @@ int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
 	struct kvm_memory_slot *slot;
 	int idx;
 
-	if (!info->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
 		return -ESRCH;
 
 	idx = srcu_read_lock(&kvm->srcu);
@@ -1579,8 +1575,8 @@ int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn)
 	struct kvm_memory_slot *slot;
 	int idx;
 
-	if (!info->attached)
-		return 0;
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
+		return -ESRCH;
 
 	idx = srcu_read_lock(&kvm->srcu);
 	slot = gfn_to_memslot(kvm, gfn);
@@ -1658,7 +1654,7 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	struct gvt_dma *entry;
 	int ret;
 
-	if (!vgpu->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return -EINVAL;
 
 	mutex_lock(&vgpu->cache_lock);
@@ -1704,8 +1700,8 @@ int intel_gvt_dma_pin_guest_page(struct intel_vgpu *vgpu, dma_addr_t dma_addr)
 	struct gvt_dma *entry;
 	int ret = 0;
 
-	if (!vgpu->attached)
-		return -ENODEV;
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
+		return -EINVAL;
 
 	mutex_lock(&vgpu->cache_lock);
 	entry = __gvt_cache_find_dma_addr(vgpu, dma_addr);
@@ -1732,7 +1728,7 @@ void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 {
 	struct gvt_dma *entry;
 
-	if (!vgpu->attached)
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
 		return;
 
 	mutex_lock(&vgpu->cache_lock);
@@ -1768,7 +1764,7 @@ static void intel_gvt_test_and_emulate_vblank(struct intel_gvt *gvt)
 	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) {
 		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK + id,
 				       (void *)&gvt->service_request)) {
-			if (vgpu->active)
+			if (test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status))
 				intel_vgpu_emulate_vblank(vgpu);
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index d6fe94cd0fdb..aa162ac0d76e 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -866,7 +866,8 @@ pick_next_workload(struct intel_gvt *gvt, struct intel_engine_cs *engine)
 		goto out;
 	}
 
-	if (!scheduler->current_vgpu->active ||
+	if (!test_bit(INTEL_VGPU_STATUS_ACTIVE,
+	    scheduler->current_vgpu->status) ||
 	    list_empty(workload_q_head(scheduler->current_vgpu, engine)))
 		goto out;
 
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 56c71474008a..ae7d2919240f 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -166,9 +166,7 @@ void intel_gvt_clean_vgpu_types(struct intel_gvt *gvt)
  */
 void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu)
 {
-	mutex_lock(&vgpu->vgpu_lock);
-	vgpu->active = true;
-	mutex_unlock(&vgpu->vgpu_lock);
+	set_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status);
 }
 
 /**
@@ -183,7 +181,7 @@ void intel_gvt_deactivate_vgpu(struct intel_vgpu *vgpu)
 {
 	mutex_lock(&vgpu->vgpu_lock);
 
-	vgpu->active = false;
+	clear_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status);
 
 	if (atomic_read(&vgpu->submission.running_workload_num)) {
 		mutex_unlock(&vgpu->vgpu_lock);
@@ -228,7 +226,8 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct drm_i915_private *i915 = gvt->gt->i915;
 
-	drm_WARN(&i915->drm, vgpu->active, "vGPU is still active!\n");
+	drm_WARN(&i915->drm, test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status),
+		 "vGPU is still active!\n");
 
 	/*
 	 * remove idr first so later clean can judge if need to stop
@@ -285,8 +284,7 @@ struct intel_vgpu *intel_gvt_create_idle_vgpu(struct intel_gvt *gvt)
 	if (ret)
 		goto out_free_vgpu;
 
-	vgpu->active = false;
-
+	clear_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status);
 	return vgpu;
 
 out_free_vgpu:
-- 
2.25.1

