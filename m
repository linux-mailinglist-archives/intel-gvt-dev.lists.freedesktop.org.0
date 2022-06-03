Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E153C4EB
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Jun 2022 08:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A157B113D0F;
	Fri,  3 Jun 2022 06:33:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC16113AA1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Jun 2022 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vl3AAzeMI7BX2u/O8kPSzZJJV5eD7Q+Y9ihN+xpp9yg=; b=CsHm8to1EmyLTpAfY85bRBD2Fs
 1aW45wyOFtxDv3FRvHCuMQqIwQzpkB0OMVIa6IA8gt3SWx9s6iLQvCqKijS8GSglca6BboBYVLkaR
 OHwXTpn3u2cMEhiC4KgccEWxL0nCRZbhUihE3OndKfZMDdrDsDRv87gpfuMo/ksIuoo9zfBRGNi8b
 SnxD5AgNIvRiRpeTQOCcUXVGQUrD0wQGvVLmiqVJ8iOLKBj+NxBQHY45ut8kDM3gi0gPhuANrERVb
 mQA9at7o2Y8kdKmlijG8KmGJjI7j+g7jxf520CCfjCKlyzFk5l3nBAH5MjZpiyLWgvCio/3AZOk/k
 fp6p+uAQ==;
Received: from [2001:4bb8:185:a81e:b29a:8b56:eb9a:ca3b] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nx0sV-00614B-91; Fri, 03 Jun 2022 06:33:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 6/8] vfio/mdev: unexport mdev_bus_type
Date: Fri,  3 Jun 2022 08:33:26 +0200
Message-Id: <20220603063328.3715-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220603063328.3715-1-hch@lst.de>
References: <20220603063328.3715-1-hch@lst.de>
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
Cc: linux-s390@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 kvm@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

mdev_bus_type is only used in mdev.ko now, so unexport it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vfio/mdev/mdev_driver.c  | 1 -
 drivers/vfio/mdev/mdev_private.h | 1 +
 include/linux/mdev.h             | 2 --
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
index 9c2af59809e2e..dde6adf23b1db 100644
--- a/drivers/vfio/mdev/mdev_driver.c
+++ b/drivers/vfio/mdev/mdev_driver.c
@@ -47,7 +47,6 @@ struct bus_type mdev_bus_type = {
 	.remove		= mdev_remove,
 	.match		= mdev_match,
 };
-EXPORT_SYMBOL_GPL(mdev_bus_type);
 
 /**
  * mdev_register_driver - register a new MDEV driver
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 277819f1ebed8..3ecd6ae1dfa7c 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -13,6 +13,7 @@
 int  mdev_bus_register(void);
 void mdev_bus_unregister(void);
 
+extern struct bus_type mdev_bus_type;
 extern const struct attribute_group *mdev_device_groups[];
 
 #define to_mdev_type_attr(_attr)	\
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 5811b5a52a511..f92b4d8edf0e8 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -88,8 +88,6 @@ static inline const guid_t *mdev_uuid(struct mdev_device *mdev)
 	return &mdev->uuid;
 }
 
-extern struct bus_type mdev_bus_type;
-
 int mdev_register_parent(struct mdev_parent *parent, struct device *dev,
 		struct mdev_driver *mdev_driver);
 void mdev_unregister_parent(struct mdev_parent *parent);
-- 
2.30.2

