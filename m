Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D669D9A1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Feb 2023 04:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C772410E190;
	Tue, 21 Feb 2023 03:48:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AB710E19A;
 Tue, 21 Feb 2023 03:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676951315; x=1708487315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K55QzaM1Uq2FMbfnJPLqS1pga0jCaQMDwWeJE8VoIZQ=;
 b=jTDu4ic65VK9hp/aPvOqVOSN1dG7/bb3Ag9wqIcIobSyiGLT4QRV7IOR
 WMQhkwB/4mWd6HJgDCeVqg/BbQ08pxLmof0Za///HXjfDuuKqVyYDW6Hq
 4VhpXS/u2MlPEYKg6WDgv7U28GTcSHWmRbZfdRssUZFotmbsafKYqR//l
 UdECHRII5W7onkr7el4hDHLLDqBzSBkkRvCr91Bid3woSatr89vhwX+zR
 2O5R9g0H1gzA2fxh2J+5voTVS1ojrypPX7BUSGtzL2rNDxdfUlNHGaKqK
 d737md+WLYV24oGBUEduIvHUX7bYaHY0CuVFvBCX1DgR3EM5DjvYBsGGy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397218533"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="397218533"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 19:48:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="664822218"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="664822218"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 20 Feb 2023 19:48:27 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 17/19] vfio: Add VFIO_DEVICE_AT[DE]TACH_IOMMUFD_PT
Date: Mon, 20 Feb 2023 19:48:10 -0800
Message-Id: <20230221034812.138051-18-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221034812.138051-1-yi.l.liu@intel.com>
References: <20230221034812.138051-1-yi.l.liu@intel.com>
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
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, joro@8bytes.org,
 cohuck@redhat.com, xudong.hao@intel.com, peterx@redhat.com,
 yan.y.zhao@intel.com, eric.auger@redhat.com, terrence.xu@intel.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, intel-gfx@lists.freedesktop.org,
 chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This adds ioctl for userspace to attach device cdev fd to and detach
from IOAS/hw_pagetable managed by iommufd.

    VFIO_DEVICE_ATTACH_IOMMUFD_PT: attach vfio device to IOAS, hw_pagetable
				   managed by iommufd. Attach can be
				   undo by VFIO_DEVICE_DETACH_IOMMUFD_PT
				   or device fd close.
    VFIO_DEVICE_DETACH_IOMMUFD_PT: detach vfio device from the current attached
				   IOAS or hw_pagetable managed by iommufd.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/device_cdev.c | 76 ++++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h        | 16 ++++++++
 drivers/vfio/vfio_main.c   |  8 ++++
 include/uapi/linux/vfio.h  | 52 ++++++++++++++++++++++++++
 4 files changed, 152 insertions(+)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index be62f0a5687e..6870e42944ba 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -182,6 +182,82 @@ long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
 	return ret;
 }
 
+int vfio_ioctl_device_attach(struct vfio_device_file *df,
+			     void __user *arg)
+{
+	struct vfio_device *device = df->device;
+	struct vfio_device_attach_iommufd_pt attach;
+	unsigned long minsz;
+	int ret;
+
+	minsz = offsetofend(struct vfio_device_attach_iommufd_pt, pt_id);
+
+	if (copy_from_user(&attach, (void __user *)arg, minsz))
+		return -EFAULT;
+
+	if (attach.argsz < minsz || attach.flags ||
+	    attach.pt_id == IOMMUFD_INVALID_ID)
+		return -EINVAL;
+
+	if (!device->ops->bind_iommufd)
+		return -ENODEV;
+
+	mutex_lock(&device->dev_set->lock);
+	if (df->noiommu) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ret = device->ops->attach_ioas(device, &attach.pt_id);
+	if (ret)
+		goto out_unlock;
+
+	ret = copy_to_user((void __user *)arg +
+			   offsetofend(struct vfio_device_attach_iommufd_pt, flags),
+			   &attach.pt_id,
+			   sizeof(attach.pt_id)) ? -EFAULT : 0;
+	if (ret)
+		goto out_detach;
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
+int vfio_ioctl_device_detach(struct vfio_device_file *df,
+			     void __user *arg)
+{
+	struct vfio_device *device = df->device;
+	struct vfio_device_detach_iommufd_pt detach;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct vfio_device_detach_iommufd_pt, flags);
+
+	if (copy_from_user(&detach, (void __user *)arg, minsz))
+		return -EFAULT;
+
+	if (detach.argsz < minsz || detach.flags)
+		return -EINVAL;
+
+	if (!device->ops->bind_iommufd)
+		return -ENODEV;
+
+	mutex_lock(&device->dev_set->lock);
+	if (df->noiommu) {
+		mutex_unlock(&device->dev_set->lock);
+		return -EINVAL;
+	}
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
index 40b54b0ce993..1cba2baafb08 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -264,6 +264,10 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
 void vfio_device_cdev_close(struct vfio_device_file *df);
 long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
 				    unsigned long arg);
