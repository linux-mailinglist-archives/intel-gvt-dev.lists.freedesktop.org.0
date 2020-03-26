Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DD1937F8
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Mar 2020 06:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB776E28B;
	Thu, 26 Mar 2020 05:41:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EAC6E27C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Mar 2020 05:41:42 +0000 (UTC)
IronPort-SDR: j7wDWOYjGSo2SgzVVyxgTPtvD6BJw2xJnna7Wbex/zDyJT38rOuh+t6WcyS+wfXtqnkeFPGe7i
 SiTD2PDgshJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 22:41:42 -0700
IronPort-SDR: 2xL1WmubufOQ7JEJr9cpXUp1XyThWDYxyZXYT7GndF4zMlQKV/3YY0CpzYizMtx0AhtpsEErZp
 7vcF4ZcqKkFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="393862320"
Received: from zhaji-mobl3.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.249.174.174])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 22:41:40 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: alex.williamson@redhat.com
Subject: [PATCH v2 2/2] drm/i915/gvt: mdev aggregation type
Date: Thu, 26 Mar 2020 13:41:36 +0800
Message-Id: <20200326054136.2543-3-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326054136.2543-1-zhenyuw@linux.intel.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
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
Cc: "Jiang, Dave" <dave.jiang@intel.com>, kevin.tian@intel.com,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

To increase the flexibility for resource allocation on mdev types,f
this trys to add aggregation attribute for mdev type that can
aggregate gfx memory resources in GVT case.

Use sysfs method for this attribute, the most difference for GVT is
that the gfx resource allocation will be delayed until mdev open
instead of mdev create to allow aggregation setting before VM
start. But gfx resource accouting would still handle left resource for
target vGPU or other types.

"max_aggregation" would show maxium instances for aggregation on
target vGPU type. "aggregated_instances" shows current count of aggregated
instances. "max_aggregation" is read-only and user sets needed account
by write to "aggregated_instances".

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: "Jiang, Dave" <dave.jiang@intel.com>
Cc: "Yuan, Hang" <hang.yuan@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/aperture_gm.c |  44 +++++--
 drivers/gpu/drm/i915/gvt/gtt.c         |   9 +-
 drivers/gpu/drm/i915/gvt/gvt.c         |   7 +-
 drivers/gpu/drm/i915/gvt/gvt.h         |  42 ++++--
 drivers/gpu/drm/i915/gvt/kvmgt.c       | 115 ++++++++++++++++-
 drivers/gpu/drm/i915/gvt/vgpu.c        | 172 +++++++++++++++++--------
 6 files changed, 295 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 0d6d59871308..9ee3083b37ae 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -238,10 +238,10 @@ static void free_resource(struct intel_vgpu *vgpu)
 	gvt->fence.vgpu_allocated_fence_num -= vgpu_fence_sz(vgpu);
 }
 
