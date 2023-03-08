Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72626B08C5
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596FE10E5E4;
	Wed,  8 Mar 2023 13:29:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9598710E5E4;
 Wed,  8 Mar 2023 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282159; x=1709818159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jI5t7+FTFbWU3k6ZtsKZ2cB5vkHyHBAEw/BOV4eh+Oo=;
 b=ZRiBAoneBqhCfwPUItxQqJ0aDEYAawI9b20HGPasrRj4pzLN37zhxZ8v
 KmcuUAr+W7LRZ1Kg3PsScCR25oOq0RbEEzJTZzWztECJDwTcDToE/UcnJ
 0ElDCOMJ4Nqg20fjT9xgZSVkTrrWG4dkhadyG3sptFpWeeb/+ffcrcO0c
 l+LHkmzyL8dy1pGoJ5G3HAr2gufiHdovqVORlCVSlgNG4+7LPsQM1pIns
 vjG7yZ1b/WzijTG/af6MeqnZyCSvclhfLnI/APPLlUXqM5brzkUzPMwOi
 4DEdgVmiuYVtZfbBQQ+Z3lWxMZPpDZyVjTxiGReNubb3k9llCjus/fyQ5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165170"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165170"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789325"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789325"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:18 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 07/24] vfio: Block device access via device fd until device
 is opened
Date: Wed,  8 Mar 2023 05:28:46 -0800
Message-Id: <20230308132903.465159-8-yi.l.liu@intel.com>
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
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 drivers/vfio/group.c     | 11 ++++++++++-
 drivers/vfio/vfio.h      |  1 +
 drivers/vfio/vfio_main.c | 16 ++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 160a4c891dda..4a220d5bf79b 100644
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
index 7ced404526d9..e60c409868f8 100644
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
index 8c9b05f540fd..027410e8d4a8 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1114,6 +1114,10 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 	struct vfio_device *device = df->device;
 	int ret;
 
+	/* Paired with smp_store_release() in vfio_device_group_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	ret = vfio_device_pm_runtime_get(device);
 	if (ret)
 		return ret;
@@ -1141,6 +1145,10 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
+	/* Paired with smp_store_release() in vfio_device_group_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	if (unlikely(!device->ops->read))
 		return -EINVAL;
 
@@ -1154,6 +1162,10 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
+	/* Paired with smp_store_release() in vfio_device_group_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	if (unlikely(!device->ops->write))
 		return -EINVAL;
 
@@ -1165,6 +1177,10 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
+	/* Paired with smp_store_release() in vfio_device_group_open() */
+	if (!smp_load_acquire(&df->access_granted))
+		return -EINVAL;
+
 	if (unlikely(!device->ops->mmap))
 		return -EINVAL;
 
-- 
2.34.1

