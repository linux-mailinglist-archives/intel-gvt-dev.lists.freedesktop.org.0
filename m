Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05F6B08D8
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A6510E603;
	Wed,  8 Mar 2023 13:29:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C7E10E610;
 Wed,  8 Mar 2023 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282171; x=1709818171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p0+sdiJRsT1CFvbgXCytRESDpwjpnnBYhpkQpIa3C7k=;
 b=GEnKuiKHV06HxxHZA4xWnCr14sqisaQEPtSRsCJaNDuyrg8WNmnoU6PL
 W6hbWS6B+wIVliGqBu6n9poGf3BdvmfPp5k9nrIulRIWUDZCkHSBnQ67e
 AMYN4ubm+F++H6k3hs8S/S2n57na9tXQhelDmfmlFPpyplNoaeHGl2HKB
 Cy3qn3VbcFEvP2kfu/HEz+GL7G8ie2IL48Y5AYu6lOjNovcr+f57Pjfkn
 IQuZjGPhwYCCmwShNfdRyTT6OukXrB5ZBZHBLI6+YE1ciKc22zuMdWhh2
 TvKvxx3qKoVsvDkQdadivF7Stgbw8psNW+xQTfFTN5s1AMMFr+ND83foj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165247"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165247"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789400"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789400"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:29 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 14/24] vfio: Add cdev_device_open_cnt to vfio_group
Date: Wed,  8 Mar 2023 05:28:53 -0800
Message-Id: <20230308132903.465159-15-yi.l.liu@intel.com>
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

for counting the devices that are opened via the cdev path. This count
is increased and decreased by the cdev path. The group path checks it
to achieve exclusion with the cdev path. With this, only one path (group
path or cdev path) will claim DMA ownership. This avoids scenarios in
which devices within the same group may be opened via different paths.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 drivers/vfio/group.c | 33 +++++++++++++++++++++++++++++++++
 drivers/vfio/vfio.h  |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 555d68aefa71..63aafd59278d 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -392,6 +392,33 @@ static long vfio_group_fops_unl_ioctl(struct file *filep,
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
@@ -414,6 +441,11 @@ static int vfio_group_fops_open(struct inode *inode, struct file *filep)
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
@@ -488,6 +520,7 @@ static void vfio_group_release(struct device *dev)
 	mutex_destroy(&group->device_lock);
 	mutex_destroy(&group->group_lock);
 	WARN_ON(group->iommu_group);
+	WARN_ON(group->cdev_device_open_cnt);
 	ida_free(&vfio.group_ida, MINOR(group->dev.devt));
 	kfree(group);
 }
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 3356321805e9..e1b8763e443e 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -83,8 +83,11 @@ struct vfio_group {
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

