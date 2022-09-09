Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA905B2C61
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Sep 2022 05:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FFB10EA26;
	Fri,  9 Sep 2022 03:04:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F4610E8A9;
 Fri,  9 Sep 2022 03:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662692686; x=1694228686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=soBnAVMV7/b3RWmlqT7Qm3YU2ApJN5udh0rQdoHKIKg=;
 b=nINjeeoN+MC3t+8wd5b1hiAVFioqSzUWag7YDixmBztw8J0+emme6O+m
 mQlz4FCEGu1JQ8VTulAPMdim64US3jz1gMlD1gwxUelOn5vt1BFEk54k4
 4VsW9HOYXfG8Ih/jc77xBtJQ7W6APPylJl1ZIZl86UqhacrazwjIZowwa
 kA6OkJL8LyqDoNdjGhNYDzpEyp3uuaHEt4a1724+hYIAFiKlComZBE7Jr
 klVd0c5/3xfZR3LNxvyRDW6/8A/xHU9B6ERxFg9XVxYk/4RVik8wWp6W4
 deng9qdnzTKeInU0yHYNnbqLd4eblXMCAYMtA2tbl10I5yMbZC7ers1rk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359109575"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="359109575"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740908510"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 20:03:36 -0700
From: Kevin Tian <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org
Subject: [PATCH v3 01/15] vfio: Add helpers for unifying vfio_device life cycle
Date: Fri,  9 Sep 2022 18:22:33 +0800
Message-Id: <20220909102247.67324-2-kevin.tian@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220909102247.67324-1-kevin.tian@intel.com>
References: <20220909102247.67324-1-kevin.tian@intel.com>
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
Cc: Yi Liu <yi.l.liu@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The idea is to let vfio core manage the vfio_device life cycle instead
of duplicating the logic cross drivers. This is also a preparatory
step for adding struct device into vfio_device.

New pair of helpers together with a kref in vfio_device:

 - vfio_alloc_device()
 - vfio_put_device()

Drivers can register @init/@release callbacks to manage any private
state wrapping the vfio_device.

However vfio-ccw doesn't fit this model due to a life cycle mess
that its private structure mixes both parent and mdev info hence must
be allocated/freed outside of the life cycle of vfio device.

Per prior discussions this won't be fixed in short term by IBM folks.

Instead of waiting for those modifications introduce another helper
vfio_init_device() so ccw can call it to initialize a pre-allocated
vfio_device.

Further implication of the ccw trick is that vfio_device cannot be
freed uniformly in vfio core. Instead, require *EVERY* driver to
implement @release and free vfio_device inside. Then ccw can choose
to delay the free at its own discretion.

Another trick down the road is that kvzalloc() is used to accommodate
the need of gvt which uses vzalloc() while all others use kzalloc().
So drivers should call a helper vfio_free_device() to free the
vfio_device instead of assuming that kfree() or vfree() is appliable.

Later once the ccw mess is fixed we can remove those tricks and
fully handle structure alloc/free in vfio core.

