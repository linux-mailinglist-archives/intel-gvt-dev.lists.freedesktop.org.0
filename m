Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263BC6C9FC9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9210E3C0;
	Mon, 27 Mar 2023 09:35:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6573110E3C0;
 Mon, 27 Mar 2023 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909711; x=1711445711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8gWbAJJlIuV/z8+WOO6T7u0CyD5t7kZGlKBcfpHfaUQ=;
 b=hbKHSdalqRF3snvsFYI1XnEHZLnlqKRIPvXDEU462SJ3ebrJ8LyZp9HC
 Be30glrdAzEbX2+YEmgopu5Sfrscul5UhiKBJjaD3b8jK4Tu9uYPrwmqm
 QgIIuH/a7bx1xVgNNx/pL/DXb1iWR70uQe+0R3/CoERaZec53OW0cFOi0
 sT2UCIeFrsFswvT8ssB6LSgxsuRVLNGzK2rUzMPNEqMhtV6O54ePCLFev
 xY3OOoHJ/5em+9L6V8+9Tq7ZShDua+wXCoyQBY00TDAKyIeoGpegMvHWd
 ZaOCP03uY8PBG4HI18JVmD4OyV+VMvATZBviCVpWXwp3dZrRMiT97GAjj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="319879608"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="319879608"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="633554687"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="633554687"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga003.jf.intel.com with ESMTP; 27 Mar 2023 02:35:10 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Date: Mon, 27 Mar 2023 02:34:58 -0700
Message-Id: <20230327093458.44939-11-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327093458.44939-1-yi.l.liu@intel.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
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

This is a preparation for vfio device cdev as cdev gives userspace the
capability to open device cdev fd and management stack (e.g. libvirt)
could pass the device fd to the actual user (e.g. QEMU). As a result,
the actual user has no idea about the device's bus:devfn information.
This is a problem when user uses VFIO_DEVICE_GET_PCI_HOT_RESET_INFO to
know the hot reset affected device scope as this ioctl returns bus:devfn
info. For the fd passing usage, the acutal user cannot map the bus:devfn
to the devices it has opened via the fd passed from management stack. So
a new ioctl is required.

This new ioctl reports the list of iommufd dev_id that is opened by the
user. If there is affected device that is not bound to vfio driver or
opened by another user, this command shall fail with -EPERM. For the
noiommu mode in the vfio device cdev path, this shall fail as no dev_id
would be generated, hence nothing to report.

This ioctl is useless to the users that open vfio group as such users
have no idea about the iommufd dev_id and it can use the existing
VFIO_DEVICE_GET_PCI_HOT_RESET_INFO. The user that uses the traditional
mode vfio group/container would be failed if invoking this ioctl. But
the user that uses the iommufd compat mode vfio group/container shall
succeed. This is harmless as long as user cannot make use of it and
should use VFIO_DEVICE_GET_PCI_HOT_RESET_INFO.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 98 ++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h        | 47 +++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 19f5b075d70a..45edf4e9b98b 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1181,6 +1181,102 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
+static struct pci_dev *
+vfio_pci_dev_set_resettable(struct vfio_device_set *dev_set);
+
+static int vfio_pci_ioctl_get_pci_hot_reset_group_info(
+	struct vfio_pci_core_device *vdev,
+	struct vfio_pci_hot_reset_group_info __user *arg)
+{
+	unsigned long minsz =
+		offsetofend(struct vfio_pci_hot_reset_group_info, count);
+	struct vfio_pci_hot_reset_group_info hdr;
+	struct iommufd_ctx *iommufd, *cur_iommufd;
+	u32 count = 0, index = 0, *devices = NULL;
+	struct vfio_pci_core_device *cur;
+	bool slot = false;
+	int ret = 0;
+
+	if (copy_from_user(&hdr, arg, minsz))
+		return -EFAULT;
+
+	if (hdr.argsz < minsz)
+		return -EINVAL;
+
+	hdr.flags = 0;
+
+	/* Can we do a slot or bus reset or neither? */
+	if (!pci_probe_reset_slot(vdev->pdev->slot))
+		slot = true;
+	else if (pci_probe_reset_bus(vdev->pdev->bus))
+		return -ENODEV;
+
+	mutex_lock(&vdev->vdev.dev_set->lock);
+	if (!vfio_pci_dev_set_resettable(vdev->vdev.dev_set)) {
+		ret = -EPERM;
+		goto out_unlock;
+	}
+
+	iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
+	if (!iommufd) {
+		ret = -EPERM;
+		goto out_unlock;
+	}
+
+	/* How many devices are affected? */
+	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
+					    &count, slot);
+	if (ret)
+		goto out_unlock;
+
+	WARN_ON(!count); /* Should always be at least one */
+
+	/*
+	 * If there's enough space, fill it now, otherwise return -ENOSPC and
+	 * the number of devices affected.
+	 */
+	if (hdr.argsz < sizeof(hdr) + (count * sizeof(*devices))) {
+		ret = -ENOSPC;
+		hdr.count = count;
+		goto reset_info_exit;
+	}
+
+	devices = kcalloc(count, sizeof(*devices), GFP_KERNEL);
+	if (!devices) {
+		ret = -ENOMEM;
+		goto reset_info_exit;
+	}
+
+	list_for_each_entry(cur, &vdev->vdev.dev_set->device_list, vdev.dev_set_list) {
+		cur_iommufd = vfio_iommufd_physical_ictx(&cur->vdev);
+		if (cur->vdev.open_count) {
+			if (cur_iommufd != iommufd) {
+				ret = -EPERM;
+				break;
+			}
+			ret = vfio_iommufd_physical_devid(&cur->vdev, &devices[index]);
+			if (ret)
+				break;
+			index++;
+		}
+	}
+
+reset_info_exit:
+	if (copy_to_user(arg, &hdr, minsz))
+		ret = -EFAULT;
+
+	if (!ret) {
+		if (copy_to_user(&arg->devices, devices,
+				 hdr.count * sizeof(*devices)))
+			ret = -EFAULT;
+	}
+
+	kfree(devices);
+out_unlock:
+	mutex_unlock(&vdev->vdev.dev_set->lock);
+	return ret;
+}
+
 static int vfio_pci_ioctl_get_pci_hot_reset_info(
 	struct vfio_pci_core_device *vdev,
 	struct vfio_pci_hot_reset_info __user *arg)
