Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2955BE60
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Jun 2022 07:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7EC112984;
	Tue, 28 Jun 2022 05:15:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F73C112981
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Jun 2022 05:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QZ4l9htX7ZZM0YQDIhR466tludIGvHqlWhr/H0DLHhE=; b=gyoP29pu5pFSM5ow6rmpsCCsdx
 ZMw0MhXPILMFuy9uDMYHDsi9e74VEusPZRh5eOnL1P58ceiUSatz05QLMoQp/UQ3QxjWiOCjssAEe
 Iks1KYFI6+aEclMe1V2ukR5aMEqRXI+1jNjizUjrDXI60DTFDOXcZqt5mH0eUamxtni4L8m4MqWDU
 snYi18tWNmRDlIiNHPQwnr7rHu/SZH/w10QStDj/AnJCxgFASH4SrL1s6pEO8OLwl8RzgP4I/WH6m
 x4BsHIYceIDSCq7PpjDug2mPC/iv+wt8w/IkUyZgosHm2f/EjPPpCJi7hA/lfNIi8o5bSgiDMHxC/
 fAPTYgAg==;
Received: from [2001:4bb8:199:3788:e965:1541:b076:2977] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o63Yv-004Kpi-3Z; Tue, 28 Jun 2022 05:14:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 07/13] vfio/mdev: remove mdev_parent_dev
Date: Tue, 28 Jun 2022 07:14:29 +0200
Message-Id: <20220628051435.695540-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220628051435.695540-1-hch@lst.de>
References: <20220628051435.695540-1-hch@lst.de>
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
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Just open code the dereferences in the only user.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 Documentation/driver-api/vfio-mediated-device.rst | 3 ---
 drivers/gpu/drm/i915/gvt/kvmgt.c                  | 2 +-
 drivers/vfio/mdev/mdev_core.c                     | 6 ------
 include/linux/mdev.h                              | 1 -
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 82a4007bd7207..a4c3a4a168ec6 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -202,9 +202,6 @@ Directories and files under the sysfs for Each Physical Device
 
 	sprintf(buf, "%s-%s", dev_driver_string(parent->dev), group->name);
 
-  (or using mdev_parent_dev(mdev) to arrive at the parent device outside
-  of the core mdev code)
-
 * device_api
 
   This attribute should show which device API is being created, for example,
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1c6b7e8bec4fb..136f9c0df48b9 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1549,7 +1549,7 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
 
 static int intel_vgpu_probe(struct mdev_device *mdev)
 {
-	struct device *pdev = mdev_parent_dev(mdev);
+	struct device *pdev = mdev->type->parent->dev;
 	struct intel_gvt *gvt = kdev_to_i915(pdev)->gvt;
 	struct intel_vgpu_type *type =
 		container_of(mdev->type, struct intel_vgpu_type, type);
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index bde7ce620dae0..75628759a3bf0 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -23,12 +23,6 @@ static struct class_compat *mdev_bus_compat_class;
 static LIST_HEAD(mdev_list);
 static DEFINE_MUTEX(mdev_list_lock);
 
-struct device *mdev_parent_dev(struct mdev_device *mdev)
-{
-	return mdev->type->parent->dev;
-}
-EXPORT_SYMBOL(mdev_parent_dev);
-
 /*
  * Used in mdev_type_attribute sysfs functions to return the parent struct
  * device
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index dd11c142bf887..83c85a0247f25 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -100,7 +100,6 @@ void mdev_unregister_parent(struct mdev_parent *parent);
 int mdev_register_driver(struct mdev_driver *drv);
 void mdev_unregister_driver(struct mdev_driver *drv);
 
-struct device *mdev_parent_dev(struct mdev_device *mdev);
 static inline struct device *mdev_dev(struct mdev_device *mdev)
 {
 	return &mdev->dev;
-- 
2.30.2