Existing vfio_{un}init_group_dev() will be deprecated after all
existing usages are converted to the new model.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Co-developed-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/vfio/vfio_main.c | 92 ++++++++++++++++++++++++++++++++++++++++
 include/linux/vfio.h     | 25 ++++++++++-
 2 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 27d9186f35d5..adc1b697bb78 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -498,6 +498,98 @@ void vfio_uninit_group_dev(struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
 
+/* Release helper called by vfio_put_device() */
+void vfio_device_release(struct kref *kref)
+{
+	struct vfio_device *device =
+			container_of(kref, struct vfio_device, kref);
+
+	vfio_uninit_group_dev(device);
+
+	/*
+	 * kvfree() cannot be done here due to a life cycle mess in
+	 * vfio-ccw. Before the ccw part is fixed all drivers are
+	 * required to support @release and call vfio_free_device()
+	 * from there.
+	 */
+	device->ops->release(device);
+}
+EXPORT_SYMBOL_GPL(vfio_device_release);
+
+/*
+ * Alloc and initialize vfio_device so it can be registered to vfio
+ * core.
+ *
+ * Drivers should use the wrapper vfio_alloc_device() for allocation.
+ * @size is the size of the structure to be allocated, including any
+ * private data used by the driver.
+ *
+ * Driver may provide an @init callback to cover device private data.
+ *
+ * Use vfio_put_device() to release the structure after success return.
+ */
+struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
+				       const struct vfio_device_ops *ops)
+{
+	struct vfio_device *device;
+	int ret;
+
+	if (WARN_ON(size < sizeof(struct vfio_device)))
+		return ERR_PTR(-EINVAL);
+
+	device = kvzalloc(size, GFP_KERNEL);
+	if (!device)
+		return ERR_PTR(-ENOMEM);
+
+	ret = vfio_init_device(device, dev, ops);
+	if (ret)
+		goto out_free;
+	return device;
+
+out_free:
+	kvfree(device);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(_vfio_alloc_device);
+
+/*
+ * Initialize a vfio_device so it can be registered to vfio core.
+ *
+ * Only vfio-ccw driver should call this interface.
+ */
+int vfio_init_device(struct vfio_device *device, struct device *dev,
+		     const struct vfio_device_ops *ops)
+{
+	int ret;
+
+	vfio_init_group_dev(device, dev, ops);
+
+	if (ops->init) {
+		ret = ops->init(device);
+		if (ret)
+			goto out_uninit;
+	}
+
+	kref_init(&device->kref);
+	return 0;
+
+out_uninit:
+	vfio_uninit_group_dev(device);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vfio_init_device);
+
+/*
+ * The helper called by driver @release callback to free the device
+ * structure. Drivers which don't have private data to clean can
+ * simply use this helper as its @release.
+ */
+void vfio_free_device(struct vfio_device *device)
+{
+	kvfree(device);
+}
+EXPORT_SYMBOL_GPL(vfio_free_device);
+
 static struct vfio_group *vfio_noiommu_group_alloc(struct device *dev,
 		enum vfio_group_type type)
 {
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 0e2826559091..f67cac700e6f 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -47,7 +47,8 @@ struct vfio_device {
 	struct kvm *kvm;
 
 	/* Members below here are private, not for driver use */
-	refcount_t refcount;
+	struct kref kref;	/* object life cycle */
+	refcount_t refcount;	/* user count on registered device*/
 	unsigned int open_count;
 	struct completion comp;
 	struct list_head group_next;
@@ -57,6 +58,8 @@ struct vfio_device {
 /**
  * struct vfio_device_ops - VFIO bus driver device callbacks
  *
+ * @init: initialize private fields in device structure
+ * @release: Reclaim private fields in device structure
  * @open_device: Called when the first file descriptor is opened for this device
  * @close_device: Opposite of open_device
  * @read: Perform read(2) on device file descriptor
@@ -74,6 +77,8 @@ struct vfio_device {
  */
 struct vfio_device_ops {
 	char	*name;
+	int	(*init)(struct vfio_device *vdev);
+	void	(*release)(struct vfio_device *vdev);
 	int	(*open_device)(struct vfio_device *vdev);
 	void	(*close_device)(struct vfio_device *vdev);
 	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
@@ -161,6 +166,24 @@ static inline int vfio_check_feature(u32 flags, size_t argsz, u32 supported_ops,
 	return 1;
 }
 
+struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
+				       const struct vfio_device_ops *ops);
+#define vfio_alloc_device(dev_struct, member, dev, ops)				\
+	container_of(_vfio_alloc_device(sizeof(struct dev_struct) +		\
+					BUILD_BUG_ON_ZERO(offsetof(		\
+						struct dev_struct, member)),	\
+					dev, ops),				\
+		     struct dev_struct, member)
+
+int vfio_init_device(struct vfio_device *device, struct device *dev,
+		     const struct vfio_device_ops *ops);
+void vfio_free_device(struct vfio_device *device);
+void vfio_device_release(struct kref *kref);
+static inline void vfio_put_device(struct vfio_device *device)
+{
+	kref_put(&device->kref, vfio_device_release);
+}
+
 void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
 			 const struct vfio_device_ops *ops);
 void vfio_uninit_group_dev(struct vfio_device *device);
-- 
2.21.3

