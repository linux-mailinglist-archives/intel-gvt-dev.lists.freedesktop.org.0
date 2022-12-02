Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C1F6407F7
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Dec 2022 14:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E920D10E05D;
	Fri,  2 Dec 2022 13:54:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14A510E07E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  2 Dec 2022 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669989250; x=1701525250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dA0jLnWflQfc0oKFFy7Fcze9aV4au1U5pXgipaOev9I=;
 b=bEYaTw2g4u3hR/YKKZuLRJOkB1fZBtzSTMWAo5YgVfk2iCo8FO9H3XIK
 sxA+btCPqSuWvm+o+wYEOUdzFEkYeQr8PjJ1ZXS79dDxwihWeRcn1gj3O
 pOy1/ej5jGxAirZ7xHSvfCPnO1fTw0mMzkvO8Kh6uAqITIKkg7tmDTP4G
 vzrT0CQMp3PlYLaAr/tDnZC6o5nZXFCMWqnryCDO051+FMOWr1GnJEH/T
 Av8z2Zfvx2UNZtI08jRzwYpckoHux9xnm8xedau8ZwDwmnWyoQgL/mgvz
 dFNREjz7+U6VPGrWyGQ9yYPtJtCzgDXABrW2jwJnld70rQBorW3j2jpKI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="315983407"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="315983407"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 05:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="675834132"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="675834132"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga008.jf.intel.com with ESMTP; 02 Dec 2022 05:54:04 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: jgg@nvidia.com
Subject: [[iommufd] PATCH v3 1/2] i915/gvt: Move gvt mapping cache
 initialization to intel_vgpu_init_dev()
Date: Fri,  2 Dec 2022 05:54:01 -0800
Message-Id: <20221202135402.756470-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202135402.756470-1-yi.l.liu@intel.com>
References: <20221202135402.756470-1-yi.l.liu@intel.com>
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
 drivers/gpu/drm/i915/gvt/kvmgt.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7a45e5360caf..aaf0d9e8da95 100644
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
@@ -718,6 +715,11 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 	kvmgt_protect_table_destroy(vgpu);
 	gvt_cache_destroy(vgpu);
 
+	WARN_ON(vgpu->nr_cache_entries);
+
+	vgpu->gfn_cache = RB_ROOT;
+	vgpu->dma_addr_cache = RB_ROOT;
+
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
 
 	vgpu->attached = false;
@@ -1451,9 +1453,17 @@ static int intel_vgpu_init_dev(struct vfio_device *vfio_dev)
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

