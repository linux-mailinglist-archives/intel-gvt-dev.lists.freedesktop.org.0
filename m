Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9C7579CA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 12:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA0410E312;
	Tue, 18 Jul 2023 10:55:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABC910E318;
 Tue, 18 Jul 2023 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689677750; x=1721213750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8JOUsKGObo09iLtnZdrQCaUrUBlHZzD6b6Hk1GdqAec=;
 b=Ppg3QiHkGyrIOmKJ0tHhl51PpDaiUOkbwpetTqGqUfig/RS3bPQjv9p5
 F1qAB5MicGDdoVUDIbdnbG+w+7PGX6rz3fU54E8F6SG489wTcXebItDcU
 hZnfTuxz04ZiAHBbdDJOUm75JfpYMheplTO6oi1EfI7HZ4qNEbHwdSXqK
 i/v0kBMHlczPO6tSaaXWJyzuR+Kd8ULOUW5AOKeB1zi6m8GBKrNGtO3i3
 aUcjRT6mwkF4aTdz2hWAlV39MWLhnw3JnZwzyQJEZwp9wQR3HzMRBSL6K
 2xnObhgQTgGSEFJaklwh+pj3QRTEYYDm0yooxhdXYdP2ouPccCLjGk+B+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452553613"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452553613"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 03:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673863820"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="673863820"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga003.jf.intel.com with ESMTP; 18 Jul 2023 03:55:49 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v10 09/10] vfio/pci: Copy hot-reset device info to userspace
 in the devices loop
Date: Tue, 18 Jul 2023 03:55:41 -0700
Message-Id: <20230718105542.4138-10-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718105542.4138-1-yi.l.liu@intel.com>
References: <20230718105542.4138-1-yi.l.liu@intel.com>
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

This copies the vfio_pci_dependent_device to userspace during looping each
affected device for reporting vfio_pci_hot_reset_info. This avoids counting
the affected devices and allocating a potential large buffer to store the
vfio_pci_dependent_device of all the affected devices before copying them
to userspace.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 93 ++++++++++++--------------------
 1 file changed, 33 insertions(+), 60 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 32506c5539b9..f4a0ea01559e 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -777,19 +777,25 @@ static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
 }
 
 struct vfio_pci_fill_info {
-	int max;
-	int cur;
-	struct vfio_pci_dependent_device *devices;
+	struct vfio_pci_dependent_device __user *devices;
+	struct vfio_pci_dependent_device __user *devices_end;
 	struct vfio_device *vdev;
+	u32 count;
 	u32 flags;
 };
 
 static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 {
+	struct vfio_pci_dependent_device info = {
+		.segment = pci_domain_nr(pdev->bus),
+		.bus = pdev->bus->number,
+		.devfn = pdev->devfn,
+	};
 	struct vfio_pci_fill_info *fill = data;
 
-	if (fill->cur == fill->max)
-		return -EAGAIN; /* Something changed, try again */
+	fill->count++;
+	if (fill->devices >= fill->devices_end)
+		return 0;
 
 	if (fill->flags & VFIO_PCI_HOT_RESET_FLAG_DEV_ID) {
 		struct iommufd_ctx *iommufd = vfio_iommufd_device_ictx(fill->vdev);
@@ -802,19 +808,19 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 		 */
 		vdev = vfio_find_device_in_devset(dev_set, &pdev->dev);
 		if (!vdev) {
-			fill->devices[fill->cur].devid = VFIO_PCI_DEVID_NOT_OWNED;
+			info.devid = VFIO_PCI_DEVID_NOT_OWNED;
 		} else {
 			int id = vfio_iommufd_get_dev_id(vdev, iommufd);
 
 			if (id > 0)
-				fill->devices[fill->cur].devid = id;
+				info.devid = id;
 			else if (id == -ENOENT)
-				fill->devices[fill->cur].devid = VFIO_PCI_DEVID_OWNED;
+				info.devid = VFIO_PCI_DEVID_OWNED;
 			else
-				fill->devices[fill->cur].devid = VFIO_PCI_DEVID_NOT_OWNED;
+				info.devid = VFIO_PCI_DEVID_NOT_OWNED;
 		}
 		/* If devid is VFIO_PCI_DEVID_NOT_OWNED, clear owned flag. */
-		if (fill->devices[fill->cur].devid == VFIO_PCI_DEVID_NOT_OWNED)
+		if (info.devid == VFIO_PCI_DEVID_NOT_OWNED)
 			fill->flags &= ~VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED;
 	} else {
 		struct iommu_group *iommu_group;
@@ -823,13 +829,13 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 		if (!iommu_group)
 			return -EPERM; /* Cannot reset non-isolated devices */
 
-		fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
+		info.group_id = iommu_group_id(iommu_group);
 		iommu_group_put(iommu_group);
 	}
-	fill->devices[fill->cur].segment = pci_domain_nr(pdev->bus);
-	fill->devices[fill->cur].bus = pdev->bus->number;
-	fill->devices[fill->cur].devfn = pdev->devfn;
-	fill->cur++;
+
+	if (copy_to_user(fill->devices, &info, sizeof(info)))
+		return -EFAULT;
+	fill->devices++;
 	return 0;
 }
 
