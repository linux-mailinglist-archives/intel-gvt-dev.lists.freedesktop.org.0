Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6263BD0C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 10:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A7910E3A2;
	Tue, 29 Nov 2022 09:35:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A0110E3A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Nov 2022 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669714545; x=1701250545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=imlqJJLzk3XCQrZvkhpFqQz0O/HUPdUfvXwA2mtMm7Q=;
 b=PBJxJVCdqlrEMC/Av2d7KR+aMIRP7/ndsBobH9GogkLaY0l88RLBiDbK
 wKIkmE1ba8OxMtNtS8QdkrENjtFBYQ1rfzjqBe/Mttl2a2HrS70v/vWVD
 f6nDL1jikzau08VWj3kb7EAw78d/TktTbqruXimsbsb+L6LmEaLhTlV6f
 g5u3ImZA0EnBRCTv6a19koB5XHhspFq5cLW0GHJTrqrF3TabGzp0TgFlD
 fukmPTcSXAIv6bDb8hhokEUa00XD8d8vScmoEafBVvDdMTgc86dawPKAP
 PhGHbz4ZiN3kIiJ4bna0fFYR2W6fy5Q+Q54AwoH2kss713PS9w86cLTWS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295442189"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295442189"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 01:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="818156892"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="818156892"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga005.jf.intel.com with ESMTP; 29 Nov 2022 01:35:38 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: jgg@nvidia.com
Subject: [iommufd PATCH v2 1/2] i915/gvt: Move gvt mapping cache
 initialization to vGPU creation
Date: Tue, 29 Nov 2022 01:35:34 -0800
Message-Id: <20221129093535.359357-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129093535.359357-1-yi.l.liu@intel.com>
References: <20221129093535.359357-1-yi.l.liu@intel.com>
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
 alex.williamson@redhat.com, chao.p.peng@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

vfio container registers .dma_unmap() callback after the device is opened.
So it's fine for mdev drivers to initialize internal mapping cache in
.open_device(). See vfio_device_container_register().

Now with iommufd an access ops with an unmap callback is registered
when the device is bound to iommufd which is before .open_device()
is called. This implies gvt's .dma_unmap() could be called before its
internal mapping cache is initialized.

The fix is moving gvt mapping cache initialization to vGPU creation.
While at it also move ptable initialization together.

Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h   | 2 ++
 drivers/gpu/drm/i915/gvt/kvmgt.c | 7 ++-----
 drivers/gpu/drm/i915/gvt/vgpu.c  | 2 ++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index dbf8d7470b2c..a3a7e16078ba 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -754,6 +754,8 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
 
+void gvt_cache_init(struct intel_vgpu *vgpu);
+void kvmgt_protect_table_init(struct intel_vgpu *info);
 int intel_gvt_page_track_add(struct intel_vgpu *info, u64 gfn);
 int intel_gvt_page_track_remove(struct intel_vgpu *info, u64 gfn);
 int intel_gvt_dma_pin_guest_page(struct intel_vgpu *vgpu, dma_addr_t dma_addr);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7a45e5360caf..a9e4eda94057 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -322,7 +322,7 @@ static void gvt_cache_destroy(struct intel_vgpu *vgpu)
 	}
 }
 
-static void gvt_cache_init(struct intel_vgpu *vgpu)
+void gvt_cache_init(struct intel_vgpu *vgpu)
 {
 	vgpu->gfn_cache = RB_ROOT;
 	vgpu->dma_addr_cache = RB_ROOT;
@@ -330,7 +330,7 @@ static void gvt_cache_init(struct intel_vgpu *vgpu)
 	mutex_init(&vgpu->cache_lock);
 }
 
-static void kvmgt_protect_table_init(struct intel_vgpu *info)
+void kvmgt_protect_table_init(struct intel_vgpu *info)
 {
 	hash_init(info->ptable);
 }
@@ -671,9 +671,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 
 	vgpu->attached = true;
 
-	kvmgt_protect_table_init(vgpu);
-	gvt_cache_init(vgpu);
-
 	vgpu->track_node.track_write = kvmgt_page_track_write;
 	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
 	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 56c71474008a..036e1a72a26b 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -382,6 +382,8 @@ int intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
 
 	intel_gvt_update_reg_whitelist(vgpu);
 	mutex_unlock(&gvt->lock);
+	kvmgt_protect_table_init(vgpu);
+	gvt_cache_init(vgpu);
 	return 0;
 
 out_clean_sched_policy:
-- 
2.34.1

