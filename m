Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE813B87D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jan 2020 04:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9266E845;
	Wed, 15 Jan 2020 03:58:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E43E6E845
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jan 2020 03:58:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 19:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="213570974"
Received: from unknown (HELO joy-OptiPlex-7040.sh.intel.com) ([10.239.13.9])
 by orsmga007.jf.intel.com with ESMTP; 14 Jan 2020 19:51:18 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: alex.williamson@redhat.com,
	zhenyuw@linux.intel.com
Subject: [PATCH v2 0/2] use vfio_dma_rw to read/write IOVAs from CPU side
Date: Tue, 14 Jan 2020 22:41:32 -0500
Message-Id: <20200115034132.2753-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, pbonzini@redhat.com,
 intel-gvt-dev@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

It is better for a device model to use IOVAs to read/write memory.
And because the rw operations come from CPUs, it is not necessary to call
vfio_pin_pages() to pin those pages.

patch 1 introduces interface vfio_dma_rw in vfio to read/write IOVAs
without pinning user space pages.

patch 2 let gvt switch from kvm side rw interface to vfio_dma_rw.

v2 changelog:
- rename vfio_iova_rw to vfio_dma_rw, vfio iommu driver ops .iova_rw
to .dma_rw. (Alex).
- change iova and len from unsigned long to dma_addr_t and size_t,
respectively. (Alex)
- fix possible overflow in dma->vaddr + iova - dma->iova + offset (Alex)
- split DMAs from on page boundary to on max available size to eliminate
  redundant searching of vfio_dma and switching mm. (Alex)
- add a check for IOMMU_WRITE permission.

Yan Zhao (2):
  vfio: introduce vfio_dma_rw to read/write a range of IOVAs
  drm/i915/gvt: subsitute kvm_read/write_guest with vfio_dma_rw

 drivers/gpu/drm/i915/gvt/kvmgt.c | 26 +++--------
 drivers/vfio/vfio.c              | 45 +++++++++++++++++++
 drivers/vfio/vfio_iommu_type1.c  | 76 ++++++++++++++++++++++++++++++++
 include/linux/vfio.h             |  5 +++
 4 files changed, 133 insertions(+), 19 deletions(-)

-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
