Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE5056804D
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Jul 2022 09:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7121123FC;
	Wed,  6 Jul 2022 07:43:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D8F1123CE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 Jul 2022 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MJquY0cBq6HegNcR5aAGNBle4qpO78JnndWMh/mUJG4=; b=o5kuXD0Bh4AZF6SDYhzKkyYYql
 Spdlv6gI4ank/TDlgzN+r4Ky+PgoIvvfvPfpaoLjwzkYbsQ/MkTz216sT6DJUMqgGN3X7M1BD0V2j
 EIogYos8eO2FhQ4TEOea6A6LT0wEkqT+BPTqlgpBpiwgksT37kKqmF4pnZDvKdke7o6NPfFOYXkqD
 0Swv4iskKx/Ymrpv2rUyjAku38Dh0RIMWoeWt5xGef8al1FvxhEVQOyyJN95+uL7eAb2LhBkBW54Q
 a6u0AW19ULRqGZrnRKmAQ7uvcDZcNF5SbD4e6aaLcnvhj0lpO5MR2yjZehULieVcvsX12eHkMHgYu
 cHeEJ2OQ==;
Received: from [2001:4bb8:189:3c4a:34cd:2d1d:8766:aad] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o8zgi-007A0x-Ud; Wed, 06 Jul 2022 07:43:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 15/15] vfio/mdev: remove an extra parent kobject reference
Date: Wed,  6 Jul 2022 09:42:19 +0200
Message-Id: <20220706074219.3614-16-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706074219.3614-1-hch@lst.de>
References: <20220706074219.3614-1-hch@lst.de>
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
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The mdev_type already holds a reference to the parent through
mdev_types_kset, so drop the extra reference.

Suggested-by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vfio/mdev/mdev_sysfs.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index c5cd035d591d0..e2087cac1c859 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -153,8 +153,6 @@ static void mdev_type_release(struct kobject *kobj)
 	struct mdev_type *type = to_mdev_type(kobj);
 
 	pr_debug("Releasing group %s\n", kobj->name);
-	/* Pairs with the get in add_mdev_supported_type() */
-	put_device(type->parent->dev);
 	kfree(type);
 }
 
@@ -170,16 +168,12 @@ static int mdev_type_add(struct mdev_parent *parent, struct mdev_type *type)
 
 	type->kobj.kset = parent->mdev_types_kset;
 	type->parent = parent;
-	/* Pairs with the put in mdev_type_release() */
-	get_device(parent->dev);
 
 	ret = kobject_init_and_add(&type->kobj, &mdev_type_ktype, NULL,
 				   "%s-%s", dev_driver_string(parent->dev),
 				   type->sysfs_name);
-	if (ret) {
-		kobject_put(&type->kobj);
+	if (ret)
 		return ret;
-	}
 
 	type->devices_kobj = kobject_create_and_add("devices", &type->kobj);
 	if (!type->devices_kobj) {
@@ -191,7 +185,6 @@ static int mdev_type_add(struct mdev_parent *parent, struct mdev_type *type)
 
 attr_devices_failed:
 	kobject_del(&type->kobj);
-	kobject_put(&type->kobj);
 	return ret;
 }
 
-- 
2.30.2

