Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 769074FBE7C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350F110E2A8;
	Mon, 11 Apr 2022 14:14:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD8710E2A8;
 Mon, 11 Apr 2022 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2CKZnVDwRbmavT6IByuUkxzVO/hIRHVsBfHKJD/UCD4=; b=Qa6yGQ9PChKdxgeyF3wQjKEoPW
 MJCjS8bN7MrzmtpZrO1CE0wZoQAP/iqhKu/bLAM+mdWTrxMThW9HsZ7cEeKQcLECKnkq4ED0yS+wB
 Q1ovDGwFdtXSITpaLgGxwqitn+DtHqxeT+EQOnEB2kwmmm1F/0WD13lFrq8ncZ5KVXeNABuAWyKZf
 OU4TDj+bRdmAzd8MYpoDZ60de1jnXkctm1tM9mpcerSvO8IGM+smkgpArNND+iFIRcVWhMFR+CdN7
 imh2cH7NXTyVf9Hfjkx/dcwWNO3EIYD2wAedO3HhOM/xB2exds6xSa70yD492L5sDNV92rp4pMQsp
 FZJLSXAA==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduo5-009KK6-MC; Mon, 11 Apr 2022 14:14:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 03/34] drm/i915/gvt: rename intel_vgpu_ops to
 intel_vgpu_mdev_ops
Date: Mon, 11 Apr 2022 16:13:32 +0200
Message-Id: <20220411141403.86980-4-hch@lst.de>
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

Free the intel_vgpu_ops symbol name for something that fits better.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 5231ce8084b36..e3f0c555ed5f6 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1765,7 +1765,7 @@ static const struct attribute_group *intel_vgpu_groups[] = {
 	NULL,
 };
 
-static struct mdev_parent_ops intel_vgpu_ops = {
+static struct mdev_parent_ops intel_vgpu_mdev_ops = {
 	.mdev_attr_groups       = intel_vgpu_groups,
 	.create			= intel_vgpu_create,
 	.remove			= intel_vgpu_remove,
@@ -1788,9 +1788,9 @@ static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
 		return ret;
 
 	intel_gvt_ops = ops;
-	intel_vgpu_ops.supported_type_groups = gvt_vgpu_type_groups;
+	intel_vgpu_mdev_ops.supported_type_groups = gvt_vgpu_type_groups;
 
-	ret = mdev_register_device(dev, &intel_vgpu_ops);
+	ret = mdev_register_device(dev, &intel_vgpu_mdev_ops);
 	if (ret)
 		intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
 
-- 
2.30.2

