Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0A6D3175
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 16:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA9710E1BE;
	Sat,  1 Apr 2023 14:44:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56EC10E05B;
 Sat,  1 Apr 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680360273; x=1711896273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dgj5ZUV5FzyshZBmCtEuPGjWqH1I8a/k7CA8N5o/j5U=;
 b=A+5cd5eDt4b0fHbwT4TwW5+/jqwzdpx2U+nVR9bePJJSQzFFfYCysvAV
 YNgved0CnmWZiOMU4b2UaeuqXQEVkyzrVsdfPrwQ2+JfNdpvH7OhY4HKk
 i/R8TbmcmCb0AZEb5nVF9za2JZ4t8WluIDQOXCraODJDkfdzK5O6NiIxX
 TJFrioc92hkkw72Qn3P9GfsmeYzfpPLppZVj6WpCOs/7Q8GD+Fp7s97tv
 GdIMvCCvpbXC9WdE/zy6LuWxwqpldNkErH/uh1oLKKOVaS3M7jl8Cv6jr
 i37CUhFP2paY4EMw2juI7bwNqszJMD+qJWmfIWlJnne/Kqv/n2fjyM8JX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340385098"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="340385098"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 07:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662705821"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="662705821"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 07:44:33 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 03/12] vfio/pci: Move the existing hot reset logic to be a
 helper
Date: Sat,  1 Apr 2023 07:44:20 -0700
Message-Id: <20230401144429.88673-4-yi.l.liu@intel.com>
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

This prepares to add another method for hot reset. The major hot reset logic
are moved to vfio_pci_ioctl_pci_hot_reset_groups().

No functional change is intended.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 56 +++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 5d745c9abf05..3696b8e58445 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1255,29 +1255,17 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 	return ret;
 }
 
-static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
-					struct vfio_pci_hot_reset __user *arg)
+static int
+vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
+				    struct vfio_pci_hot_reset *hdr,
+				    bool slot,
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
@@ -1289,11 +1277,11 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 		return ret;
 
 	/* Somewhere between 1 and count is OK */
-	if (!hdr.count || hdr.count > count)
+	if (!hdr->count || hdr->count > count)
 		return -EINVAL;
 
-	group_fds = kcalloc(hdr.count, sizeof(*group_fds), GFP_KERNEL);
-	files = kcalloc(hdr.count, sizeof(*files), GFP_KERNEL);
+	group_fds = kcalloc(hdr->count, sizeof(*group_fds), GFP_KERNEL);
+	files = kcalloc(hdr->count, sizeof(*files), GFP_KERNEL);
 	if (!group_fds || !files) {
 		kfree(group_fds);
 		kfree(files);
@@ -1301,7 +1289,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	}
 
 	if (copy_from_user(group_fds, arg->group_fds,
-			   hdr.count * sizeof(*group_fds))) {
+			   hdr->count * sizeof(*group_fds))) {
 		kfree(group_fds);
 		kfree(files);
 		return -EFAULT;
@@ -1311,7 +1299,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	 * Get the group file for each fd to ensure the group held across
 	 * the reset
 	 */
-	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
+	for (file_idx = 0; file_idx < hdr->count; file_idx++) {
 		struct file *file = fget(group_fds[file_idx]);
 
 		if (!file) {
@@ -1335,7 +1323,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	if (ret)
 		goto hot_reset_release;
 
-	info.count = hdr.count;
+	info.count = hdr->count;
 	info.files = files;
 
 	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
@@ -1348,6 +1336,28 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
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
+	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
+}
+
 static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
 				    struct vfio_device_ioeventfd __user *arg)
 {
-- 
2.34.1

