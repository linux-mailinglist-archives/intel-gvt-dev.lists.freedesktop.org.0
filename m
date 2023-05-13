Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA865701745
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 15:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0E10E0FE;
	Sat, 13 May 2023 13:29:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBFB10E0FE;
 Sat, 13 May 2023 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683984539; x=1715520539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8b+sMJ9CtsqavfRZw2uc4X1L8VxMQmoBLRSiSkpXBgo=;
 b=jLV1OPwLyN0mc68ldf9MCvaAzo6TmKsLLVfPJFzo/I4NpocnLOw+WwSt
 t/+UpSUba277fLtjDkHe4mXu1uvWpvFN0V3WMQhM5dNebAT44w2f8icwA
 BhLXCjtmmWG2KYue1c9QmVjMGMqfGE7jTgwu64gfhXmlrGzCWsCBivB3y
 j26Gebd+/SQuL1nwx0eLRWdXobCdVZR9GXHMb+3pYtf2dmrgoaZeeFgSB
 /ZYKM8TvXyHSMKloXeMs1ZrlnWKjyBolBf4fBYtGcglt1a4j056aIKtgx
 oyzp2mrQ4+iOXFalXlfl7wDImnwqSEQ3f1W6svRakkt179eFLwPTouJcr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354100851"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="354100851"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2023 06:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703459532"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; d="scan'208";a="703459532"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 06:28:58 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v11 21/23] vfio: Determine noiommu device in
 __vfio_register_dev()
Date: Sat, 13 May 2023 06:28:25 -0700
Message-Id: <20230513132827.39066-22-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513132827.39066-1-yi.l.liu@intel.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, yi.l.liu@intel.com,
 kvm@vger.kernel.org, lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org,
 nicolinc@nvidia.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is to make the cdev path and group path consistent for the noiommu
devices registration. If vfio_noiommu is disabled, such registration
should fail. However, this check is vfio_device_set_group() which is part
of the vfio_group code. If the vfio_group code is compiled out, noiommu
devices would be registered even vfio_noiommu is disabled.

This adds vfio_device_set_noiommu() which can fail and calls it in the
device registration. For now, it never fails as long as
vfio_device_set_group() is successful. But when the vfio_group code is
compiled out, vfio_device_set_noiommu() would fail the noiommu devices
when vfio_noiommu is disabled.

As noiommu devices is checked and there are multiple places which needs
to test noiommu devices, this also adds a flag to mark noiommu devices.
Hence the callers of vfio_device_is_noiommu() can be converted to test
vfio_device->noiommu.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/device_cdev.c |  4 ++--
 drivers/vfio/group.c       |  2 +-
 drivers/vfio/iommufd.c     | 10 +++++-----
 drivers/vfio/vfio.h        |  7 ++++---
 drivers/vfio/vfio_main.c   |  6 +++++-
 include/linux/vfio.h       |  1 +
 6 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 3f14edb80a93..6d7f50ee535d 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -111,7 +111,7 @@ long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
 	if (df->group)
 		return -EINVAL;
 
-	if (vfio_device_is_noiommu(device) && !capable(CAP_SYS_RAWIO))
+	if (device->noiommu && !capable(CAP_SYS_RAWIO))
 		return -EPERM;
 
 	ret = vfio_device_block_group(device);
@@ -157,7 +157,7 @@ long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
 	device->cdev_opened = true;
 	mutex_unlock(&device->dev_set->lock);
 
-	if (vfio_device_is_noiommu(device))
+	if (device->noiommu)
 		dev_warn(device->dev, "noiommu device is bound to iommufd by user "
 			 "(%s:%d)\n", current->comm, task_pid_nr(current));
 	return 0;
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 7aacbd9d08c9..bf4335bce892 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -192,7 +192,7 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 		vfio_device_group_get_kvm_safe(device);
 
 	df->iommufd = device->group->iommufd;
-	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
+	if (df->iommufd && device->noiommu && device->open_count == 0) {
 		ret = vfio_iommufd_compat_probe_noiommu(device,
 							df->iommufd);
 		if (ret)
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 799ea322a7d4..dfe706f1e952 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -71,7 +71,7 @@ int vfio_iommufd_bind(struct vfio_device_file *df)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev))
+	if (vdev->noiommu)
 		return vfio_iommufd_noiommu_bind(vdev, ictx, &df->devid);
 
 	return vdev->ops->bind_iommufd(vdev, ictx, &df->devid);
@@ -86,7 +86,7 @@ int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
 	lockdep_assert_held(&vdev->dev_set->lock);
 
 	/* compat noiommu does not need to do ioas attach */
-	if (vfio_device_is_noiommu(vdev))
+	if (vdev->noiommu)
 		return 0;
 
 	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
@@ -103,7 +103,7 @@ void vfio_iommufd_unbind(struct vfio_device_file *df)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev)) {
+	if (vdev->noiommu) {
 		vfio_iommufd_noiommu_unbind(vdev);
 		return;
 	}
@@ -116,7 +116,7 @@ int vfio_iommufd_attach(struct vfio_device *vdev, u32 *pt_id)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (vfio_device_is_noiommu(vdev))
+	if (vdev->noiommu)
 		return 0;
 
 	return vdev->ops->attach_ioas(vdev, pt_id);
@@ -126,7 +126,7 @@ void vfio_iommufd_detach(struct vfio_device *vdev)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
-	if (!vfio_device_is_noiommu(vdev))
+	if (!vdev->noiommu)
 		vdev->ops->detach_ioas(vdev);
 }
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 50553f67600f..c8579d63b2b9 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -106,10 +106,11 @@ bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
 
-static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
+static inline int vfio_device_set_noiommu(struct vfio_device *device)
 {
-	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
-	       vdev->group->type == VFIO_NO_IOMMU;
+	device->noiommu = IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
+			  device->group->type == VFIO_NO_IOMMU;
+	return 0;
 }
 
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 8c3f26b4929b..8979f320d620 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -289,8 +289,12 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (ret)
 		return ret;
 
+	ret = vfio_device_set_noiommu(device);
+	if (ret)
+		goto err_out;
+
 	ret = dev_set_name(&device->device, "%svfio%d",
-			   vfio_device_is_noiommu(device) ? "noiommu-" : "", device->index);
+			   device->noiommu ? "noiommu-" : "", device->index);
 	if (ret)
 		goto err_out;
 
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index cf9d082a623c..fa13889e763f 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -68,6 +68,7 @@ struct vfio_device {
 	bool iommufd_attached;
 #endif
 	bool cdev_opened:1;
+	bool noiommu:1;
 };
 
 /**
-- 
2.34.1

