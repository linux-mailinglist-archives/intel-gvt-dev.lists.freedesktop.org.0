Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C423D56C716
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  9 Jul 2022 06:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C3410F317;
	Sat,  9 Jul 2022 04:55:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9B10F317
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  9 Jul 2022 04:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7AMjs8tJ4INb7VvueD9P1D3lDvMiXxVkCmaTdyxRw0Y=; b=m0U4jOXbkA9c09m911O/T8RRnC
 MY10bJoxlYNVN5XkPFWY1tgS0IxtMolUwFaSVaVy7FzWczXw4CgJwzVXPwI1DdxYU+7CTOPnOEwWs
 nn9TUCdYFuEDUFXa2SHaXMKkGgs1ZbS0f9yKBP3wv8Tj175DFH1IOloUV0o9ZQpv2EZAcSgZM63yU
 b8R38OgjIMqvWZEiOOYHypKh4TUqMIlLUrpR4FuIsblMqynb88Pjg9aPJQ1Mjw0dhfLV8UTFIm70A
 29t9Hw/fKoLjnns6E7wtD7nJonJzEDF6pTfkao/e4sKmFgOAQ2DKiEvKyRWrTDqxHqiBdVF5E7rOV
 vLzzZq3w==;
Received: from 213-225-4-185.nat.highway.a1.net ([213.225.4.185]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oA2V4-00702l-57; Sat, 09 Jul 2022 04:55:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 08/14] vfio/mdev: remove mdev_parent_dev
Date: Sat,  9 Jul 2022 06:54:44 +0200
Message-Id: <20220709045450.609884-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220709045450.609884-1-hch@lst.de>
References: <20220709045450.609884-1-hch@lst.de>
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

Just open code the dereferences in the only user.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 Documentation/driver-api/vfio-mediated-device.rst | 3 ---
 drivers/gpu/drm/i915/gvt/kvmgt.c                  | 2 +-
 drivers/vfio/mdev/mdev_core.c                     | 6 ------
 include/linux/mdev.h                              | 1 -
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 82a4007bd7207..a4c3a4a168ec6 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -202,9 +202,6 @@ Directories and files under the sysfs for Each Physical Device
 
 	sprintf(buf, "%s-%s", dev_driver_string(parent->dev), group->name);
 
-  (or using mdev_parent_dev(mdev) to arrive at the parent device outside
-  of the core mdev code)
-
 * device_api
 
   This attribute should show which device API is being created, for example,
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ead56e4d30650..3473d4bafd61e 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1549,7 +1549,7 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
 
 static int intel_vgpu_probe(struct mdev_device *mdev)
 {
-	struct device *pdev = mdev_parent_dev(mdev);
+	struct device *pdev = mdev->type->parent->dev;
 	struct intel_gvt *gvt = kdev_to_i915(pdev)->gvt;
 	struct intel_vgpu_type *type =
 		container_of(mdev->type, struct intel_vgpu_type, type);
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index bde7ce620dae0..75628759a3bf0 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -23,12 +23,6 @@ static struct class_compat *mdev_bus_compat_class;
 static LIST_HEAD(mdev_list);
 static DEFINE_MUTEX(mdev_list_lock);
 
-struct device *mdev_parent_dev(struct mdev_device *mdev)
-{
-	return mdev->type->parent->dev;
-}
-EXPORT_SYMBOL(mdev_parent_dev);
-
 /*
  * Used in mdev_type_attribute sysfs functions to return the parent struct
  * device
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 6c179d2b89274..bbedffcb38d48 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -95,7 +95,6 @@ void mdev_unregister_parent(struct mdev_parent *parent);
 int mdev_register_driver(struct mdev_driver *drv);
 void mdev_unregister_driver(struct mdev_driver *drv);
 
-struct device *mdev_parent_dev(struct mdev_device *mdev);
 static inline struct device *mdev_dev(struct mdev_device *mdev)
 {
 	return &mdev->dev;
-- 
2.30.2

