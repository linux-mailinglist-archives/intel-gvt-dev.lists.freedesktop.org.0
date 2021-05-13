Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8A737F439
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 May 2021 10:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251106E072;
	Thu, 13 May 2021 08:36:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3867C6E072;
 Thu, 13 May 2021 08:36:57 +0000 (UTC)
IronPort-SDR: 5leI+BRYij4c38BmXGniLb0t2r00A9Z2TThOD3xk3GTZx/Gqgk+JDSjBCkgZr+HY1JShId6yu2
 1aLv9f/4eykw==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="263830342"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="263830342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 01:36:56 -0700
IronPort-SDR: 4AkIb13AFVqqIOse5yVPr45AN43qDwN8z/GpaxZ5tSc+cCBO/fL4imTnic77rZwq+QaU2VAENM
 vYhouXMXl6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="400831718"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2021 01:36:53 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Move mdev attribute groups into kvmgt module
Date: Thu, 13 May 2021 16:39:02 +0800
Message-Id: <20210513083902.2822350-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210511083332.1740601-2-zhenyuw@linux.intel.com>
References: <20210511083332.1740601-2-zhenyuw@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

As kvmgt module contains all handling for VFIO/mdev, leaving mdev attribute
groups in gvt module caused dependency issue. Although it was there for possible
other hypervisor usage, that turns out never to be true. So this moves all mdev
handling into kvmgt module completely to resolve dependency issue.

With this fix, no config workaround is required. So revert previous workaround
commits: adaeb718d46f ("vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV")
and 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV").

Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/Kconfig         |   1 -
 drivers/gpu/drm/i915/gvt/gvt.c       | 124 +--------------------------
 drivers/gpu/drm/i915/gvt/gvt.h       |   3 -
 drivers/gpu/drm/i915/gvt/hypercall.h |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 122 ++++++++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/mpt.h       |   4 +-
 6 files changed, 118 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 69f57ca9c68d..93f4d059fc89 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -102,7 +102,6 @@ config DRM_I915_GVT
 	bool "Enable Intel GVT-g graphics virtualization host support"
 	depends on DRM_I915
 	depends on 64BIT
-	depends on VFIO_MDEV=y || VFIO_MDEV=DRM_I915
 	default n
 	help
 	  Choose this option if you want to enable Intel GVT-g graphics
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index e7c2babcee8b..cbac409f6c8a 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -46,118 +46,6 @@ static const char * const supported_hypervisors[] = {
 	[INTEL_GVT_HYPERVISOR_KVM] = "KVM",
 };
 
