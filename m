Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACC4427C4
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0371B6FAC7;
	Tue,  2 Nov 2021 07:08:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4DC6FAC7;
 Tue,  2 Nov 2021 07:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tcK+GeyX8NZZN0h0/L+3lzdbP4oBFdoZo3maiXxcc6E=; b=ieFWj5SXjKWewgQcpvTV7WNO5y
 A1z7vpbmS3+tJyjzYFkD5/QzhNPu9iJV0Tf8Czvbz+IWdKMsCZvBQv3cNuv6L0PFPWAyeQq5NJPNr
 i/gFOmF5tQRdIzT9soETHatsVrQv0j72nuhth8gN9xOW4BujVx3CQg37l8+st5Q+P2DjkYA4oO/RX
 PB19hzFbz/OXBphijO5LQWJIWy+4uvWv+IOCo1LNLWPu77+kL5HPNvphvMeTJJOqXdYaz0T9QeOS6
 0EKfQ1I0jhzUIRc+VoMVf4TaBJLSC5rdDmkrpXz+PKBAng0o80EJnS+SEslZHpFCrHZiDQXvjOpT2
 h9xtkHVQ==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnuI-000iQe-TQ; Tue, 02 Nov 2021 07:08:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 25/29] drm/i915/gvt: streamline intel_vgpu_create
Date: Tue,  2 Nov 2021 08:05:57 +0100
Message-Id: <20211102070601.155501-26-hch@lst.de>
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

Initialize variables at declaration time, avoid pointless gotos and
cater for the fact that intel_gvt_create_vgpu can't return NULL.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index a369564fd8509..021cd8328db32 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -702,26 +702,19 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num)
 
 static int intel_vgpu_create(struct mdev_device *mdev)
 {
-	struct intel_vgpu *vgpu = NULL;
+	struct device *pdev = mdev_parent_dev(mdev);
+	struct intel_gvt *gvt = kdev_to_i915(pdev)->gvt;
 	struct intel_vgpu_type *type;
-	struct device *pdev;
-	struct intel_gvt *gvt;
-	int ret;
-
-	pdev = mdev_parent_dev(mdev);
-	gvt = kdev_to_i915(pdev)->gvt;
+	struct intel_vgpu *vgpu;
 
 	type = &gvt->types[mdev_get_type_group_id(mdev)];
-	if (!type) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (!type)
+		return -EINVAL;
 
 	vgpu = intel_gvt_create_vgpu(gvt, type);
-	if (IS_ERR_OR_NULL(vgpu)) {
-		ret = vgpu == NULL ? -EFAULT : PTR_ERR(vgpu);
-		gvt_err("failed to create intel vgpu: %d\n", ret);
-		goto out;
+	if (IS_ERR(vgpu)) {
+		gvt_err("failed to create intel vgpu: %ld\n", PTR_ERR(vgpu));
+		return PTR_ERR(vgpu);
 	}
 
 	INIT_WORK(&vgpu->release_work, intel_vgpu_release_work);
@@ -731,10 +724,7 @@ static int intel_vgpu_create(struct mdev_device *mdev)
 
 	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
 		     dev_name(mdev_dev(mdev)));
-	ret = 0;
-
-out:
-	return ret;
+	return 0;
 }
 
 static int intel_vgpu_remove(struct mdev_device *mdev)
-- 
2.30.2

