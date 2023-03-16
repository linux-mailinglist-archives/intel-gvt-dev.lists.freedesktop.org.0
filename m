Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226D6BCFB2
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EC110E0FA;
	Thu, 16 Mar 2023 12:42:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC0D10E0E8;
 Thu, 16 Mar 2023 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678970539; x=1710506539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kBVDCZo5ppkLKXbsECV/EdBkx1cCs/f3fhiyJ7QusD8=;
 b=aLfO/ENjkhi7cziizg4wwN8oBa48E3fq8DaHKfkYD5xPH3BrcWLs1IaI
 uy0tO6BUG0Hz3F27hjrWhYVvS7o6cr3REUia9Y1NjSHUFYNCjCZSpgK8U
 EYhCc0MZdtJ0pH6wKdeRdSwjfL5c1l9az7yzqlGujHyRSM3K6UtUZ5EZ2
 6m9la5KPVZ95VhzjhYOgY27idh5/IrLoS43qcteVCm25MRVunWUWmyEsM
 Syqoqerew1zAJhEWSVKvQO9hNoCGVrvLyG6RVGzvDr6K2zwgFvi5eqUag
 PcrRd2c6AmHQAEGQVffs+QGFCLKQ/QsW0k7Uf0XJ6TyHu1qBGYLKglu/M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="321811983"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="321811983"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="1009207801"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009207801"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2023 05:41:57 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH 0/7] Introduce new methods for verifying ownership in vfio PCI
 hot reset
Date: Thu, 16 Mar 2023 05:41:49 -0700
Message-Id: <20230316124156.12064-1-yi.l.liu@intel.com>
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
stuffs to the vfio PCI hot reset.

[1] https://lore.kernel.org/kvm/Y%2FdobS6gdSkxnPH7@nvidia.com/
[2] https://lore.kernel.org/kvm/Y%2FZOOClu8nXy2toX@nvidia.com/#t
[3] https://lore.kernel.org/kvm/ZACX+Np%2FIY7ygqL5@nvidia.com/
[4] https://lore.kernel.org/kvm/DS0PR11MB7529BE88460582BD599DC1F7C3B19@DS0PR11MB7529.namprd11.prod.outlook.com/#t
[5] https://lore.kernel.org/kvm/ZAcvzvhkt9QhCmdi@nvidia.com/

Regards,
	Yi Liu

Yi Liu (7):
  vfio/pci: Update comment around group_fd get in
    vfio_pci_ioctl_pci_hot_reset()
  vfio/pci: Only check ownership of opened devices in hot reset
  vfio/pci: Allow passing zero-length fd array in
    VFIO_DEVICE_PCI_HOT_RESET
  vfio/pci: Renaming for accepting device fd in hot reset path
  vfio: Refine vfio file kAPIs for vfio PCI hot reset
  vfio: Accpet device file from vfio PCI hot reset path
  vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET ioctl

 drivers/iommu/iommufd/device.c   |   6 ++
 drivers/vfio/group.c             |  32 +++----
 drivers/vfio/iommufd.c           |   8 ++
 drivers/vfio/pci/vfio_pci_core.c | 146 ++++++++++++++++++++-----------
 drivers/vfio/vfio.h              |   2 +
 drivers/vfio/vfio_main.c         |  44 ++++++++++
 include/linux/iommufd.h          |   1 +
 include/linux/vfio.h             |   4 +
 include/uapi/linux/vfio.h        |  18 +++-
 9 files changed, 193 insertions(+), 68 deletions(-)

-- 
2.34.1