-static int alloc_resource(struct intel_vgpu *vgpu,
-		struct intel_vgpu_creation_params *param)
+static int alloc_resource(struct intel_vgpu *vgpu)
 {
 	struct intel_gvt *gvt = vgpu->gvt;
+	struct intel_vgpu_creation_params *param = &vgpu->param;
 	unsigned long request, avail, max, taken;
 	const char *item;
 
@@ -254,7 +254,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
 	max = gvt_aperture_sz(gvt) - HOST_LOW_GM_SIZE;
 	taken = gvt->gm.vgpu_allocated_low_gm_size;
 	avail = max - taken;
-	request = MB_TO_BYTES(param->low_gm_sz);
+	request = param->low_gm_sz * param->aggregation;
 
 	if (request > avail)
 		goto no_enough_resource;
@@ -265,7 +265,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
 	max = gvt_hidden_sz(gvt) - HOST_HIGH_GM_SIZE;
 	taken = gvt->gm.vgpu_allocated_high_gm_size;
 	avail = max - taken;
-	request = MB_TO_BYTES(param->high_gm_sz);
+	request = param->high_gm_sz * param->aggregation;
 
 	if (request > avail)
 		goto no_enough_resource;
@@ -283,8 +283,8 @@ static int alloc_resource(struct intel_vgpu *vgpu,
 
 	vgpu_fence_sz(vgpu) = request;
 
-	gvt->gm.vgpu_allocated_low_gm_size += MB_TO_BYTES(param->low_gm_sz);
-	gvt->gm.vgpu_allocated_high_gm_size += MB_TO_BYTES(param->high_gm_sz);
+	gvt->gm.vgpu_allocated_low_gm_size += param->low_gm_sz * param->aggregation;
+	gvt->gm.vgpu_allocated_high_gm_size += param->high_gm_sz * param->aggregation;
 	gvt->fence.vgpu_allocated_fence_num += param->fence_sz;
 	return 0;
 
@@ -307,9 +307,34 @@ void intel_vgpu_free_resource(struct intel_vgpu *vgpu)
 {
 	free_vgpu_gm(vgpu);
 	free_vgpu_fence(vgpu);
+}
+
+void intel_vgpu_free_resource_count(struct intel_vgpu *vgpu)
+{
 	free_resource(vgpu);
 }
 
+int intel_vgpu_alloc_resource_count(struct intel_vgpu *vgpu)
+{
+	return alloc_resource(vgpu);
+}
+
+int intel_vgpu_adjust_resource_count(struct intel_vgpu *vgpu)
+{
+	if ((vgpu_aperture_sz(vgpu) != vgpu->param.low_gm_sz *
+	     vgpu->param.aggregation) ||
+	    (vgpu_hidden_sz(vgpu) != vgpu->param.high_gm_sz *
+	     vgpu->param.aggregation)) {
+		/* handle aggregation change */
+		intel_vgpu_free_resource_count(vgpu);
+		intel_vgpu_alloc_resource_count(vgpu);
+		mutex_lock(&vgpu->gvt->lock);
+		intel_gvt_update_vgpu_types(vgpu->gvt);
+		mutex_unlock(&vgpu->gvt->lock);
+	}
+	return 0;
+}
+
 /**
  * intel_vgpu_reset_resource - reset resource state owned by a vGPU
  * @vgpu: a vGPU
@@ -338,15 +363,10 @@ void intel_vgpu_reset_resource(struct intel_vgpu *vgpu)
  * zero on success, negative error code if failed.
  *
  */
-int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu,
-		struct intel_vgpu_creation_params *param)
+int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu)
 {
 	int ret;
 
-	ret = alloc_resource(vgpu, param);
-	if (ret)
-		return ret;
-
 	ret = alloc_vgpu_gm(vgpu);
 	if (ret)
 		goto out_free_resource;
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 2a4b23f8aa74..60f455134ed0 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2466,12 +2466,6 @@ int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
 {
 	struct intel_vgpu_gtt *gtt = &vgpu->gtt;
 
-	INIT_RADIX_TREE(&gtt->spt_tree, GFP_KERNEL);
-
-	INIT_LIST_HEAD(&gtt->ppgtt_mm_list_head);
-	INIT_LIST_HEAD(&gtt->oos_page_list_head);
-	INIT_LIST_HEAD(&gtt->post_shadow_list_head);
-
 	gtt->ggtt_mm = intel_vgpu_create_ggtt_mm(vgpu);
 	if (IS_ERR(gtt->ggtt_mm)) {
 		gvt_vgpu_err("fail to create mm for ggtt.\n");
@@ -2508,6 +2502,9 @@ static void intel_vgpu_destroy_ggtt_mm(struct intel_vgpu *vgpu)
 {
 	struct intel_gvt_partial_pte *pos, *next;
 
+	if (!vgpu->gtt.ggtt_mm)
+		return;
+
 	list_for_each_entry_safe(pos, next,
 				 &vgpu->gtt.ggtt_mm->ggtt_mm.partial_pte_list,
 				 list) {
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 9e1787867894..bbd77cba239e 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -99,11 +99,11 @@ static ssize_t description_show(struct kobject *kobj, struct device *dev,
 
 	return sprintf(buf, "low_gm_size: %dMB\nhigh_gm_size: %dMB\n"
 		       "fence: %d\nresolution: %s\n"
-		       "weight: %d\n",
+		       "weight: %d\naggregation: %s\n",
 		       BYTES_TO_MB(type->low_gm_size),
 		       BYTES_TO_MB(type->high_gm_size),
 		       type->fence, vgpu_edid_str(type->resolution),
-		       type->weight);
+		       type->weight, type->aggregation ? "yes" : "no");
 }
 
 static MDEV_TYPE_ATTR_RO(available_instances);
@@ -185,6 +185,9 @@ static const struct intel_gvt_ops intel_gvt_ops = {
 	.vgpu_get_dmabuf = intel_vgpu_get_dmabuf,
 	.write_protect_handler = intel_vgpu_page_track_handler,
 	.emulate_hotplug = intel_vgpu_emulate_hotplug,
+	.vgpu_delayed_alloc = intel_vgpu_delayed_alloc,
+	.vgpu_res_free = intel_vgpu_res_free,
+	.vgpu_res_change = intel_vgpu_adjust_resource_count,
 };
 
 static void init_device_info(struct intel_gvt *gvt)
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 58c2c7932e3f..bb8f16d468f4 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -165,15 +165,30 @@ struct intel_vgpu_submission {
 	bool active;
 };
 
+struct intel_vgpu_creation_params {
+	__u64 handle;
+	__u64 low_gm_sz;
+	__u64 high_gm_sz;
+	__u64 fence_sz;
+	__u64 resolution;
+	__s32 primary;
+	__u64 vgpu_id;
+	__u32 weight;
+	__u32 aggregation; /* requested aggregation number if type supports */
+};
+
 struct intel_vgpu {
 	struct intel_gvt *gvt;
 	struct mutex vgpu_lock;
 	int id;
 	unsigned long handle; /* vGPU handle used by hypervisor MPT modules */
 	bool active;
+	bool res_initialized;
 	bool pv_notified;
 	bool failsafe;
 	unsigned int resetting_eng;
+	struct intel_vgpu_creation_params param;
+	struct intel_vgpu_type *type;
 
 	/* Both sched_data and sched_ctl can be seen a part of the global gvt
 	 * scheduler structure. So below 2 vgpu data are protected
@@ -276,6 +291,7 @@ struct intel_vgpu_type {
 	unsigned int fence;
 	unsigned int weight;
 	enum intel_vgpu_edid resolution;
+	bool aggregation;
 };
 
 struct intel_gvt {
@@ -402,22 +418,12 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
 #define vgpu_fence_base(vgpu) (vgpu->fence.base)
 #define vgpu_fence_sz(vgpu) (vgpu->fence.size)
 
-struct intel_vgpu_creation_params {
-	__u64 handle;
-	__u64 low_gm_sz;  /* in MB */
-	__u64 high_gm_sz; /* in MB */
-	__u64 fence_sz;
-	__u64 resolution;
-	__s32 primary;
-	__u64 vgpu_id;
-
-	__u32 weight;
-};
-
-int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu,
-			      struct intel_vgpu_creation_params *param);
+int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu);
 void intel_vgpu_reset_resource(struct intel_vgpu *vgpu);
 void intel_vgpu_free_resource(struct intel_vgpu *vgpu);
+int intel_vgpu_alloc_resource_count(struct intel_vgpu *vgpu);
+void intel_vgpu_free_resource_count(struct intel_vgpu *vgpu);
+int intel_vgpu_adjust_resource_count(struct intel_vgpu *vgpu);
 void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
 	u32 fence, u64 value);
 
@@ -458,11 +464,13 @@ static inline void intel_vgpu_write_pci_bar(struct intel_vgpu *vgpu,
 
 int intel_gvt_init_vgpu_types(struct intel_gvt *gvt);
 void intel_gvt_clean_vgpu_types(struct intel_gvt *gvt);
+void intel_gvt_update_vgpu_types(struct intel_gvt *gvt);
 
 struct intel_vgpu *intel_gvt_create_idle_vgpu(struct intel_gvt *gvt);
 void intel_gvt_destroy_idle_vgpu(struct intel_vgpu *vgpu);
 struct intel_vgpu *intel_gvt_create_vgpu(struct intel_gvt *gvt,
 					 struct intel_vgpu_type *type);
+int intel_vgpu_delayed_alloc(struct intel_vgpu *vgpu);
 void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_release_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
@@ -523,6 +531,9 @@ static inline u64 intel_vgpu_get_bar_gpa(struct intel_vgpu *vgpu, int bar)
 			PCI_BASE_ADDRESS_MEM_MASK;
 }
 
+int intel_vgpu_res_alloc(struct intel_vgpu *vgpu);
+void intel_vgpu_res_free(struct intel_vgpu *vgpu);
+
 void intel_vgpu_clean_opregion(struct intel_vgpu *vgpu);
 int intel_vgpu_init_opregion(struct intel_vgpu *vgpu);
 int intel_vgpu_opregion_base_write_handler(struct intel_vgpu *vgpu, u32 gpa);
@@ -557,6 +568,9 @@ struct intel_gvt_ops {
 	int (*write_protect_handler)(struct intel_vgpu *, u64, void *,
 				     unsigned int);
 	void (*emulate_hotplug)(struct intel_vgpu *vgpu, bool connected);
+	int (*vgpu_delayed_alloc)(struct intel_vgpu *vgpu);
+	void (*vgpu_res_free)(struct intel_vgpu *vgpu);
+	int (*vgpu_res_change)(struct intel_vgpu *vgpu);
 };
 
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 074c4efb58eb..b1a4096c6c50 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -711,6 +711,7 @@ static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
 		gvt_err("failed to create intel vgpu: %d\n", ret);
 		goto out;
 	}
