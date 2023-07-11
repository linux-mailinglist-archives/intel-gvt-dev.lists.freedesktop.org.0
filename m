Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F110974E4DC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jul 2023 05:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A344C10E306;
	Tue, 11 Jul 2023 02:59:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C4510E2F8;
 Tue, 11 Jul 2023 02:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689044394; x=1720580394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+jFCGxQLqVCE0fOgD9TvDF3il67l3rPfGC/swcDibKU=;
 b=K/nhFeWSA3omEl15dO0utPrQ/WDYR64CkjxvRRbIalngFnY8UshdY0yH
 px1YUvyIA4nopJoWyUiGsYh5/zYl/VW/rBRRjUVimPbfwDsuJuZtMxGmG
 4eEGDL7pFsTdPCAMcp8w8gSyV3cDUF5ZXmHUIfsFUcy3a+oFjTc8LkfD6
 dFikQxtlCa4EOkbxfFxPnrEntW211ICpx2xUd/K+qvJwL4TYEFwyyqZPb
 KhReMRE3z4IpUk+z5y6IcriM64mk0zOA590BTCNSkN98Z3szcj0epBuo2
 FNRXVeKycoD2WxCE6EvvnjV/U+qEU7HXKN4w8iiSFKgYD0tUe5TWDF37P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361973223"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="361973223"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724250931"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="724250931"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 19:59:53 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v14 23/26] vfio: Add VFIO_DEVICE_[AT|DE]TACH_IOMMUFD_PT
Date: Mon, 10 Jul 2023 19:59:25 -0700
Message-Id: <20230711025928.6438-24-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711025928.6438-1-yi.l.liu@intel.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
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
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, yi.l.liu@intel.com,
 kvm@vger.kernel.org, lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org,
 nicolinc@nvidia.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This adds ioctl for userspace to attach device cdev fd to and detach
from IOAS/hw_pagetable managed by iommufd.

    VFIO_DEVICE_ATTACH_IOMMUFD_PT: attach vfio device to IOAS or hw_pagetable
				   managed by iommufd. Attach can be undo
				   by VFIO_DEVICE_DETACH_IOMMUFD_PT or device
				   fd close.
    VFIO_DEVICE_DETACH_IOMMUFD_PT: detach vfio device from the current attached
				   IOAS or hw_pagetable managed by iommufd.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/device_cdev.c | 58 ++++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h        |  5 ++++
 drivers/vfio/vfio_main.c   | 15 +++++++++-
 include/uapi/linux/vfio.h  | 44 +++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index f40784dd5561..e75da0a70d1f 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -152,6 +152,64 @@ void vfio_df_unbind_iommufd(struct vfio_device_file *df)
 	vfio_device_unblock_group(device);
 }
 
+int vfio_df_ioctl_attach_pt(struct vfio_device_file *df,
+			    struct vfio_device_attach_iommufd_pt __user *arg)
+{
+	struct vfio_device *device = df->device;
+	struct vfio_device_attach_iommufd_pt attach;
+	unsigned long minsz;
+	int ret;
+
+	minsz = offsetofend(struct vfio_device_attach_iommufd_pt, pt_id);
+
+	if (copy_from_user(&attach, arg, minsz))
+		return -EFAULT;
+
+	if (attach.argsz < minsz || attach.flags)
+		return -EINVAL;
+
+	mutex_lock(&device->dev_set->lock);
+	ret = device->ops->attach_ioas(device, &attach.pt_id);
+	if (ret)
+		goto out_unlock;
+
+	if (copy_to_user(&arg->pt_id, &attach.pt_id, sizeof(attach.pt_id))) {
+		ret = -EFAULT;
+		goto out_detach;
+	}
+	mutex_unlock(&device->dev_set->lock);
+
+	return 0;
+
+out_detach:
+	device->ops->detach_ioas(device);
+out_unlock:
+	mutex_unlock(&device->dev_set->lock);
+	return ret;
+}
+
+int vfio_df_ioctl_detach_pt(struct vfio_device_file *df,
+			    struct vfio_device_detach_iommufd_pt __user *arg)
+{
+	struct vfio_device *device = df->device;
+	struct vfio_device_detach_iommufd_pt detach;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct vfio_device_detach_iommufd_pt, flags);
+
+	if (copy_from_user(&detach, arg, minsz))
+		return -EFAULT;
+
+	if (detach.argsz < minsz || detach.flags)
+		return -EINVAL;
+
+	mutex_lock(&device->dev_set->lock);
+	device->ops->detach_ioas(device);
+	mutex_unlock(&device->dev_set->lock);
+
+	return 0;
+}
+
 static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 137d3e9ca798..1493bf8f4086 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -266,6 +266,11 @@ vfio_iommufd_compat_attach_ioas(struct vfio_device *device,
 }
 #endif
 
