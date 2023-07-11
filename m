Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D874E432
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jul 2023 04:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB2E10E2F0;
	Tue, 11 Jul 2023 02:31:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8800610E1CA;
 Tue, 11 Jul 2023 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689042709; x=1720578709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=unyaXR5kZ823+ELcC0xyzG7tD4kEy8mBmvo8Jl0Rb70=;
 b=LMcfExtRwP0+EKMec1I4f8OfxOQLaIElwcKOwLkiTEv3CXk5JTHcN3dm
 Y5lAadk+MIVgcncLnFiF2BLQWCRkAJi3vxNRGKJ5X9C1+iP4ODZ3t3Xe3
 t47mB4RXVlTnZw4bwwb+gc8v+ACsPLi/xDRda5VQVmFNKuAGfr5DrNvpH
 8KSJt2VNCcTfWkRuo/G0wcYRfoMajb5uiY7vef17V90R0bSokiuTvpicM
 y9hvqjGgC2JRIlXBZKXEPO4Hp5jQEIe8gBEwViT9/HPRm4x8bO1Uglm3L
 Dr37D8e1XpilpYSth06dowY5mnAUYeWmz6OMQ1Es04MRUBuo1NKRv7tbD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368004717"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="368004717"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720907595"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="720907595"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 19:31:32 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 07/10] vfio: Add helper to search vfio_device in a dev_set
Date: Mon, 10 Jul 2023 19:31:23 -0700
Message-Id: <20230711023126.5531-8-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711023126.5531-1-yi.l.liu@intel.com>
References: <20230711023126.5531-1-yi.l.liu@intel.com>
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
Tested-by: Terrence Xu <terrence.xu@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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

