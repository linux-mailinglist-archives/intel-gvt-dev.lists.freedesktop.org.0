Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7717D4FBEB7
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2893910EBB3;
	Mon, 11 Apr 2022 14:15:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A5210E9D0;
 Mon, 11 Apr 2022 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=UejgJ+d4lNSB1BHJIM2Bn0Hh/zPTKz22eVGLMRr5vyQ=; b=s5i2PqRgIHYSOlL4ViwnTIQy3D
 lJ33ceibkxThIZV6trU2IADutJByO/AelCiCCVTaa2njdQ+9PxBX3cbnR7R/bIf17y526HKXs8X7U
 ClUCQx4RrPJ5en15K2hIhVTw0hbtRIXJOKv1ajuzCHY7PpFk39IUGxB/sc1cG1wnV7JW1omax8F/R
 nmSzHn7Hn559UbzZqXEfqEo1gefqX5Yhiuw69svcHdv5WkKMS14ThKXNuYeCC+wLS14Nz972qT9w9
 rbc7NpD59civSwzLp1aIWn+mqFaEzMR3O+J0iSu36Tt2ntF7LvOvUK91cVo/3WrgOOiHH7cyUjGEX
 p5eFhskw==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupQ-009Kyo-0S; Mon, 11 Apr 2022 14:15:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 31/34] vfio/mdev: Remove mdev_parent_ops dev_attr_groups
Date: Mon, 11 Apr 2022 16:14:00 +0200
Message-Id: <20220411141403.86980-32-hch@lst.de>
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

This is only used by one sample to print a fixed string that is pointless.

In general, having a device driver attach sysfs attributes to the parent
is horrific. This should never happen, and always leads to some kind of
liftime bug as it become very difficult for the sysfs attribute to go back
to any data owned by the device driver.

Remove the general mechanism to create this abuse.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vfio/mdev/mdev_sysfs.c | 12 ++----------
 include/linux/mdev.h           |  2 --
 samples/vfio-mdev/mtty.c       | 30 +-----------------------------
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index f5cf1931c54e4..66eef08833a4e 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -197,7 +197,6 @@ void parent_remove_sysfs_files(struct mdev_parent *parent)
 		remove_mdev_supported_type(type);
 	}
 
-	sysfs_remove_groups(&parent->dev->kobj, parent->ops->dev_attr_groups);
 	kset_unregister(parent->mdev_types_kset);
 }
 
@@ -213,17 +212,10 @@ int parent_create_sysfs_files(struct mdev_parent *parent)
 
 	INIT_LIST_HEAD(&parent->type_list);
 
-	ret = sysfs_create_groups(&parent->dev->kobj,
-				  parent->ops->dev_attr_groups);
-	if (ret)
-		goto create_err;
-
 	ret = add_mdev_supported_type_groups(parent);
 	if (ret)
-		sysfs_remove_groups(&parent->dev->kobj,
-				    parent->ops->dev_attr_groups);
-	else
-		return ret;
+		goto create_err;
+	return 0;
 
 create_err:
 	kset_unregister(parent->mdev_types_kset);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 192aed656116f..69df1fa2cb6f9 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -36,7 +36,6 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
  *
  * @owner:		The module owner.
  * @device_driver:	Which device driver to probe() on newly created devices
- * @dev_attr_groups:	Attributes of the parent device.
  * @mdev_attr_groups:	Attributes of the mediated device.
  * @supported_type_groups: Attributes to define supported types. It is mandatory
  *			to provide supported types.
@@ -47,7 +46,6 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
 struct mdev_parent_ops {
 	struct module   *owner;
 	struct mdev_driver *device_driver;
-	const struct attribute_group **dev_attr_groups;
 	const struct attribute_group **mdev_attr_groups;
 	struct attribute_group **supported_type_groups;
 };
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index a0e1a469bd47a..4f227dc267859 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1207,38 +1207,11 @@ static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static ssize_t
-sample_mtty_dev_show(struct device *dev, struct device_attribute *attr,
-		     char *buf)
-{
-	return sprintf(buf, "This is phy device\n");
-}
-
-static DEVICE_ATTR_RO(sample_mtty_dev);
-
-static struct attribute *mtty_dev_attrs[] = {
-	&dev_attr_sample_mtty_dev.attr,
-	NULL,
-};
-
-static const struct attribute_group mtty_dev_group = {
-	.name  = "mtty_dev",
-	.attrs = mtty_dev_attrs,
-};
-
-static const struct attribute_group *mtty_dev_groups[] = {
-	&mtty_dev_group,
-	NULL,
-};
-
 static ssize_t
 sample_mdev_dev_show(struct device *dev, struct device_attribute *attr,
 		     char *buf)
 {
-	if (mdev_from_dev(dev))
-		return sprintf(buf, "This is MDEV %s\n", dev_name(dev));
-
-	return sprintf(buf, "\n");
+	return sprintf(buf, "This is MDEV %s\n", dev_name(dev));
 }
 
 static DEVICE_ATTR_RO(sample_mdev_dev);
@@ -1333,7 +1306,6 @@ static struct mdev_driver mtty_driver = {
 static const struct mdev_parent_ops mdev_fops = {
 	.owner                  = THIS_MODULE,
 	.device_driver		= &mtty_driver,
-	.dev_attr_groups        = mtty_dev_groups,
 	.supported_type_groups  = mdev_type_groups,
 };
 
-- 
2.30.2

