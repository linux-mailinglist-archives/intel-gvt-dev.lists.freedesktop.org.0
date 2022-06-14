Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD354A86C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jun 2022 06:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFCA10FB9A;
	Tue, 14 Jun 2022 04:54:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1028C10FB9A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jun 2022 04:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yWgwBd01q1i40kokmt0dpMTuHq9q3ZmdNDZ448P4wTM=; b=TvyqgNSyF/EXJ689dgOYVovPO7
 ASMD/bSmT4Rr2TzxnRa2Rq3U9jIabnOphDZGcY7COYygRTM+1QrHCURcfqXk2eW2Zu/rvOt08xW7z
 4ouNBYulMEYoxAHHq798m6SGtxoM4++Elt0owbRerLMgQEUoTkoQN32zZbv7+SedY8tDQPazFJI/o
 JWGnURIVDy1fzWY7libLzTLXcFwLUJb9syvHtZCuYkOzI7mji1Xg77HmiXeotALsAlEQwdxB5Inq3
 5MTZYX3NsP3LtnKPjRTRz94DazDX2H93Yy1SIcYnml1mggTav1zSryaeLwwi3//Jq93XqH/9RDFiF
 XkN5iFAA==;
Received: from [2001:4bb8:180:36f6:1fed:6d48:cf16:d13c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o0yZn-0072hb-JD; Tue, 14 Jun 2022 04:54:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 08/13] vfio/mdev: remove mtype_get_parent_dev
Date: Tue, 14 Jun 2022 06:54:23 +0200
Message-Id: <20220614045428.278494-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614045428.278494-1-hch@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 kvm@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Just open code the dereferences in the only user.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/s390/cio/vfio_ccw_ops.c |  3 +--
 drivers/vfio/mdev/mdev_core.c   | 10 ----------
 include/linux/mdev.h            |  2 --
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 25b8d42a522ac..43d53736dfe3c 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -88,8 +88,7 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
 {
-	struct vfio_ccw_private *private =
-		dev_get_drvdata(mtype_get_parent_dev(mtype));
+	struct vfio_ccw_private *private = dev_get_drvdata(mtype->parent->dev);
 
 	return sprintf(buf, "%d\n", atomic_read(&private->avail));
 }
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 479ae5ed6c392..20513b7f6b5eb 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -23,16 +23,6 @@ static struct class_compat *mdev_bus_compat_class;
 static LIST_HEAD(mdev_list);
 static DEFINE_MUTEX(mdev_list_lock);
 
-/*
- * Used in mdev_type_attribute sysfs functions to return the parent struct
- * device
- */
-struct device *mtype_get_parent_dev(struct mdev_type *mtype)
-{
-	return mtype->parent->dev;
-}
-EXPORT_SYMBOL(mtype_get_parent_dev);
-
 /* Caller must hold parent unreg_sem read or write lock */
 static void mdev_device_remove_common(struct mdev_device *mdev)
 {
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 83c85a0247f25..ecf964d34f2ca 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -51,8 +51,6 @@ static inline struct mdev_device *to_mdev_device(struct device *dev)
 	return container_of(dev, struct mdev_device, dev);
 }
 
-struct device *mtype_get_parent_dev(struct mdev_type *mtype);
-
 /* interface for exporting mdev supported type attributes */
 struct mdev_type_attribute {
 	struct attribute attr;
-- 
2.30.2

