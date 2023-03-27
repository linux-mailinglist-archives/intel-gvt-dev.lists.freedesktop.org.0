Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4826C9FFD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A77710E37F;
	Mon, 27 Mar 2023 09:40:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD510E355;
 Mon, 27 Mar 2023 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679910049; x=1711446049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aWgIvwnZdQqft2YWFXeN+ATd6QbZ/XTSJfJU/Pxkqho=;
 b=MCWsJ1Lf+rDHAn1zed9XfCN4K9yOZiV1B7WeRk3blOQ1LeNcFtzmbrkT
 L6rfoc+btceomLl6HSbpoe9wMwb8ClNMiXV0TkP/FL31KM9Supr12zjW9
 UelJdbnifX61lq0Cha+EFIdrbfn/2NYlvWa35HLm8k5YZs7zgxnop/cN0
 Z0py2iS7Oq6XtKNtnHUxff2FgJsUuwxA8/+qgm7gas+BTlsTqyKs/kBkT
 0XxFVX26vX7JJc/3Rcag6rCJD3aG/O0gqiIma7+EKG2/CjHYq4M3wWTOz
 lso1JsiixVGw2N+oJf/YJbS202r9eImDVr/NelJcim8r+lNHh40ZIgF3X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426485193"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="426485193"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660775622"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="660775622"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 02:40:48 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 00/24] Add vfio_device cdev for iommufd support
Date: Mon, 27 Mar 2023 02:40:23 -0700
Message-Id: <20230327094047.47215-1-yi.l.liu@intel.com>
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

Existing VFIO provides group-centric user APIs for userspace. Userspace
opens the /dev/vfio/$group_id first before getting device fd and hence
getting access to device. This is not the desired model for iommufd. Per
the conclusion of community discussion[1], iommufd provides device-centric
kAPIs and requires its consumer (like VFIO) to be device-centric user
APIs. Such user APIs are used to associate device with iommufd and also
the I/O address spaces managed by the iommufd.

This series first introduces a per device file structure to be prepared
for further enhancement and refactors the kvm-vfio code to be prepared
for accepting device file from userspace. Afte this, adds a mechanism for
blocking device access before iommufd bind. Then refactors the vfio to be
able to handle cdev path (e.g. iommufd binding, no-iommufd, [de]attach ioas).
This refactor includes making the device_open exclusive between group and
cdev path, only allow single device open in cdev path; vfio-iommufd code is
also refactored to support cdev. e.g. split the vfio_iommufd_bind() into
two steps. Eventually, adds the cdev support for vfio device and the new
ioctls, then makes group infrastructure optional as it is not needed when
vfio device cdev is compiled.

This series is based on some preparation works done to vfio emulated devices[2]
and vfio pci hot reset enhancements[3].

This series is a prerequisite for iommu nesting for vfio device[4] [5].

The complete code can be found in below branch, simple tests done to the
legacy group path and the cdev path. Draft QEMU branch can be found at[6]

https://github.com/yiliu1765/iommufd/tree/vfio_device_cdev_v8
(config CONFIG_IOMMUFD=y CONFIG_VFIO_DEVICE_CDEV=y)

base-commit: 1d412cdf6cd17c347b5398416a60518671e13d37

[1] https://lore.kernel.org/kvm/BN9PR11MB5433B1E4AE5B0480369F97178C189@BN9PR11MB5433.namprd11.prod.outlook.com/
[2] https://lore.kernel.org/kvm/20230327093351.44505-1-yi.l.liu@intel.com/
[3] https://lore.kernel.org/kvm/20230327093458.44939-1-yi.l.liu@intel.com/
[4] https://lore.kernel.org/linux-iommu/20230309080910.607396-1-yi.l.liu@intel.com/
[5] https://lore.kernel.org/linux-iommu/20230309082207.612346-1-yi.l.liu@intel.com/
[6] https://github.com/yiliu1765/qemu/tree/iommufd_rfcv3 (it is based on Eric's
    QEMU iommufd rfcv3 (https://lore.kernel.org/kvm/20230131205305.2726330-1-eric.auger@redhat.com/)
    plus commits to align with vfio_device_cdev v8)

Change log:

v8:
 - Add patch 18 to determine noiommu device at vfio_device registration (Jason)
 - Add patch 19 to name noiommu device with "noiommu-" prefix to be par with
   group path
 - Add r-b from Kevin
 - Add t-b from Terrence

v7: https://lore.kernel.org/kvm/20230316125534.17216-1-yi.l.liu@intel.com/
 - Split the vfio-pci hot reset changes to be separate patch series (Jason, Kevin)
 - More polish on no-iommufd support (patch 11 - 13) in cdev path (Kevin)
 - iommufd_access_detach() in patch 16 is added by Nic for emulated devices (Kevin, Jason)

