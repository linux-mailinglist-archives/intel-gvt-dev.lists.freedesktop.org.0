Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04468B810
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Feb 2023 10:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2E510E32E;
	Mon,  6 Feb 2023 09:05:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5813910E332;
 Mon,  6 Feb 2023 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675674356; x=1707210356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=320rjb5oGBZ8je/W/hiIRJDKHA61nOxqBmTbhyG7Nrk=;
 b=nMb+o0COcnjDAgRPS4iz+Dv5tOCcD/vZMMCQLvKFGAjOu5fNKQmpj/jB
 4C8vGTZUTEvcGmq5YH+ta3SN/jDF+8D5nBpmWC59NB0/0PoxpyqEcL+vA
 BwCy4zzlHb1Qfn1pM2A/06s6wJ5iQ1Z91CjNQXQjDBvnnIzoIp9OzPNWK
 pmj5qLngHDitaqwVRId+9lbiR5MHIasK2ClXWrVJYmwX6XBy3w5BkBX3y
 NQvr5EBW3HYLHfC1Ks2Q1fF0lzUQPaShAUv5lHD9DhjviHhrJQZKz0nxb
 uJG8R9qLfEu86bT+f+II7vHABTAO0ZewnVNPObV4gfvvP+qwKrOA6c0ob Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309495850"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="309495850"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911862826"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="911862826"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 01:05:53 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 07/14] vfio: Block device access via device fd until device
 is opened
Date: Mon,  6 Feb 2023 01:05:25 -0800
Message-Id: <20230206090532.95598-8-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206090532.95598-1-yi.l.liu@intel.com>
References: <20230206090532.95598-1-yi.l.liu@intel.com>
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
 cohuck@redhat.com, linux-kernel@vger.kernel.org, peterx@redhat.com,
 eric.auger@redhat.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Allow the vfio_device file to be in a state where the device FD is
opened but the device cannot be used by userspace (i.e. its .open_device()
hasn't been called). This inbetween state is not used when the device
FD is spawned from the group FD, however when we create the device FD
directly by opening a cdev it will be opened in the blocked state.

The reason for the inbetween state is userspace only gets a FD but
doesn't have the secure until binding the FD to an iommufd. So in the
blocked state, only the bind operation is allowed, other device accesses
are not allowed. Completing bind will allow user to further access the
device.

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
---
 drivers/vfio/vfio.h      |  1 +
 drivers/vfio/vfio_main.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index d8275881c1f1..802e13f1256e 100644
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