@@ -1404,6 +1500,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		return vfio_pci_ioctl_get_irq_info(vdev, uarg);
 	case VFIO_DEVICE_GET_PCI_HOT_RESET_INFO:
 		return vfio_pci_ioctl_get_pci_hot_reset_info(vdev, uarg);
+	case VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO:
+		return vfio_pci_ioctl_get_pci_hot_reset_group_info(vdev, uarg);
 	case VFIO_DEVICE_GET_REGION_INFO:
 		return vfio_pci_ioctl_get_region_info(vdev, uarg);
 	case VFIO_DEVICE_IOEVENTFD:
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 25432ef213ee..61b801dfd40b 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -669,6 +669,53 @@ struct vfio_pci_hot_reset_info {
 
 #define VFIO_DEVICE_GET_PCI_HOT_RESET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
 
+/**
+ * VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 12,
+ *						    struct vfio_pci_hot_reset_group_info)
+ *
+ * This is used in the vfio device cdev mode.  It returns the list of
+ * affected devices (represented by iommufd dev_id) when hot reset is
+ * issued on the current device with which this ioctl is invoked.  It
+ * only includes the devices that are opened by the current user in the
+ * time of this command is invoked.  This list may change when user opens
+ * new device or close opened device, hence user should re-invoke it
+ * after open/close devices.  This command has no guarantee on the result
+ * of VFIO_DEVICE_PCI_HOT_RESET since the not-opened affected device can
+ * be by other users in the window between the two ioctls.  If the affected
+ * devices are opened by multiple users, the VFIO_DEVICE_PCI_HOT_RESET
+ * shall fail, detail can check the description of VFIO_DEVICE_PCI_HOT_RESET.
+ *
+ * For the users that open vfio group/container, this ioctl is useless as
+ * they have no idea about the iommufd dev_id returned by this ioctl.  For
+ * the users of the traditional mode vfio group/container, this ioctl will
+ * fail as this mode does not use iommufd hence no dev_id to report back.
+ * For the users of the iommufd compat mode vfio group/container, this ioctl
+ * would succeed as this mode uses iommufd as container fd.  But such users
+ * still have no idea about the iommufd dev_id as the dev_id is only stored
+ * in kernel in this mode.  For the users of the vfio group/container, the
+ * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO should be used to know the hot reset
+ * affected devices.
+ *
+ * Return: 0 on success, -errno on failure:
+ *	-enospc = insufficient buffer;
+ *	-enodev = unsupported for device;
+ *	-eperm = no permission for device, this error comes:
+ *		 - when there are affected devices that are opened but
+ *		   not bound to the same iommufd with the current device
+ *		   with which this ioctl is invoked,
+ *		 - there are affected devices that are not bound to vfio
+ *		   driver yet.
+ *		 - no valid iommufd is bound (e.g. noiommu mode)
+ */
+struct vfio_pci_hot_reset_group_info {
+	__u32	argsz;
+	__u32	flags;
+	__u32	count;
+	__u32	devices[];
+};
+
+#define VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO	_IO(VFIO_TYPE, VFIO_BASE + 18)
+
 /**
  * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
  *				    struct vfio_pci_hot_reset)
-- 
2.34.1

