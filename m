Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333974E41D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jul 2023 04:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A6F10E2BA;
	Tue, 11 Jul 2023 02:31:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E0210E2BE;
 Tue, 11 Jul 2023 02:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689042708; x=1720578708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DcZLQRs6bkyXhGJtTrFo9Gb/5IYRw2KErfwV9wNLtjw=;
 b=VnL2GssOldVdi2+MRjRgUERBCK1AtOtGHK4j7RSQHK+jEfOmA7T7bxgp
 JrAACw0bd0uNXhK3644yaKePMNLZS4k47Q1gWOe4/8j2n5+6eQU4FNm05
 qdxSt54/jiY1ALLJIYV4qTqWso7wVAgdhwvdbv+An26i0Z7KUUz67yJoR
 WgT9aJabpJ1KWfzrHgQ6s9rJ9ZJTCluCGOy+fhgmG5XdvKBT5Z6VOrVgH
 Bhx2Di+oMa2KSaF8ObGJNNdNoTTKCt2IQM3NyjueJIhHnJanzxdV9PNJM
 Qd0PlLyslrhgbgLbSpYUhR/xcPGOcwpnyfB8qdAnbXi+kb8FUMEcbBrap A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368004654"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="368004654"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720907551"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="720907551"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 19:31:28 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 02/10] vfio/pci: Move the existing hot reset logic to be a
 helper
Date: Mon, 10 Jul 2023 19:31:18 -0700
Message-Id: <20230711023126.5531-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711023126.5531-1-yi.l.liu@intel.com>
References: <20230711023126.5531-1-yi.l.liu@intel.com>
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
index 4e228e2a6d99..3d595ad2ed0a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1296,29 +1296,16 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
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
@@ -1330,11 +1317,11 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
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
@@ -1342,7 +1329,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	}
 
 	if (copy_from_user(group_fds, arg->group_fds,
-			   hdr.count * sizeof(*group_fds))) {
+			   array_count * sizeof(*group_fds))) {
 		kfree(group_fds);
 		kfree(files);
 		return -EFAULT;
@@ -1352,7 +1339,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	 * Get the group file for each fd to ensure the group is held across
 	 * the reset
 	 */
-	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
+	for (file_idx = 0; file_idx < array_count; file_idx++) {
 		struct file *file = fget(group_fds[file_idx]);
 
 		if (!file) {
@@ -1376,7 +1363,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	if (ret)
 		goto hot_reset_release;
 
-	info.count = hdr.count;
+	info.count = array_count;
 	info.files = files;
 
 	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
@@ -1389,6 +1376,28 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
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

