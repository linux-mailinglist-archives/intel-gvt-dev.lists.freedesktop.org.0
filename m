Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD7183F7B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Mar 2020 04:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3406E03F;
	Fri, 13 Mar 2020 03:18:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B996E03F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Mar 2020 03:18:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 20:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="278065177"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2020 20:18:32 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] vfio: introduce vfio_dma_rw to read/write a range of
 IOVAs
Date: Thu, 12 Mar 2020 23:09:01 -0400
Message-Id: <20200313030901.7830-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313030548.7705-1-yan.y.zhao@intel.com>
References: <20200313030548.7705-1-yan.y.zhao@intel.com>
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
Cc: kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, peterx@redhat.com,
 alex.williamson@redhat.com, zhenyuw@linux.intel.com, pbonzini@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

vfio_dma_rw will read/write a range of user space memory pointed to by
IOVA into/from a kernel buffer without enforcing pinning the user space
memory.

TODO: mark the IOVAs to user space memory dirty if they are written in
vfio_dma_rw().

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/vfio/vfio.c             | 49 +++++++++++++++++++++
 drivers/vfio/vfio_iommu_type1.c | 76 +++++++++++++++++++++++++++++++++
 include/linux/vfio.h            |  5 +++
 3 files changed, 130 insertions(+)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 97b972bfb735..6997f711b925 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1999,6 +1999,55 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
+
+/*
+ * This interface allows the CPUs to perform some sort of virtual DMA on
+ * behalf of the device.
+ *
+ * CPUs read/write from/into a range of IOVAs pointing to user space memory
+ * into/from a kernel buffer.
+ *
+ * As the read/write of user space memory is conducted via the CPUs and is
+ * not a real device DMA, it is not necessary to pin the user space memory.
+ *
+ * The caller needs to call vfio_group_get_external_user() or
+ * vfio_group_get_external_user_from_dev() prior to calling this interface,
+ * so as to prevent the VFIO group from disposal in the middle of the call.
+ * But it can keep the reference to the VFIO group for several calls into
+ * this interface.
+ * After finishing using of the VFIO group, the caller needs to release the
+ * VFIO group by calling vfio_group_put_external_user().
+ *
+ * @group [in]		: VFIO group
+ * @user_iova [in]	: base IOVA of a user space buffer
+ * @data [in]		: pointer to kernel buffer
+ * @len [in]		: kernel buffer length
+ * @write		: indicate read or write
+ * Return error code on failure or 0 on success.
+ */
+int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
+		void *data, size_t len, bool write)
+{
+	struct vfio_container *container;
+	struct vfio_iommu_driver *driver;
+	int ret = 0;
+
+	if (!group || !data || len <= 0)
+		return -EINVAL;
+
+	container = group->container;
+	driver = container->iommu_driver;
+
+	if (likely(driver && driver->ops->dma_rw))
+		ret = driver->ops->dma_rw(container->iommu_data,
+					  user_iova, data, len, write);
+	else
+		ret = -ENOTTY;
+
+	return ret;
+}
+EXPORT_SYMBOL(vfio_dma_rw);
+
 static int vfio_register_iommu_notifier(struct vfio_group *group,
 					unsigned long *events,
 					struct notifier_block *nb)
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index a177bf2c6683..9fdfae1cb17a 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -27,6 +27,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/mm.h>
+#include <linux/mmu_context.h>
 #include <linux/rbtree.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
@@ -2305,6 +2306,80 @@ static int vfio_iommu_type1_unregister_notifier(void *iommu_data,
 	return blocking_notifier_chain_unregister(&iommu->notifier, nb);
 }
 
+static int vfio_iommu_type1_dma_rw_chunk(struct vfio_iommu *iommu,
+					 dma_addr_t user_iova, void *data,
+					 size_t count, bool write,
+					 size_t *copied)
+{
+	struct mm_struct *mm;
+	unsigned long vaddr;
+	struct vfio_dma *dma;
+	bool kthread = current->mm == NULL;
+	size_t offset;
+
+	*copied = 0;
+
+	dma = vfio_find_dma(iommu, user_iova, 1);
+	if (!dma)
+		return -EINVAL;
+
+	if ((write && !(dma->prot & IOMMU_WRITE)) ||
+			!(dma->prot & IOMMU_READ))
+		return -EPERM;
+
+	mm = get_task_mm(dma->task);
+
+	if (!mm)
+		return -EPERM;
+
+	if (kthread)
+		use_mm(mm);
+	else if (current->mm != mm)
+		goto out;
+
+	offset = user_iova - dma->iova;
+
+	if (count > dma->size - offset)
+		count = dma->size - offset;
+
+	vaddr = dma->vaddr + offset;
+
+	if (write)
+		*copied = __copy_to_user((void __user *)vaddr, data,
+					 count) ? 0 : count;
+	else
+		*copied = __copy_from_user(data, (void __user *)vaddr,
+					   count) ? 0 : count;
+	if (kthread)
+		unuse_mm(mm);
+out:
+	mmput(mm);
+	return *copied ? 0 : -EFAULT;
+}
+
+static int vfio_iommu_type1_dma_rw(void *iommu_data, dma_addr_t user_iova,
+				   void *data, size_t count, bool write)
+{
+	struct vfio_iommu *iommu = iommu_data;
+	int ret = 0;
+	size_t done;
+
+	mutex_lock(&iommu->lock);
+	while (count > 0) {
+		ret = vfio_iommu_type1_dma_rw_chunk(iommu, user_iova, data,
+						    count, write, &done);
+		if (ret)
+			break;
+
+		count -= done;
+		data += done;
+		user_iova += done;
+	}
+
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
 static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
 	.name			= "vfio-iommu-type1",
 	.owner			= THIS_MODULE,
@@ -2317,6 +2392,7 @@ static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
 	.unpin_pages		= vfio_iommu_type1_unpin_pages,
 	.register_notifier	= vfio_iommu_type1_register_notifier,
 	.unregister_notifier	= vfio_iommu_type1_unregister_notifier,
+	.dma_rw			= vfio_iommu_type1_dma_rw,
 };
 
 static int __init vfio_iommu_type1_init(void)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index fb71e0ac0e76..34b2fdf4de6e 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -82,6 +82,8 @@ struct vfio_iommu_driver_ops {
 					     struct notifier_block *nb);
 	int		(*unregister_notifier)(void *iommu_data,
 					       struct notifier_block *nb);
+	int		(*dma_rw)(void *iommu_data, dma_addr_t user_iova,
+				  void *data, size_t count, bool write);
 };
 
 extern int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops);
@@ -109,6 +111,9 @@ extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
 extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
 			    int npage);
 
+extern int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
+		       void *data, size_t len, bool write);
+
 /* each type has independent events */
 enum vfio_notify_type {
 	VFIO_IOMMU_NOTIFY = 0,
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
