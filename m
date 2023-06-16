Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB157732B9F
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Jun 2023 11:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D0210E584;
	Fri, 16 Jun 2023 09:30:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EEA10E0B7;
 Fri, 16 Jun 2023 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686907845; x=1718443845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0RL1OEZ1lWh/4j/ulZ4PY7VgMYSzHRE6E2a3bhpSb+E=;
 b=FDz/ZWp0O36Bj0MTGXftlol8y4dv/x89WbUFbJfTE0PJ+9f4tC9n2ez2
 SxvJlWqkZm8v9IsxfGaIVxMDwuQ7EXQ9oet4c50/A5cGMALHIq1eDTQEW
 N6rMV1t5+TIYpMsZkK85jkJ3XFComq13/sTjgvdy+jSmcjdV297aBEfg7
 OGn97KAr7S8Pzc+4G4j0h1MOJLv4/lCFOoDheZwzFC42L8gSjfZlZA7Hn
 0PQURvM51OHgAnxAPeJ9bTsGH9Tk86igD2K8IHuD9JtqG+VcCcgO73YT0
 6CALZr4SH+QU6aPADXWfbmL1Kyt+U95+M87QRYcT0OZAWKGhEdeeFRXz1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387863434"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="387863434"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742601913"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="742601913"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 02:30:44 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 02/10] vfio/pci: Move the existing hot reset logic to be a
 helper
Date: Fri, 16 Jun 2023 02:30:34 -0700
Message-Id: <20230616093042.65094-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616093042.65094-1-yi.l.liu@intel.com>
References: <20230616093042.65094-1-yi.l.liu@intel.com>
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

This prepares to add another method for hot reset. The major hot reset logic
are moved to vfio_pci_ioctl_pci_hot_reset_groups().

No functional change is intended.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 55 +++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index f4153fd22a87..cc23c9d65826 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1258,29 +1258,16 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 	return ret;
 }
 
-static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
-					struct vfio_pci_hot_reset __user *arg)
+static int
+vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
+				    int array_count, bool slot,
+				    struct vfio_pci_hot_reset __user *arg)
 {
-	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
-	struct vfio_pci_hot_reset hdr;
 	int32_t *group_fds;
 	struct file **files;
 	struct vfio_pci_group_info info;
-	bool slot = false;
 	int file_idx, count = 0, ret = 0;
 
-	if (copy_from_user(&hdr, arg, minsz))
-		return -EFAULT;
-
-	if (hdr.argsz < minsz || hdr.flags)
-		return -EINVAL;
-
-	/* Can we do a slot or bus reset or neither? */
-	if (!pci_probe_reset_slot(vdev->pdev->slot))
-		slot = true;
-	else if (pci_probe_reset_bus(vdev->pdev->bus))
-		return -ENODEV;
-
 	/*
 	 * We can't let userspace give us an arbitrarily large buffer to copy,
 	 * so verify how many we think there could be.  Note groups can have
@@ -1292,11 +1279,11 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 		return ret;
 
 	/* Somewhere between 1 and count is OK */
-	if (!hdr.count || hdr.count > count)
+	if (!array_count || array_count > count)
 		return -EINVAL;
 
-	group_fds = kcalloc(hdr.count, sizeof(*group_fds), GFP_KERNEL);
-	files = kcalloc(hdr.count, sizeof(*files), GFP_KERNEL);
+	group_fds = kcalloc(array_count, sizeof(*group_fds), GFP_KERNEL);
+	files = kcalloc(array_count, sizeof(*files), GFP_KERNEL);
 	if (!group_fds || !files) {
 		kfree(group_fds);
 		kfree(files);
@@ -1304,7 +1291,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	}
 
 	if (copy_from_user(group_fds, arg->group_fds,
-			   hdr.count * sizeof(*group_fds))) {
+			   array_count * sizeof(*group_fds))) {
 		kfree(group_fds);
 		kfree(files);
 		return -EFAULT;
@@ -1314,7 +1301,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	 * Get the group file for each fd to ensure the group is held across
 	 * the reset
 	 */
-	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
+	for (file_idx = 0; file_idx < array_count; file_idx++) {
 		struct file *file = fget(group_fds[file_idx]);
 
 		if (!file) {
@@ -1338,7 +1325,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	if (ret)
 		goto hot_reset_release;
 
-	info.count = hdr.count;
+	info.count = array_count;
 	info.files = files;
 
 	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
@@ -1351,6 +1338,28 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
+static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
+					struct vfio_pci_hot_reset __user *arg)
+{
+	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
+	struct vfio_pci_hot_reset hdr;
+	bool slot = false;
+
+	if (copy_from_user(&hdr, arg, minsz))
+		return -EFAULT;
+
+	if (hdr.argsz < minsz || hdr.flags)
+		return -EINVAL;
+
+	/* Can we do a slot or bus reset or neither? */
+	if (!pci_probe_reset_slot(vdev->pdev->slot))
+		slot = true;
+	else if (pci_probe_reset_bus(vdev->pdev->bus))
+		return -ENODEV;
+
+	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, hdr.count, slot, arg);
+}
+
 static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
 				    struct vfio_device_ioeventfd __user *arg)
 {
-- 
2.34.1

