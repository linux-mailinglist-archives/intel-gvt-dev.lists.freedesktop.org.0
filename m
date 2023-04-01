Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5545D6D316E
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 16:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D557810E0F6;
	Sat,  1 Apr 2023 14:44:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C40E10E05B;
 Sat,  1 Apr 2023 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680360272; x=1711896272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5F7P7Jg2V0ZDZMnrZa1Gd5CHrngSw5dblTzPduvISBM=;
 b=QxT1eHvdZ6Y46LOd0MbBxx1GSVjMviwgSqZdUrQ+aCf7EaSQd4sff1Fb
 TiSJWaYIojkRKE6C5ICFJ+hxmp0x/Vho78/XhYNn70bSzjqRK/dngCDAv
 c+XKT+tegSdOjXdz9mYIf7Q5MNqWT0y4dw/1D+9k6CY7ZCIiKIIeNZryz
 zFl5IgCkjEnThlXq76NttkaxRxZ4tpAiHqT8xO8VrfAvctogoUvpEVhfb
 1NdmRBgjwjBVZGY9+zuKBWyRxi4MC9dG6XsGYEflBUDpsHBqfP7j9r9xd
 LBIRBJKXXhrt2P6MQtqvlCZ8fu3dXXqDKjg8MNCOvqgjdfgX6tCPg7oOQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340385070"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="340385070"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 07:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662705799"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="662705799"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 07:44:30 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 00/12] Introduce new methods for verifying ownership in
 vfio PCI hot reset
Date: Sat,  1 Apr 2023 07:44:17 -0700
Message-Id: <20230401144429.88673-1-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
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

VFIO_DEVICE_PCI_HOT_RESET requires user to pass an array of group fds
to prove that it owns all devices affected by resetting the calling
device. This series introduces several extensions to allow the ownership
check better aligned with iommufd and coming vfio device cdev support.

First, resetting an unopened device is always safe given nobody is using
it. So relax the check to allow such devices not covered by group fd
array. [1]

When iommufd is used we can simply verify that all affected devices are
bound to a same iommufd then no need for the user to provide extra fd
information. This is enabled by the user passing a zero-length fd array
and moving forward this should be the preferred way for hot reset. [2]

However the iommufd method has difficulty working with noiommu devices
since those devices don't have a valid iommufd, unless the noiommu device
is in a singleton dev_set hence no ownership check is required. [3]

For noiommu backward compatibility a 3rd method is introduced by allowing
the user to pass an array of device fds to prove ownership. [4]

As suggested by Jason [5], we have this series to introduce the above
stuffs to the vfio PCI hot reset. Per the dicussion in [6] [7], in the
end of this series, the VFIO_DEVICE_GET_PCI_HOT_RESET_INFO is extended
to report devid for the devices opened as cdev. This is goging to support
the device fd passing usage.

The new hot reset method and updated _INFO ioctl are tested with two
test commits in below qemu:

https://github.com/yiliu1765/qemu/commits/iommufd_rfcv3
(requires to test with cdev kernel)

[1] https://lore.kernel.org/kvm/Y%2FdobS6gdSkxnPH7@nvidia.com/
[2] https://lore.kernel.org/kvm/Y%2FZOOClu8nXy2toX@nvidia.com/#t
[3] https://lore.kernel.org/kvm/ZACX+Np%2FIY7ygqL5@nvidia.com/
[4] https://lore.kernel.org/kvm/DS0PR11MB7529BE88460582BD599DC1F7C3B19@DS0PR11MB7529.namprd11.prod.outlook.com/#t
[5] https://lore.kernel.org/kvm/ZAcvzvhkt9QhCmdi@nvidia.com/
[6] https://lore.kernel.org/kvm/ZBoYgNq60eDpV9Un@nvidia.com/
[7] https://lore.kernel.org/kvm/20230327132619.5ab15440.alex.williamson@redhat.com/

Change log:

v3:
 - Remove the new _INFO ioctl of v2, extend the existing _INFO ioctl to
   report devid (Alex)
 - Add r-b from Jason
 - Add t-b from Terrence Xu and Yanting Jiang (mainly regression test)

v2: https://lore.kernel.org/kvm/20230327093458.44939-1-yi.l.liu@intel.com/
 - Split the patch 03 of v1 to be 03, 04 and 05 of v2 (Jaon)
 - Add r-b from Kevin and Jason
 - Add patch 10 to introduce a new _INFO ioctl for the usage of device
   fd passing usage in cdev path (Jason, Alex)

v1: https://lore.kernel.org/kvm/20230316124156.12064-1-yi.l.liu@intel.com/

Regards,
	Yi Liu

Yi Liu (12):
  vfio/pci: Update comment around group_fd get in
    vfio_pci_ioctl_pci_hot_reset()
  vfio/pci: Only check ownership of opened devices in hot reset
  vfio/pci: Move the existing hot reset logic to be a helper
  vfio-iommufd: Add helper to retrieve iommufd_ctx and devid for
    vfio_device
  vfio/pci: Allow passing zero-length fd array in
    VFIO_DEVICE_PCI_HOT_RESET
  vfio: Refine vfio file kAPIs for vfio PCI hot reset
  vfio: Accpet device file from vfio PCI hot reset path
  vfio/pci: Renaming for accepting device fd in hot reset path
  vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET ioctl
  vfio: Mark cdev usage in vfio_device
  iommufd: Define IOMMUFD_INVALID_ID in uapi
  vfio/pci: Report dev_id in VFIO_DEVICE_GET_PCI_HOT_RESET_INFO

 drivers/iommu/iommufd/device.c   |  12 ++
 drivers/vfio/group.c             |  32 +++--
 drivers/vfio/iommufd.c           |  14 +++
 drivers/vfio/pci/vfio_pci_core.c | 204 ++++++++++++++++++++++---------
 drivers/vfio/vfio.h              |   2 +
 drivers/vfio/vfio_main.c         |  44 +++++++
 include/linux/iommufd.h          |   3 +
 include/linux/vfio.h             |  21 ++++
 include/uapi/linux/iommufd.h     |   3 +
 include/uapi/linux/vfio.h        |  42 ++++++-
 10 files changed, 301 insertions(+), 76 deletions(-)

-- 
2.34.1

