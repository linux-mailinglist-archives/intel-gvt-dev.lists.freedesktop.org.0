Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22C4427CB
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B978B6FADB;
	Tue,  2 Nov 2021 07:08:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C026FAD9;
 Tue,  2 Nov 2021 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=R+MnX7P4JhMdHkwO5mYjqQ5bG2WzAWktBLWwF8eOUo8=; b=GOPHHIabQhKLdLzYV86wwABvBK
 ffM/OeMcHVx9NxEt7VCSyLzudROrlF+t1v0bFEyrgk3c6PQwMQY+0az8O9w9DMyKa8F+5h1RQSU9Z
 W+Ps4b7deikL39ZySpbJxA7WhxgbGJrJVvL4F6XNu3wk7VC5ytKMYHwOZ0eTuK94hr41KIc7h2bz5
 4AjJshLSflPbD3ExbZTtqEAsHwhLGDJGBT/vf/4zh30lmN/6wPBDGa/z4xQ9NFypMZv1E8Ky7kwxO
 kR2xK8Uaw6TYixQolAQDDoTwSJZS1Cct1Jy/5qY/FoT3gIdKeDGaAc2LJ10L9uhcVKySwZMA0XJax
 cTxhljTg==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnuY-000iWD-Rp; Tue, 02 Nov 2021 07:08:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 28/29] drm/i915/gvt: convert to use vfio_register_group_dev()
Date: Tue,  2 Nov 2021 08:06:00 +0100
Message-Id: <20211102070601.155501-29-hch@lst.de>
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

This is straightforward conversion, the intel_vgpu already has a pointer
to the vfio_dev, which can be replaced with the embedded structure and
we can replace all the mdev_get_drvdata() with a simple container_of().

Based on an patch from Jason Gunthorpe.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h   |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c | 190 ++++++++++++++++---------------
 2 files changed, 102 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index fa83365227514..d55c956296930 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -210,7 +210,7 @@ struct intel_vgpu {
 
 	u32 scan_nonprivbb;
 
-	struct mdev_device *mdev;
+	struct vfio_device vfio_device;
 	struct vfio_region *region;
 	int num_regions;
 	struct eventfd_ctx *intx_trigger;
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 46ab66ebbc9aa..e504e8825c545 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -97,6 +97,9 @@ struct gvt_dma {
 	struct kref ref;
 };
 
+#define vfio_dev_to_vgpu(vfio_dev) \
+	container_of((vfio_dev), struct intel_vgpu, vfio_device)
+
 static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
 		const u8 *val, int len,
 		struct kvm_page_track_notifier_node *node);
@@ -705,44 +708,6 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num)
 	return ret;
 }
 
-static int intel_vgpu_create(struct mdev_device *mdev)
-{
-	struct device *pdev = mdev_parent_dev(mdev);
-	struct intel_gvt *gvt = kdev_to_i915(pdev)->gvt;
-	struct intel_vgpu_type *type;
-	struct intel_vgpu *vgpu;
-
-	type = &gvt->types[mdev_get_type_group_id(mdev)];
-	if (!type)
-		return -EINVAL;
-
-	vgpu = intel_gvt_create_vgpu(gvt, type);
-	if (IS_ERR(vgpu)) {
-		gvt_err("failed to create intel vgpu: %ld\n", PTR_ERR(vgpu));
-		return PTR_ERR(vgpu);
-	}
-
-	INIT_WORK(&vgpu->release_work, intel_vgpu_release_work);
-
-	vgpu->mdev = mdev;
-	mdev_set_drvdata(mdev, vgpu);
-
-	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
-		     dev_name(mdev_dev(mdev)));
-	return 0;
-}
-
-static int intel_vgpu_remove(struct mdev_device *mdev)
-{
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-
-	if (vgpu->attached)
-		return -EBUSY;
-
-	intel_gvt_destroy_vgpu(vgpu);
-	return 0;
-}
-
 static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
@@ -811,9 +776,9 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
 	return ret;
 }
 
-static int intel_vgpu_open_device(struct mdev_device *mdev)
+static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	unsigned long events;
 	int ret;
 	struct vfio_group *vfio_group;
@@ -822,7 +787,7 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	vgpu->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY, &events,
+	ret = vfio_register_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY, &events,
 				&vgpu->iommu_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
@@ -831,7 +796,7 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	}
 
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
-	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
+	ret = vfio_register_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY, &events,
 				&vgpu->group_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
@@ -839,7 +804,8 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 		goto undo_iommu;
 	}
 
