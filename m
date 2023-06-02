Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D872016C
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095AD10E690;
	Fri,  2 Jun 2023 12:15:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D006D10E681;
 Fri,  2 Jun 2023 12:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708123; x=1717244123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTSoubudwEU5Y+ZHahwtCKIExL3xu+31JcKfuVsmfgE=;
 b=ImlQv6nqmJZATaPxJar9ptIVgzsUTQWvhoFSqP/kmnZy2QSKjGW+TKJR
 4mouPD8iDcI4xudE9DI0UutT5oqUwnfnQgMIH5QdoVq9NdJ+DorMJhkz4
 cRIAJfA6l4UTgr1nkUhBYIps7DimXkwsGnUpMSPSslQs4j9Yes+7iENdM
 3zdMbFiTr+l4a2xHeaB7Qbiixw4eW67MaYLyEG1KWBXxqHYPRnTAX1SIJ
 eNxBnf7gIr0VU1b/eeM6r4ap6Dk251D5/yVWLQ+Nx2M8YjO4M7ha75CBs
 qx2PRo0ynbvSkbs6QVusMegf2VQUVPIbDLMo9UDjgHCqVospM+V1QPpP/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335467530"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="335467530"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772876481"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="772876481"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 05:15:22 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v7 9/9] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
Date: Fri,  2 Jun 2023 05:15:15 -0700
Message-Id: <20230602121515.79374-10-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602121515.79374-1-yi.l.liu@intel.com>
References: <20230602121515.79374-1-yi.l.liu@intel.com>
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

This is the way user to invoke hot-reset for the devices opened by cdev
interface. User should check the flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED
in the output of VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl before doing
hot-reset for cdev devices.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 61 ++++++++++++++++++++++++++------
 include/uapi/linux/vfio.h        | 14 ++++++++
 2 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index a615a223cdef..b0eadafcbcf5 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -181,7 +181,8 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
 struct vfio_pci_group_info;
 static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups);
+				      struct vfio_pci_group_info *groups,
+				      struct iommufd_ctx *iommufd_ctx);
 
 /*
  * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
@@ -1308,8 +1309,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
 	if (ret)
 		return ret;
 
-	/* Somewhere between 1 and count is OK */
-	if (!array_count || array_count > count)
+	if (array_count > count)
 		return -EINVAL;
 
 	group_fds = kcalloc(array_count, sizeof(*group_fds), GFP_KERNEL);
@@ -1358,7 +1358,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
 	info.count = array_count;
 	info.files = files;
 
-	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
+	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info, NULL);
 
 hot_reset_release:
 	for (file_idx--; file_idx >= 0; file_idx--)
@@ -1381,13 +1381,21 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	if (hdr.argsz < minsz || hdr.flags)
 		return -EINVAL;
 
+	/* zero-length array is only for cdev opened devices */
+	if (!!hdr.count == vfio_device_cdev_opened(&vdev->vdev))
+		return -EINVAL;
+
 	/* Can we do a slot or bus reset or neither? */
 	if (!pci_probe_reset_slot(vdev->pdev->slot))
 		slot = true;
 	else if (pci_probe_reset_bus(vdev->pdev->bus))
 		return -ENODEV;
 
-	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, hdr.count, slot, arg);
+	if (hdr.count)
+		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, hdr.count, slot, arg);
+
+	return vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, NULL,
+					  vfio_iommufd_device_ictx(&vdev->vdev));
 }
 
 static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
@@ -2354,13 +2362,16 @@ const struct pci_error_handlers vfio_pci_core_err_handlers = {
 };
 EXPORT_SYMBOL_GPL(vfio_pci_core_err_handlers);
 
-static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
+static bool vfio_dev_in_groups(struct vfio_device *vdev,
 			       struct vfio_pci_group_info *groups)
 {
 	unsigned int i;
 
+	if (!groups)
+		return false;
+
 	for (i = 0; i < groups->count; i++)
-		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
+		if (vfio_file_has_dev(groups->files[i], vdev))
 			return true;
 	return false;
 }
@@ -2436,7 +2447,8 @@ static int vfio_pci_dev_set_pm_runtime_get(struct vfio_device_set *dev_set)
  * get each memory_lock.
  */
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups)
+				      struct vfio_pci_group_info *groups,
+				      struct iommufd_ctx *iommufd_ctx)
 {
 	struct vfio_pci_core_device *cur_mem;
 	struct vfio_pci_core_device *cur_vma;
@@ -2466,11 +2478,38 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		goto err_unlock;
 
 	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
+		bool owned;
+
 		/*
-		 * Test whether all the affected devices are contained by the
-		 * set of groups provided by the user.
+		 * Test whether all the affected devices can be reset by the
+		 * user.
+		 *
+		 * If called from a group opened device and the user provides
+		 * a set of groups, all the devices in the dev_set should be
+		 * contained by the set of groups provided by the user.
+		 *
+		 * If called from a cdev opened device and the user provides
+		 * a zero-length array, all the devices in the dev_set must
+		 * be bound to the same iommufd_ctx as the input iommufd_ctx.
+		 * If there is any device that has not been bound to any
+		 * iommufd_ctx yet, check if its iommu_group has any device
+		 * bound to the input iommufd_ctx.  Such devices can be
+		 * considered owned by the input iommufd_ctx as the device
+		 * cannot be owned by another iommufd_ctx when its iommu_group
+		 * is owned.
+		 *
+		 * Otherwise, reset is not allowed.
 		 */
-		if (!vfio_dev_in_groups(cur_vma, groups)) {
+		if (iommufd_ctx) {
+			int devid = vfio_iommufd_device_hot_reset_devid(&cur_vma->vdev,
+									iommufd_ctx);
+
+			owned = (devid != VFIO_PCI_DEVID_NOT_OWNED);
+		} else {
+			owned = vfio_dev_in_groups(&cur_vma->vdev, groups);
+		}
+
+		if (!owned) {
 			ret = -EINVAL;
 			goto err_undo;
 		}
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 70cc31e6b1ce..f753124e1c82 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -690,6 +690,9 @@ enum {
  *	  affected devices are represented in the dev_set and also owned by
  *	  the user.  This flag is available only when
  *	  flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID is set, otherwise reserved.
+ *	  When set, user could invoke VFIO_DEVICE_PCI_HOT_RESET with a zero
+ *	  length fd array on the calling device as the ownership is validated
+ *	  by iommufd_ctx.
  *
  * Return: 0 on success, -errno on failure:
  *	-enospc = insufficient buffer, -enodev = unsupported for device.
@@ -721,6 +724,17 @@ struct vfio_pci_hot_reset_info {
  * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
  *				    struct vfio_pci_hot_reset)
  *
+ * Userspace requests hot reset for the devices it operates.  Due to the
+ * underlying topology, multiple devices can be affected in the reset
+ * while some might be opened by another user.  To avoid interference
+ * the calling user must ensure all affected devices are owned by itself.
+ *
+ * As the ownership described by VFIO_DEVICE_GET_PCI_HOT_RESET_INFO, the
+ * cdev opened devices must exclusively provide a zero-length fd array and
+ * the group opened devices must exclusively use an array of group fds for
+ * proof of ownership.  Mixed access to devices between cdev and legacy
+ * groups are not supported by this interface.
+ *
  * Return: 0 on success, -errno on failure.
  */
 struct vfio_pci_hot_reset {
-- 
2.34.1

