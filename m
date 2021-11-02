Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82F4427C0
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8D96FAB5;
	Tue,  2 Nov 2021 07:08:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6616C6FABF;
 Tue,  2 Nov 2021 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=0cvxm+1NDIuIjwW6TCzfd8E3JMSEUjYmjWbtvzBc2eY=; b=d/eDM1VEchLVS3pbAngUVSb+Qf
 b2W9RL6bmvkl2DcGj7oxtAp7vHWBhMzv9RBi0DAezAZcn612RJppDZKn10f8vcl9rhTkFvKLL7pMo
 oF4zA4QvA7ucMy6xCmz7zoYReSC6fRyTEt0XgmaGL+Th5VCIpliXhb5ZjCVR+0+XLae/9Q3t8Nqxg
 X2Y7jzQfct9ndhhgvtwkSkgNRmjxciUhMlgo++kAneKZ1f30dwf+COv+yq/2G+PYWO+wRy7cwKUef
 FflP0r+U8CavuCOSRgdlf9i2rBL2YjQFZeikY0UjPf+ABm/r0E2B+6yj2BULeXI20ebAhVn3QN2RO
 56xR7aNw==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnuE-000iOC-GT; Tue, 02 Nov 2021 07:08:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 24/29] drm/i915/gvt: remove the extra vfio_device refcounting
 for dmabufs
Date: Tue,  2 Nov 2021 08:05:56 +0100
Message-Id: <20211102070601.155501-25-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

All the dmabufs are torn down when th VGPU is released, so there is
no need for extra refcounting here.

Based on an patch from Jason Gunthorpe.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c | 12 ------------
 drivers/gpu/drm/i915/gvt/gvt.h    |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index eacfe7beaaf67..88c4f8b02ffb6 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -134,7 +134,6 @@ static void dmabuf_gem_object_free(struct kref *kref)
 					struct intel_vgpu_dmabuf_obj, list);
 			if (dmabuf_obj == obj) {
 				list_del(pos);
-				vfio_device_put(vgpu->vfio_device);
 				idr_remove(&vgpu->object_idr,
 					   dmabuf_obj->dmabuf_id);
 				kfree(dmabuf_obj->info);
@@ -474,16 +473,6 @@ int intel_vgpu_query_plane(struct intel_vgpu *vgpu, void *args)
 
 	kref_init(&dmabuf_obj->kref);
 
-	mutex_lock(&vgpu->dmabuf_lock);
-	vgpu->vfio_device = vfio_device_get_from_dev(mdev_dev(vgpu->mdev));
-	if (!vgpu->vfio_device) {
-		gvt_vgpu_err("failed to get vfio device\n");
-		mutex_unlock(&vgpu->dmabuf_lock);
-		ret = -ENODEV;
-		goto out_free_info;
-	}
-	mutex_unlock(&vgpu->dmabuf_lock);
-
 	update_fb_info(gfx_plane_info, &fb_info);
 
 	INIT_LIST_HEAD(&dmabuf_obj->list);
@@ -589,7 +578,6 @@ void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
 		dmabuf_obj->vgpu = NULL;
 
 		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
-		vfio_device_put(vgpu->vfio_device);
 		list_del(pos);
 
 		/* dmabuf_obj might be freed in dmabuf_obj_put */
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 7c87d7638e6b2..fa83365227514 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -230,7 +230,6 @@ struct intel_vgpu {
 	struct kvm *kvm;
 	struct work_struct release_work;
 	atomic_t released;
-	struct vfio_device *vfio_device;
 	struct vfio_group *vfio_group;
 
 	struct kvm_page_track_notifier_node track_node;
-- 
2.30.2

