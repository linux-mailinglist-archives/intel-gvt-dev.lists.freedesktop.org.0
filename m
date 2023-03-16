Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2966BCF20
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6266710ECDC;
	Thu, 16 Mar 2023 12:15:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F6410E19F;
 Thu, 16 Mar 2023 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678968928; x=1710504928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sxytFivzmEF3JiIZ5gxIgrAj7qk6BTLqEQSy5lsJZpY=;
 b=AQ8QqBosq/3VVKoOPEzh6txq85zusjYyhtoOQku6PaD7cgaLhoXed5MV
 jgiuGmRQ0kLcbyc0LhwDm6Ke9WhK2aVVAlf7YaIPY63J+/410pV7FOcK9
 U4YPK65io7Ocj7ATu5N8xTJk2gPFtgnGrDxpgH+gUU+iTmQvqaixNuMF5
 6KGm+Jh/9q7by2hEI9HsPOpHcR+yZxQ9kO0AGFZGsEGfH7OT+xYsYdnGh
 QyTAZs8oz2NVUw6syejlwxcHahouCQyGl0sbcBtfD2wVwI2LJXlyNLeMH
 PVFnVTbg5+AwTOwvZmPyuiUZEcb7ON+cqWNUWIbHGoPORDF3vJ/NKRzTc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336661364"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336661364"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="679874203"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="679874203"
Received: from unknown (HELO 984fee00a4c6.jf.intel.com) ([10.165.58.231])
 by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 05:15:27 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 0/5] vfio: Make emulated devices prepared for vfio device
 cdev
Date: Thu, 16 Mar 2023 05:15:21 -0700
Message-Id: <20230316121526.5644-1-yi.l.liu@intel.com>
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
iommufd op set. This makes all vfio device drivers have consistent iommufd
operations, which is good for adding new device uAPIs in the device cdev
series.

Change log:

v2:
 - Add r-b from Kevin and Jason
 - Refine patch 01 per comments from Jason and Kevin

v1: https://lore.kernel.org/kvm/20230308131340.459224-1-yi.l.liu@intel.com/

Thanks,
	Yi Liu

Nicolin Chen (1):
  iommufd: Create access in vfio_iommufd_emulated_bind()

Yi Liu (4):
  vfio-iommufd: No need to record iommufd_ctx in vfio_device
  vfio-iommufd: Make vfio_iommufd_emulated_bind() return iommufd_access
    ID
  vfio/mdev: Uses the vfio emulated iommufd ops set in the mdev sample
    drivers
  vfio: Check the presence for iommufd callbacks in
    __vfio_register_dev()

 drivers/iommu/iommufd/device.c   | 57 ++++++++++++++++++++------------
 drivers/iommu/iommufd/selftest.c |  8 +++--
 drivers/vfio/iommufd.c           | 39 +++++++++++-----------
 drivers/vfio/vfio_main.c         |  5 +--
 include/linux/iommufd.h          |  5 +--
 include/linux/vfio.h             |  1 -
 samples/vfio-mdev/mbochs.c       |  3 ++
 samples/vfio-mdev/mdpy.c         |  3 ++
 samples/vfio-mdev/mtty.c         |  3 ++
 9 files changed, 76 insertions(+), 48 deletions(-)

-- 
2.34.1

