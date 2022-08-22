Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883B59B950
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Aug 2022 08:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F99499ED8;
	Mon, 22 Aug 2022 06:22:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E1599EBB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Aug 2022 06:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Z1h3673Uq2kJ2j+5Me5K20pUonQL6wknNcFIcptZiYs=; b=3tL6Tc3hwDW+ULFnC4Ys+2wgBV
 Q6qyylmRcbH35a6nA3O7ai+RZdZ79ZAD4OgTP0bmqpVWZtbAgczgVcP654Kw6fTMVLkX7k6bSq41H
 fakaRIQcbM0GS5KcwFuaCDsuQ/FPwSNGsITp8MKwPO4FwLhcR7BbK8p1vfUa9/+lrTKYwE6fx0hpy
 HPCohIfJ1T1H0O5Ye0kHbE1p3TeZ3HFw2101vftEzrOINqYbDWoaC3wPcMSVDz3P6pnwVkgX03kGN
 gFyOu0wm8ZpBZYsPAfw7BJTHPW4O4ZD+DCc28cu811eh4gx6EX171LihuVHXWqsU0iACT7+IERUt9
 AefekKCw==;
Received: from [2001:4bb8:198:6528:7eb3:3a42:932d:eeba] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oQ0pP-005NVx-NW; Mon, 22 Aug 2022 06:22:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 06/14] vfio/mdev: remove mdev_from_dev
Date: Mon, 22 Aug 2022 08:22:00 +0200
Message-Id: <20220822062208.152745-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822062208.152745-1-hch@lst.de>
References: <20220822062208.152745-1-hch@lst.de>
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
Cc: linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Just open code it in the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed By: Kirti Wankhede <kwankhede@nvidia.com>
---
 drivers/vfio/mdev/mdev_core.c | 6 ++----
 include/linux/mdev.h          | 4 ----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 2d95a497fd3b2..bde7ce620dae0 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -53,10 +53,8 @@ static void mdev_device_remove_common(struct mdev_device *mdev)
 
 static int mdev_device_remove_cb(struct device *dev, void *data)
 {
-	struct mdev_device *mdev = mdev_from_dev(dev);
-
-	if (mdev)
-		mdev_device_remove_common(mdev);
+	if (dev->bus == &mdev_bus_type)
+		mdev_device_remove_common(to_mdev_device(dev));
 	return 0;
 }
 
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 19bc93c10e8c7..4f558de52fd94 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -102,9 +102,5 @@ static inline struct device *mdev_dev(struct mdev_device *mdev)
 {
 	return &mdev->dev;
 }
-static inline struct mdev_device *mdev_from_dev(struct device *dev)
-{
-	return dev->bus == &mdev_bus_type ? to_mdev_device(dev) : NULL;
-}
 
 #endif /* MDEV_H */
-- 
2.30.2

