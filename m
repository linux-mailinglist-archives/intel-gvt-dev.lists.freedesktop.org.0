Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA64FBEBA
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088010EF85;
	Mon, 11 Apr 2022 14:15:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E133D10EF85;
 Mon, 11 Apr 2022 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Qyqf1uPVPL3PyVQKl1EmiPuwTiU5LR+HZ4CfCVyTJz8=; b=bPTLtmiIav25Jb/guwqSFV28jI
 g+lhC3HZR3otZTAAAWozFHObmyxDwt/p/mfL4umlrak2wG9t18Rfh2t+cwKgs4HQ/iXTfXJO0mODZ
 dXeOnNnr2/WVWZkrvZEwwY4bnWGQw3FYlwjXgePq9gMxAk0ZQnfPaGjD8a3f0X5Xt5iyIoeNxa2t7
 s7r3hcJCJs7M04QPJEym6zMfjLvYd/PanwrO+V8A4d8veVWDeQkGi3KjSeCyYzIBCk3oC7hGJZDy/
 wl/HnlJ3Agnr1Gf8B34nq1Qfrl2WAi/3PQ2MEnndpaY4FrRZAzjDM81/G99Bc5X8uRYJomuOcJLJD
 +l5hjY3Q==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupW-009L0x-1k; Mon, 11 Apr 2022 14:15:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 33/34] vfio/mdev: Use the driver core to create the 'remove'
 file
Date: Mon, 11 Apr 2022 16:14:02 +0200
Message-Id: <20220411141403.86980-34-hch@lst.de>
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

The device creator is supposed to use the dev.groups value to add sysfs
files before device_add is called, not call sysfs_create_files() after
device_add() returns. This creates a race with uevent delivery where the
extra attribute will not be visible.

This was being done because the groups had been co-opted by the mdev
driver, now that prior patches have moved the driver's groups to the
struct device_driver the dev.group is properly free for use here.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vfio/mdev/mdev_core.c    |  1 +
 drivers/vfio/mdev/mdev_private.h |  2 ++
 drivers/vfio/mdev/mdev_sysfs.c   | 19 ++++++++++---------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 19a20ff420b7f..b8b9e7911e559 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -269,6 +269,7 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 	mdev->dev.parent  = parent->dev;
 	mdev->dev.bus = &mdev_bus_type;
 	mdev->dev.release = mdev_device_release;
+	mdev->dev.groups = mdev_device_groups;
 	mdev->type = type;
 	/* Pairs with the put in mdev_device_release() */
 	kobject_get(&type->kobj);
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 5a7ffd4e770fd..7c9fc79f3d838 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -32,6 +32,8 @@ struct mdev_type {
 	unsigned int type_group_id;
 };
 
+extern const struct attribute_group *mdev_device_groups[];
+
 #define to_mdev_type_attr(_attr)	\
 	container_of(_attr, struct mdev_type_attribute, attr)
 #define to_mdev_type(_kobj)		\
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index 5a3873d1a275a..0ccfeb3dda245 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -244,11 +244,20 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_WO(remove);
 
-static const struct attribute *mdev_device_attrs[] = {
+static struct attribute *mdev_device_attrs[] = {
 	&dev_attr_remove.attr,
 	NULL,
 };
 
+static const struct attribute_group mdev_device_group = {
+	.attrs = mdev_device_attrs,
+};
+
+const struct attribute_group *mdev_device_groups[] = {
+	&mdev_device_group,
+	NULL
+};
+
 int mdev_create_sysfs_files(struct mdev_device *mdev)
 {
 	struct mdev_type *type = mdev->type;
@@ -262,15 +271,8 @@ int mdev_create_sysfs_files(struct mdev_device *mdev)
 	ret = sysfs_create_link(kobj, &type->kobj, "mdev_type");
 	if (ret)
 		goto type_link_failed;
-
-	ret = sysfs_create_files(kobj, mdev_device_attrs);
-	if (ret)
-		goto create_files_failed;
-
 	return ret;
 
-create_files_failed:
-	sysfs_remove_link(kobj, "mdev_type");
 type_link_failed:
 	sysfs_remove_link(mdev->type->devices_kobj, dev_name(&mdev->dev));
 	return ret;
@@ -280,7 +282,6 @@ void mdev_remove_sysfs_files(struct mdev_device *mdev)
 {
 	struct kobject *kobj = &mdev->dev.kobj;
 
-	sysfs_remove_files(kobj, mdev_device_attrs);
 	sysfs_remove_link(kobj, "mdev_type");
 	sysfs_remove_link(mdev->type->devices_kobj, dev_name(&mdev->dev));
 }
-- 
2.30.2

