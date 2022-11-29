Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE663BD0D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 10:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ADD10E3A4;
	Tue, 29 Nov 2022 09:35:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A62210E3A5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Nov 2022 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669714545; x=1701250545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=shWxgKsdB1GFAq34prMvhlGT559Htyp40wmiBBeqxdI=;
 b=ADfI6Al7OSr+jbUe+jFZBAT4rgmNbZ0jv/hrLzmuvSCji5xKMI6YajLC
 gZCHPTTKzyqAH/cpTNW48B3LYtWWfv4Y4E2jcFv2et+eqavQjoV0aNmwq
 IpY7MCTr02f6QLA1xP8AzQ4Apj0g+a6fGgEx6wgmhDdbnXVXfD70dScxJ
 7cdv6AWjGkxEFYqA0XDgDle73p8cAhjs5g5zmzPN0Nh0BHDG32pkCFvF3
 CcHa5S7XhQVY8+TnkCU8tgjtIqYDdLTr3tHSc7N3Ulv9vDXtk5i01P6FD
 gXik7r4INkjAVvjQkN+7WeUz3fY5hKCn1G+svYgqh9aEqPltR140fjT/Y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295442183"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295442183"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 01:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="818156887"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="818156887"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga005.jf.intel.com with ESMTP; 29 Nov 2022 01:35:37 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: jgg@nvidia.com
Subject: [iommufd PATCH v2 0/2] Make mdev driver dma_unmap callback tolerant
 to unmaps come before device open
Date: Tue, 29 Nov 2022 01:35:33 -0800
Message-Id: <20221129093535.359357-1-yi.l.liu@intel.com>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, linux-s390@vger.kernel.org,
 kevin.tian@intel.com, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, alex.williamson@redhat.com,
 chao.p.peng@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Jason's "Connect VFIO to IOMMUFD" introduces vfio iommufd compat mode. Under
this mode, vfio_iommufd_bind() creates an access which has an unmap callback,
which can be called immediately. This means mdev drivers may receive unmap
requests before the mdev is opened. For now, there are only three drivers
(gvt, vfio-ap and vfio-ccw) providing dma_unmap(). vfio-ccw is fine with
such requests. While gvt-g and vfio-ap may have potential problem with such
requests due to internal implementation. This series tries to enhance the two
drivers.

This series is based on Jason's below branch.

https://github.com/jgunthorpe/linux/tree/iommufd

(commit: 41973418f6c8c241ed5647d1408d5b917f24dfd8)

Change:
v2:
 - Refine the cover letter and commit message of patch 0001 (Kevin)
 - Rename patch 0001 to better fit the commit message
 - Add r-b from Zhi for patch 0001
 - tweak iova range test to assume page-aligned for patch 0002 (Jason)
 - Remove break so all queues within range are removed for patch 0002 (Kevin)

v1: https://lore.kernel.org/kvm/20221123134832.429589-1-yi.l.liu@intel.com/

Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Jason Herne <jjherne@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org

Regards,
	Yi Liu

Matthew Rosato (1):
  vfio/ap: validate iova during dma_unmap and trigger irq disable

Yi Liu (1):
  i915/gvt: Move gvt mapping cache initialization to vGPU creation

 drivers/gpu/drm/i915/gvt/gvt.h    |  2 ++
 drivers/gpu/drm/i915/gvt/kvmgt.c  |  7 ++-----
 drivers/gpu/drm/i915/gvt/vgpu.c   |  2 ++
 drivers/s390/crypto/vfio_ap_ops.c | 18 +++++++++++++++++-
 4 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.34.1

