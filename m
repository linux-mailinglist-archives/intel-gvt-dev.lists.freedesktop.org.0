Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2E6A4004
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 12:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8869110E3B6;
	Mon, 27 Feb 2023 11:11:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD7C10E1BF;
 Mon, 27 Feb 2023 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677496297; x=1709032297;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1IK/1lZnvbJJD8QhJKvYKH9Xogqqka0gaxsLoXDjZpU=;
 b=LN819lxCNfU1U+imJkqMloEguwqdB9mHznAx5686gDUWdKvZE98UnNSZ
 ihyC9g4W1Jfb0h6YqQhly8ndLj6JdqkN0JjJF6bxsLE7yXXa+BhuFkaDb
 irF2UHOJIEOc2sOjCL7PMjnQvfFJcDt3EdsGazr/+ZcrGoh0aDRkLpLc1
 NdNHvZr6m/0s5iGyJigwh1DmkmCYDO8VK/SSLJnSvCBSUNRsY+5+4cMPX
 rNf1d29geU6fYwsR4We9e4ys34STUSNv6XpTWdjFPa2JPRJGegKuivp0p
 O0hpaq5Jjz0ZN/QlCfhIQygv3l8Mk8kjbjg5+hV9nLhMxEGqR7dCeCf6j A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="420097522"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="420097522"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="651189392"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="651189392"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 03:11:36 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Date: Mon, 27 Feb 2023 03:11:16 -0800
Message-Id: <20230227111135.61728-1-yi.l.liu@intel.com>
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

Existing VFIO provides group-centric user APIs for userspace. Userspace
opens the /dev/vfio/$group_id first before getting device fd and hence
getting access to device. This is not the desired model for iommufd. Per
the conclusion of community discussion[1], iommufd provides device-centric
kAPIs and requires its consumer (like VFIO) to be device-centric user
APIs. Such user APIs are used to associate device with iommufd and also
the I/O address spaces managed by the iommufd.

This series first introduces a per device file structure to be prepared
for further enhancement and refactors the kvm-vfio code to be prepared
for accepting device file from userspace. Then refactors the vfio to be
able to handle iommufd binding. This refactor includes the mechanism of
blocking device access before iommufd bind, making the device_open exclusive.
between the group path and the cdev path. Eventually, adds the cdev support
for vfio device, and makes group infrastructure optional as it is not needed
when vfio device cdev is compiled.

This is also a prerequisite for iommu nesting for vfio device[2].

The complete code can be found in below branch, simple test done with the
legacy group path and the cdev path. Draft QEMU branch can be found at[3]

https://github.com/yiliu1765/iommufd/tree/vfio_device_cdev_v5
(config CONFIG_IOMMUFD=y CONFIG_VFIO_DEVICE_CDEV=y)

base-commit: 63777bd2daa3625da6eada88bd9081f047664dad

[1] https://lore.kernel.org/kvm/BN9PR11MB5433B1E4AE5B0480369F97178C189@BN9PR11MB5433.namprd11.prod.outlook.com/
[2] https://lore.kernel.org/linux-iommu/20230209043153.14964-1-yi.l.liu@intel.com/
[3] https://github.com/yiliu1765/qemu/tree/iommufd_rfcv3 (it is based on Eric's
    QEMU iommufd rfcv3 (https://lore.kernel.org/kvm/20230131205305.2726330-1-eric.auger@redhat.com/)
    plus two commits to align with vfio_device_cdev v3/v4/v5)

Change log:

v5:
 - Add r-b from Kevin on patch 08, 13, 14, 15 and 17.
 - Rename patch 02 to limit the change for KVM facing kAPIs. The vfio pci
   hot reset path only accepts group file until patch 09. (Kevin)
 - Update comment around smp_load_acquire(&df->access_granted) (Yan)
 - Adopt Jason's suggestion on the vfio pci hot reset path, passing zero-length
   fd array to indicate using bound iommufd_ctx as ownership check. (Jason, Kevin)
 - Direct read df->access_granted value in vfio_device_cdev_close() (Kevin, Yan, Jason)
 - Wrap the iommufd get/put into a helper to refine the error path of
   vfio_device_ioctl_bind_iommufd(). (Yan)

v4: https://lore.kernel.org/kvm/20230221034812.138051-1-yi.l.liu@intel.com/
 - Add r-b from Kevin on patch 09/10
 - Add a line in devices/vfio.rst to emphasize user should add group/device to
   KVM prior to invoke open_device op which may be called in the VFIO_GROUP_GET_DEVICE_FD
   or VFIO_DEVICE_BIND_IOMMUFD ioctl.
 - Modify VFIO_GROUP/VFIO_DEVICE_CDEV Kconfig dependency (Alex)
 - Select VFIO_GROUP for SPAPR (Jason)
 - Check device fully-opened in PCI hotreset path for device fd (Jason)
 - Set df->access_granted in the caller of vfio_device_open() since
   the caller may fail in other operations, but df->access_granted
   does not allow a true to false change. So it should be set only when
   the open path is really done successfully. (Yan, Kevin)
 - Fix missing iommufd_ctx_put() in the cdev path (Yan)
 - Fix an issue found in testing exclusion between group and cdev path.
   vfio_device_cdev_close() should check df->access_granted before heading
   to other operations.
 - Update vfio.rst for iommufd/cdev

