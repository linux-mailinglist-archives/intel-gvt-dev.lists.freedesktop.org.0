Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338656C9FD3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB30310E374;
	Mon, 27 Mar 2023 09:35:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A75010E3A7;
 Mon, 27 Mar 2023 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909709; x=1711445709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v0D3R5+aGDWyOemoEsVYiHjHAhjBokxdDCY6e1VuJQQ=;
 b=m+kwdCNJe2CwWWMmVaNd+oU55DQDv/YxXAVlgHAkI0ywZAkmgnYBO19X
 AQrUyHvrAZZ8n7y6cBjvDNQ/7g6PE8xc7Bqf2hvuUT878Iu94fMbJD0J6
 kjWRW4n6NlfCOnIV6l+sK7mq02x7e1tOFGJotv/Eiwlh3LkQMoPXeYcyn
 bVOxj6PvsV6sBXcsNlFmw3xgy1VsjNreoJSvA2QQ+2UuFfJ3o2CsgmXYP
 z+yu+M8YmllXaXL93ESofP405YvEWmJ+FKOk77/iH1dTrd9PlcdFGvOKU
 oJjiNmkJGGXORa+YItJTMNl3Bil1pXd1czdmXHWHUjQvJB2rqV53e3crt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="319879592"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="319879592"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="633554680"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="633554680"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga003.jf.intel.com with ESMTP; 27 Mar 2023 02:35:08 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 09/10] vfio/pci: Accept device fd in
 VFIO_DEVICE_PCI_HOT_RESET ioctl
Date: Mon, 27 Mar 2023 02:34:57 -0700
Message-Id: <20230327093458.44939-10-yi.l.liu@intel.com>
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

Now user can also provide an array of device fds as a 3rd method to verify
the reset ownership. It's not useful at this point when the device fds are
acquired via group fds. But it's necessary when moving to device cdev which
allows the user to directly acquire device fds by skipping group. In that
case this method can be used as a last resort when the preferred iommufd
verification doesn't work, e.g. in noiommu usages.

Clarify it in uAPI.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 9 +++++----
 include/uapi/linux/vfio.h        | 3 ++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index da6325008872..19f5b075d70a 100644
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
@@ -2469,7 +2469,8 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		 * cannot race being opened by another user simultaneously.
 		 *
 		 * Otherwise all opened devices in the dev_set must be
-		 * contained by the set of groups provided by the user.
+		 * contained by the set of groups/devices provided by
+		 * the user.
 		 *
 		 * If user provides a zero-length array, then all the
 		 * opened devices must be bound to a same iommufd_ctx.
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

