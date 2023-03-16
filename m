Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5326BD001
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3251810E13E;
	Thu, 16 Mar 2023 12:55:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6397A10E1EB;
 Thu, 16 Mar 2023 12:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971349; x=1710507349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ac4KtZZ6beubpwmpT9ie22pg4ftKNdsniOLMWnizrzo=;
 b=NwI27oKkIhNQBU6zSg8WQf0vazjcISvV+nRO1n7GZ/ZVuKXCAzUjv8df
 Cqu9oWq0zSsQUH2OZtqyOJMDfOvMYcmd3N2DBIwxg1YSjQ0TydzzNhd+t
 biI3sVO2O1OTodPD/YyDXvuGoXotPdPJ8iKjCvBKEqkAy4XTIdZpEqfcy
 BEZiUGRfJEf/+mMHcjF3/96e5IuNG4A3aFVDLA5ig3pRdNprGqtx2FN/Z
 ec9V+lZtheT+atkh75pV3WPbQhSx9VgyQtf0ipMB2kkVdctxZ8uPLdZBh
 tjpeJCVUdCJVvZNrGXHLBoEIVnjlJtSddIHnBxBEuGK+oBZD7TSXtTFGb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336668081"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336668081"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="790277803"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="790277803"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2023 05:55:48 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v7 08/22] vfio: Block device access via device fd until device
 is opened
Date: Thu, 16 Mar 2023 05:55:20 -0700
Message-Id: <20230316125534.17216-9-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316125534.17216-1-yi.l.liu@intel.com>
References: <20230316125534.17216-1-yi.l.liu@intel.com>
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

Allow the vfio_device file to be in a state where the device FD is
opened but the device cannot be used by userspace (i.e. its .open_device()
hasn't been called). This inbetween state is not used when the device
FD is spawned from the group FD, however when we create the device FD
directly by opening a cdev it will be opened in the blocked state.

The reason for the inbetween state is that userspace only gets a FD but
doesn't gain access permission until binding the FD to an iommufd. So in
the blocked state, only the bind operation is allowed. Completing bind
will allow user to further access the device.

This is implemented by adding a flag in struct vfio_device_file to mark
the blocked state and using a simple smp_load_acquire() to obtain the
flag value and serialize all the device setup with the thread accessing
this device.

Following this lockless scheme, it can safely handle the device FD
unbound->bound but it cannot handle bound->unbound. To allow this we'd
need to add a lock on all the vfio ioctls which seems costly. So once
device FD is bound, it remains bound until the FD is closed.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 11 ++++++++++-
 drivers/vfio/vfio.h      |  1 +
 drivers/vfio/vfio_main.c | 41 ++++++++++++++++++++++++++++++++++------
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 9a7b2765eef6..4f267ae7bebc 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -194,9 +194,18 @@ static int vfio_device_group_open(struct vfio_device_file *df)
 	df->iommufd = device->group->iommufd;
 
 	ret = vfio_device_open(df);
-	if (ret)
+	if (ret) {
 		df->iommufd = NULL;
+		goto out_put_kvm;
+	}
+
+	/*
+	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
+	 * read/write/mmap
+	 */
+	smp_store_release(&df->access_granted, true);
 
+out_put_kvm:
 	if (device->open_count == 0)
 		vfio_device_put_kvm(device);
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index cffc08f5a6f1..854f2c97cb9a 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -18,6 +18,7 @@ struct vfio_container;
 
 struct vfio_device_file {
 	struct vfio_device *device;
+	bool access_granted;
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
 	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 2ea6cb6d03c7..b515bbda4c74 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1114,6 +1114,10 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 	struct vfio_device *device = df->device;
 	int ret;
 
+	/* Paired with smp_store_release() following vfio_device_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	ret = vfio_device_pm_runtime_get(device);
 	if (ret)
 		return ret;
@@ -1141,6 +1145,10 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
+	/* Paired with smp_store_release() following vfio_device_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	if (unlikely(!device->ops->read))
 		return -EINVAL;
 
@@ -1154,6 +1162,10 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
+	/* Paired with smp_store_release() following vfio_device_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	if (unlikely(!device->ops->write))
 		return -EINVAL;
 
@@ -1165,6 +1177,10 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
+	/* Paired with smp_store_release() following vfio_device_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	if (unlikely(!device->ops->mmap))
 		return -EINVAL;
 
@@ -1201,6 +1217,24 @@ bool vfio_file_is_valid(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_file_is_valid);
 
+/*
+ * Return true if the input file is a vfio device file and has opened
+ * the input device. Otherwise, return false.
+ */
+static bool vfio_file_has_device_access(struct file *file,
+					struct vfio_device *device)
+{
+	struct vfio_device *vdev = vfio_device_from_file(file);
+	struct vfio_device_file *df;
+
+	if (!vdev || vdev != device)
+		return false;
+
+	df = file->private_data;
+
+	return READ_ONCE(df->access_granted);
+}
+
 /**
  * vfio_file_has_dev - True if the VFIO file is a handle for device
  * @file: VFIO file to check
@@ -1211,17 +1245,12 @@ EXPORT_SYMBOL_GPL(vfio_file_is_valid);
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
 {
 	struct vfio_group *group;
-	struct vfio_device *vdev;
 
 	group = vfio_group_from_file(file);
 	if (group)
 		return vfio_group_has_dev(group, device);
 
-	vdev = vfio_device_from_file(file);
-	if (vdev)
-		return vdev == device;
-
-	return false;
+	return vfio_file_has_device_access(file, device);
 }
 EXPORT_SYMBOL_GPL(vfio_file_has_dev);
 
-- 
2.34.1