+int vfio_ioctl_device_attach(struct vfio_device_file *df,
+			     void __user *arg);
+int vfio_ioctl_device_detach(struct vfio_device_file *df,
+			     void __user *arg);
 int vfio_cdev_init(struct class *device_class);
 void vfio_cdev_cleanup(void);
 #else
@@ -297,6 +301,18 @@ static inline long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
 	return -EOPNOTSUPP;
 }
 
+static inline int vfio_ioctl_device_attach(struct vfio_device_file *df,
+					   void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int vfio_ioctl_device_detach(struct vfio_device_file *df,
+					   void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int vfio_cdev_init(struct class *device_class)
 {
 	return 0;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 5e9a4fd800be..af03ea97844e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1157,6 +1157,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 		ret = vfio_ioctl_device_feature(device, (void __user *)arg);
 		break;
 
+	case VFIO_DEVICE_ATTACH_IOMMUFD_PT:
+		ret = vfio_ioctl_device_attach(df, (void __user *)arg);
+		break;
+
+	case VFIO_DEVICE_DETACH_IOMMUFD_PT:
+		ret = vfio_ioctl_device_detach(df, (void __user *)arg);
+		break;
+
 	default:
 		if (unlikely(!device->ops->ioctl))
 			ret = -EINVAL;
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 1fe69173e739..026af52cf22e 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -228,6 +228,58 @@ struct vfio_device_bind_iommufd {
 
 #define VFIO_DEVICE_BIND_IOMMUFD	_IO(VFIO_TYPE, VFIO_BASE + 19)
 
+/*
+ * VFIO_DEVICE_ATTACH_IOMMUFD_PT - _IOW(VFIO_TYPE, VFIO_BASE + 20,
+ *					struct vfio_device_attach_iommufd_pt)
+ *
+ * Attach a vfio device to an iommufd address space specified by IOAS
+ * id or hw_pagetable (hwpt) id.
+ *
+ * Available only after a device has been bound to iommufd via
+ * VFIO_DEVICE_BIND_IOMMUFD
+ *
+ * Undo by VFIO_DEVICE_DETACH_IOMMUFD_PT or device fd close.
+ *
+ * @argsz:	user filled size of this data.
+ * @flags:	must be 0.
+ * @pt_id:	Input the target id which can represent an ioas or a hwpt
+ *		allocated via iommufd subsystem.
+ *		Output the attached hwpt id which could be the specified
+ *		hwpt itself or a hwpt automatically created for the
+ *		specified ioas by kernel during the attachment.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vfio_device_attach_iommufd_pt {
+	__u32	argsz;
+	__u32	flags;
+	__u32	pt_id;
+};
+
+#define VFIO_DEVICE_ATTACH_IOMMUFD_PT		_IO(VFIO_TYPE, VFIO_BASE + 20)
+
+/*
+ * VFIO_DEVICE_DETACH_IOMMUFD_PT - _IOW(VFIO_TYPE, VFIO_BASE + 21,
+ *					struct vfio_device_detach_iommufd_pt)
+ *
+ * Detach a vfio device from the iommufd address space it has been
+ * attached to. After it, device should be in a blocking DMA state.
+ *
+ * Available only after a device has been bound to iommufd via
+ * VFIO_DEVICE_BIND_IOMMUFD
+ *
+ * @argsz:	user filled size of this data.
+ * @flags:	must be 0.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vfio_device_detach_iommufd_pt {
+	__u32	argsz;
+	__u32	flags;
+};
+
+#define VFIO_DEVICE_DETACH_IOMMUFD_PT		_IO(VFIO_TYPE, VFIO_BASE + 21)
+
 /**
  * VFIO_DEVICE_GET_INFO - _IOR(VFIO_TYPE, VFIO_BASE + 7,
  *						struct vfio_device_info)
-- 
2.34.1