-	vfio_group = vfio_group_get_external_user_from_dev(mdev_dev(mdev));
+	vfio_group =
+		vfio_group_get_external_user_from_dev(vgpu->vfio_device.dev);
 	if (IS_ERR_OR_NULL(vfio_group)) {
 		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
 		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
@@ -847,14 +813,6 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	}
 	vgpu->vfio_group = vfio_group;
 
-	/* Take a module reference as mdev core doesn't take
-	 * a reference for vendor driver.
-	 */
-	if (!try_module_get(THIS_MODULE)) {
-		ret = -ENODEV;
-		goto undo_group;
-	}
-
 	ret = -EEXIST;
 	if (vgpu->attached)
 		goto undo_group;
@@ -892,11 +850,11 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	vgpu->vfio_group = NULL;
 
 undo_register:
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
+	vfio_unregister_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY,
 					&vgpu->group_notifier);
 
 undo_iommu:
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
+	vfio_unregister_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY,
 					&vgpu->iommu_notifier);
 out:
 	return ret;
@@ -926,19 +884,16 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	intel_gvt_release_vgpu(vgpu);
 
-	ret = vfio_unregister_notifier(mdev_dev(vgpu->mdev), VFIO_IOMMU_NOTIFY,
+	ret = vfio_unregister_notifier(vgpu->vfio_device.dev, VFIO_IOMMU_NOTIFY,
 					&vgpu->iommu_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
-	ret = vfio_unregister_notifier(mdev_dev(vgpu->mdev), VFIO_GROUP_NOTIFY,
+	ret = vfio_unregister_notifier(vgpu->vfio_device.dev, VFIO_GROUP_NOTIFY,
 					&vgpu->group_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for group failed: %d\n", ret);
 
-	/* dereference module reference taken at open */
-	module_put(THIS_MODULE);
-
 	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
 
 	kvm_page_track_unregister_notifier(vgpu->kvm, &vgpu->track_node);
@@ -953,11 +908,9 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	vgpu->attached = false;
 }
 
-static void intel_vgpu_close_device(struct mdev_device *mdev)
+static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-
-	__intel_vgpu_release(vgpu);
+	__intel_vgpu_release(vfio_dev_to_vgpu(vfio_dev));
 }
 
 static void intel_vgpu_release_work(struct work_struct *work)
@@ -1109,10 +1062,10 @@ static bool gtt_entry(struct intel_vgpu *vgpu, loff_t *ppos)
 			true : false;
 }
 
-static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
+static ssize_t intel_vgpu_read(struct vfio_device *vfio_dev, char __user *buf,
 			size_t count, loff_t *ppos)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	unsigned int done = 0;
 	int ret;
 
@@ -1183,11 +1136,11 @@ static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
 	return -EFAULT;
 }
 
-static ssize_t intel_vgpu_write(struct mdev_device *mdev,
+static ssize_t intel_vgpu_write(struct vfio_device *vfio_dev,
 				const char __user *buf,
 				size_t count, loff_t *ppos)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	unsigned int done = 0;
 	int ret;
 
@@ -1257,13 +1210,14 @@ static ssize_t intel_vgpu_write(struct mdev_device *mdev,
 	return -EFAULT;
 }
 
-static int intel_vgpu_mmap(struct mdev_device *mdev, struct vm_area_struct *vma)
+static int intel_vgpu_mmap(struct vfio_device *vfio_dev,
+		struct vm_area_struct *vma)
 {
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	unsigned int index;
 	u64 virtaddr;
 	unsigned long req_size, pgoff, req_start;
 	pgprot_t pg_prot;
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 
 	index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
 	if (index >= VFIO_PCI_ROM_REGION_INDEX)
@@ -1386,10 +1340,10 @@ static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
 	return func(vgpu, index, start, count, flags, data);
 }
 
-static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
+static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int cmd,
 			     unsigned long arg)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	unsigned long minsz;
 
 	gvt_dbg_core("vgpu%d ioctl, cmd: %d\n", vgpu->id, cmd);
@@ -1664,14 +1618,9 @@ static ssize_t
 vgpu_id_show(struct device *dev, struct device_attribute *attr,
 	     char *buf)
 {
-	struct mdev_device *mdev = mdev_from_dev(dev);
+	struct intel_vgpu *vgpu = dev_get_drvdata(dev);
 
-	if (mdev) {
-		struct intel_vgpu *vgpu = (struct intel_vgpu *)
-			mdev_get_drvdata(mdev);
-		return sprintf(buf, "%d\n", vgpu->id);
-	}
-	return sprintf(buf, "\n");
+	return sprintf(buf, "%d\n", vgpu->id);
 }
 
 static DEVICE_ATTR_RO(vgpu_id);
