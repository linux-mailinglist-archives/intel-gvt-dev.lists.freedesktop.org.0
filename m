Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4896C9FBD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5357110E378;
	Mon, 27 Mar 2023 09:35:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EB310E344;
 Mon, 27 Mar 2023 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909701; x=1711445701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VFtDtoN5Kck+5X+jp0cmuooALgzxmKpAJpHtfFQwAcw=;
 b=lk3OHGGutTVpTSEQLGArtfVYh73FpnF/CmephS5DGlwqAcMl7rht6r5X
 TlBaekxublLLiobPwlZ5vAjOtSXoXjHkse9eEumfj0JK1cAL2O/DB3UOI
 BLB4qIKZ9Q3Uz7ZW3QSmeXMXhAo6BVrK2urQZUGcP9jN/39GGyCMgneQC
 Qypd8J1E0b2D5leLoF5AOvxLKYChAP89LWSeBt+dEYikY3+/X9mlhJp8c
 vGtasWv+e+Kx2gEwOx/6clhN+IG9HykG80Yk+VxJI7gHDRJFYuP38om34
 YaHiru6vw9iR8N8mc9duMzE9JmWVsTBTpTLhVUVdErHqGMkPs7vGAK44q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="319879477"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="319879477"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="633554601"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="633554601"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga003.jf.intel.com with ESMTP; 27 Mar 2023 02:34:59 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 00/10] Introduce new methods for verifying ownership in
 vfio PCI hot reset
Date: Mon, 27 Mar 2023 02:34:48 -0700
Message-Id: <20230327093458.44939-1-yi.l.liu@intel.com>
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
stuffs to the vfio PCI hot reset. Per the dicussion in [6], this series
also adds a new _INFO ioctl to get hot reset scope for given device.

[1] https://lore.kernel.org/kvm/Y%2FdobS6gdSkxnPH7@nvidia.com/
[2] https://lore.kernel.org/kvm/Y%2FZOOClu8nXy2toX@nvidia.com/#t
[3] https://lore.kernel.org/kvm/ZACX+Np%2FIY7ygqL5@nvidia.com/
[4] https://lore.kernel.org/kvm/DS0PR11MB7529BE88460582BD599DC1F7C3B19@DS0PR11MB7529.namprd11.prod.outlook.com/#t
[5] https://lore.kernel.org/kvm/ZAcvzvhkt9QhCmdi@nvidia.com/
[6] https://lore.kernel.org/kvm/ZBoYgNq60eDpV9Un@nvidia.com/

Change log:

v2:
 - Split the patch 03 of v1 to be 03, 04 and 05 of v2 (Jaon)
 - Add r-b from Kevin and Jason
 - Add patch 10 to introduce a new _INFO ioctl for the usage of device
   fd passing usage in cdev path (Jason, Alex)

v1: https://lore.kernel.org/kvm/20230316124156.12064-1-yi.l.liu@intel.com/

Regards,
	Yi Liu

Yi Liu (10):
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
  vfio/pci: Add VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO

 drivers/iommu/iommufd/device.c   |  12 ++
 drivers/vfio/group.c             |  32 ++--
 drivers/vfio/iommufd.c           |  16 ++
 drivers/vfio/pci/vfio_pci_core.c | 244 ++++++++++++++++++++++++-------
 drivers/vfio/vfio.h              |   2 +
 drivers/vfio/vfio_main.c         |  44 ++++++
 include/linux/iommufd.h          |   3 +
 include/linux/vfio.h             |  14 ++
 include/uapi/linux/vfio.h        |  65 +++++++-
 9 files changed, 364 insertions(+), 68 deletions(-)

-- 
2.34.1

