Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DA63BE5E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 11:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D2110E3AF;
	Tue, 29 Nov 2022 10:58:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E034810E3AB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Nov 2022 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669719514; x=1701255514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67kRFHqzmUGB9qguOhZFndL6g8y4s9H/Z5kjkjhRQz4=;
 b=RMA9mdcjp0N4iyZis1Ku/GdLKuU6sN7Ofx67MOLXfgMn0RgyVVtjKtS0
 qjkuJvOXBEISwyUwBq7aSrkdXA9Cj/X/6OuPiJhDKM756OX9PkFDhx9Gf
 s/osr63f+1b3iaNSnUW25GMA1wGXsnQqDTXmrwu8+BaJGBFnkuGRROl47
 wYgJI4JlNcW8bOhmyFmZ4qIzD8/+JZqT7kCqH/rjaCuyS4+p0WkJ+sNpQ
 jXOtCvEZYYNoC0zlmy38Kpu8ScbNa5Xy4yZGpLEq7O8tXiDZYBF76PZM7
 gGSnHMKi6SC6H+hkTE1LmRrhkb+9ASt0eoON0pFR8t7n8zrbPYPIR3/Ei A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295457252"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295457252"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 02:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="621411021"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="621411021"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 29 Nov 2022 02:58:34 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: jgg@nvidia.com
Subject: [[RESEND] iommufd PATCH v2 1/2] i915/gvt: Move gvt mapping cache
 initialization to intel_vgpu_init_dev()
Date: Tue, 29 Nov 2022 02:58:30 -0800
Message-Id: <20221129105831.466954-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129105831.466954-1-yi.l.liu@intel.com>
References: <20221129105831.466954-1-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, alex.williamson@redhat.com,
 chao.p.peng@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

vfio container registers .dma_unmap() callback after the device is opened.
So it's fine for mdev drivers to initialize internal mapping cache in
.open_device(). See vfio_device_container_register().

Now with iommufd an access ops with an unmap callback is registered
when the device is bound to iommufd which is before .open_device()
is called. This implies gvt's .dma_unmap() could be called before its
internal mapping cache is initialized.

The fix is moving gvt mapping cache initialization to vGPU init. While
at it also move ptable initialization together.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7a45e5360caf..f563e5dbe66f 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -671,9 +671,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 
 	vgpu->attached = true;
 
-	kvmgt_protect_table_init(vgpu);
-	gvt_cache_init(vgpu);
-
 	vgpu->track_node.track_write = kvmgt_page_track_write;
 	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
 	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
@@ -1451,9 +1448,17 @@ static int intel_vgpu_init_dev(struct vfio_device *vfio_dev)
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	struct intel_vgpu_type *type =
 		container_of(mdev->type, struct intel_vgpu_type, type);
+	int ret;
 
 	vgpu->gvt = kdev_to_i915(mdev->type->parent->dev)->gvt;
-	return intel_gvt_create_vgpu(vgpu, type->conf);
+	ret = intel_gvt_create_vgpu(vgpu, type->conf);
+	if (ret)
+		return ret;
+
+	kvmgt_protect_table_init(vgpu);
+	gvt_cache_init(vgpu);
+
+	return 0;
 }
 
 static void intel_vgpu_release_dev(struct vfio_device *vfio_dev)
-- 
2.34.1