-static struct intel_vgpu_type *
-intel_gvt_find_vgpu_type(struct intel_gvt *gvt, unsigned int type_group_id)
-{
-	if (WARN_ON(type_group_id >= gvt->num_types))
-		return NULL;
-	return &gvt->types[type_group_id];
-}
-
-static ssize_t available_instances_show(struct mdev_type *mtype,
-					struct mdev_type_attribute *attr,
-					char *buf)
-{
-	struct intel_vgpu_type *type;
-	unsigned int num = 0;
-	void *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
-
-	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(mtype));
-	if (!type)
-		num = 0;
-	else
-		num = type->avail_instance;
-
-	return sprintf(buf, "%u\n", num);
-}
-
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-
-static ssize_t description_show(struct mdev_type *mtype,
-				struct mdev_type_attribute *attr, char *buf)
-{
-	struct intel_vgpu_type *type;
-	void *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
-
-	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(mtype));
-	if (!type)
-		return 0;
-
-	return sprintf(buf, "low_gm_size: %dMB\nhigh_gm_size: %dMB\n"
-		       "fence: %d\nresolution: %s\n"
-		       "weight: %d\n",
-		       BYTES_TO_MB(type->low_gm_size),
-		       BYTES_TO_MB(type->high_gm_size),
-		       type->fence, vgpu_edid_str(type->resolution),
-		       type->weight);
-}
-
-static MDEV_TYPE_ATTR_RO(available_instances);
-static MDEV_TYPE_ATTR_RO(device_api);
-static MDEV_TYPE_ATTR_RO(description);
-
-static struct attribute *gvt_type_attrs[] = {
-	&mdev_type_attr_available_instances.attr,
-	&mdev_type_attr_device_api.attr,
-	&mdev_type_attr_description.attr,
-	NULL,
-};
-
-static struct attribute_group *gvt_vgpu_type_groups[] = {
-	[0 ... NR_MAX_INTEL_VGPU_TYPES - 1] = NULL,
-};
-
-static bool intel_get_gvt_attrs(struct attribute_group ***intel_vgpu_type_groups)
-{
-	*intel_vgpu_type_groups = gvt_vgpu_type_groups;
-	return true;
-}
-
-static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
-{
-	int i, j;
-	struct intel_vgpu_type *type;
-	struct attribute_group *group;
-
-	for (i = 0; i < gvt->num_types; i++) {
-		type = &gvt->types[i];
-
-		group = kzalloc(sizeof(struct attribute_group), GFP_KERNEL);
-		if (WARN_ON(!group))
-			goto unwind;
-
-		group->name = type->name;
-		group->attrs = gvt_type_attrs;
-		gvt_vgpu_type_groups[i] = group;
-	}
-
-	return 0;
-
-unwind:
-	for (j = 0; j < i; j++) {
-		group = gvt_vgpu_type_groups[j];
-		kfree(group);
-	}
-
-	return -ENOMEM;
-}
-
-static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
-{
-	int i;
-	struct attribute_group *group;
-
-	for (i = 0; i < gvt->num_types; i++) {
-		group = gvt_vgpu_type_groups[i];
-		gvt_vgpu_type_groups[i] = NULL;
-		kfree(group);
-	}
-}
-
 static const struct intel_gvt_ops intel_gvt_ops = {
 	.emulate_cfg_read = intel_vgpu_emulate_cfg_read,
 	.emulate_cfg_write = intel_vgpu_emulate_cfg_write,
@@ -169,8 +57,6 @@ static const struct intel_gvt_ops intel_gvt_ops = {
 	.vgpu_reset = intel_gvt_reset_vgpu,
 	.vgpu_activate = intel_gvt_activate_vgpu,
 	.vgpu_deactivate = intel_gvt_deactivate_vgpu,
-	.gvt_find_vgpu_type = intel_gvt_find_vgpu_type,
-	.get_gvt_attrs = intel_get_gvt_attrs,
 	.vgpu_query_plane = intel_vgpu_query_plane,
 	.vgpu_get_dmabuf = intel_vgpu_get_dmabuf,
 	.write_protect_handler = intel_vgpu_page_track_handler,
@@ -274,7 +160,6 @@ void intel_gvt_clean_device(struct drm_i915_private *i915)
 		return;
 
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
-	intel_gvt_cleanup_vgpu_type_groups(gvt);
 	intel_gvt_clean_vgpu_types(gvt);
 
 	intel_gvt_debugfs_clean(gvt);
@@ -363,12 +248,6 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	if (ret)
 		goto out_clean_thread;
 
-	ret = intel_gvt_init_vgpu_type_groups(gvt);
-	if (ret) {
-		gvt_err("failed to init vgpu type groups: %d\n", ret);
-		goto out_clean_types;
-	}
-
 	vgpu = intel_gvt_create_idle_vgpu(gvt);
 	if (IS_ERR(vgpu)) {
 		ret = PTR_ERR(vgpu);
@@ -454,7 +333,8 @@ EXPORT_SYMBOL_GPL(intel_gvt_register_hypervisor);
 void
 intel_gvt_unregister_hypervisor(void)
 {
-	intel_gvt_hypervisor_host_exit(intel_gvt_host.dev);
+	void *gvt = (void *)kdev_to_i915(intel_gvt_host.dev)->gvt;
+	intel_gvt_hypervisor_host_exit(intel_gvt_host.dev, gvt);
 	module_put(THIS_MODULE);
 }
 EXPORT_SYMBOL_GPL(intel_gvt_unregister_hypervisor);
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 88ab360fcb31..0c0615602343 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -574,9 +574,6 @@ struct intel_gvt_ops {
 	void (*vgpu_reset)(struct intel_vgpu *);
 	void (*vgpu_activate)(struct intel_vgpu *);
 	void (*vgpu_deactivate)(struct intel_vgpu *);
-	struct intel_vgpu_type *(*gvt_find_vgpu_type)(
-		struct intel_gvt *gvt, unsigned int type_group_id);
-	bool (*get_gvt_attrs)(struct attribute_group ***intel_vgpu_type_groups);
 	int (*vgpu_query_plane)(struct intel_vgpu *vgpu, void *);
 	int (*vgpu_get_dmabuf)(struct intel_vgpu *vgpu, unsigned int);
 	int (*write_protect_handler)(struct intel_vgpu *, u64, void *,
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index b79da5124f83..f33e3cbd0439 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -49,7 +49,7 @@ enum hypervisor_type {
 struct intel_gvt_mpt {
 	enum hypervisor_type type;
 	int (*host_init)(struct device *dev, void *gvt, const void *ops);
-	void (*host_exit)(struct device *dev);
+	void (*host_exit)(struct device *dev, void *gvt);
 	int (*attach_vgpu)(void *vgpu, unsigned long *handle);
 	void (*detach_vgpu)(void *vgpu);
 	int (*inject_msi)(unsigned long handle, u32 addr, u16 data);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 65ff43cfc0f7..48b4d4cf805d 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -144,6 +144,104 @@ static inline bool handle_valid(unsigned long handle)
 	return !!(handle & ~0xff);
 }
 
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
+{
+	struct intel_vgpu_type *type;
+	unsigned int num = 0;
+	struct intel_gvt *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
+
+	type = &gvt->types[mtype_get_type_group_id(mtype)];
+	if (!type)
+		num = 0;
+	else
+		num = type->avail_instance;
+
+	return sprintf(buf, "%u\n", num);
+}
+
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
+}
+
+static ssize_t description_show(struct mdev_type *mtype,
+				struct mdev_type_attribute *attr, char *buf)
+{
+	struct intel_vgpu_type *type;
+	struct intel_gvt *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
+
+	type = &gvt->types[mtype_get_type_group_id(mtype)];
+	if (!type)
+		return 0;
+
+	return sprintf(buf, "low_gm_size: %dMB\nhigh_gm_size: %dMB\n"
+		       "fence: %d\nresolution: %s\n"
+		       "weight: %d\n",
+		       BYTES_TO_MB(type->low_gm_size),
+		       BYTES_TO_MB(type->high_gm_size),
+		       type->fence, vgpu_edid_str(type->resolution),
+		       type->weight);
+}
+
+static MDEV_TYPE_ATTR_RO(available_instances);
+static MDEV_TYPE_ATTR_RO(device_api);
+static MDEV_TYPE_ATTR_RO(description);
+
+static struct attribute *gvt_type_attrs[] = {
+	&mdev_type_attr_available_instances.attr,
+	&mdev_type_attr_device_api.attr,
+	&mdev_type_attr_description.attr,
+	NULL,
+};
+
+static struct attribute_group *gvt_vgpu_type_groups[] = {
+	[0 ... NR_MAX_INTEL_VGPU_TYPES - 1] = NULL,
+};
+
+static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
+{
+	int i, j;
+	struct intel_vgpu_type *type;
+	struct attribute_group *group;
+
+	for (i = 0; i < gvt->num_types; i++) {
+		type = &gvt->types[i];
+
+		group = kzalloc(sizeof(struct attribute_group), GFP_KERNEL);
+		if (!group)
+			goto unwind;
+
+		group->name = type->name;
+		group->attrs = gvt_type_attrs;
+		gvt_vgpu_type_groups[i] = group;
+	}
+
+	return 0;
+
+unwind:
+	for (j = 0; j < i; j++) {
+		group = gvt_vgpu_type_groups[j];
+		kfree(group);
+	}
+
+	return -ENOMEM;
+}
+
+static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
+{
+	int i;
+	struct attribute_group *group;
+
+	for (i = 0; i < gvt->num_types; i++) {
+		group = gvt_vgpu_type_groups[i];
+		gvt_vgpu_type_groups[i] = NULL;
+		kfree(group);
+	}
+}
+
 static int kvmgt_guest_init(struct mdev_device *mdev);
 static void intel_vgpu_release_work(struct work_struct *work);
 static bool kvmgt_guest_exit(struct kvmgt_guest_info *info);
@@ -694,14 +792,13 @@ static int intel_vgpu_create(struct mdev_device *mdev)
 	struct intel_vgpu *vgpu = NULL;
 	struct intel_vgpu_type *type;
 	struct device *pdev;
-	void *gvt;
+	struct intel_gvt *gvt;
 	int ret;
 
 	pdev = mdev_parent_dev(mdev);
 	gvt = kdev_to_i915(pdev)->gvt;
 
-	type = intel_gvt_ops->gvt_find_vgpu_type(gvt,
-						 mdev_get_type_group_id(mdev));
+	type = &gvt->types[mdev_get_type_group_id(mdev)];
 	if (!type) {
 		ret = -EINVAL;
 		goto out;
@@ -1667,19 +1764,26 @@ static struct mdev_parent_ops intel_vgpu_ops = {
 
 static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
 {
-	struct attribute_group **kvm_vgpu_type_groups;
+	int ret;
+
+	ret = intel_gvt_init_vgpu_type_groups((struct intel_gvt *)gvt);
+	if (ret)
+		return ret;
 
 	intel_gvt_ops = ops;
-	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
-		return -EFAULT;
-	intel_vgpu_ops.supported_type_groups = kvm_vgpu_type_groups;
+	intel_vgpu_ops.supported_type_groups = gvt_vgpu_type_groups;
 
-	return mdev_register_device(dev, &intel_vgpu_ops);
+	ret = mdev_register_device(dev, &intel_vgpu_ops);
+	if (ret)
+		intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
+
+	return ret;
 }
 
-static void kvmgt_host_exit(struct device *dev)
+static void kvmgt_host_exit(struct device *dev, void *gvt)
 {
 	mdev_unregister_device(dev);
+	intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
 }
 
 static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 550a456e936f..e6c5a792a49a 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -63,13 +63,13 @@ static inline int intel_gvt_hypervisor_host_init(struct device *dev,
 /**
  * intel_gvt_hypervisor_host_exit - exit GVT-g host side
  */
-static inline void intel_gvt_hypervisor_host_exit(struct device *dev)
+static inline void intel_gvt_hypervisor_host_exit(struct device *dev, void *gvt)
 {
 	/* optional to provide */
 	if (!intel_gvt_host.mpt->host_exit)
 		return;
 
-	intel_gvt_host.mpt->host_exit(dev);
+	intel_gvt_host.mpt->host_exit(dev, gvt);
 }
 
 /**
-- 
2.31.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
