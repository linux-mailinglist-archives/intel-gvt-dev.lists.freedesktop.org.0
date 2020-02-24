Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E316A0CD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Feb 2020 09:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D66C6E09C;
	Mon, 24 Feb 2020 08:57:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0825F6E09C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Feb 2020 08:57:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 00:57:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; d="scan'208";a="231068899"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 00:57:38 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v3 6/7] drm/i915/gvt: avoid unnecessary lookup in each vfio
 pin & unpin pages
Date: Mon, 24 Feb 2020 03:48:14 -0500
Message-Id: <20200224084814.31945-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224084350.31574-1-yan.y.zhao@intel.com>
References: <20200224084350.31574-1-yan.y.zhao@intel.com>
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
 linux-kernel@vger.kernel.org, peterx@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, intel-gvt-dev@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

substitute vfio_pin_pages() and vfio_unpin_pages() with
vfio_pin_pages_from_group() and vfio_unpin_pages_from_group(), so that
it will not go through looking up, referencing, dereferencing of VFIO
group in each call.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3d6362fd94e7..aa7c6f2f1fb8 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -129,7 +129,8 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
-		ret = vfio_unpin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1);
+		ret = vfio_unpin_pages_from_group(vgpu->vdev.vfio_group,
+						  &cur_gfn, 1);
 		WARN_ON(ret != 1);
 	}
 }
@@ -152,8 +153,9 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 		unsigned long pfn;
 
-		ret = vfio_pin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1,
-				     IOMMU_READ | IOMMU_WRITE, &pfn);
+		ret = vfio_pin_pages_from_group(vgpu->vdev.vfio_group,
+						&cur_gfn, 1,
+						IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
 				     cur_gfn, ret);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