+int vfio_df_ioctl_attach_pt(struct vfio_device_file *df,
+			    struct vfio_device_attach_iommufd_pt __user *arg);
+int vfio_df_ioctl_detach_pt(struct vfio_device_file *df,
+			    struct vfio_device_detach_iommufd_pt __user *arg);
+
 #if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
 void vfio_init_device_cdev(struct vfio_device *device);
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 9fdf93ff17cf..ba1d84afe081 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1162,6 +1162,19 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 	if (ret)
 		return ret;
 
+	/* cdev only ioctls */
+	if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV) && !df->group) {
+		switch (cmd) {
+		case VFIO_DEVICE_ATTACH_IOMMUFD_PT:
+			ret = vfio_df_ioctl_attach_pt(df, uptr);
+			goto out;
+
+		case VFIO_DEVICE_DETACH_IOMMUFD_PT:
+			ret = vfio_df_ioctl_detach_pt(df, uptr);
+			goto out;
+		}
+	}
+
 	switch (cmd) {
 	case VFIO_DEVICE_FEATURE:
 		ret = vfio_ioctl_device_feature(device, uptr);
@@ -1174,7 +1187,7 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 			ret = device->ops->ioctl(device, cmd, arg);
 		break;
 	}
-
+out:
 	vfio_device_pm_runtime_put(device);
 	return ret;
 }
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 098946b23e86..fa06e3eb4955 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -924,6 +924,50 @@ struct vfio_device_bind_iommufd {
 
 #define VFIO_DEVICE_BIND_IOMMUFD	_IO(VFIO_TYPE, VFIO_BASE + 18)
 
+/*
+ * VFIO_DEVICE_ATTACH_IOMMUFD_PT - _IOW(VFIO_TYPE, VFIO_BASE + 19,
+ *					struct vfio_device_attach_iommufd_pt)
+ * @argsz:	User filled size of this data.
+ * @flags:	Must be 0.
+ * @pt_id:	Input the target id which can represent an ioas or a hwpt
+ *		allocated via iommufd subsystem.
+ *		Output the input ioas id or the attached hwpt id which could
+ *		be the specified hwpt itself or a hwpt automatically created
+ *		for the specified ioas by kernel during the attachment.
+ *
+ * Associate the device with an address space within the bound iommufd.
+ * Undo by VFIO_DEVICE_DETACH_IOMMUFD_PT or device fd close.  This is only
+ * allowed on cdev fds.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vfio_device_attach_iommufd_pt {
+	__u32	argsz;
+	__u32	flags;
+	__u32	pt_id;
+};
+
+#define VFIO_DEVICE_ATTACH_IOMMUFD_PT		_IO(VFIO_TYPE, VFIO_BASE + 19)
+
+/*
+ * VFIO_DEVICE_DETACH_IOMMUFD_PT - _IOW(VFIO_TYPE, VFIO_BASE + 20,
+ *					struct vfio_device_detach_iommufd_pt)
+ * @argsz:	User filled size of this data.
+ * @flags:	Must be 0.
+ *
+ * Remove the association of the device and its current associated address
+ * space.  After it, the device should be in a blocking DMA state.  This is only
+ * allowed on cdev fds.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vfio_device_detach_iommufd_pt {
+	__u32	argsz;
+	__u32	flags;
+};
+
+#define VFIO_DEVICE_DETACH_IOMMUFD_PT		_IO(VFIO_TYPE, VFIO_BASE + 20)
+
 /*
  * Provide support for setting a PCI VF Token, which is used as a shared
  * secret between PF and VF drivers.  This feature may only be set on a
-- 
2.34.1