v3: https://lore.kernel.org/kvm/20230213151348.56451-1-yi.l.liu@intel.com/
 - Add r-b from Kevin on patch 03, 06, 07, 08.
 - Refine the group and cdev path exclusion. Remove vfio_device:single_open;
   add vfio_group::cdev_device_open_cnt to achieve exlucsion between group
   path and cdev path (Kevin, Jason)
 - Fix a bug in the error handling path (Yan Zhao)
 - Address misc remarks from Kevin

v2: https://lore.kernel.org/kvm/20230206090532.95598-1-yi.l.liu@intel.com/
 - Add r-b from Kevin and Eric on patch 01 02 04.
 - "Split kvm/vfio: Provide struct kvm_device_ops::release() insted of ::destroy()"
   from this series and got applied. (Alex, Kevin, Jason, Mathhew)
 - Add kvm_ref_lock to protect vfio_device_file->kvm instead of reusing
   dev_set->lock as dead-lock is observed with vfio-ap which would try to
   acquire kvm_lock. This is opposite lock order with kvm_device_release()
   which holds kvm_lock first and then hold dev_set->lock. (Kevin)
 - Use a separate ioctl for detaching IOAS. (Alex)
 - Rename vfio_device_file::single_open to be is_cdev_device (Kevin, Alex)
 - Move the vfio device cdev code into device_cdev.c and add a VFIO_DEVICE_CDEV
   kconfig for it. (Kevin, Jason)

v1: https://lore.kernel.org/kvm/20230117134942.101112-1-yi.l.liu@intel.com/
 - Fix the circular refcount between kvm struct and device file reference. (JasonG)
 - Address comments from KevinT
 - Remained the ioctl for detach, needs to Alex's taste
   (https://lore.kernel.org/kvm/BN9PR11MB5276BE9F4B0613EE859317028CFF9@BN9PR11MB5276.namprd11.prod.outlook.com/)

rfc: https://lore.kernel.org/kvm/20221219084718.9342-1-yi.l.liu@intel.com/

Thanks,
	Yi Liu

Yi Liu (19):
  vfio: Allocate per device file structure
  vfio: Refine vfio file kAPIs for KVM
  vfio: Accept vfio device file in the KVM facing kAPI
  kvm/vfio: Rename kvm_vfio_group to prepare for accepting vfio device
    fd
  kvm/vfio: Accept vfio device file from userspace
  vfio: Pass struct vfio_device_file * to vfio_device_open/close()
  vfio: Block device access via device fd until device is opened
  vfio/pci: Update comment around group_fd get in
    vfio_pci_ioctl_pci_hot_reset()
  vfio/pci: Allow passing zero-length fd array in
    VFIO_DEVICE_PCI_HOT_RESET
  vfio: Add infrastructure for bind_iommufd from userspace
  vfio-iommufd: Add detach_ioas support for physical VFIO devices
  vfio-iommufd: Add detach_ioas for emulated VFIO devices
  vfio: Add cdev_device_open_cnt to vfio_group
  vfio: Make vfio_device_open() single open for device cdev path
  vfio: Add cdev for vfio_device
  vfio: Add VFIO_DEVICE_BIND_IOMMUFD
  vfio: Add VFIO_DEVICE_AT[DE]TACH_IOMMUFD_PT
  vfio: Compile group optionally
  docs: vfio: Add vfio device cdev description

 Documentation/driver-api/vfio.rst             | 133 +++++++-
 Documentation/virt/kvm/devices/vfio.rst       |  52 ++--
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   1 +
 drivers/s390/cio/vfio_ccw_ops.c               |   1 +
 drivers/s390/crypto/vfio_ap_ops.c             |   1 +
 drivers/vfio/Kconfig                          |  26 ++
 drivers/vfio/Makefile                         |   3 +-
 drivers/vfio/device_cdev.c                    | 285 ++++++++++++++++++
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |   1 +
 drivers/vfio/group.c                          | 139 ++++++---
 drivers/vfio/iommufd.c                        |  59 +++-
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   2 +
 drivers/vfio/pci/mlx5/main.c                  |   1 +
 drivers/vfio/pci/vfio_pci.c                   |   1 +
 drivers/vfio/pci/vfio_pci_core.c              | 116 +++++--
 drivers/vfio/platform/vfio_amba.c             |   1 +
 drivers/vfio/platform/vfio_platform.c         |   1 +
 drivers/vfio/vfio.h                           | 192 +++++++++++-
 drivers/vfio/vfio_main.c                      | 244 +++++++++++++--
 include/linux/iommufd.h                       |   6 +
 include/linux/vfio.h                          |  40 ++-
 include/uapi/linux/kvm.h                      |  16 +-
 include/uapi/linux/vfio.h                     | 102 +++++++
 virt/kvm/vfio.c                               | 141 ++++-----
 24 files changed, 1348 insertions(+), 216 deletions(-)
 create mode 100644 drivers/vfio/device_cdev.c

-- 
2.34.1

