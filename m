Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F46D31FF
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 17:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D7210E224;
	Sat,  1 Apr 2023 15:18:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057110E0F6;
 Sat,  1 Apr 2023 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680362320; x=1711898320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TM2VBxl68DMup2WqMbkWDMx3S0SElcLwR7pPs6tgu68=;
 b=gNAUlQClgaS6+PHBa4N/pQJyK0d+W9W9esX6/x9PRAGbvwrECWBpPce/
 umNtLrEUpV6sGRjOWXCjCywzOXcKmV2+uqWzicFxXRoZWgWee7HiUoYeJ
 N+bOj4mAlHxZVu3HjA8l0KnmNtdWfWSjq9MkwYqraZedFCcYi/arn/n7c
 QWTQ54r66qcTEUaAbda/CdXjkLx6adEhAwOMcXp5wcSMVp/C7oSncTAfF
 e52beRxxLEEaDe3bgkO4z/NyrNCZcahWsyHOmFuksHM8kU+1jRcyVnqxS
 o85d6GHoT44ci7qVzEpKEPmPZVb2iBvYs38ASe6uQ4fiBQkbCwdgZxYj4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404411237"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="404411237"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 08:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="678937176"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="678937176"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 01 Apr 2023 08:18:39 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 07/25] vfio: Pass struct vfio_device_file * to
 vfio_device_open/close()
Date: Sat,  1 Apr 2023 08:18:15 -0700
Message-Id: <20230401151833.124749-8-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401151833.124749-1-yi.l.liu@intel.com>
References: <20230401151833.124749-1-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, yi.l.liu@intel.com, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This avoids passing too much parameters in multiple functions.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 20 ++++++++++++++------
 drivers/vfio/vfio.h      |  8 ++++----
 drivers/vfio/vfio_main.c | 25 +++++++++++++++----------
 3 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 4f937ebaf6f7..9a7b2765eef6 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -169,8 +169,9 @@ static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
 	spin_unlock(&device->group->kvm_ref_lock);
 }
 
-static int vfio_device_group_open(struct vfio_device *device)
+static int vfio_device_group_open(struct vfio_device_file *df)
 {
+	struct vfio_device *device = df->device;
 	int ret;
 
 	mutex_lock(&device->group->group_lock);
@@ -190,7 +191,11 @@ static int vfio_device_group_open(struct vfio_device *device)
 	if (device->open_count == 0)
 		vfio_device_group_get_kvm_safe(device);
 
-	ret = vfio_device_open(device, device->group->iommufd);
+	df->iommufd = device->group->iommufd;
+
+	ret = vfio_device_open(df);
+	if (ret)
+		df->iommufd = NULL;
 
 	if (device->open_count == 0)
 		vfio_device_put_kvm(device);
@@ -202,12 +207,15 @@ static int vfio_device_group_open(struct vfio_device *device)
 	return ret;
 }
 
-void vfio_device_group_close(struct vfio_device *device)
+void vfio_device_group_close(struct vfio_device_file *df)
 {
+	struct vfio_device *device = df->device;
+
 	mutex_lock(&device->group->group_lock);
 	mutex_lock(&device->dev_set->lock);
 
-	vfio_device_close(device, device->group->iommufd);
+	vfio_device_close(df);
+	df->iommufd = NULL;
 
 	if (device->open_count == 0)
 		vfio_device_put_kvm(device);
@@ -228,7 +236,7 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
 		goto err_out;
 	}
 
-	ret = vfio_device_group_open(device);
+	ret = vfio_device_group_open(df);
 	if (ret)
 		goto err_free;
 
@@ -260,7 +268,7 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
 	return filep;
 
 err_close_device:
-	vfio_device_group_close(device);
+	vfio_device_group_close(df);
 err_free:
 	kfree(df);
 err_out:
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index e4672d91a6f7..cffc08f5a6f1 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -20,13 +20,13 @@ struct vfio_device_file {
 	struct vfio_device *device;
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
+	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
 };
 
 void vfio_device_put_registration(struct vfio_device *device);
 bool vfio_device_try_get_registration(struct vfio_device *device);
-int vfio_device_open(struct vfio_device *device, struct iommufd_ctx *iommufd);
-void vfio_device_close(struct vfio_device *device,
-		       struct iommufd_ctx *iommufd);
+int vfio_device_open(struct vfio_device_file *df);
+void vfio_device_close(struct vfio_device_file *df);
 struct vfio_device_file *
 vfio_allocate_device_file(struct vfio_device *device);
 
@@ -91,7 +91,7 @@ void vfio_device_group_register(struct vfio_device *device);
 void vfio_device_group_unregister(struct vfio_device *device);
 int vfio_device_group_use_iommu(struct vfio_device *device);
 void vfio_device_group_unuse_iommu(struct vfio_device *device);
-void vfio_device_group_close(struct vfio_device *device);
+void vfio_device_group_close(struct vfio_device_file *df);
 struct vfio_group *vfio_group_from_file(struct file *file);
 bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device);
 bool vfio_group_enforced_coherent(struct vfio_group *group);
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index cb543791b28b..2ea6cb6d03c7 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -419,9 +419,10 @@ vfio_allocate_device_file(struct vfio_device *device)
 	return df;
 }
 
-static int vfio_device_first_open(struct vfio_device *device,
-				  struct iommufd_ctx *iommufd)
+static int vfio_device_first_open(struct vfio_device_file *df)
 {
+	struct vfio_device *device = df->device;
+	struct iommufd_ctx *iommufd = df->iommufd;
 	int ret;
 
 	lockdep_assert_held(&device->dev_set->lock);
@@ -453,9 +454,11 @@ static int vfio_device_first_open(struct vfio_device *device,
 	return ret;
 }
 
-static void vfio_device_last_close(struct vfio_device *device,
-				   struct iommufd_ctx *iommufd)
+static void vfio_device_last_close(struct vfio_device_file *df)
 {
+	struct vfio_device *device = df->device;
+	struct iommufd_ctx *iommufd = df->iommufd;
+
 	lockdep_assert_held(&device->dev_set->lock);
 
 	if (device->ops->close_device)
@@ -467,15 +470,16 @@ static void vfio_device_last_close(struct vfio_device *device,
 	module_put(device->dev->driver->owner);
 }
 
-int vfio_device_open(struct vfio_device *device, struct iommufd_ctx *iommufd)
+int vfio_device_open(struct vfio_device_file *df)
 {
+	struct vfio_device *device = df->device;
 	int ret = 0;
 
 	lockdep_assert_held(&device->dev_set->lock);
 
 	device->open_count++;
 	if (device->open_count == 1) {
-		ret = vfio_device_first_open(device, iommufd);
+		ret = vfio_device_first_open(df);
 		if (ret)
 			device->open_count--;
 	}
@@ -483,14 +487,15 @@ int vfio_device_open(struct vfio_device *device, struct iommufd_ctx *iommufd)
 	return ret;
 }
 
-void vfio_device_close(struct vfio_device *device,
-		       struct iommufd_ctx *iommufd)
+void vfio_device_close(struct vfio_device_file *df)
 {
+	struct vfio_device *device = df->device;
+
 	lockdep_assert_held(&device->dev_set->lock);
 
 	vfio_assert_device_open(device);
 	if (device->open_count == 1)
-		vfio_device_last_close(device, iommufd);
+		vfio_device_last_close(df);
 	device->open_count--;
 }
 
@@ -535,7 +540,7 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
-	vfio_device_group_close(device);
+	vfio_device_group_close(df);
 
 	vfio_device_put_registration(device);
 
-- 
2.34.1

