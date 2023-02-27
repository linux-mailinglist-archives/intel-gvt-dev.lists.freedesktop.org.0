Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D726A4010
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 12:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C95A10E3C1;
	Mon, 27 Feb 2023 11:11:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A1810E3B5;
 Mon, 27 Feb 2023 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677496299; x=1709032299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4V4tri1LJEDOJcJsFhfXwZ150imt3TnXkCcqIxj5+HY=;
 b=WTdZHgKG9ZyN47N4opnpaTyZ7kC5TTzVkxn/vHKKorpU+QEj/9InmBo5
 4mNDWWUHjJY07pWeXz7sJpgx6jZSml3DNCh/5ifOIFNNVnxhwvQr3tG7r
 ajr+ctayek7B8717oPn1vp+pQdVoFsSyDlL+KV9pBh1WTxOImS4DFjd+T
 yDN3r/ZnNM09i3PORkErtZ6JwPpKN5JKQTVBhou7l5cwyCTZFB7yuT/DG
 gTLtTGrbbLY79Ng9Ib9vLRoend6hIXLbSEis//IcKBCWkkJmVoQyRrGGr
 tU0w2Qhbtsj/bSXOqsHdnegaF5NmEFNneS/urBfTqniwUdzm7VUtkWrad Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="420097563"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="420097563"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="651189417"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="651189417"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 03:11:38 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v5 03/19] vfio: Accept vfio device file in the KVM facing kAPI
Date: Mon, 27 Feb 2023 03:11:19 -0800
Message-Id: <20230227111135.61728-4-yi.l.liu@intel.com>
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

This makes the vfio file kAPIs to accepte vfio device files, also a
preparation for vfio device cdev support.

For the kvm set with vfio device file, kvm pointer is stored in struct
vfio_device_file, and use kvm_ref_lock to protect kvm set and kvm
pointer usage within VFIO. This kvm pointer will be set to vfio_device
after device file is bound to iommufd in the cdev path.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/vfio.h      |  2 ++
 drivers/vfio/vfio_main.c | 42 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 4612cadb6c56..59ca8b3d7563 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -18,6 +18,8 @@ struct vfio_container;
 
 struct vfio_device_file {
 	struct vfio_device *device;
+	spinlock_t kvm_ref_lock; /* protect kvm field */
+	struct kvm *kvm;
 };
 
 void vfio_device_put_registration(struct vfio_device *device);
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 42ed3955814f..9941db787891 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -406,6 +406,7 @@ vfio_allocate_device_file(struct vfio_device *device)
 		return ERR_PTR(-ENOMEM);
 
 	df->device = device;
+	spin_lock_init(&df->kvm_ref_lock);
 
 	return df;
 }
@@ -1167,13 +1168,23 @@ const struct file_operations vfio_device_fops = {
 	.mmap		= vfio_device_fops_mmap,
 };
 
+static struct vfio_device *vfio_device_from_file(struct file *file)
+{
+	struct vfio_device_file *df = file->private_data;
+
+	if (file->f_op != &vfio_device_fops)
+		return NULL;
+	return df->device;
+}
+
 /**
  * vfio_file_is_valid - True if the file is valid vfio file
  * @file: VFIO group file or VFIO device file
  */
 bool vfio_file_is_valid(struct file *file)
 {
-	return vfio_group_from_file(file);
+	return vfio_group_from_file(file) ||
+	       vfio_device_from_file(file);
 }
 EXPORT_SYMBOL_GPL(vfio_file_is_valid);
 
@@ -1188,15 +1199,36 @@ EXPORT_SYMBOL_GPL(vfio_file_is_valid);
  */
 bool vfio_file_enforced_coherent(struct file *file)
 {
-	struct vfio_group *group = vfio_group_from_file(file);
+	struct vfio_group *group;
+	struct vfio_device *device;
 
+	group = vfio_group_from_file(file);
 	if (group)
 		return vfio_group_enforced_coherent(group);
 
+	device = vfio_device_from_file(file);
+	if (device)
+		return device_iommu_capable(device->dev,
+					    IOMMU_CAP_ENFORCE_CACHE_COHERENCY);
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 
+static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
+{
+	struct vfio_device_file *df = file->private_data;
+
+	/*
+	 * The kvm is first recorded in the vfio_device_file, and will
+	 * be propagated to vfio_device::kvm when the file is bound to
+	 * iommufd successfully in the vfio device cdev path.
+	 */
+	spin_lock(&df->kvm_ref_lock);
+	df->kvm = kvm;
+	spin_unlock(&df->kvm_ref_lock);
+}
+
 /**
  * vfio_file_set_kvm - Link a kvm with VFIO drivers
  * @file: VFIO group file or VFIO device file
@@ -1205,10 +1237,14 @@ EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
  */
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 {
-	struct vfio_group *group = vfio_group_from_file(file);
+	struct vfio_group *group;
 
+	group = vfio_group_from_file(file);
 	if (group)
 		vfio_group_set_kvm(group, kvm);
+
+	if (vfio_device_from_file(file))
+		vfio_device_file_set_kvm(file, kvm);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 
-- 
2.34.1

