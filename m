Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E124E4FBEBC
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F36310F003;
	Mon, 11 Apr 2022 14:15:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95B10EBB3;
 Mon, 11 Apr 2022 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=83Xr824ZWe/+bYO/7xwxaSh67VlT2bCnejrGqyZ3RhE=; b=ExXjO1y8vLhYwwH/gqilmFGP4+
 whNFaISAjiRPLOaIWuw6lVbEIpc1yvh+i9t0L6cwy7IvEQSyXrsQ11DAJ+jTjLVbMBLVRxkoUzJQz
 dmalJUKxCerzORyj7j9AYYTs61jTztvoXjjhGKAvUhw72XekSZ/0aRqjIAryTS7WVdq+csmQsJfeP
 6eKsiqGxaaW+xYS8NLLYrdsZEW2KSXWco/ZP9BFBqyTmMYWNuFy4GcWobQCNoXIhRBjuUdOcDrVu/
 yJXLWb64YBf5BYVe39meMgy8koTN3R259u+j0Y4vY5dqkFZrHe2essxL1C1XjLHZvrDsPMpse4+yN
 bytyCfqA==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupZ-009L21-7Z; Mon, 11 Apr 2022 14:15:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 34/34] vfio/mdev: Remove mdev drvdata
Date: Mon, 11 Apr 2022 16:14:03 +0200
Message-Id: <20220411141403.86980-35-hch@lst.de>
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

From: Jason Gunthorpe <jgg@nvidia.com>

This is no longer used, remove it.

All usages were moved over to either use container_of() from a vfio_device
or to use dev_drvdata() directly on the mdev.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/mdev.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 1f6f57a3c3168..bb539794f54a8 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -15,7 +15,6 @@ struct mdev_type;
 struct mdev_device {
 	struct device dev;
 	guid_t uuid;
-	void *driver_data;
 	struct list_head next;
 	struct mdev_type *type;
 	bool active;
@@ -66,14 +65,6 @@ struct mdev_driver {
 	struct device_driver driver;
 };
 
-static inline void *mdev_get_drvdata(struct mdev_device *mdev)
-{
-	return mdev->driver_data;
-}
-static inline void mdev_set_drvdata(struct mdev_device *mdev, void *data)
-{
-	mdev->driver_data = data;
-}
 static inline const guid_t *mdev_uuid(struct mdev_device *mdev)
 {
 	return &mdev->uuid;
-- 
2.30.2

