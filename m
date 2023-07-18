Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80B7579BF
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 12:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB3910E31D;
	Tue, 18 Jul 2023 10:55:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B9610E313;
 Tue, 18 Jul 2023 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689677748; x=1721213748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWiBEHRsg5mOdeIGrk7v2bxlQYc8MQMuKZq0KXdeifc=;
 b=nr1FJ8b2NNKykkJT+tqgerjNRcxg6cp3U5BqGEmM6Y0l2SSiByMkXMgY
 h0wcnYmPN6yHSEXmnf++4niNx6frpWd9OWxuuwfiepm2B5Y5KAKDbh4/h
 gmk7sod+BNDY+ZAqRL4kOP3dPx0goEgnAKBe2IG6uhiKOOOpsFVHljrTm
 AJBOVTbh2NYiXUqm1uu6bWU5/CYgjEivhGxh0icZswiXqUfarH2vYHn6g
 pOxYriEXQj09cueTEXX6gt4lTvkznu6y6h8FCQPzdQRc+uW4QjZAUFxdO
 l45aBhtkrVDDrcZLurcV0qyy0RGUl9piXHHc0wrdOu3M7ytOhrq1MZn20 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452553588"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452553588"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 03:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673863814"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="673863814"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga003.jf.intel.com with ESMTP; 18 Jul 2023 03:55:47 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v10 07/10] vfio: Add helper to search vfio_device in a dev_set
Date: Tue, 18 Jul 2023 03:55:39 -0700
Message-Id: <20230718105542.4138-8-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718105542.4138-1-yi.l.liu@intel.com>
References: <20230718105542.4138-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, yi.l.liu@intel.com,
 kvm@vger.kernel.org, lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org,
 nicolinc@nvidia.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

There are drivers that need to search vfio_device within a given dev_set.
e.g. vfio-pci. So add a helper.

vfio_pci_is_device_in_set() now returns -EBUSY in commit a882c16a2b7e
("vfio/pci: Change vfio_pci_try_bus_reset() to use the dev_set") where
it was trying to preserve the return of vfio_pci_try_zap_and_vma_lock_cb().
However, it makes more sense to return -ENODEV.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c |  6 +-----
 drivers/vfio/vfio_main.c         | 15 +++++++++++++++
 include/linux/vfio.h             |  3 +++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 3d595ad2ed0a..5b5316a5484a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2377,12 +2377,8 @@ static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
 static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
 {
 	struct vfio_device_set *dev_set = data;
-	struct vfio_device *cur;
 
-	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
-		if (cur->dev == &pdev->dev)
-			return 0;
-	return -EBUSY;
+	return vfio_find_device_in_devset(dev_set, &pdev->dev) ? 0 : -ENODEV;
 }
 
 /*
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index f0ca33b2e1df..ab4f3a794f78 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -141,6 +141,21 @@ unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set)
 }
 EXPORT_SYMBOL_GPL(vfio_device_set_open_count);
 
+struct vfio_device *
+vfio_find_device_in_devset(struct vfio_device_set *dev_set,
+			   struct device *dev)
+{
+	struct vfio_device *cur;
+
+	lockdep_assert_held(&dev_set->lock);
+
+	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
+		if (cur->dev == dev)
+			return cur;
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(vfio_find_device_in_devset);
+
 /*
  * Device objects - create, release, get, put, search
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 2a45853773a6..ee120d2d530b 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -244,6 +244,9 @@ void vfio_unregister_group_dev(struct vfio_device *device);
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
 unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set);
+struct vfio_device *
+vfio_find_device_in_devset(struct vfio_device_set *dev_set,
+			   struct device *dev);
 
 int vfio_mig_get_next_state(struct vfio_device *device,
 			    enum vfio_device_mig_state cur_fsm,
-- 
2.34.1

