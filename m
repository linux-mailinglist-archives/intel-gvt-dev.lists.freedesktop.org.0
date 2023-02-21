Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B569D9A5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Feb 2023 04:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3218A10E1B5;
	Tue, 21 Feb 2023 03:48:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5155D10E147;
 Tue, 21 Feb 2023 03:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676951315; x=1708487315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+3Nq/K38kHZsQSxS12tarLBGvaa5fz9uJFcv3nNQVBg=;
 b=AHcD9Zeejnruav0+DjGgmbMzeA0moRjGcCJIiUoin+ySsqx4rMvaZ2Ug
 0+/5Wrk8Ao5Z5TJzdpA+fEXPCuTi5ORARuUVZOgi17Cdnmou9Z1HVhqgf
 Dty9KfUbP/RflVskeaYDg20+6+jR68tN5tANNnn6AZmNWaxqh+F7wMc4j
 D5SThfyDRaoZueH698lyo1kA2WUsfD0pBcPSf8Z9OQZPwf/nBZPXIns1S
 4l56QULA+ia9UhgVxFl+BMVep26k/MvxVnzs8hZUVFPpw8F6Fk6iqPbxD
 /2DHBVpAcooLEkuopEuEt/3fS5642/IglqnnSGA6xuhcyc/Ace2m/J3Ns A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397218550"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="397218550"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 19:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="664822227"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="664822227"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 20 Feb 2023 19:48:29 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 19/19] docs: vfio: Add vfio device cdev description
Date: Mon, 20 Feb 2023 19:48:12 -0800
Message-Id: <20230221034812.138051-20-yi.l.liu@intel.com>
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

This gives hints for userspace applications on device cdev usage.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 Documentation/driver-api/vfio.rst | 125 ++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
index 44527420f20d..5d290ceb2bbf 100644
--- a/Documentation/driver-api/vfio.rst
+++ b/Documentation/driver-api/vfio.rst
@@ -239,6 +239,123 @@ group and can access them as follows::
 	/* Gratuitous device reset and go... */
 	ioctl(device, VFIO_DEVICE_RESET);
 
