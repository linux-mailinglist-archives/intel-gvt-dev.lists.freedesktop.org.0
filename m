Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707AD6EF6C7
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 16:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BC810E530;
	Wed, 26 Apr 2023 14:54:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9A210E293;
 Wed, 26 Apr 2023 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682520866; x=1714056866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4m9wk/nfUu+Ko6ZOipEux5/ofaGiWcx58iIPXEvzblM=;
 b=UE7OXN2K96K3sYHGp/NYpOqG8GLXhOSnbDvL9ync/yAIB3ufFwx8/xS7
 ST1agcBaLAxPbrOfKMNKErK6Rw7Z3amAJXsqL4Z43x6JiKB/7k9FMwbmi
 QMbXzjcPO/weSgb2s8fNJY51nLWVurBqq0wrIRTtyc0K/ixnWFOW7Jcsl
 BauQ7GHCxM+NgBZurrb9w8P8yFAoaX7h/lJ/XWUZabuNnVx82x/QXWd/u
 Bj43oqBcEGpc7VCf+c39X3UDIPaZdC+5ibPxXmInWU0c15W2OYE2bqhGc
 Gu2DXuP+xRlIc23axUtfnKZXVc4drWxky3yOpnaG8yPOcgNZm8kr5X/tI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433410210"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="433410210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 07:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758643974"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="758643974"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 07:54:21 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 0/9] Enhance vfio PCI hot reset for vfio cdev device
Date: Wed, 26 Apr 2023 07:54:10 -0700
Message-Id: <20230426145419.450922-1-yi.l.liu@intel.com>
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
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, yi.l.liu@intel.com,
 kvm@vger.kernel.org, lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org,
 nicolinc@nvidia.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VFIO_DEVICE_PCI_HOT_RESET requires user to pass an array of group fds
to prove that it owns all devices affected by resetting the calling
device. While for cdev devices, user can use an iommufd-based ownership
checking model and invoke VFIO_DEVICE_PCI_HOT_RESET with a zero-length
fd array.

This series first creates iommufd_access for noiommu devices to fill the
gap for adding iommufd-based ownership checking model, then extends
VFIO_DEVICE_GET_PCI_HOT_RESET_INFO to check ownership and return the
check result and the devid of affected devices to user. In the end, extends
the VFIO_DEVICE_PCI_HOT_RESET to accept zero-length fd array for hot-reset
with cdev devices.

The new hot reset method and updated _INFO ioctl are tested with the
below qemu:

https://github.com/yiliu1765/qemu/tree/iommufd_rfcv4.mig.reset.v4_var3
(requires to test with the cdev kernel)

Change log:

v4:
 - Rename the patch series subject
 - Patch 01 is moved from the cdev series
 - Patch 02, 06 are new per review comments in v3
 - Patch 03/04/05/07/08/09 are from v3 with updates

v3: https://lore.kernel.org/kvm/20230401144429.88673-1-yi.l.liu@intel.com/
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

Yi Liu (9):
  vfio: Determine noiommu in vfio_device registration
  vfio-iommufd: Create iommufd_access for noiommu devices
  vfio/pci: Update comment around group_fd get in
    vfio_pci_ioctl_pci_hot_reset()
  vfio/pci: Move the existing hot reset logic to be a helper
  vfio: Mark cdev usage in vfio_device
  iommufd: Reserved -1 in the iommufd xarray
  vfio-iommufd: Add helper to retrieve iommufd_ctx and devid for
    vfio_device
  vfio/pci: Extend VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device
    cdev
  vfio/pci: Allow passing zero-length fd array in
    VFIO_DEVICE_PCI_HOT_RESET

 drivers/iommu/iommufd/device.c   |  24 ++++
 drivers/iommu/iommufd/main.c     |   5 +-
 drivers/vfio/iommufd.c           |  48 +++++--
 drivers/vfio/pci/vfio_pci_core.c | 223 +++++++++++++++++++++++++------
 drivers/vfio/vfio.h              |   7 +-
 drivers/vfio/vfio_main.c         |   4 +
 include/linux/iommufd.h          |   6 +
 include/linux/vfio.h             |  22 +++
 include/uapi/linux/vfio.h        |  61 ++++++++-
 9 files changed, 347 insertions(+), 53 deletions(-)

-- 
2.34.1