+	vgpu->type = type;
 
 	INIT_WORK(&kvmgt_vdev(vgpu)->release_work, intel_vgpu_release_work);
 
@@ -793,6 +794,8 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	unsigned long events;
 	int ret;
 
+	mutex_lock(&vgpu->vgpu_lock);
+
 	vdev->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
 	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
@@ -814,21 +817,32 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 		goto undo_iommu;
 	}
 
+	if (vgpu->type->aggregation && vgpu->param.aggregation) {
+		ret = intel_gvt_ops->vgpu_delayed_alloc(vgpu);
+		if (ret)
+			goto undo_group;
+	}
+
 	/* Take a module reference as mdev core doesn't take
 	 * a reference for vendor driver.
 	 */
 	if (!try_module_get(THIS_MODULE))
-		goto undo_group;
+		goto free_res;
 
 	ret = kvmgt_guest_init(mdev);
-	if (ret)
-		goto undo_group;
+	if (ret) {
+		module_put(THIS_MODULE);
+		goto free_res;
+	}
 
 	intel_gvt_ops->vgpu_activate(vgpu);
 
 	atomic_set(&vdev->released, 0);
-	return ret;
+	goto out;
 
+free_res:
+	if (vgpu->type->aggregation && vgpu->param.aggregation)
+		intel_gvt_ops->vgpu_res_free(vgpu);
 undo_group:
 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
 					&vdev->group_notifier);
