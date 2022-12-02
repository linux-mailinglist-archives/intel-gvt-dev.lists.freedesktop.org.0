Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8F6407F9
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Dec 2022 14:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3EB10E07E;
	Fri,  2 Dec 2022 13:54:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EAB10E05D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  2 Dec 2022 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669989250; x=1701525250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7n0SkAtXNEP54Rvy3eAXZE7g3DEKAPeKCMLcGkCqZks=;
 b=oCJgPUER6HGtT3V27zsJlML7QNTkbsKM9KtJ0MRq/8uXfZv04Hejw0CV
 Nt0UcEqHOC200+mHw/+emG+PSDzX0QhD4SAm2d9YORjF6kE0Iq8EcAE2X
 uUNqoOC7qaYyZu7xspsUZEOX0FbMAZHS8OP47PGXJuZmuBcXEtL1m3bK/
 +aChi2Hyn2N0pMcw8C8xTWNXetref/9YxbhDR/wzFB4mTeIq6oZudZ0tG
 CljLwxzeekGvI0JUgb5NjGeisJARSn1qfFi+yd+CECk2XtD3Xjnuu08Ib
 slkS+z1BhDLpAoLEmoWxQAYHzPsk4pRVWDjJ1Bj52PycxQQgV9VOsYUiq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="315983401"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="315983401"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 05:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="675834126"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="675834126"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga008.jf.intel.com with ESMTP; 02 Dec 2022 05:54:03 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: jgg@nvidia.com
Subject: [[iommufd] PATCH v3 0/2] Make mdev driver dma_unmap callback tolerant
 to unmaps come before device open
Date: Fri,  2 Dec 2022 05:54:00 -0800
Message-Id: <20221202135402.756470-1-yi.l.liu@intel.com>
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

(commit: 2079f24ce168f580a30e8eea94e660461d7d0d7a)

Change:
v3:
 - Add explicit check on vgpu->nr_cache_entries, explicitly reset gvt cache (Zhenyu)
 - Add Tony Krowiak's r-b for patch 0002

v2: https://lore.kernel.org/kvm/20221129105831.466954-1-yi.l.liu@intel.com/
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
  iommufd PATCH v2 2/2] vfio/ap: validate iova during dma_unmap and
    trigger irq disable

Yi Liu (1):
  i915/gvt: Move gvt mapping cache initialization to
    intel_vgpu_init_dev()

 drivers/gpu/drm/i915/gvt/kvmgt.c  | 18 ++++++++++++++----
 drivers/s390/crypto/vfio_ap_ops.c | 18 +++++++++++++++++-
 2 files changed, 31 insertions(+), 5 deletions(-)

-- 
2.34.1

