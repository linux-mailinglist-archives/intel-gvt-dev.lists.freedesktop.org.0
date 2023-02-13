Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E6694A92
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Feb 2023 16:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6057B10E60C;
	Mon, 13 Feb 2023 15:14:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CE910E603;
 Mon, 13 Feb 2023 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676301255; x=1707837255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U2rECZ0JItdMdjmbYNwZ0avc4uKZTi4VlXq+oNTswaY=;
 b=D+9Z080ZInoWC2+7CE3cKr1RKOdCgDffY1enyAZKpYtD3J5Pm03hAieB
 xCyiJ8hPWUqr4c+XjzP88AN5CEbwe6r3tkI2FlwxuOeA+gZml0ycO8HWV
 8E7FFpbhq2SuVIsjpUlpTlPEFVV+hssBW+Phiku6JzaGKUOIrqaK6M9Il
 f66hVgTGkZ20R6Y1uDlS6nGnLrQDvO5w6H2QdqVd/2epGNgH68hsQ1WgX
 FZFDbzMTzI0OGypYbAV+q+mHX/Mie9i5Ns/Z728ELatMkBnJepLkhfCDB
 +juoMzA97rjOzn5RsyTY9GGd6NFrUrP7MGexBsQgBMYqlAF6VSCrxAAz8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="318931595"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="318931595"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701289672"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="701289672"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 07:13:56 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: joro@8bytes.org, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, robin.murphy@arm.com
Subject: [PATCH v3 07/15] vfio: Block device access via device fd until device
 is opened
Date: Mon, 13 Feb 2023 07:13:40 -0800
Message-Id: <20230213151348.56451-8-yi.l.liu@intel.com>
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
---
 drivers/vfio/vfio.h      |  1 +
 drivers/vfio/vfio_main.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 11e56fe079a1..d56cdb114024 100644
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
index c517252aba19..2267057240bd 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -476,7 +476,15 @@ int vfio_device_open(struct vfio_device_file *df)
 			device->open_count--;
 	}
 
-	return ret;
+	if (ret)
+		return ret;
+
+	/*
+	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
+	 * read/write/mmap
+	 */
+	smp_store_release(&df->access_granted, true);
+	return 0;
 }
 
 void vfio_device_close(struct vfio_device_file *df)
@@ -1104,8 +1112,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 {
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
+	bool access;
 	int ret;
 
+	/* Paired with smp_store_release() in vfio_device_open() */
+	access = smp_load_acquire(&df->access_granted);
+	if (!access)
+		return -EINVAL;
+
 	ret = vfio_device_pm_runtime_get(device);
 	if (ret)
 		return ret;
@@ -1132,6 +1146,12 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
 {
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
+	bool access;
+
+	/* Paired with smp_store_release() in vfio_device_open() */
+	access = smp_load_acquire(&df->access_granted);
+	if (!access)
+		return -EINVAL;
 
 	if (unlikely(!device->ops->read))
 		return -EINVAL;
@@ -1145,6 +1165,12 @@ static ssize_t vfio_device_fops_write(struct file *filep,
 {
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
+	bool access;
+
+	/* Paired with smp_store_release() in vfio_device_open() */
+	access = smp_load_acquire(&df->access_granted);
+	if (!access)
+		return -EINVAL;
 
 	if (unlikely(!device->ops->write))
 		return -EINVAL;
@@ -1156,6 +1182,12 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 {
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
+	bool access;
+
+	/* Paired with smp_store_release() in vfio_device_open() */
+	access = smp_load_acquire(&df->access_granted);
+	if (!access)
+		return -EINVAL;
 
 	if (unlikely(!device->ops->mmap))
 		return -EINVAL;
-- 
2.34.1

