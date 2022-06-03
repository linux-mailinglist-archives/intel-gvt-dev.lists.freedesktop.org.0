Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88453C4E7
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Jun 2022 08:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0324113673;
	Fri,  3 Jun 2022 06:33:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5519811321D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Jun 2022 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mnrk1WExxM7qb8QUyANfKl3ANS7CKD+PXwkAz7UwVFk=; b=SOBawjmC5dRkuONKmVo2gnK+NB
 fSzjHqRlvBXgytKF/NFsWnD1SSSR2S4RIKAdTEgVH+lK58M+NFgix4mwiSH/sNJuYdYyFO7Fu9gUs
 +F3c54I21KHATmPEvyrD8MbF9fgqErvPXNwXqIpRYWBlrnqOcPdSotoFrGg6EJNnya2f4mHXWUq+r
 rNi+rMZel7V5Jlh4hKj09e/zVJpBVoTU3WiTsbJRccYLWjgXgYLohlEZGId1/dgq7RzhtIYHebexa
 BovW3IKTr5CTu7babUlVrlGwjjPPS01ZQb0ObRu1FcxHFzII1PA/kmu7xdISW66D/5XFJvqlWZaSS
 I5L1s0Og==;
Received: from [2001:4bb8:185:a81e:b29a:8b56:eb9a:ca3b] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nx0sP-00612N-LX; Fri, 03 Jun 2022 06:33:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 4/8] vfio/mdev: remove mdev_{create,remove}_sysfs_files
Date: Fri,  3 Jun 2022 08:33:24 +0200
Message-Id: <20220603063328.3715-5-hch@lst.de>
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

Just fold these two trivial helpers into their only callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vfio/mdev/mdev_core.c    | 12 ++++++++++--
 drivers/vfio/mdev/mdev_private.h |  3 ---
 drivers/vfio/mdev/mdev_sysfs.c   | 28 ----------------------------
 3 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index ff38c9549a55e..34b01d45cfe9f 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -46,7 +46,8 @@ static void mdev_device_remove_common(struct mdev_device *mdev)
 {
 	struct mdev_parent *parent = mdev->type->parent;
 
-	mdev_remove_sysfs_files(mdev);
+	sysfs_remove_link(&mdev->dev.kobj, "mdev_type");
+	sysfs_remove_link(mdev->type->devices_kobj, dev_name(&mdev->dev));
 	device_del(&mdev->dev);
 	lockdep_assert_held(&parent->unreg_sem);
 	/* Balances with device_initialize() */
@@ -193,16 +194,23 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 	if (ret)
 		goto out_del;
 
-	ret = mdev_create_sysfs_files(mdev);
+	ret = sysfs_create_link(type->devices_kobj, &mdev->dev.kobj,
+				dev_name(&mdev->dev));
 	if (ret)
 		goto out_del;
 
+	ret = sysfs_create_link(&mdev->dev.kobj, &type->kobj, "mdev_type");
+	if (ret)
+		goto out_remove_type_link;
+
 	mdev->active = true;
 	dev_dbg(&mdev->dev, "MDEV: created\n");
 	up_read(&parent->unreg_sem);
 
 	return 0;
 
+out_remove_type_link:
+	sysfs_remove_link(mdev->type->devices_kobj, dev_name(&mdev->dev));
 out_del:
 	device_del(&mdev->dev);
 out_unlock:
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 476cc0379ede0..277819f1ebed8 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -20,9 +20,6 @@ extern const struct attribute_group *mdev_device_groups[];
 #define to_mdev_type(_kobj)		\
 	container_of(_kobj, struct mdev_type, kobj)
 
-int  mdev_create_sysfs_files(struct mdev_device *mdev);
-void mdev_remove_sysfs_files(struct mdev_device *mdev);
-
 int mdev_device_create(struct mdev_type *kobj, const guid_t *uuid);
 int  mdev_device_remove(struct mdev_device *dev);
 
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index fb058755d85b8..b6bc623487f06 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -176,31 +176,3 @@ const struct attribute_group *mdev_device_groups[] = {
 	&mdev_device_group,
 	NULL
 };
-
-int mdev_create_sysfs_files(struct mdev_device *mdev)
-{
-	struct mdev_type *type = mdev->type;
-	struct kobject *kobj = &mdev->dev.kobj;
-	int ret;
-
-	ret = sysfs_create_link(type->devices_kobj, kobj, dev_name(&mdev->dev));
-	if (ret)
-		return ret;
-
-	ret = sysfs_create_link(kobj, &type->kobj, "mdev_type");
-	if (ret)
-		goto type_link_failed;
-	return ret;
-
-type_link_failed:
-	sysfs_remove_link(mdev->type->devices_kobj, dev_name(&mdev->dev));
-	return ret;
-}
-
-void mdev_remove_sysfs_files(struct mdev_device *mdev)
-{
-	struct kobject *kobj = &mdev->dev.kobj;
-
-	sysfs_remove_link(kobj, "mdev_type");
-	sysfs_remove_link(mdev->type->devices_kobj, dev_name(&mdev->dev));
-}
-- 
2.30.2

