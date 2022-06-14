Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DEF54A861
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jun 2022 06:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E275910FAC0;
	Tue, 14 Jun 2022 04:54:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF73E10F8FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jun 2022 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xVrT4eVcIYRujIwa3JDjYXEZV1LmJHxRXGA2Ss7neX8=; b=sZWhNkQZSA2tufMa8NpcSAzUvE
 mzv0SxsvkYadS+eSGnAUEf5edN2DYo869XrOWb7FsQ94dkJYX22aoZtIkwAUKkBj8IPH9hw+3TYVv
 p0owWShjnJYx8ku+CpJE631QyQyhizQbpjwnjaiYucT9XaAkWfopAIe7S8dRpOnYnxdN/warHCSQj
 KMIYa3Z/MBbbh2+sesgBROc7P+UguObmxQx5D79jeW+lQT/FIxX4n2X+ENusi5ZJFUZKHLKi28uSr
 Hado4s+Ep7Evv1022J8Hc3x0iJmN2iTM0EBxH7U1RJUCBqzur5yQrCdE2GvUkTa+GjLCCsnDquKpl
 Oe4JEBlA==;
Received: from [2001:4bb8:180:36f6:1fed:6d48:cf16:d13c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o0yZf-0072fF-JX; Tue, 14 Jun 2022 04:54:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 05/13] vfio/mdev: remove mdev_from_dev
Date: Tue, 14 Jun 2022 06:54:20 +0200
Message-Id: <20220614045428.278494-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614045428.278494-1-hch@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
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
 intel-gvt-dev@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 kvm@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Just open code it in the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/mdev/mdev_core.c | 6 ++----
 include/linux/mdev.h          | 4 ----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index fe4230b21993d..49a4a26787ce6 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -54,10 +54,8 @@ static void mdev_device_remove_common(struct mdev_device *mdev)
 
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
index d28ddf0f561a0..409e86d343a05 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -107,9 +107,5 @@ static inline struct device *mdev_dev(struct mdev_device *mdev)
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

