Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BC6C9F99
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18E110E344;
	Mon, 27 Mar 2023 09:33:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2479F10E338;
 Mon, 27 Mar 2023 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909635; x=1711445635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VkV/8FTePBOMnCIePLYijAz1Ei748yULDz/BHYMAuKo=;
 b=OLp2Vx6yRgfPeRdvAJqidmyObOd4/6ifNOhWXbrLJv+qUtDaZ03kDhwT
 yCypMjNj5F6wYRkeQgmK7En8lld6TLg17mfoPLF/50DEhH5DMFyG2gM0Z
 bHvabtrDddwonySRkwYkz7ZSGtwr9xSZwmk/MT5XAfmY2S0S8s1a4Rsth
 M5GGn1a6U5D+7YlkWy0I8pxqzIFYI9rvQan7AqtauX4EF82sdCNwWLJJs
 f2IlN4oJqvvG9hxRa2eARdI+xdP5bdHQFvciPX9p3ngLv9400qBjqYyXQ
 0uXdJophKv9GXw+aw0n77GmwQPDH6kzmeDtKuPYcMrg0YQFy9quK6hQWK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402817900"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="402817900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685908071"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="685908071"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 02:33:53 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 0/6] vfio: Make emulated devices prepared for vfio device
 cdev
Date: Mon, 27 Mar 2023 02:33:45 -0700
Message-Id: <20230327093351.44505-1-yi.l.liu@intel.com>
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

The .bind_iommufd op of vfio emulated devices are either empty or does
nothing. This is different with the vfio physical devices, to add vfio
device cdev, need to make them act the same.

This series first makes the .bind_iommufd op of vfio emulated devices
to create iommufd_access, this introduces a new iommufd API. Then let
the driver that does not provide .bind_iommufd op to use the vfio emulated
iommufd op set. This makes all vfio device drivers have consistent iommufd
operations, which is good for adding new device uAPIs in the device cdev
series.

Change log:

v3:
 - Use iommufd_get_ioas() for ioas get, hence patch 01 is added to modify
   the input parameter of iommufd_get_ioas(). (Jason)
 - Add r-b from Jason and Kevin
 - Add t-b from Terrence Xu

v2: https://lore.kernel.org/kvm/20230316121526.5644-1-yi.l.liu@intel.com/
 - Add r-b from Kevin and Jason
 - Refine patch 01 per comments from Jason and Kevin

v1: https://lore.kernel.org/kvm/20230308131340.459224-1-yi.l.liu@intel.com/

Thanks,
        Yi Liu
    
Nicolin Chen (1):
  iommufd: Create access in vfio_iommufd_emulated_bind()

Yi Liu (5):
  iommu/iommufd: Pass iommufd_ctx pointer in iommufd_get_ioas()
  vfio-iommufd: No need to record iommufd_ctx in vfio_device
  vfio-iommufd: Make vfio_iommufd_emulated_bind() return iommufd_access
    ID
  vfio/mdev: Uses the vfio emulated iommufd ops set in the mdev sample
    drivers
  vfio: Check the presence for iommufd callbacks in
    __vfio_register_dev()

 drivers/iommu/iommufd/device.c          | 55 +++++++++++++++----------
 drivers/iommu/iommufd/ioas.c            | 14 +++----
 drivers/iommu/iommufd/iommufd_private.h |  4 +-
 drivers/iommu/iommufd/selftest.c        | 14 ++++---
 drivers/iommu/iommufd/vfio_compat.c     |  2 +-
 drivers/vfio/iommufd.c                  | 37 ++++++++---------
 drivers/vfio/vfio_main.c                |  5 ++-
 include/linux/iommufd.h                 |  5 ++-
 include/linux/vfio.h                    |  1 -
 samples/vfio-mdev/mbochs.c              |  3 ++
 samples/vfio-mdev/mdpy.c                |  3 ++
 samples/vfio-mdev/mtty.c                |  3 ++
 12 files changed, 85 insertions(+), 61 deletions(-)

-- 
2.34.1

