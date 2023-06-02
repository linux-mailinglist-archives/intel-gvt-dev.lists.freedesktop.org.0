Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1072017F
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Jun 2023 14:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C879F10E686;
	Fri,  2 Jun 2023 12:17:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9D310E681;
 Fri,  2 Jun 2023 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685708219; x=1717244219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lw+vwvdxEdp9BEWzE4GXkpHsjk6zyDUEhjLk1tCdoGw=;
 b=HeOF+lcZmtWxS/3IjTlMDndnlpTStGUczmlAa+7iuv1pk8AUEmNB/r3o
 zgmSvxqPEb+d8xBh7ua6Gq4J+jTfFRKqeXMPCIjfc/cSxM1iSrsT6vFJ+
 toK4LbovtpAUpzaniiuKGy+BVRkoKAZ2FMEvSO4qPRDANakRk6F91yohf
 UiPpXL7xbiQHoz/G/fW80kxRWQzb6TRVHOqPgxvRg89008k8MLOVf/gOP
 2OwCjWe2k/eNVNhDkkwb1FbxbvxzT51cTKoxtOAqGT3kKxPYZH9lcsoBF
 xEXoEQrPfYPBm8RUUVZZ7GeJxegR/uMINPciTv9NjzEjkF4utbPROMk3p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384136509"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="384136509"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 05:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037947266"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="1037947266"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2023 05:16:58 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v12 04/24] kvm/vfio: Prepare for accepting vfio device fd
Date: Fri,  2 Jun 2023 05:16:33 -0700
Message-Id: <20230602121653.80017-5-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602121653.80017-1-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
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

This renames kvm_vfio_group related helpers to prepare for accepting
vfio device fd. No functional change is intended.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 virt/kvm/vfio.c | 115 ++++++++++++++++++++++++------------------------
 1 file changed, 58 insertions(+), 57 deletions(-)

diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index b33c7b8488b3..8f7fa07e8170 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -21,7 +21,7 @@
 #include <asm/kvm_ppc.h>
 #endif
 
