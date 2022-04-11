Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2404FBEA8
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EC510EDD7;
	Mon, 11 Apr 2022 14:15:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C8010EC2C;
 Mon, 11 Apr 2022 14:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hqtGJWFU5UxJXTWiuv/FMcNVyUUv+JnqKyxlKX1n9BM=; b=pMtIWHOM5eXHf4PtHumQh0LlZo
 T9uf89kNIbGhHGnexNokhRRInSC7tfRLHE0FACINgwbqC4B636XCBWRwOdL27qHUIW8sI9zkjCtqk
 juc68yIkEEz2sQDwxQO+15rrsa4TRnDTCZPbxhm+3HELR41NXHatWk6J//nQ2In2mJipRImddhZ5G
 uLTPGOuFrD/Kvbazqc7DcMYvcgOl5JONv1zkE74nRL1nYRTMXK6SxgCTHt9BKnOjA+w503p+A+ol0
 Ya2YlA4I5fN0KvIGSN55uckItuJ3gKCX/NYpvmKFF1DSSo5XdaU14ZIeU6B5dpNWGXs2DAussFyCq
 nF+5r4rg==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndup6-009Ks8-4y; Mon, 11 Apr 2022 14:15:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 24/34] drm/i915/gvt: remove the extra vfio_device refcounting
 for dmabufs
Date: Mon, 11 Apr 2022 16:13:53 +0200
Message-Id: <20220411141403.86980-25-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411141403.86980-1-hch@lst.de>
References: <20220411141403.86980-1-hch@lst.de>
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
index 90443306a9ad4..01e54b45c5c1b 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -139,7 +139,6 @@ static void dmabuf_gem_object_free(struct kref *kref)
 			dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 			if (dmabuf_obj == obj) {
 				list_del(pos);
-				vfio_device_put(vgpu->vfio_device);
 				idr_remove(&vgpu->object_idr,
 					   dmabuf_obj->dmabuf_id);
 				kfree(dmabuf_obj->info);
@@ -473,16 +472,6 @@ int intel_vgpu_query_plane(struct intel_vgpu *vgpu, void *args)
 
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
@@ -587,7 +576,6 @@ void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
 		dmabuf_obj->vgpu = NULL;
 
 		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
-		vfio_device_put(vgpu->vfio_device);
 		list_del(pos);
 
 		/* dmabuf_obj might be freed in dmabuf_obj_put */
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 865997c5005d5..8565189e0c0dd 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -231,7 +231,6 @@ struct intel_vgpu {
 	struct kvm *kvm;
 	struct work_struct release_work;
 	atomic_t released;
-	struct vfio_device *vfio_device;
 	struct vfio_group *vfio_group;
 
 	struct kvm_page_track_notifier_node track_node;
-- 
2.30.2