@@ -837,6 +851,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
 					&vdev->iommu_notifier);
 out:
+	mutex_unlock(&vgpu->vgpu_lock);
 	return ret;
 }
 
@@ -1628,8 +1643,100 @@ static const struct attribute_group intel_vgpu_group = {
 	.attrs = intel_vgpu_attrs,
 };
 
+/*
+ * "max_aggregation" display maxium instances for aggregation,
+ * if type doesn't support aggregation, it displays 0
+ */
+static ssize_t
+max_aggregation_show(struct device *dev, struct device_attribute *attr,
+		     char *buf)
+{
+	struct mdev_device *mdev = mdev_from_dev(dev);
+
+	if (mdev) {
+		struct intel_vgpu *vgpu = (struct intel_vgpu *)
+			mdev_get_drvdata(mdev);
+		struct intel_vgpu_type *type = vgpu->type;
+		/* return left avail + current allocated as maxium */
+		unsigned int m = type->avail_instance +
+			vgpu->param.aggregation;
+		if (type->aggregation)
+			return sprintf(buf, "%u\n", m);
+	}
+	return sprintf(buf, "0\n");
+}
+static DEVICE_ATTR_RO(max_aggregation);
+
+static ssize_t
+aggregated_instances_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mdev_device *mdev = mdev_from_dev(dev);
+	unsigned long val;
+	ssize_t ret = -EINVAL;
+
+	if (kstrtoul(buf, 0, &val) < 0)
+		return ret;
+
+	if (val > 0 && mdev) {
+		struct intel_vgpu *vgpu = (struct intel_vgpu *)
+			mdev_get_drvdata(mdev);
+		struct intel_vgpu_type *type = vgpu->type;
+
+		if (val == vgpu->param.aggregation)
+			return count;
+
+		mutex_lock(&vgpu->vgpu_lock);
+		if (vgpu->active) {
+			mutex_unlock(&vgpu->vgpu_lock);
+			return ret;
+		}
+		/*
+		 * value should be less than maxium aggregation
+		 * instance number.
+		 */
+		if (type->aggregation &&
+		    val <= (vgpu->param.aggregation + type->avail_instance)) {
+			vgpu->param.aggregation = val;
+			intel_gvt_ops->vgpu_res_change(vgpu);
+			ret = count;
+		}
+		mutex_unlock(&vgpu->vgpu_lock);
+	}
+	return ret;
+}
+
+static ssize_t
+aggregated_instances_show(struct device *dev, struct device_attribute *attr,
+		 char *buf)
+{
+	struct mdev_device *mdev = mdev_from_dev(dev);
+
+	if (mdev) {
+		struct intel_vgpu *vgpu = (struct intel_vgpu *)
+			mdev_get_drvdata(mdev);
+		struct intel_vgpu_type *type = vgpu->type;
+		if (type->aggregation)
+			return sprintf(buf, "%u\n", vgpu->param.aggregation);
+	}
+	return sprintf(buf, "0\n");
+}
+static DEVICE_ATTR_RW(aggregated_instances);
+
+static struct attribute *mdev_attrs[] = {
+	&dev_attr_max_aggregation.attr,
+	&dev_attr_aggregated_instances.attr,
+	NULL
+};
+
+static const struct attribute_group mdev_group = {
+	.name = "mdev",
+	.attrs = mdev_attrs,
+};
+
 static const struct attribute_group *intel_vgpu_groups[] = {
 	&intel_vgpu_group,
+	&mdev_group,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 1d5ff88078bd..08a1b164e9a8 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -89,12 +89,13 @@ static struct {
 	unsigned int weight;
 	enum intel_vgpu_edid edid;
 	char *name;
+	bool aggregation;
 } vgpu_types[] = {
 /* Fixed vGPU type table */
-	{ MB_TO_BYTES(64), MB_TO_BYTES(384), 4, VGPU_WEIGHT(8), GVT_EDID_1024_768, "8" },
-	{ MB_TO_BYTES(128), MB_TO_BYTES(512), 4, VGPU_WEIGHT(4), GVT_EDID_1920_1200, "4" },
-	{ MB_TO_BYTES(256), MB_TO_BYTES(1024), 4, VGPU_WEIGHT(2), GVT_EDID_1920_1200, "2" },
-	{ MB_TO_BYTES(512), MB_TO_BYTES(2048), 4, VGPU_WEIGHT(1), GVT_EDID_1920_1200, "1" },
+	{ MB_TO_BYTES(64), MB_TO_BYTES(384), 4, VGPU_WEIGHT(8), GVT_EDID_1024_768, "8", true },
+	{ MB_TO_BYTES(128), MB_TO_BYTES(512), 4, VGPU_WEIGHT(4), GVT_EDID_1920_1200, "4", false },
+	{ MB_TO_BYTES(256), MB_TO_BYTES(1024), 4, VGPU_WEIGHT(2), GVT_EDID_1920_1200, "2", false },
+	{ MB_TO_BYTES(512), MB_TO_BYTES(2048), 4, VGPU_WEIGHT(1), GVT_EDID_1920_1200, "1", false },
 };
 
 /**
@@ -148,6 +149,7 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
 		gvt->types[i].resolution = vgpu_types[i].edid;
 		gvt->types[i].avail_instance = min(low_avail / vgpu_types[i].low_mm,
 						   high_avail / vgpu_types[i].high_mm);
+		gvt->types[i].aggregation = vgpu_types[i].aggregation;
 
 		if (IS_GEN(gvt->gt->i915, 8))
 			sprintf(gvt->types[i].name, "GVTg_V4_%s",
@@ -174,7 +176,7 @@ void intel_gvt_clean_vgpu_types(struct intel_gvt *gvt)
 	kfree(gvt->types);
 }
 
-static void intel_gvt_update_vgpu_types(struct intel_gvt *gvt)
+void intel_gvt_update_vgpu_types(struct intel_gvt *gvt)
 {
 	int i;
 	unsigned int low_gm_avail, high_gm_avail, fence_avail;
@@ -213,9 +215,7 @@ static void intel_gvt_update_vgpu_types(struct intel_gvt *gvt)
  */
 void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu)
 {
-	mutex_lock(&vgpu->vgpu_lock);
 	vgpu->active = true;
-	mutex_unlock(&vgpu->vgpu_lock);
 }
 
 /**
@@ -259,6 +259,8 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
 	mutex_lock(&vgpu->vgpu_lock);
 	intel_vgpu_clean_workloads(vgpu, ALL_ENGINES);
 	intel_vgpu_dmabuf_cleanup(vgpu);
+	if (vgpu->type->aggregation)
+		intel_vgpu_res_free(vgpu);
 	mutex_unlock(&vgpu->vgpu_lock);
 }
 
@@ -290,10 +292,13 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 	intel_vgpu_clean_submission(vgpu);
 	intel_vgpu_clean_display(vgpu);
 	intel_vgpu_clean_opregion(vgpu);
-	intel_vgpu_reset_ggtt(vgpu, true);
-	intel_vgpu_clean_gtt(vgpu);
+	if (vgpu->res_initialized) {
+		intel_vgpu_reset_ggtt(vgpu, true);
+		intel_vgpu_clean_gtt(vgpu);
+		intel_vgpu_free_resource(vgpu);
+	}
+	intel_vgpu_free_resource_count(vgpu);
 	intel_gvt_hypervisor_detach_vgpu(vgpu);
-	intel_vgpu_free_resource(vgpu);
 	intel_vgpu_clean_mmio(vgpu);
 	intel_vgpu_dmabuf_cleanup(vgpu);
 	mutex_unlock(&vgpu->vgpu_lock);
@@ -364,59 +369,85 @@ void intel_gvt_destroy_idle_vgpu(struct intel_vgpu *vgpu)
 	vfree(vgpu);
 }
 
-static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
-		struct intel_vgpu_creation_params *param)
+int intel_vgpu_res_alloc(struct intel_vgpu *vgpu)
 {
-	struct intel_vgpu *vgpu;
 	int ret;
 
-	gvt_dbg_core("handle %llu low %llu MB high %llu MB fence %llu\n",
-			param->handle, param->low_gm_sz, param->high_gm_sz,
-			param->fence_sz);
+	ret = intel_vgpu_alloc_resource(vgpu);
+	if (ret)
+		return ret;
 
-	vgpu = vzalloc(sizeof(*vgpu));
-	if (!vgpu)
-		return ERR_PTR(-ENOMEM);
+	populate_pvinfo_page(vgpu);
+
+	ret = intel_vgpu_init_gtt(vgpu);
+	if (ret) {
+		intel_vgpu_free_resource(vgpu);
+		return ret;
+	}
+	vgpu->res_initialized = true;
+	return 0;
+}
+
+void intel_vgpu_res_free(struct intel_vgpu *vgpu)
+{
+	intel_vgpu_reset_ggtt(vgpu, true);
+	intel_vgpu_clean_gtt(vgpu);
+	intel_vgpu_free_resource(vgpu);
+	vgpu->res_initialized = false;
+	mutex_lock(&vgpu->gvt->lock);
+	intel_gvt_update_vgpu_types(vgpu->gvt);
+	mutex_unlock(&vgpu->gvt->lock);
+}
+
+static int
+__intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
+			bool delay_res_alloc)
+{
+	struct intel_gvt *gvt = vgpu->gvt;
+	struct intel_vgpu_gtt *gtt = &vgpu->gtt;
+	int ret;
 
 	ret = idr_alloc(&gvt->vgpu_idr, vgpu, IDLE_VGPU_IDR + 1, GVT_MAX_VGPU,
-		GFP_KERNEL);
+			GFP_KERNEL);
 	if (ret < 0)
-		goto out_free_vgpu;
-
+		return ret;
 	vgpu->id = ret;
-	vgpu->handle = param->handle;
-	vgpu->gvt = gvt;
-	vgpu->sched_ctl.weight = param->weight;
+
 	mutex_init(&vgpu->vgpu_lock);
 	mutex_init(&vgpu->dmabuf_lock);
 	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
 	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
 	idr_init(&vgpu->object_idr);
-	intel_vgpu_init_cfg_space(vgpu, param->primary);
+	INIT_RADIX_TREE(&gtt->spt_tree, GFP_KERNEL);
+	INIT_LIST_HEAD(&gtt->ppgtt_mm_list_head);
+	INIT_LIST_HEAD(&gtt->oos_page_list_head);
+	INIT_LIST_HEAD(&gtt->post_shadow_list_head);
+
+	intel_vgpu_init_cfg_space(vgpu, vgpu->param.primary);
 
 	ret = intel_vgpu_init_mmio(vgpu);
 	if (ret)
 		goto out_clean_idr;
 
-	ret = intel_vgpu_alloc_resource(vgpu, param);
+	ret = intel_vgpu_alloc_resource_count(vgpu);
 	if (ret)
 		goto out_clean_vgpu_mmio;
 
-	populate_pvinfo_page(vgpu);
+	if (!delay_res_alloc) {
+		ret = intel_vgpu_res_alloc(vgpu);
+		if (ret)
+			goto out_clean_vgpu_mmio;
+	}
 
 	ret = intel_gvt_hypervisor_attach_vgpu(vgpu);
 	if (ret)
 		goto out_clean_vgpu_resource;
 
-	ret = intel_vgpu_init_gtt(vgpu);
-	if (ret)
-		goto out_detach_hypervisor_vgpu;
-
 	ret = intel_vgpu_init_opregion(vgpu);
 	if (ret)
-		goto out_clean_gtt;
+		goto out_detach_hypervisor_vgpu;
 
-	ret = intel_vgpu_init_display(vgpu, param->resolution);
+	ret = intel_vgpu_init_display(vgpu, vgpu->param.resolution);
 	if (ret)
 		goto out_clean_opregion;
 
@@ -438,7 +469,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	if (ret)
 		goto out_clean_sched_policy;
 
-	return vgpu;
+	return 0;
 
 out_clean_sched_policy:
 	intel_vgpu_clean_sched_policy(vgpu);
@@ -448,19 +479,17 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	intel_vgpu_clean_display(vgpu);
 out_clean_opregion:
 	intel_vgpu_clean_opregion(vgpu);
-out_clean_gtt:
-	intel_vgpu_clean_gtt(vgpu);
 out_detach_hypervisor_vgpu:
 	intel_gvt_hypervisor_detach_vgpu(vgpu);
 out_clean_vgpu_resource:
+	intel_vgpu_clean_gtt(vgpu);
 	intel_vgpu_free_resource(vgpu);
+	intel_gvt_update_vgpu_types(vgpu->gvt);
 out_clean_vgpu_mmio:
 	intel_vgpu_clean_mmio(vgpu);
 out_clean_idr:
 	idr_remove(&gvt->vgpu_idr, vgpu->id);
-out_free_vgpu:
-	vfree(vgpu);
-	return ERR_PTR(ret);
+	return ret;
 }
 
 /**
@@ -474,33 +503,64 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
  * pointer to intel_vgpu, error pointer if failed.
  */
 struct intel_vgpu *intel_gvt_create_vgpu(struct intel_gvt *gvt,
-				struct intel_vgpu_type *type)
+					 struct intel_vgpu_type *type)
 {
-	struct intel_vgpu_creation_params param;
 	struct intel_vgpu *vgpu;
+	struct intel_vgpu_creation_params *param;
+	int ret;
+
+	vgpu = vzalloc(sizeof(*vgpu));
+	if (!vgpu)
+		return ERR_PTR(-ENOMEM);
 
-	param.handle = 0;
-	param.primary = 1;
-	param.low_gm_sz = type->low_gm_size;
-	param.high_gm_sz = type->high_gm_size;
-	param.fence_sz = type->fence;
-	param.weight = type->weight;
-	param.resolution = type->resolution;
+	param = &vgpu->param;
+	param->handle = 0;
+	param->primary = 1;
+	param->low_gm_sz = type->low_gm_size;
+	param->high_gm_sz = type->high_gm_size;
+	param->fence_sz = type->fence;
+	param->weight = type->weight;
+	param->resolution = type->resolution;
 
-	/* XXX current param based on MB */
-	param.low_gm_sz = BYTES_TO_MB(param.low_gm_sz);
-	param.high_gm_sz = BYTES_TO_MB(param.high_gm_sz);
+	gvt_dbg_core("handle %llu low %llu MB high %llu MB fence %llu\n",
+		     param->handle, BYTES_TO_MB(param->low_gm_sz),
+		     BYTES_TO_MB(param->high_gm_sz),
+		     param->fence_sz);
+
+	vgpu->handle = param->handle;
+	vgpu->gvt = gvt;
+	vgpu->sched_ctl.weight = param->weight;
+	param->aggregation = 1;
 
 	mutex_lock(&gvt->lock);
-	vgpu = __intel_gvt_create_vgpu(gvt, &param);
-	if (!IS_ERR(vgpu))
-		/* calculate left instance change for types */
-		intel_gvt_update_vgpu_types(gvt);
+	ret = __intel_gvt_create_vgpu(vgpu, type->aggregation ? true : false);
+	if (ret) {
+		mutex_unlock(&gvt->lock);
+		vfree(vgpu);
+		return ERR_PTR(ret);
+	}
+	/* calculate left instance change for types */
+	intel_gvt_update_vgpu_types(vgpu->gvt);
 	mutex_unlock(&gvt->lock);
 
 	return vgpu;
 }
 
+int intel_vgpu_delayed_alloc(struct intel_vgpu *vgpu)
+{
+	int ret;
+
+	intel_vgpu_adjust_resource_count(vgpu);
+	ret = intel_vgpu_res_alloc(vgpu);
+	if (ret)
+		return -EINVAL;
+
+	mutex_lock(&vgpu->gvt->lock);
+	intel_gvt_update_vgpu_types(vgpu->gvt);
+	mutex_unlock(&vgpu->gvt->lock);
+	return 0;
+}
+
 /**
  * intel_gvt_reset_vgpu_locked - reset a virtual GPU by DMLR or GT reset
  * @vgpu: virtual GPU
-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