@@ -1691,19 +1640,72 @@ static const struct attribute_group *intel_vgpu_groups[] = {
 	NULL,
 };
 
-const struct mdev_parent_ops intel_vgpu_mdev_ops = {
-	.mdev_attr_groups       = intel_vgpu_groups,
-	.supported_type_groups	= gvt_vgpu_type_groups,
-	.create			= intel_vgpu_create,
-	.remove			= intel_vgpu_remove,
+static const struct vfio_device_ops intel_vgpu_dev_ops = {
+	.open_device	= intel_vgpu_open_device,
+	.close_device	= intel_vgpu_close_device,
+	.read		= intel_vgpu_read,
+	.write		= intel_vgpu_write,
+	.mmap		= intel_vgpu_mmap,
+	.ioctl		= intel_vgpu_ioctl,
+};
 
-	.open_device		= intel_vgpu_open_device,
-	.close_device		= intel_vgpu_close_device,
+static int intel_vgpu_probe(struct mdev_device *mdev)
+{
+	struct device *pdev = mdev_parent_dev(mdev);
+	struct intel_gvt *gvt = kdev_to_i915(pdev)->gvt;
+	struct intel_vgpu_type *type;
+	struct intel_vgpu *vgpu;
+	int ret;
+
+	type = &gvt->types[mdev_get_type_group_id(mdev)];
+	if (!type)
+		return -EINVAL;
+
+	vgpu = intel_gvt_create_vgpu(gvt, type);
+	if (IS_ERR(vgpu)) {
+		gvt_err("failed to create intel vgpu: %ld\n", PTR_ERR(vgpu));
+		return PTR_ERR(vgpu);
+	}
 
-	.read			= intel_vgpu_read,
-	.write			= intel_vgpu_write,
-	.mmap			= intel_vgpu_mmap,
-	.ioctl			= intel_vgpu_ioctl,
+	INIT_WORK(&vgpu->release_work, intel_vgpu_release_work);
+	vfio_init_group_dev(&vgpu->vfio_device, &mdev->dev,
+			    &intel_vgpu_dev_ops);
+
+	dev_set_drvdata(&mdev->dev, vgpu);
+	ret = vfio_register_group_dev(&vgpu->vfio_device);
+	if (ret) {
+		intel_gvt_destroy_vgpu(vgpu);
+		return ret;
+	}
+
+	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
+		     dev_name(mdev_dev(mdev)));
+	return 0;
+}
+
+static void intel_vgpu_remove(struct mdev_device *mdev)
+{
+	struct intel_vgpu *vgpu = dev_get_drvdata(&mdev->dev);
+
+	if (WARN_ON_ONCE(vgpu->attached))
+		return;
+	intel_gvt_destroy_vgpu(vgpu);
+}
+
+static struct mdev_driver intel_vgpu_mdev_driver = {
+	.driver = {
+		.name		= "intel_vgpu_mdev",
+		.owner		= THIS_MODULE,
+		.dev_groups	= intel_vgpu_groups,
+	},
+	.probe		= intel_vgpu_probe,
+	.remove		= intel_vgpu_remove,
+};
+
+const struct mdev_parent_ops intel_vgpu_mdev_ops = {
+	.owner			= THIS_MODULE,
+	.supported_type_groups	= gvt_vgpu_type_groups,
+	.device_driver		= &intel_vgpu_mdev_driver,
 };
 
 int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn)
@@ -1907,11 +1909,21 @@ void intel_gvt_dma_unmap_guest_page(struct intel_vgpu *vgpu,
 
 static int __init kvmgt_init(void)
 {
-	return intel_gvt_set_ops(&intel_gvt_vgpu_ops);
+	int ret;
+
+	ret = intel_gvt_set_ops(&intel_gvt_vgpu_ops);
+	if (ret)
+		return ret;
+
+	ret = mdev_register_driver(&intel_vgpu_mdev_driver);
+	if (ret)
+		intel_gvt_clear_ops(&intel_gvt_vgpu_ops);
+	return ret;
 }
 
 static void __exit kvmgt_exit(void)
 {
+	mdev_unregister_driver(&intel_vgpu_mdev_driver);
 	intel_gvt_clear_ops(&intel_gvt_vgpu_ops);
 }
 
-- 
2.30.2

