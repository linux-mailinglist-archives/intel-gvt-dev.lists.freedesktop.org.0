Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF8694A8A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Feb 2023 16:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BED710E604;
	Mon, 13 Feb 2023 15:14:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20F910E5ED;
 Mon, 13 Feb 2023 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676301252; x=1707837252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hq6Kpt+wQho3ZB5LjTS6DNluvYQ+TsR2dKPZc8MDHlc=;
 b=jvSP+8HmIqYTq7OY35GzKyxWaOnrVIGAOmot0zZwmE3f8rtV7QJSZdPJ
 Vfif8LCGoLwULXuXVh771upSIAihkksreQxGPf8F+6dH8TFCNsD5P3+MG
 9qS8ZalptWQe3zJNzCXdnCz4plD1qZvtWFk4SiLkwX4y7VdEXU6IIwja3
 gx/KAht7Qg85Tg2cHhNLVtPVBcDScgFhmtS5KH0n5/5YboYCMxLQm+f18
 vNFCIU6wv0g2oXoSo0VDoJmAYSkDekjEZKshMGbXGkosfhlw5Od8WE3WM
 x5Ok/MOG68bN76lEc1RFpepySJWiRFK4vuUjg0x2hRWWqzo6sfK8e0Wh/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="318931529"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="318931529"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701289653"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="701289653"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 07:13:51 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: joro@8bytes.org, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, robin.murphy@arm.com
Subject: [PATCH v3 01/15] vfio: Allocate per device file structure
Date: Mon, 13 Feb 2023 07:13:34 -0800
Message-Id: <20230213151348.56451-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213151348.56451-1-yi.l.liu@intel.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
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
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, jasowang@redhat.com,
 cohuck@redhat.com, peterx@redhat.com, eric.auger@redhat.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is preparation for adding vfio device cdev support. vfio device
cdev requires:
1) a per device file memory to store the kvm pointer set by KVM. It will
   be propagated to vfio_device:kvm after the device cdev file is bound
   to an iommufd
2) a mechanism to block device access through device cdev fd before it
   is bound to an iommufd

To address above requirements, this adds a per device file structure
named vfio_device_file. For now, it's only a wrapper of struct vfio_device
pointer. Other fields will be added to this per file structure in future
commits.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/vfio/group.c     | 13 +++++++++++--
 drivers/vfio/vfio.h      |  6 ++++++
 drivers/vfio/vfio_main.c | 31 ++++++++++++++++++++++++++-----
 3 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 0e9036e2b9c4..cf51e1a0fd96 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -215,19 +215,26 @@ void vfio_device_group_close(struct vfio_device *device)
 
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
@@ -251,6 +258,8 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
 
 err_close_device:
 	vfio_device_group_close(device);
+err_free:
+	kfree(df);
 err_out:
 	return ERR_PTR(ret);
 }
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index e9721d8424bc..61bbf673e672 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -16,11 +16,17 @@ struct iommu_group;
 struct vfio_device;
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
index 3a597e799918..d99fa0cec18e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -396,6 +396,20 @@ static bool vfio_assert_device_open(struct vfio_device *device)
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
@@ -509,12 +523,15 @@ static inline void vfio_device_pm_runtime_put(struct vfio_device *device)
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
 
@@ -1079,7 +1096,8 @@ static int vfio_ioctl_device_feature(struct vfio_device *device,
 static long vfio_device_fops_unl_ioctl(struct file *filep,
 				       unsigned int cmd, unsigned long arg)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 	int ret;
 
 	ret = vfio_device_pm_runtime_get(device);
@@ -1106,7 +1124,8 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
 				     size_t count, loff_t *ppos)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 
 	if (unlikely(!device->ops->read))
 		return -EINVAL;
@@ -1118,7 +1137,8 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 				      const char __user *buf,
 				      size_t count, loff_t *ppos)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 
 	if (unlikely(!device->ops->write))
 		return -EINVAL;
@@ -1128,7 +1148,8 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 
 static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 {
-	struct vfio_device *device = filep->private_data;
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
 
 	if (unlikely(!device->ops->mmap))
 		return -EINVAL;
-- 
2.34.1

