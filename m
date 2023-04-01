Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA736D3195
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 16:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36310E299;
	Sat,  1 Apr 2023 14:44:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3CA10E24F;
 Sat,  1 Apr 2023 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680360282; x=1711896282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p64YHQtdhIkzhEK1tO8XIf7bxcuE3M+6sbnj/z7LnJY=;
 b=Moz9bcFjycKXRjviIikYL3tnXc/cGepdR0uSUzi/kGj+Dk4mn/DH4Dvl
 12muE6X627JfZSC3qtbhmWFh+qgFyP8zhleCrcA4YEsGTl2gPYmIQafnE
 cTnSSPVkX0T0y/CJBtbZ3FfAO2TatHtxVt36OYxAyQO1OZn447LxvvJRE
 RSJtgy/JGw55he1Sl/ppd6fxP1vBUVdOhdxQ/5PCcwrYrzCRxyfmBvuii
 XKcSbdZadNKKg6dTb7uWXT/30TJoHx2JLFPi4FTJwCzy9TsiTEp1Q79VO
 uGtcGE0aVTWsACJEld1dqvOK3yKmFFIvuLqytLfjjDDMnXr4mwNPWd6lh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340385190"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="340385190"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 07:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662705864"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="662705864"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 07:44:41 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Date: Sat,  1 Apr 2023 07:44:29 -0700
Message-Id: <20230401144429.88673-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401144429.88673-1-yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, yi.l.liu@intel.com, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

for the users that accept device fds passed from management stacks to be
able to figure out the host reset affected devices among the devices
opened by the user. This is needed as such users do not have BDF (bus,
devfn) knowledge about the devices it has opened, hence unable to use
the information reported by existing VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
to figure out the affected devices.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 58 ++++++++++++++++++++++++++++----
 include/uapi/linux/vfio.h        | 24 ++++++++++++-
 2 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 19f5b075d70a..a5a7e148dce1 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -30,6 +30,7 @@
 #if IS_ENABLED(CONFIG_EEH)
 #include <asm/eeh.h>
 #endif
+#include <uapi/linux/iommufd.h>
 
 #include "vfio_pci_priv.h"
 
@@ -767,6 +768,20 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
 	return 0;
 }
 
+static struct vfio_device *
+vfio_pci_find_device_in_devset(struct vfio_device_set *dev_set,
+			       struct pci_dev *pdev)
+{
+	struct vfio_device *cur;
+
+	lockdep_assert_held(&dev_set->lock);
+
+	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
+		if (cur->dev == &pdev->dev)
+			return cur;
+	return NULL;
+}
+
 static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
 {
 	(*(int *)data)++;
@@ -776,13 +791,20 @@ static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
 struct vfio_pci_fill_info {
 	int max;
 	int cur;
+	bool require_devid;
+	struct iommufd_ctx *iommufd;
+	struct vfio_device_set *dev_set;
 	struct vfio_pci_dependent_device *devices;
 };
 
 static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 {
 	struct vfio_pci_fill_info *fill = data;
+	struct vfio_device_set *dev_set = fill->dev_set;
 	struct iommu_group *iommu_group;
+	struct vfio_device *vdev;
+
+	lockdep_assert_held(&dev_set->lock);
 
 	if (fill->cur == fill->max)
 		return -EAGAIN; /* Something changed, try again */
@@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 	if (!iommu_group)
 		return -EPERM; /* Cannot reset non-isolated devices */
 
-	fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
+	if (fill->require_devid) {
+		/*
+		 * Report dev_id of the devices that are opened as cdev
+		 * and have the same iommufd with the fill->iommufd.
+		 * Otherwise, just fill IOMMUFD_INVALID_ID.
+		 */
+		vdev = vfio_pci_find_device_in_devset(dev_set, pdev);
+		if (vdev && vfio_device_cdev_opened(vdev) &&
+		    fill->iommufd == vfio_iommufd_physical_ictx(vdev))
+			vfio_iommufd_physical_devid(vdev, &fill->devices[fill->cur].dev_id);
+		else
+			fill->devices[fill->cur].dev_id = IOMMUFD_INVALID_ID;
+	} else {
+		fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
+	}
 	fill->devices[fill->cur].segment = pci_domain_nr(pdev->bus);
 	fill->devices[fill->cur].bus = pdev->bus->number;
 	fill->devices[fill->cur].devfn = pdev->devfn;
@@ -1230,17 +1266,27 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 		return -ENOMEM;
 
 	fill.devices = devices;
+	fill.dev_set = vdev->vdev.dev_set;
 
+	mutex_lock(&vdev->vdev.dev_set->lock);
+	if (vfio_device_cdev_opened(&vdev->vdev)) {
+		fill.require_devid = true;
+		fill.iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
+	}
 	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_fill_devs,
 					    &fill, slot);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
 
 	/*
 	 * If a device was removed between counting and filling, we may come up
 	 * short of fill.max.  If a device was added, we'll have a return of
 	 * -EAGAIN above.
 	 */
-	if (!ret)
+	if (!ret) {
 		hdr.count = fill.cur;
+		if (fill.require_devid)
+			hdr.flags = VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID;
+	}
 
 reset_info_exit:
 	if (copy_to_user(arg, &hdr, minsz))
@@ -2346,12 +2392,10 @@ static bool vfio_dev_in_files(struct vfio_pci_core_device *vdev,
 static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
 {
 	struct vfio_device_set *dev_set = data;
-	struct vfio_device *cur;
 
-	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
-		if (cur->dev == &pdev->dev)
-			return 0;
-	return -EBUSY;
+	lockdep_assert_held(&dev_set->lock);
+
+	return vfio_pci_find_device_in_devset(dev_set, pdev) ? 0 : -EBUSY;
 }
 
 /*
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 25432ef213ee..5a34364e3b94 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -650,11 +650,32 @@ enum {
  * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 12,
  *					      struct vfio_pci_hot_reset_info)
  *
+ * This command is used to query the affected devices in the hot reset for
+ * a given device.  User could use the information reported by this command
+ * to figure out the affected devices among the devices it has opened.
+ * This command always reports the segment, bus and devfn information for
+ * each affected device, and selectively report the group_id or the dev_id
+ * per the way how the device being queried is opened.
+ *	- If the device is opened via the traditional group/container manner,
+ *	  this command reports the group_id for each affected device.
+ *
+ *	- If the device is opened as a cdev, this command needs to report
+ *	  dev_id for each affected device and set the
+ *	  VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID flag.  For the affected
+ *	  devices that are not opened as cdev or bound to different iommufds
+ *	  with the device that is queried, report an invalid dev_id to avoid
+ *	  potential dev_id conflict as dev_id is local to iommufd.  For such
+ *	  affected devices, user shall fall back to use the segment, bus and
+ *	  devfn info to map it to opened device.
+ *
  * Return: 0 on success, -errno on failure:
  *	-enospc = insufficient buffer, -enodev = unsupported for device.
  */
 struct vfio_pci_dependent_device {
-	__u32	group_id;
+	union {
+		__u32   group_id;
+		__u32	dev_id;
+	};
 	__u16	segment;
 	__u8	bus;
 	__u8	devfn; /* Use PCI_SLOT/PCI_FUNC */
@@ -663,6 +684,7 @@ struct vfio_pci_dependent_device {
 struct vfio_pci_hot_reset_info {
 	__u32	argsz;
 	__u32	flags;
+#define VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID	(1 << 0)
 	__u32	count;
 	struct vfio_pci_dependent_device	devices[];
 };
-- 
2.34.1

