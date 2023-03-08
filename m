Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E06B0822
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D464510E5F4;
	Wed,  8 Mar 2023 13:13:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E38910E5D8;
 Wed,  8 Mar 2023 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678281231; x=1709817231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jonEG8yk9naLkZYL/M4HRCN722cu+ImMHdIJf3nmHqM=;
 b=PNCYp4u8ts2KC0R5Km/pCHbM47hItq74/RQSrK7dzKqvMyCueMcokwgq
 xZBWwUKgF4q5JPVSphI5/AsfhyAAgrN6A8mtjjosHAySYuvFuitgRiixi
 g0ikM/08oRLHbUFP3tVgHqDaQicByTsyiKmDAqWizOD0a8WhOSVNdYrAl
 fS7W9YdJn8yYmN3uDw75+XxEskflH0haRup/W2ukqKhpYHPt80WXpyLeU
 zGZqI5QJOXhCGBSjErYSn4dCiQn1o2iBaHn9dtdMiEV2Z3sjIdlmNhxiT
 IIZu4WBhTEofE5fwJUF8Vz4ghQANOwVwVq1NioVmely04Qb7d7Ks75Hgg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338474767"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="338474767"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670330894"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="670330894"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 05:13:41 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v1 0/5] vfio: Make emulated devices prepared for vfio device
 cdev
Date: Wed,  8 Mar 2023 05:13:35 -0800
Message-Id: <20230308131340.459224-1-yi.l.liu@intel.com>
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

The .bind_iommufd op of vfio emulated devices are either empty or does
nothing. This is different with the vfio physical devices, to add vfio
device cdev, need to make them act the same.

This series first makes the .bind_iommufd op of vfio emulated devices
to create iommufd_access, this introduces a new iommufd API. Then let
the driver that does not provide .bind_iommufd op to use the vfio emulated
iommufd op set.

Thanks,
	Yi Liu

Nicolin Chen (1):
  iommufd: Create access in vfio_iommufd_emulated_bind()

Yi Liu (4):
  vfio-iommufd: No need to record iommufd_ctx in vfio_device
  vfio-iommufd: Make vfio_iommufd_emulated_bind() return iommufd_access
    ID
  Samples/mdev: Uses the vfio emulated iommufd ops set in the mdev
    sample drivers
  vfio: Check the presence for iommufd callbacks in
    __vfio_register_dev()

 drivers/iommu/iommufd/device.c          | 107 ++++++++++++++++++------
 drivers/iommu/iommufd/iommufd_private.h |   1 +
 drivers/iommu/iommufd/selftest.c        |   8 +-
 drivers/vfio/iommufd.c                  |  35 ++++----
 drivers/vfio/vfio_main.c                |   5 +-
 include/linux/iommufd.h                 |   5 +-
 include/linux/vfio.h                    |   1 -
 samples/vfio-mdev/mbochs.c              |   3 +
 samples/vfio-mdev/mdpy.c                |   3 +
 samples/vfio-mdev/mtty.c                |   3 +
 10 files changed, 119 insertions(+), 52 deletions(-)

-- 
2.34.1

