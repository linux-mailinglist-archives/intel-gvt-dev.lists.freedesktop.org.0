Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304F6D3187
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 16:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5566D10E224;
	Sat,  1 Apr 2023 14:44:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9489F10E05B;
 Sat,  1 Apr 2023 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680360275; x=1711896275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BWa6T6hOjcr7bNpakDPjbbVXSouryNJ0Y/EIjnK17EQ=;
 b=SqhrCg64n7NY51/jFSqbGzD218fFdDgcQWI8gIG4qFxbcWxrOT0qFq3J
 zzdAlKejfxo8/ERs6+6iDAJ479CWHvejekFw0bYB7AjW/2hDJBqJAPfA8
 KSr4bBKM1viS5Uw+VlK0cTlf18eXVyo4LtBNGmSdF8m/SooGzqMZs1VQr
 vIld9Mt4JGIfIkvo84qPzeNSo7lt9aA/s07Ma9lvfthKIpk+p8YpsChuk
 zy0n7ho48kUrdRI1otTwmHksrDcas632CiIHjvaBmoZT8w6i7ukQ3Bx0B
 ibDRXtv2rnC5c2zdwr7e/7EZKGA+zB0VQPCQRPL6GxS9sIWBHJo5HIboI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340385116"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="340385116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 07:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662705833"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="662705833"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 07:44:34 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 05/12] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
Date: Sat,  1 Apr 2023 07:44:22 -0700
Message-Id: <20230401144429.88673-6-yi.l.liu@intel.com>
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

as an alternative method for ownership check when iommufd is used. In
this case all opened devices in the affected dev_set are verified to
be bound to a same valid iommufd value to allow reset. It's simpler
and faster as user does not need to pass a set of fds and kernel no
need to search the device within the given fds.

a device in noiommu mode doesn't have a valid iommufd, so this method
should not be used in a dev_set which contains multiple devices and one
of them is in noiommu. The only allowed noiommu scenario is that the
calling device is noiommu and it's in a singleton dev_set.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 42 +++++++++++++++++++++++++++-----
 include/uapi/linux/vfio.h        |  9 ++++++-
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 3696b8e58445..b68fcba67a4b 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -180,7 +180,8 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
 struct vfio_pci_group_info;
 static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups);
+				      struct vfio_pci_group_info *groups,
+				      struct iommufd_ctx *iommufd_ctx);
 
 /*
  * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
@@ -1277,7 +1278,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
 		return ret;
 
 	/* Somewhere between 1 and count is OK */
-	if (!hdr->count || hdr->count > count)
+	if (hdr->count > count)
 		return -EINVAL;
 
 	group_fds = kcalloc(hdr->count, sizeof(*group_fds), GFP_KERNEL);
@@ -1326,7 +1327,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
 	info.count = hdr->count;
 	info.files = files;
 
-	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
+	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info, NULL);
 
 hot_reset_release:
 	for (file_idx--; file_idx >= 0; file_idx--)
@@ -1341,6 +1342,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 {
 	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
 	struct vfio_pci_hot_reset hdr;
+	struct iommufd_ctx *iommufd;
 	bool slot = false;
 
 	if (copy_from_user(&hdr, arg, minsz))
@@ -1355,7 +1357,12 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	else if (pci_probe_reset_bus(vdev->pdev->bus))
 		return -ENODEV;
 
-	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
+	if (hdr.count)
+		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
+
+	iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
+
+	return vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, NULL, iommufd);
 }
 
 static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
@@ -2327,6 +2334,9 @@ static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
 {
 	unsigned int i;
 
+	if (!groups)
+		return false;
+
 	for (i = 0; i < groups->count; i++)
 		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
 			return true;
@@ -2402,13 +2412,25 @@ static int vfio_pci_dev_set_pm_runtime_get(struct vfio_device_set *dev_set)
 	return ret;
 }
 
+static bool vfio_dev_in_iommufd_ctx(struct vfio_pci_core_device *vdev,
+				    struct iommufd_ctx *iommufd_ctx)
+{
+	struct iommufd_ctx *iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
+
+	if (!iommufd)
+		return false;
+
+	return iommufd == iommufd_ctx;
+}
+
 /*
  * We need to get memory_lock for each device, but devices can share mmap_lock,
  * therefore we need to zap and hold the vma_lock for each device, and only then
  * get each memory_lock.
  */
 static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
-				      struct vfio_pci_group_info *groups)
+				      struct vfio_pci_group_info *groups,
+				      struct iommufd_ctx *iommufd_ctx)
 {
 	struct vfio_pci_core_device *cur_mem;
 	struct vfio_pci_core_device *cur_vma;
@@ -2448,9 +2470,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		 *
 		 * Otherwise all opened devices in the dev_set must be
 		 * contained by the set of groups provided by the user.
+		 *
+		 * If user provides a zero-length array, then all the
+		 * opened devices must be bound to a same iommufd_ctx.
+		 *
+		 * If all above checks are failed, reset is allowed only if
+		 * the calling device is in a singleton dev_set.
 		 */
 		if (cur_vma->vdev.open_count &&
-		    !vfio_dev_in_groups(cur_vma, groups)) {
+		    !vfio_dev_in_groups(cur_vma, groups) &&
+		    !vfio_dev_in_iommufd_ctx(cur_vma, iommufd_ctx) &&
+		    (dev_set->device_count > 1)) {
 			ret = -EINVAL;
 			goto err_undo;
 		}
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index f96e5689cffc..17aa5d09db41 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -679,7 +679,14 @@ struct vfio_pci_hot_reset_info {
  * the calling user must ensure all affected devices, if opened, are
  * owned by itself.
  *
- * The ownership is proved by an array of group fds.
+ * The ownership can be proved by:
+ *   - An array of group fds
+ *   - A zero-length array
+ *
+ * In the last case all affected devices which are opened by this user
+ * must have been bound to a same iommufd. If the calling device is in
+ * noiommu mode (no valid iommufd) then it can be reset only if the reset
+ * doesn't affect other devices.
  *
  * Return: 0 on success, -errno on failure.
  */
-- 
2.34.1

