Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703A6D31F9
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 17:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED9410E112;
	Sat,  1 Apr 2023 15:18:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEF310E105;
 Sat,  1 Apr 2023 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680362316; x=1711898316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hUwYSsLdqR/fklvxwBo5aRySGIYs2Vl7KYRkZwHwtPA=;
 b=fE8r5ER9BTNrgUEdDGb0tG6tu/nRPJc95O1cGVgElrEONyzRu2ddwCy1
 wG5eWYyNC4pfGVUwIfgd5yFj1/MBsKROBMkaoOoHYchEC9j33XOKrnUj2
 S7c3QL1xIuMhc0OTFhOFqD2ytJQYwadqO8BRrSEvO17cW4bkzE3qaDwmN
 jSnHmp4gpA9/qKxLoZtBzcUTbdSQGQGZZKaLn28aHdKWywF9ja/cD83uG
 LIvQSYynW4y1OfI+nbDaRJ4m9cn/VxNHxEadZP7Q8rAVWdNg+/n+g4YEr
 rxA+Na34+4M7Cz1Rjb7lHX8HetPKpSvmPCOhpPbqGV4Xz39X+Hwd44W01 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404411175"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="404411175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 08:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="678937147"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="678937147"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 01 Apr 2023 08:18:35 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v9 01/25] vfio: Allocate per device file structure
Date: Sat,  1 Apr 2023 08:18:09 -0700
Message-Id: <20230401151833.124749-2-yi.l.liu@intel.com>
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

This is preparation for adding vfio device cdev support. vfio device
cdev requires:
1) A per device file memory to store the kvm pointer set by KVM. It will
   be propagated to vfio_device:kvm after the device cdev file is bound
   to an iommufd.
2) A mechanism to block device access through device cdev fd before it
   is bound to an iommufd.

To address above requirements, this adds a per device file structure
named vfio_device_file. For now, it's only a wrapper of struct vfio_device
pointer. Other fields will be added to this per file structure in future
commits.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 13 +++++++++++--
 drivers/vfio/vfio.h      |  6 ++++++
 drivers/vfio/vfio_main.c | 35 ++++++++++++++++++++++++++++-------
 3 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index d0c95d033605..8a13cea43f49 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -218,19 +218,26 @@ void vfio_device_group_close(struct vfio_device *device)
 
 static struct file *vfio_device_open_file(struct vfio_device *device)
 {
+	struct vfio_device_file *df;
 	struct file *filep;
 	int ret;
 
+	df = vfio_allocate_device_file(device);
+	if (IS_ERR(df)) {
+		ret = PTR_ERR(df);
+		goto err_out;
+	}
+
 	ret = vfio_device_group_open(device);
 	if (ret)
-		goto err_out;
+		goto err_free;
 
 	/*
 	 * We can't use anon_inode_getfd() because we need to modify
 	 * the f_mode flags directly to allow more than just ioctls
 	 */
 	filep = anon_inode_getfile("[vfio-device]", &vfio_device_fops,
-				   device, O_RDWR);
+				   df, O_RDWR);
 	if (IS_ERR(filep)) {
 		ret = PTR_ERR(filep);
 		goto err_close_device;
@@ -254,6 +261,8 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
 
 err_close_device:
 	vfio_device_group_close(device);
+err_free:
+	kfree(df);
 err_out:
 	return ERR_PTR(ret);
 }
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index c0aeea24fbd6..250fbd3786c5 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -16,11 +16,17 @@ struct iommufd_ctx;
 struct iommu_group;
 struct vfio_container;
 
+struct vfio_device_file {
+	struct vfio_device *device;
+};
+
 void vfio_device_put_registration(struct vfio_device *device);
 bool vfio_device_try_get_registration(struct vfio_device *device);
 int vfio_device_open(struct vfio_device *device, struct iommufd_ctx *iommufd);
 void vfio_device_close(struct vfio_device *device,
 		       struct iommufd_ctx *iommufd);
+struct vfio_device_file *
+vfio_allocate_device_file(struct vfio_device *device);
 
 extern const struct file_operations vfio_device_fops;
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index ebbb6b91a498..89722bf87edc 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -404,6 +404,20 @@ static bool vfio_assert_device_open(struct vfio_device *device)
 	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
 }
 
+struct vfio_device_file *
+vfio_allocate_device_file(struct vfio_device *device)
+{
+	struct vfio_device_file *df;
+
+	df = kzalloc(sizeof(*df), GFP_KERNEL_ACCOUNT);
+	if (!df)
+		return ERR_PTR(-ENOMEM);
+
+	df->device = device;
+
+	return df;
+}
+
 static int vfio_device_first_open(struct vfio_device *device,
 				  struct iommufd_ctx *iommufd)
 {
@@ -517,12 +531,15 @@ static inline void vfio_device_pm_runtime_put(struct vfio_device *device)
  */
 static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 
 	vfio_device_group_close(device);
 
 	vfio_device_put_registration(device);
 
+	kfree(df);
+
 	return 0;
 }
 
@@ -1087,7 +1104,8 @@ static int vfio_ioctl_device_feature(struct vfio_device *device,
 static long vfio_device_fops_unl_ioctl(struct file *filep,
 				       unsigned int cmd, unsigned long arg)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 	int ret;
 
 	ret = vfio_device_pm_runtime_get(device);
@@ -1114,7 +1132,8 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
 				     size_t count, loff_t *ppos)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 
 	if (unlikely(!device->ops->read))
 		return -EINVAL;
@@ -1126,7 +1145,8 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 				      const char __user *buf,
 				      size_t count, loff_t *ppos)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 
 	if (unlikely(!device->ops->write))
 		return -EINVAL;
@@ -1136,7 +1156,8 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 
 static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 
 	if (unlikely(!device->ops->mmap))
 		return -EINVAL;
@@ -1156,11 +1177,11 @@ const struct file_operations vfio_device_fops = {
 
 static struct vfio_device *vfio_device_from_file(struct file *file)
 {
-	struct vfio_device *device = file->private_data;
+	struct vfio_device_file *df = file->private_data;
 
 	if (file->f_op != &vfio_device_fops)
 		return NULL;
-	return device;
+	return df->device;
 }
 
 /**
-- 
2.34.1

