Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF36A4026
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 12:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7453E10E3C1;
	Mon, 27 Feb 2023 11:11:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3A10E3BE;
 Mon, 27 Feb 2023 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677496307; x=1709032307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TnrlnqPITmFu04vuqNlTbI4Gcrw9Bgh9GHe8hfhk1Vw=;
 b=Js5nBh2pPfDaZPtHTRWaP6oMsKTt/ZvapJvwGh3pybclRNyCMEtJ1OZv
 2ISKOMj7ynetWW5r196qgyo1ZOuSfSl+1A52y31u4EYUiGLr7UhxtZZwg
 bZXoQV/tGozAZkCoKcPh8gEfiFvH/Dn4i7HAL9QnrkFRbRhxzH55caf69
 k4UmeST6bg3qzHtlgDrG2cmP8U3CvpkK2NziMxPNensxHy5h2Mm26oBZ3
 oLUeonDqLdr1bLrP72zcB6xX48hD47V+oSIPM0ouRRw2fjmsOKSam9sAw
 qjrAqReetc+3kJ/fcRMPKySUYF95DJlP9WzasDPKygieYaYZLGGLtG31V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="420097714"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="420097714"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="651189573"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="651189573"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 03:11:46 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 13/19] vfio: Add cdev_device_open_cnt to vfio_group
Date: Mon, 27 Feb 2023 03:11:29 -0800
Message-Id: <20230227111135.61728-14-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227111135.61728-1-yi.l.liu@intel.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
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

for counting the devices that are opened via the cdev path. This count
is increased and decreased by the cdev path. The group path checks it
to achieve exclusion with the cdev path. With this, only one path (group
path or cdev path) will claim DMA ownership. This avoids scenarios in
which devices within the same group may be opened via different paths.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/group.c | 33 +++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h  |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index e44232551448..d4d78d63db06 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -387,6 +387,33 @@ static long vfio_group_fops_unl_ioctl(struct file *filep,
 	}
 }
 
+int vfio_device_block_group(struct vfio_device *device)
+{
+	struct vfio_group *group = device->group;
+	int ret = 0;
+
+	mutex_lock(&group->group_lock);
+	if (group->opened_file) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	group->cdev_device_open_cnt++;
+
+out_unlock:
+	mutex_unlock(&group->group_lock);
+	return ret;
+}
+
+void vfio_device_unblock_group(struct vfio_device *device)
+{
+	struct vfio_group *group = device->group;
+
+	mutex_lock(&group->group_lock);
+	group->cdev_device_open_cnt--;
+	mutex_unlock(&group->group_lock);
+}
+
 static int vfio_group_fops_open(struct inode *inode, struct file *filep)
 {
 	struct vfio_group *group =
@@ -409,6 +436,11 @@ static int vfio_group_fops_open(struct inode *inode, struct file *filep)
 		goto out_unlock;
 	}
 
+	if (group->cdev_device_open_cnt) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
 	/*
 	 * Do we need multiple instances of the group open?  Seems not.
 	 */
@@ -483,6 +515,7 @@ static void vfio_group_release(struct device *dev)
 	mutex_destroy(&group->device_lock);
 	mutex_destroy(&group->group_lock);
 	WARN_ON(group->iommu_group);
+	WARN_ON(group->cdev_device_open_cnt);
 	ida_free(&vfio.group_ida, MINOR(group->dev.devt));
 	kfree(group);
 }
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 04d2bd2e314d..a61d4df30716 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -84,8 +84,11 @@ struct vfio_group {
 	struct blocking_notifier_head	notifier;
 	struct iommufd_ctx		*iommufd;
 	spinlock_t			kvm_ref_lock;
+	unsigned int			cdev_device_open_cnt;
 };
 
+int vfio_device_block_group(struct vfio_device *device);
+void vfio_device_unblock_group(struct vfio_device *device);
 int vfio_device_set_group(struct vfio_device *device,
 			  enum vfio_group_type type);
 void vfio_device_remove_group(struct vfio_device *device);
-- 
2.34.1

