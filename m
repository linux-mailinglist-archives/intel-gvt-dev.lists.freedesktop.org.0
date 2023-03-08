Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDB6B08E6
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6223510E607;
	Wed,  8 Mar 2023 13:29:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA22810E607;
 Wed,  8 Mar 2023 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282174; x=1709818174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XeiR8haIZIHcl7wUZyWGU+A/6RExf6z0n7ntzoVlizo=;
 b=hIcBhEX1wI1kCmMZxBg0I0GatyFdx1mlDqCsLQcUE5icSYuTkQRH4Ofo
 IDZLpMBx2zmqDSkbN2nOzeFq1CL8yAK5b3+qwF2DtJdoI1pM19Vj5W+gU
 1U4OmUsdcTdiVhZdltDszxrlL7uG/SSaaZPQ4it3kyDu7yY6JNmE0oP2D
 9+Myo3hUFYQQZEH8x0hwtMUCMBCjvB7b4se8Uc1MJgQuuV+fVSFQ0Qi/o
 g4QUA4m1lrmPqukAcL+f7XQ0GYvi4Xhb2r5cqL8kW7dsisQJ5eQkEAj2R
 FTQ7x0INZEyUkRg7r8xkZq50xf1nnKtFN7p3dvROjh6gg3XSYADUIqmFb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165279"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165279"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789419"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789419"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:33 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 16/24] vfio: Make vfio_device_first_open() to cover the
 noiommu mode in cdev path
Date: Wed,  8 Mar 2023 05:28:55 -0800
Message-Id: <20230308132903.465159-17-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308132903.465159-1-yi.l.liu@intel.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 xudong.hao@intel.com, peterx@redhat.com, yan.y.zhao@intel.com,
 eric.auger@redhat.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

vfio_device_first_open() now covers the below two cases:

1) user uses iommufd (e.g. the group path in iommufd compat mode);
2) user uses container (e.g. the group path in legacy mode);

The above two paths have their own noiommu mode support accordingly.

The cdev path also uses iommufd, so for the case user provides a valid
iommufd, this helper is able to support it. But for noiommu mode, the
cdev path just provides a NULL iommufd. So this needs to be able to cover
it. As there is no special things to do for the cdev path in noiommu
mode, it can be covered by simply differentiate it from the container
case. If user is not using iommufd nor container, it is the noiommu
mode.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 15 +++++++++++++++
 drivers/vfio/vfio.h      |  1 +
 drivers/vfio/vfio_main.c | 21 +++++++++++++++++----
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index f067a6a7bbd2..51c027134814 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -780,6 +780,21 @@ void vfio_device_group_unregister(struct vfio_device *device)
 	mutex_unlock(&device->group->device_lock);
 }
 
+/*
+ * This shall be used without group lock as group and group->container
+ * should be fixed before group is set to df->group.
+ */
+bool vfio_device_group_uses_container(struct vfio_device_file *df)
+{
+	/*
+	 * Use the df->group instead of the df->device->group as no
+	 * lock is acquired here.
+	 */
+	if (WARN_ON(!df->group))
+		return false;
+	return READ_ONCE(df->group->container);
+}
+
 int vfio_device_group_use_iommu(struct vfio_device *device)
 {
 	struct vfio_group *group = device->group;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 11397cc95e0b..615ffd58562b 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -95,6 +95,7 @@ int vfio_device_set_group(struct vfio_device *device,
 void vfio_device_remove_group(struct vfio_device *device);
 void vfio_device_group_register(struct vfio_device *device);
 void vfio_device_group_unregister(struct vfio_device *device);
+bool vfio_device_group_uses_container(struct vfio_device_file *df);
 int vfio_device_group_use_iommu(struct vfio_device *device);
 void vfio_device_group_unuse_iommu(struct vfio_device *device);
 void vfio_device_group_close(struct vfio_device_file *df);
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index aa31aae33407..8c73df1a400e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -423,16 +423,29 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 {
 	struct vfio_device *device = df->device;
 	struct iommufd_ctx *iommufd = df->iommufd;
-	int ret;
+	int ret = 0;
 
 	lockdep_assert_held(&device->dev_set->lock);
 
 	if (!try_module_get(device->dev->driver->owner))
 		return -ENODEV;
 
+	/*
+	 * The handling here depends on what the user is using.
+	 *
+	 * If user uses iommufd in the group compat mode or the
+	 * cdev path, call vfio_iommufd_bind().
+	 *
+	 * If user uses container in the group legacy mode, call
+	 * vfio_device_group_use_iommu().
+	 *
+	 * If user doesn't use iommufd nor container, this is
+	 * the noiommufd mode in the cdev path, nothing needs
+	 * to be done here just go ahead to open device.
+	 */
 	if (iommufd)
 		ret = vfio_iommufd_bind(device, iommufd);
-	else
+	else if (vfio_device_group_uses_container(df))
 		ret = vfio_device_group_use_iommu(device);
 	if (ret)
 		goto err_module_put;
@@ -447,7 +460,7 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 err_unuse_iommu:
 	if (iommufd)
 		vfio_iommufd_unbind(device);
-	else
+	else if (vfio_device_group_uses_container(df))
 		vfio_device_group_unuse_iommu(device);
 err_module_put:
 	module_put(device->dev->driver->owner);
@@ -465,7 +478,7 @@ static void vfio_device_last_close(struct vfio_device_file *df)
 		device->ops->close_device(device);
 	if (iommufd)
 		vfio_iommufd_unbind(device);
-	else
+	else if (vfio_device_group_uses_container(df))
 		vfio_device_group_unuse_iommu(device);
 	module_put(device->dev->driver->owner);
 }
-- 
2.34.1

