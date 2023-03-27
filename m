Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797256CA015
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DCF10E338;
	Mon, 27 Mar 2023 09:41:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CFC10E36D;
 Mon, 27 Mar 2023 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679910059; x=1711446059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EYdu5/GBhO6Uy6G+XJ/VQwuU2UqP/gCPSMF/s2HHxDc=;
 b=OnDHhXEGEViRo5aMFoUeG7IIv7yHKlWOW04v6qX2mlDU8dWIWAtBtHFn
 9C5c2zm9xEFsP0RUttHxVzrPFxTRQWCSYSCqCjer7cr0YX7kzNMXMUC6l
 8HbC5wDLw0tjbQ2uTo/Ho9GtB7ZtNr+k0RDlxFtG1ULtRx692gnTkMfrz
 RggdtcPgLqKzX2XXERsv0uYved0VtWFz+mFQun4rSiR6sbGm/Gv6w8Vec
 HOkOkuVlEESCeISuQJ59snjNI+i7jz4tDsyfLiUXxDPgN0COsJEXsg5ro
 StfpIfVofjvKIijVEwBKr2QH8Gb5Y89xluefDspoygPa/dvFBUjxwI1Ru w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426485350"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="426485350"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660775784"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="660775784"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 02:40:58 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v8 11/24] vfio: Make vfio_device_first_open() to accept NULL
 iommufd for noiommu
Date: Mon, 27 Mar 2023 02:40:34 -0700
Message-Id: <20230327094047.47215-12-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327094047.47215-1-yi.l.liu@intel.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
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

vfio_device_first_open() requires the caller to provide either a valid
iommufd (the group path in iommufd compat mode) or a valid container
(the group path in legacy container mode). As preparation for noiommu
support in device cdev path it's extended to allow both being NULL. The
caller is expected to verify noiommu permission before passing NULL
to this function.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     |  8 ++++++++
 drivers/vfio/vfio.h      |  1 +
 drivers/vfio/vfio_main.c | 12 ++++++++----
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index c0065e359db6..36e105960dd8 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -771,6 +771,14 @@ void vfio_device_group_unregister(struct vfio_device *device)
 	mutex_unlock(&device->group->device_lock);
 }
 
+/* No group lock since df->group and df->group->container cannot change */
+bool vfio_device_group_uses_container(struct vfio_device_file *df)
+{
+	if (WARN_ON(!df->group))
+		return false;
+	return READ_ONCE(df->group->container);
+}
+
 int vfio_device_group_use_iommu(struct vfio_device *device)
 {
 	struct vfio_group *group = device->group;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index f1a448f9d067..7d4108cbc185 100644
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
index b3b7e2436aec..6739203873a6 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -423,16 +423,20 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 {
 	struct vfio_device *device = df->device;
 	struct iommufd_ctx *iommufd = df->iommufd;
-	int ret;
+	int ret = 0;
 
 	lockdep_assert_held(&device->dev_set->lock);
 
 	if (!try_module_get(device->dev->driver->owner))
 		return -ENODEV;
 
+	/*
+	 * if neither iommufd nor container is used the device is in
+	 * noiommu mode then just go ahead to open it.
+	 */
 	if (iommufd)
 		ret = vfio_iommufd_bind(device, iommufd);
-	else
+	else if (vfio_device_group_uses_container(df))
 		ret = vfio_device_group_use_iommu(device);
 	if (ret)
 		goto err_module_put;
@@ -447,7 +451,7 @@ static int vfio_device_first_open(struct vfio_device_file *df)
 err_unuse_iommu:
 	if (iommufd)
 		vfio_iommufd_unbind(device);
-	else
+	else if (vfio_device_group_uses_container(df))
 		vfio_device_group_unuse_iommu(device);
 err_module_put:
 	module_put(device->dev->driver->owner);
@@ -465,7 +469,7 @@ static void vfio_device_last_close(struct vfio_device_file *df)
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

