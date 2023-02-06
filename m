Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49368B814
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Feb 2023 10:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB1810E342;
	Mon,  6 Feb 2023 09:06:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C32510E33D;
 Mon,  6 Feb 2023 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675674364; x=1707210364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C7WpaZv8w7vyN+pvZP4FCdmwKcbV8ktjs9obY4tho1c=;
 b=JhHq4wBA5jWclu3nESg+YwUsACDfy2K6kzMl45jSb203jk1esLaXQKKk
 15NDnHiiglugBfFV27AYoxh+vkUr3UqBS8rnN3nFCvD2hwJwb7gPJHXUO
 BQtSuWk0B2X0p0oL64avsMu0w69EPrCAmUs5aSZTjCSrDiTBZHhO+QcGs
 Va8RooPiipvKi12Thns+EChodU/U+IIox62BEs8U91OxDVEXctHtwLOu0
 tncrmBDjcyk+F9QUz/qZ9WcyzdxO8WUNZPD5QggtmFkOVAIoRHIBQtcYd
 1FZS5RXHqITDZF5Z4ftkpS1rcHnLEWX8gw4XOrNr/aaGP+GoHav2N6Rt2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309495899"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="309495899"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911862860"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="911862860"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 01:06:01 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 11/14] vfio: Make vfio_device_open() exclusive between
 group path and device cdev path
Date: Mon,  6 Feb 2023 01:05:29 -0800
Message-Id: <20230206090532.95598-12-yi.l.liu@intel.com>
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

With the introduction of vfio device cdev, userspace can get device
access by either the legacy group path or the cdev path. For VFIO devices,
it can only be opened by one of the group path and the cdev path at one
time. e.g. when the device is opened via cdev path, the group path should
be failed. Both paths will call into vfio_device_open(), so the exclusion
is done in it.

VFIO group has historically allowed multi-open of the device FD. This
was made secure because the "open" was executed via an ioctl to the
group FD which is itself only single open.

However, no known use of multiple device FDs today. It is kind of a
strange thing to do because new device FDs can naturally be created
via dup().

When we implement the new device uAPI (only used in cdev path) there is
no natural way to allow the device itself from being multi-opened in a
secure manner. Without the group FD we cannot prove the security context
of the opener.

Thus, when moving to the new uAPI we block the ability to multi-open
the device. Old group path still allows it. This requires vfio_device_open()
exclusive between the cdev path with the group path.

The main logic is in the vfio_device_open(). It needs to sustain both
the legacy behavior i.e. multi-open in the group path and the new
behavior i.e. single-open in the cdev path. This mixture leads to the
introduction of a new is_cdev_device flag in struct vfio_device_file,
and a single_open flag in struct vfio_device.
    - vfio_device_file::is_cdev_device is set per the vfio_device_file
      allocation.
    - vfio_device::single_open is set after open_device op is called
      successfully if vfio_device_file::is_cdev_device is set.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     |  2 +-
 drivers/vfio/vfio.h      |  4 +++-
 drivers/vfio/vfio_main.c | 26 +++++++++++++++++++++++---
 include/linux/vfio.h     |  1 +
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 9f3f6f0e4942..a90273aa77ec 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -237,7 +237,7 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
 	struct file *filep;
 	int ret;
 
-	df = vfio_allocate_device_file(device);
+	df = vfio_allocate_device_file(device, false);
 	if (IS_ERR(df)) {
 		ret = PTR_ERR(df);
 		goto err_out;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 9126500381f5..2debf0173861 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -18,6 +18,8 @@ struct vfio_container;
 
 struct vfio_device_file {
 	struct vfio_device *device;
+	bool is_cdev_device;
+
 	bool access_granted;
 	spinlock_t kvm_ref_lock; /* protect kvm field */
 	struct kvm *kvm;
@@ -30,7 +32,7 @@ int vfio_device_open(struct vfio_device_file *df,
 		     u32 *dev_id, u32 *pt_id);
 void vfio_device_close(struct vfio_device_file *df);
 struct vfio_device_file *
-vfio_allocate_device_file(struct vfio_device *device);
+vfio_allocate_device_file(struct vfio_device *device, bool is_cdev_device);
 
 extern const struct file_operations vfio_device_fops;
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 05dd4b89e9d1..e07b185f9820 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -398,7 +398,7 @@ static bool vfio_assert_device_open(struct vfio_device *device)
 }
 
 struct vfio_device_file *
-vfio_allocate_device_file(struct vfio_device *device)
+vfio_allocate_device_file(struct vfio_device *device, bool is_cdev_device)
 {
 	struct vfio_device_file *df;
 
@@ -407,6 +407,7 @@ vfio_allocate_device_file(struct vfio_device *device)
 		return ERR_PTR(-ENOMEM);
 
 	df->device = device;
+	df->is_cdev_device = is_cdev_device;
 	spin_lock_init(&df->kvm_ref_lock);
 
 	return df;
@@ -472,11 +473,23 @@ int vfio_device_open(struct vfio_device_file *df,
 
 	lockdep_assert_held(&device->dev_set->lock);
 
+	/*
+	 * Device cdev path cannot support multiple device open since
+	 * it doesn't have a secure way for it. So a second device
+	 * open attempt should be failed if the caller is from a cdev
+	 * path or the device has already been opened by a cdev path.
+	 */
+	if (device->open_count != 0 &&
+	    (df->is_cdev_device || device->single_open))
+		return -EINVAL;
+
 	device->open_count++;
 	if (device->open_count == 1) {
 		ret = vfio_device_first_open(df, dev_id, pt_id);
 		if (ret)
 			device->open_count--;
+		else
+			device->single_open = df->is_cdev_device;
 	}
 
 	if (ret)
@@ -497,8 +510,10 @@ void vfio_device_close(struct vfio_device_file *df)
 	lockdep_assert_held(&device->dev_set->lock);
 
 	vfio_assert_device_open(device);
-	if (device->open_count == 1)
+	if (device->open_count == 1) {
 		vfio_device_last_close(df);
+		device->single_open = false; // clear single_open flag
+	}
 	device->open_count--;
 }
 
@@ -543,7 +558,12 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	struct vfio_device_file *df = filep->private_data;
 	struct vfio_device *device = df->device;
 
-	vfio_device_group_close(df);
+	/*
+	 * group path supports multiple device open, while cdev doesn't.
+	 * So use vfio_device_group_close() for !singel_open case.
+	 */
+	if (!df->is_cdev_device)
+		vfio_device_group_close(df);
 
 	vfio_device_put_registration(device);
 
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 70380d4955e1..83d1e0af0a70 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -63,6 +63,7 @@ struct vfio_device {
 	struct iommufd_ctx *iommufd_ictx;
 	bool iommufd_attached;
 #endif
+	bool single_open;
 };
 
 /**
-- 
2.34.1