@@ -1259,8 +1265,7 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 	unsigned long minsz =
 		offsetofend(struct vfio_pci_hot_reset_info, count);
 	struct vfio_pci_hot_reset_info hdr;
-	struct vfio_pci_fill_info fill = { 0 };
-	struct vfio_pci_dependent_device *devices = NULL;
+	struct vfio_pci_fill_info fill = {};
 	bool slot = false;
 	int ret = 0;
 
@@ -1278,29 +1283,9 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 	else if (pci_probe_reset_bus(vdev->pdev->bus))
 		return -ENODEV;
 
-	/* How many devices are affected? */
-	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
-					    &fill.max, slot);
-	if (ret)
-		return ret;
-
-	WARN_ON(!fill.max); /* Should always be at least one */
-
-	/*
-	 * If there's enough space, fill it now, otherwise return -ENOSPC and
-	 * the number of devices affected.
-	 */
-	if (hdr.argsz < sizeof(hdr) + (fill.max * sizeof(*devices))) {
-		ret = -ENOSPC;
-		hdr.count = fill.max;
-		goto reset_info_exit;
-	}
-
-	devices = kcalloc(fill.max, sizeof(*devices), GFP_KERNEL);
-	if (!devices)
-		return -ENOMEM;
-
-	fill.devices = devices;
+	fill.devices = arg->devices;
+	fill.devices_end = arg->devices +
+			   (hdr.argsz - sizeof(hdr)) / sizeof(arg->devices[0]);
 	fill.vdev = &vdev->vdev;
 
 	if (vfio_device_cdev_opened(&vdev->vdev))
@@ -1311,29 +1296,17 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_fill_devs,
 					    &fill, slot);
 	mutex_unlock(&vdev->vdev.dev_set->lock);
+	if (ret)
+		return ret;
 
-	/*
-	 * If a device was removed between counting and filling, we may come up
-	 * short of fill.max.  If a device was added, we'll have a return of
-	 * -EAGAIN above.
-	 */
-	if (!ret) {
-		hdr.count = fill.cur;
-		hdr.flags = fill.flags;
-	}
-
-reset_info_exit:
+	hdr.count = fill.count;
+	hdr.flags = fill.flags;
 	if (copy_to_user(arg, &hdr, minsz))
-		ret = -EFAULT;
-
-	if (!ret) {
-		if (copy_to_user(&arg->devices, devices,
-				 hdr.count * sizeof(*devices)))
-			ret = -EFAULT;
-	}
+		return -EFAULT;
 
-	kfree(devices);
-	return ret;
+	if (fill.count > fill.devices - arg->devices)
+		return -ENOSPC;
+	return 0;
 }
 
 static int
-- 
2.34.1