-struct kvm_vfio_group {
+struct kvm_vfio_file {
 	struct list_head node;
 	struct file *file;
 #ifdef CONFIG_SPAPR_TCE_IOMMU
@@ -30,7 +30,7 @@ struct kvm_vfio_group {
 };
 
 struct kvm_vfio {
-	struct list_head group_list;
+	struct list_head file_list;
 	struct mutex lock;
 	bool noncoherent;
 };
@@ -98,34 +98,35 @@ static struct iommu_group *kvm_vfio_file_iommu_group(struct file *file)
 }
 
 static void kvm_spapr_tce_release_vfio_group(struct kvm *kvm,
-					     struct kvm_vfio_group *kvg)
+					     struct kvm_vfio_file *kvf)
 {
-	if (WARN_ON_ONCE(!kvg->iommu_group))
+	if (WARN_ON_ONCE(!kvf->iommu_group))
 		return;
 
-	kvm_spapr_tce_release_iommu_group(kvm, kvg->iommu_group);
-	iommu_group_put(kvg->iommu_group);
-	kvg->iommu_group = NULL;
+	kvm_spapr_tce_release_iommu_group(kvm, kvf->iommu_group);
+	iommu_group_put(kvf->iommu_group);
+	kvf->iommu_group = NULL;
 }
 #endif
 
 /*
- * Groups can use the same or different IOMMU domains.  If the same then
- * adding a new group may change the coherency of groups we've previously
- * been told about.  We don't want to care about any of that so we retest
- * each group and bail as soon as we find one that's noncoherent.  This
- * means we only ever [un]register_noncoherent_dma once for the whole device.
+ * Groups/devices can use the same or different IOMMU domains. If the same
+ * then adding a new group/device may change the coherency of groups/devices
+ * we've previously been told about. We don't want to care about any of
+ * that so we retest each group/device and bail as soon as we find one that's
+ * noncoherent.  This means we only ever [un]register_noncoherent_dma once
+ * for the whole device.
  */
 static void kvm_vfio_update_coherency(struct kvm_device *dev)
 {
 	struct kvm_vfio *kv = dev->private;
 	bool noncoherent = false;
-	struct kvm_vfio_group *kvg;
+	struct kvm_vfio_file *kvf;
 
 	mutex_lock(&kv->lock);
 
-	list_for_each_entry(kvg, &kv->group_list, node) {
-		if (!kvm_vfio_file_enforced_coherent(kvg->file)) {
+	list_for_each_entry(kvf, &kv->file_list, node) {
+		if (!kvm_vfio_file_enforced_coherent(kvf->file)) {
 			noncoherent = true;
 			break;
 		}
@@ -143,10 +144,10 @@ static void kvm_vfio_update_coherency(struct kvm_device *dev)
 	mutex_unlock(&kv->lock);
 }
 
-static int kvm_vfio_group_add(struct kvm_device *dev, unsigned int fd)
+static int kvm_vfio_file_add(struct kvm_device *dev, unsigned int fd)
 {
 	struct kvm_vfio *kv = dev->private;
-	struct kvm_vfio_group *kvg;
+	struct kvm_vfio_file *kvf;
 	struct file *filp;
 	int ret;
 
@@ -162,27 +163,27 @@ static int kvm_vfio_group_add(struct kvm_device *dev, unsigned int fd)
 
 	mutex_lock(&kv->lock);
 
-	list_for_each_entry(kvg, &kv->group_list, node) {
-		if (kvg->file == filp) {
+	list_for_each_entry(kvf, &kv->file_list, node) {
+		if (kvf->file == filp) {
 			ret = -EEXIST;
 			goto err_unlock;
 		}
 	}
 
-	kvg = kzalloc(sizeof(*kvg), GFP_KERNEL_ACCOUNT);
-	if (!kvg) {
+	kvf = kzalloc(sizeof(*kvf), GFP_KERNEL_ACCOUNT);
+	if (!kvf) {
 		ret = -ENOMEM;
 		goto err_unlock;
 	}
 
-	kvg->file = filp;
-	list_add_tail(&kvg->node, &kv->group_list);
+	kvf->file = filp;
+	list_add_tail(&kvf->node, &kv->file_list);
 
 	kvm_arch_start_assignment(dev->kvm);
 
 	mutex_unlock(&kv->lock);
 
-	kvm_vfio_file_set_kvm(kvg->file, dev->kvm);
+	kvm_vfio_file_set_kvm(kvf->file, dev->kvm);
 	kvm_vfio_update_coherency(dev);
 
 	return 0;
@@ -193,10 +194,10 @@ static int kvm_vfio_group_add(struct kvm_device *dev, unsigned int fd)
 	return ret;
 }
 
-static int kvm_vfio_group_del(struct kvm_device *dev, unsigned int fd)
+static int kvm_vfio_file_del(struct kvm_device *dev, unsigned int fd)
 {
 	struct kvm_vfio *kv = dev->private;
-	struct kvm_vfio_group *kvg;
+	struct kvm_vfio_file *kvf;
 	struct fd f;
 	int ret;
 
@@ -208,18 +209,18 @@ static int kvm_vfio_group_del(struct kvm_device *dev, unsigned int fd)
 
 	mutex_lock(&kv->lock);
 
-	list_for_each_entry(kvg, &kv->group_list, node) {
-		if (kvg->file != f.file)
+	list_for_each_entry(kvf, &kv->file_list, node) {
+		if (kvf->file != f.file)
 			continue;
 
-		list_del(&kvg->node);
+		list_del(&kvf->node);
 		kvm_arch_end_assignment(dev->kvm);
 #ifdef CONFIG_SPAPR_TCE_IOMMU
-		kvm_spapr_tce_release_vfio_group(dev->kvm, kvg);
+		kvm_spapr_tce_release_vfio_group(dev->kvm, kvf);
 #endif
-		kvm_vfio_file_set_kvm(kvg->file, NULL);
-		fput(kvg->file);
-		kfree(kvg);
+		kvm_vfio_file_set_kvm(kvf->file, NULL);
+		fput(kvf->file);
+		kfree(kvf);
 		ret = 0;
 		break;
 	}
@@ -234,12 +235,12 @@ static int kvm_vfio_group_del(struct kvm_device *dev, unsigned int fd)
 }
 
 #ifdef CONFIG_SPAPR_TCE_IOMMU
-static int kvm_vfio_group_set_spapr_tce(struct kvm_device *dev,
-					void __user *arg)
+static int kvm_vfio_file_set_spapr_tce(struct kvm_device *dev,
+				       void __user *arg)
 {
 	struct kvm_vfio_spapr_tce param;
 	struct kvm_vfio *kv = dev->private;
-	struct kvm_vfio_group *kvg;
+	struct kvm_vfio_file *kvf;
 	struct fd f;
 	int ret;
 
@@ -254,20 +255,20 @@ static int kvm_vfio_group_set_spapr_tce(struct kvm_device *dev,
 
 	mutex_lock(&kv->lock);
 
-	list_for_each_entry(kvg, &kv->group_list, node) {
-		if (kvg->file != f.file)
+	list_for_each_entry(kvf, &kv->file_list, node) {
+		if (kvf->file != f.file)
 			continue;
 
-		if (!kvg->iommu_group) {
-			kvg->iommu_group = kvm_vfio_file_iommu_group(kvg->file);
-			if (WARN_ON_ONCE(!kvg->iommu_group)) {
+		if (!kvf->iommu_group) {
+			kvf->iommu_group = kvm_vfio_file_iommu_group(kvf->file);
+			if (WARN_ON_ONCE(!kvf->iommu_group)) {
 				ret = -EIO;
 				goto err_fdput;
 			}
 		}
 
 		ret = kvm_spapr_tce_attach_iommu_group(dev->kvm, param.tablefd,
-						       kvg->iommu_group);
+						       kvf->iommu_group);
 		break;
 	}
 
@@ -278,8 +279,8 @@ static int kvm_vfio_group_set_spapr_tce(struct kvm_device *dev,
 }
 #endif
 
-static int kvm_vfio_set_group(struct kvm_device *dev, long attr,
-			      void __user *arg)
+static int kvm_vfio_set_file(struct kvm_device *dev, long attr,
+			     void __user *arg)
 {
 	int32_t __user *argp = arg;
 	int32_t fd;
@@ -288,16 +289,16 @@ static int kvm_vfio_set_group(struct kvm_device *dev, long attr,
 	case KVM_DEV_VFIO_GROUP_ADD:
 		if (get_user(fd, argp))
 			return -EFAULT;
-		return kvm_vfio_group_add(dev, fd);
+		return kvm_vfio_file_add(dev, fd);
 
 	case KVM_DEV_VFIO_GROUP_DEL:
 		if (get_user(fd, argp))
 			return -EFAULT;
-		return kvm_vfio_group_del(dev, fd);
+		return kvm_vfio_file_del(dev, fd);
 
 #ifdef CONFIG_SPAPR_TCE_IOMMU
 	case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
-		return kvm_vfio_group_set_spapr_tce(dev, arg);
+		return kvm_vfio_file_set_spapr_tce(dev, arg);
 #endif
 	}
 
@@ -309,8 +310,8 @@ static int kvm_vfio_set_attr(struct kvm_device *dev,
 {
 	switch (attr->group) {
 	case KVM_DEV_VFIO_GROUP:
-		return kvm_vfio_set_group(dev, attr->attr,
-					  u64_to_user_ptr(attr->addr));
+		return kvm_vfio_set_file(dev, attr->attr,
+					 u64_to_user_ptr(attr->addr));
 	}
 
 	return -ENXIO;
@@ -339,16 +340,16 @@ static int kvm_vfio_has_attr(struct kvm_device *dev,
 static void kvm_vfio_release(struct kvm_device *dev)
 {
 	struct kvm_vfio *kv = dev->private;
-	struct kvm_vfio_group *kvg, *tmp;
+	struct kvm_vfio_file *kvf, *tmp;
 
-	list_for_each_entry_safe(kvg, tmp, &kv->group_list, node) {
+	list_for_each_entry_safe(kvf, tmp, &kv->file_list, node) {
 #ifdef CONFIG_SPAPR_TCE_IOMMU
-		kvm_spapr_tce_release_vfio_group(dev->kvm, kvg);
+		kvm_spapr_tce_release_vfio_group(dev->kvm, kvf);
 #endif
-		kvm_vfio_file_set_kvm(kvg->file, NULL);
-		fput(kvg->file);
-		list_del(&kvg->node);
-		kfree(kvg);
+		kvm_vfio_file_set_kvm(kvf->file, NULL);
+		fput(kvf->file);
+		list_del(&kvf->node);
+		kfree(kvf);
 		kvm_arch_end_assignment(dev->kvm);
 	}
 
@@ -382,7 +383,7 @@ static int kvm_vfio_create(struct kvm_device *dev, u32 type)
 	if (!kv)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&kv->group_list);
+	INIT_LIST_HEAD(&kv->file_list);
 	mutex_init(&kv->lock);
 
 	dev->private = kv;
-- 
2.34.1

