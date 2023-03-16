Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3456BCFCD
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3291F10ECC7;
	Thu, 16 Mar 2023 12:42:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFC310E189;
 Thu, 16 Mar 2023 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678970546; x=1710506546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/3DeM31wos4hPFJcOhBa/QKGeGtDvnA4E5EZwXXXyw=;
 b=NISSkGkia/pircvDK/6Rat2xbxNmOCAd7NDjNIS1AfAZQVemalzqtqso
 f15aOjOt5HtGlEZuEfjxPfdR6uAs257cy9nIvbST/iDSzZ+DPR91h7Z6n
 0VTjQF7bv9/MnFw9CHIv1vixK1lZwJygYajtqTykur31DNq/A5YDoFxxd
 yhNaYZmQOGl4T7x/C/u0AoF6qDOjuPFqKiNwcK+MQ1Cx9/DazE64JZ7cg
 E/8oM0KCpMifoZG5CNjqkjq8EiiNi6vpxCH0LvaibioztSj7E8CmrsT8j
 UzlYPisJ4Ok0sHf5cypMmoGoDSmC8rVnFkZknGocjgdBV9AbBSxexufZH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="321812128"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="321812128"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="1009208018"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009208018"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2023 05:42:14 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH 7/7] vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET
 ioctl
Date: Thu, 16 Mar 2023 05:41:56 -0700
Message-Id: <20230316124156.12064-8-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316124156.12064-1-yi.l.liu@intel.com>
References: <20230316124156.12064-1-yi.l.liu@intel.com>
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
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 xudong.hao@intel.com, peterx@redhat.com, yan.y.zhao@intel.com,
 eric.auger@redhat.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Now user can also provide an array of device fds as a 3rd method to verify
the reset ownership. It's not useful at this point when the device fds are
acquired via group fds. But it's necessary when moving to device cdev which
allows the user to directly acquire device fds by skipping group. In that
case this method can be used as a last resort when the preferred iommufd
verification doesn't work, e.g. in noiommu usages.

Clarify it in uAPI.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 6 +++---
 include/uapi/linux/vfio.h        | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index b7de1816b97b..19f5b075d70a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1289,7 +1289,7 @@ vfio_pci_ioctl_pci_hot_reset_files(struct vfio_pci_core_device *vdev,
 		return -ENOMEM;
 	}
 
-	if (copy_from_user(fds, arg->group_fds,
+	if (copy_from_user(fds, arg->fds,
 			   hdr->count * sizeof(*fds))) {
 		kfree(fds);
 		kfree(files);
@@ -1297,8 +1297,8 @@ vfio_pci_ioctl_pci_hot_reset_files(struct vfio_pci_core_device *vdev,
 	}
 
 	/*
-	 * Get the group file for each fd to ensure the group held across
-	 * the reset
+	 * Get the file for each fd to ensure the group/device file
+	 * is held across the reset
 	 */
 	for (file_idx = 0; file_idx < hdr->count; file_idx++) {
 		struct file *file = fget(fds[file_idx]);
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 17aa5d09db41..25432ef213ee 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -681,6 +681,7 @@ struct vfio_pci_hot_reset_info {
  *
  * The ownership can be proved by:
  *   - An array of group fds
+ *   - An array of device fds
  *   - A zero-length array
  *
  * In the last case all affected devices which are opened by this user
@@ -694,7 +695,7 @@ struct vfio_pci_hot_reset {
 	__u32	argsz;
 	__u32	flags;
 	__u32	count;
-	__s32	group_fds[];
+	__s32	fds[];
 };
 
 #define VFIO_DEVICE_PCI_HOT_RESET	_IO(VFIO_TYPE, VFIO_BASE + 13)
-- 
2.34.1

