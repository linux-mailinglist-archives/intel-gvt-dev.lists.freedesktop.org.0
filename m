Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E651163BE5D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 11:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B057810E3AB;
	Tue, 29 Nov 2022 10:58:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712E010E3AB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Nov 2022 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669719514; x=1701255514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gpq6XMGJA8yeDNB1SV9LoTeJdCcXiIy6XwKuTb6lJ7w=;
 b=XHzHDW8DYJpn68D2tmJhZqsn2TqQUt6JQoY3samjuZ1zxgavqlplD/uz
 z7I2hiusJ7oq6sD3X3CSbaG8EUqEqYn5LeJC2d1iDfcAdWNvjaqnvvo86
 Lwh1qXcls1gv7pR3Ld9RwBKkdVXB2C9GcpdyfdLu0BZPUIdsHI6S46PTZ
 9qeWvEdkNxzdWQZGGhROLvu6aCYo4otlceXGlV80Abz/pgny5Zi+6PCPL
 uKfUClJ8UYvmvbHh/deH7PQkbs4wOCXwAOD4FeU0ro50z3HHD1xY5VJo3
 LXlu0euLCeEH9Je9PDlcALCjvt4k0RaFBHaVxHOrFBnFHtwzN/E4AapXt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295457246"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295457246"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 02:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="621411018"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="621411018"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 29 Nov 2022 02:58:33 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: jgg@nvidia.com
Subject: [[RESEND] iommufd PATCH v2 0/2] Make mdev driver dma_unmap callback
 tolerant to unmaps come before device open
Date: Tue, 29 Nov 2022 02:58:29 -0800
Message-Id: <20221129105831.466954-1-yi.l.liu@intel.com>
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
 - Tweak iova range test to assume page-aligned for patch 0002 (Jason)
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
  i915/gvt: Move gvt mapping cache initialization to
    intel_vgpu_init_dev()

 drivers/gpu/drm/i915/gvt/kvmgt.c  | 13 +++++++++----
 drivers/s390/crypto/vfio_ap_ops.c | 18 +++++++++++++++++-
 2 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.34.1