+IOMMUFD and vfio_iommu_type1
+----------------------------
+
+IOMMUFD is the new user API to manage I/O page tables from userspace.
+It intends to be the portal of delivering advanced userspace DMA
+features (nested translation [5], PASID [6], etc.) and backward
+compatible with the vfio_iommu_type1 driver. Eventually vfio_iommu_type1
+will be deprecated.
+
+With the backward compatibility, no change is required for legacy VFIO
+drivers or applications to connect a VFIO device to IOMMUFD.
+
+	When CONFIG_IOMMUFD_VFIO_CONTAINER=n, VFIO container still provides
+	/dev/vfio/vfio which connects to vfio_iommu_type1. To disable VFIO
+	container and vfio_iommu_type1, the administrator could symbol link
+	/dev/vfio/vfio to /dev/iommu to enable VFIO container emulation
+	in IOMMUFD.
+
+	When CONFIG_IOMMUFD_VFIO_CONTAINER=y, IOMMUFD directly provides
+	/dev/vfio/vfio while the VFIO container and vfio_iommu_type1 are
+	explicitly disabled.
+
+VFIO Device cdev
+----------------
+
+Traditionally user acquires a device fd via VFIO_GROUP_GET_DEVICE_FD
+in a VFIO group.
+
+With CONFIG_VFIO_DEVICE_CDEV=y the user can now acquire a device fd
+by directly opening a character device /dev/vfio/devices/vfioX where
+"X" is the number allocated uniquely by VFIO for registered devices.
+
+The cdev only works with IOMMUFD. Both VFIO drivers and applications
+must adapt to the new cdev security model which requires using
+VFIO_DEVICE_BIND_IOMMUFD to claim DMA ownership before starting to
+actually use the device. Once bind succeeds then a VFIO device can
+be fully accessed by the user.
+
+VFIO device cdev doesn't rely on VFIO group/container/iommu drivers.
+Hence those modules can be fully compiled out in an environment
+where no legacy VFIO application exists.
+
+So far SPAPR does not support IOMMUFD yet. So it cannot support device
+cdev either.
+
+Device cdev Example
+-------------------
+
+Assume user wants to access PCI device 0000:6a:01.0::
+
+	$ ls /sys/bus/pci/devices/0000:6a:01.0/vfio-dev/
+	vfio0
+
+This device is therefore represented as vfio0. The user can verify
+its existence::
+
+	$ ls -l /dev/vfio/devices/vfio0
+	crw------- 1 root root 511, 0 Feb 16 01:22 /dev/vfio/devices/vfio0
+	$ cat /sys/bus/pci/devices/0000:6a:01.0/vfio-dev/vfio0/dev
+	511:0
+	$ ls -l /dev/char/511\:0
+	lrwxrwxrwx 1 root root 21 Feb 16 01:22 /dev/char/511:0 -> ../vfio/devices/vfio0
+
+Then provide the user with access to the device if unprivileged
+operation is desired::
+
+	$ chown user:user /dev/vfio/devices/vfio0
+
+Finally the user could get cdev fd by::
+
+	cdev_fd = open("/dev/vfio/devices/vfio0", O_RDWR);
+
+An opened cdev_fd doesn't give the user any permission of accessing
+the device except binding the cdev_fd to an iommufd. After that point
+then the device is fully accessible including attaching it to an
+IOMMUFD IOAS/HWPT to enable userspace DMA::
+
+	struct vfio_device_bind_iommufd bind = {
+		.argsz = sizeof(bind),
+		.flags = 0,
+	};
+	struct iommu_ioas_alloc alloc_data  = {
+		.size = sizeof(alloc_data),
+		.flags = 0,
+	};
+	struct vfio_device_attach_iommufd_pt attach_data = {
+		.argsz = sizeof(attach_data),
+		.flags = 0,
+	};
+	struct iommu_ioas_map map = {
+		.size = sizeof(map),
+		.flags = IOMMU_IOAS_MAP_READABLE |
+			 IOMMU_IOAS_MAP_WRITEABLE |
+			 IOMMU_IOAS_MAP_FIXED_IOVA,
+		.__reserved = 0,
+	};
+
+	iommufd = open("/dev/iommu", O_RDWR);
+
+	bind.iommufd = iommufd;
+	ioctl(cdev_fd, VFIO_DEVICE_BIND_IOMMUFD, &bind);
+
+	ioctl(iommufd, IOMMU_IOAS_ALLOC, &alloc_data);
+	attach_data.pt_id = alloc_data.out_ioas_id;
+	ioctl(cdev_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT, &attach_data);
+
+	/* Allocate some space and setup a DMA mapping */
+	map.user_va = (int64_t)mmap(0, 1024 * 1024, PROT_READ | PROT_WRITE,
+				    MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
+	map.iova = 0; /* 1MB starting at 0x0 from device view */
+	map.length = 1024 * 1024;
+	map.ioas_id = alloc_data.out_ioas_id;;
+
+	ioctl(iommufd, IOMMU_IOAS_MAP, &map);
+
+	/* Other device operations as stated in "VFIO Usage Example" */
+
 VFIO User API
 -------------------------------------------------------------------------------
 
@@ -566,3 +683,11 @@ This implementation has some specifics:
 				\-0d.1
 
 	00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 90)
+
+.. [5] Nested translation is an IOMMU feature which supports two stage
+   address translations. This improves the address translation efficiency
+   in IOMMU virtualization.
+
+.. [6] PASID stands for Process Address Space ID, introduced by PCI
+   Express. It is a prerequisite for Shared Virtual Addressing (SVA)
+   and Scalable I/O Virtualization (Scalable IOV).
-- 
2.34.1