v6: https://lore.kernel.org/kvm/20230308132903.465159-1-yi.l.liu@intel.com/#t
 - Add r-b from Jason on patch 01 - 08 and 13 in v5
 - Based on the prerequisite mini-series which makes vfio emulated devices
   be prepared to cdev (Jason)
 - Add the approach to pass a set of device fds to do hot reset ownership
   check, while the zero-length array approach is also kept. (Jason, Kevin, Alex)
 - Drop patch 10 of v5, it is reworked by patch 13 and 17 in v6 (Jason)
 - Store vfio_group pointer in vfio_device_file to check if user is using
   legacy vfio container (Jason)
 - Drop the is_cdev_device flag (introduced in patch 14 of v5) as the group
   pointer stored in vfio_device_file can cover it.
 - Add iommu_group check in the cdev no-iommu path patch 24 (Kevin)
 - Add t-b from Terrence, Nicolin and Matthew (thanks for the help, some patches
   are new in this version, so I just added t-b to the patches that are also
   in v5 and no big change, for others would add in this version).

v5: https://lore.kernel.org/kvm/20230227111135.61728-1-yi.l.liu@intel.com/
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

Nicolin Chen (1):
  iommufd/device: Add iommufd_access_detach() API

Yi Liu (23):
  vfio: Allocate per device file structure
  vfio: Refine vfio file kAPIs for KVM
  vfio: Remove vfio_file_is_group()
  vfio: Accept vfio device file in the KVM facing kAPI
  kvm/vfio: Rename kvm_vfio_group to prepare for accepting vfio device
    fd
  kvm/vfio: Accept vfio device file from userspace
  vfio: Pass struct vfio_device_file * to vfio_device_open/close()
  vfio: Block device access via device fd until device is opened
  vfio: Add cdev_device_open_cnt to vfio_group
  vfio: Make vfio_device_open() single open for device cdev path
  vfio: Make vfio_device_first_open() to accept NULL iommufd for noiommu
  vfio-iommufd: Move noiommu support out of vfio_iommufd_bind()
  vfio-iommufd: Split bind/attach into two steps
  vfio: Record devid in vfio_device_file
  vfio-iommufd: Add detach_ioas support for physical VFIO devices
  vfio-iommufd: Add detach_ioas support for emulated VFIO devices
  vfio: Determine noiommu in vfio_device registration
  vfio: Name noiommu vfio_device with "noiommu-" prefix
  vfio: Add cdev for vfio_device
  vfio: Add VFIO_DEVICE_BIND_IOMMUFD
  vfio: Add VFIO_DEVICE_AT[DE]TACH_IOMMUFD_PT
  vfio: Compile group optionally
  docs: vfio: Add vfio device cdev description

 Documentation/driver-api/vfio.rst             | 135 +++++++-
 Documentation/virt/kvm/devices/vfio.rst       |  53 +++-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   1 +
 drivers/iommu/iommufd/Kconfig                 |   4 +-
 drivers/iommu/iommufd/device.c                |  75 ++++-
 drivers/iommu/iommufd/iommufd_private.h       |   2 +
 drivers/s390/cio/vfio_ccw_ops.c               |   1 +
 drivers/s390/crypto/vfio_ap_ops.c             |   1 +
 drivers/vfio/Kconfig                          |  27 +-
 drivers/vfio/Makefile                         |   3 +-
 drivers/vfio/device_cdev.c                    | 300 ++++++++++++++++++
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |   1 +
 drivers/vfio/group.c                          | 154 ++++++---
 drivers/vfio/iommufd.c                        | 104 +++---
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   2 +
 drivers/vfio/pci/mlx5/main.c                  |   1 +
 drivers/vfio/pci/vfio_pci.c                   |   1 +
 drivers/vfio/platform/vfio_amba.c             |   1 +
 drivers/vfio/platform/vfio_platform.c         |   1 +
 drivers/vfio/vfio.h                           | 245 ++++++++++++--
 drivers/vfio/vfio_main.c                      | 236 +++++++++++---
 include/linux/iommufd.h                       |   1 +
 include/linux/vfio.h                          |  30 +-
 include/uapi/linux/kvm.h                      |  16 +-
 include/uapi/linux/vfio.h                     |  89 ++++++
 samples/vfio-mdev/mbochs.c                    |   1 +
 samples/vfio-mdev/mdpy.c                      |   1 +
 samples/vfio-mdev/mtty.c                      |   1 +
 virt/kvm/vfio.c                               | 141 ++++----
 29 files changed, 1376 insertions(+), 252 deletions(-)
 create mode 100644 drivers/vfio/device_cdev.c

-- 
2.34.1

