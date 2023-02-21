Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521069D98F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Feb 2023 04:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F9910E13F;
	Tue, 21 Feb 2023 03:48:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61B410E147;
 Tue, 21 Feb 2023 03:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676951301; x=1708487301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BE9VA56JN7+YLYAFW4iTmCHAvkbGjlHc5frclqlJWvw=;
 b=Te3mG3Obz70mqs4V3XLiZk7PmAWWyG6iX2qNKL7ZTU2NhM3vP1BJtVUz
 LLNSafSd4IIieo9ZJvpm4l4AWxtHSJ8wYB5C/E/86vlEXiUvcAQO5YcbI
 6m/+wmgd1KIyvMPqEEeq7kv2syuLZ6W2skMgKHGhxBo9DsKTBe/gAlso/
 PsibzIBm/gGG3lop1e1EAwZ+D372B8yA2612AmLbZ5xoSX/NObxUsbkfE
 FRjygCu7V5TAatmo0GQ7Y+g6Vd359u9xJoS4gBdO4YhIBVJS6Tpmb+xDe
 A517jvQFqgz3QYvkAxj70D2K9aldomO5YpyrEfo+JX4gozSE9XNUZ6mEc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397218459"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="397218459"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 19:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="664822177"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="664822177"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 20 Feb 2023 19:48:20 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 09/19] vfio/pci: Accept device fd for hot reset
Date: Mon, 20 Feb 2023 19:48:02 -0800
Message-Id: <20230221034812.138051-10-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221034812.138051-1-yi.l.liu@intel.com>
References: <20230221034812.138051-1-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, joro@8bytes.org,
 cohuck@redhat.com, xudong.hao@intel.com, peterx@redhat.com,
 yan.y.zhao@intel.com, eric.auger@redhat.com, terrence.xu@intel.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, intel-gfx@lists.freedesktop.org,
 chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This prepares for using vfio device cdev as no group fd will be opened
in device cdev usage.

vfio_file_is_device_opened() is added for checking a given vfio file is
able to be a proof for the device ownership or not. The reason is that
the cdev path has the device opened in an in-between state, in which the
device is not fully opened. But to be proof of ownership, device should
be fully opened.

This also updates some comments as it also accepts device fd passed by
user. The uapi has no change, but user can specify a set of device fds
in the struct vfio_pci_hot_reset::group_fds field.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 11 ++++++-----
 drivers/vfio/vfio_main.c         | 19 +++++++++++++++++++
 include/linux/vfio.h             |  1 +
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 827524510f3f..09086fefd515 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1280,8 +1280,9 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 
 	/*
 	 * We can't let userspace give us an arbitrarily large buffer to copy,
-	 * so verify how many we think there could be.  Note groups can have
-	 * multiple devices so one group per device is the max.
+	 * so verify how many we think there could be.  Note user may provide
+	 * a set of groups, group can have multiple devices so one group per
+	 * device is the max.
 	 */
 	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
 					    &count, slot);
@@ -1308,7 +1309,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 	}
 
 	/*
-	 * For each group_fd, get the group file, this ensures the group
+	 * For each fd, get the file, this ensures the group or device
 	 * is held across the reset.
 	 */
 	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
@@ -1320,7 +1321,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
 		}
 
 		/* Ensure the FD is a vfio FD.*/
-		if (!vfio_file_is_valid(file)) {
+		if (!vfio_file_is_device_opened(file)) {
 			fput(file);
 			ret = -EINVAL;
 			break;
@@ -2430,7 +2431,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
 		/*
 		 * Test whether all the affected devices are contained by the
-		 * set of groups provided by the user.
+		 * set of files provided by the user.
 		 */
 		if (!vfio_dev_in_groups(cur_vma, groups)) {
 			ret = -EINVAL;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 91c8f25393db..2c851e172586 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1209,6 +1209,25 @@ bool vfio_file_is_valid(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_file_is_valid);
 
+/**
+ * vfio_file_is_device_opened - True if the file is fully opened
+ * @file: VFIO group file or VFIO device file
+ */
+bool vfio_file_is_device_opened(struct file *file)
+{
+	struct vfio_device *device;
+
+	if (vfio_group_from_file(file))
+		return true;
+
+	device = vfio_device_from_file(file);
+	if (device)
+		return READ_ONCE(device->open_count);
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(vfio_file_is_device_opened);
+
 /**
  * vfio_file_enforced_coherent - True if the DMA associated with the VFIO file
  *        is always CPU cache coherent
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 6a07e1c6c38e..615f8a081a41 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -249,6 +249,7 @@ bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
+bool vfio_file_is_device_opened(struct file *file);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-- 
2.34.1

