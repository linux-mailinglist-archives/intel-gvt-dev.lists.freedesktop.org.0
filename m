Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C360675813
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Jan 2023 16:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13FA10E0F4;
	Fri, 20 Jan 2023 15:05:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7B110E0F4;
 Fri, 20 Jan 2023 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674227132; x=1705763132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zn183ElO1bl64Y4pVPfF7h7rDHD+/IuJAJiKiAAXWvc=;
 b=N5NkUJOGB7Apuh8+vscREZMUZPeP95xuud50bxxR2YGavx1R5fKKp18g
 Edzy4cTtXgLqhgUYVsiHYWChS/5OY5r2o3783HdrMIwne4qWKI58gNLgh
 2kEpkmfCimuXIkwO4il7XICjEFKMBxZqa8FtgJjPH/OspjgfYIZfwC+Q3
 rkO3cyoF1jOkuZa8D/T/vuZ1NyeFgf+XCD1Lbl2Tly1Ru3fhhtRPWov2n
 en/+GlZh4lsuTJ0tK2FsWjostaRIm3hDc2D3z78lr5EZxn03MFP+ZHZzc
 byczyfl+zcKPGdQPF4AIxkpJnKeuLC7+H4XoUlNEybTLjNlYTHNOUW1+M g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="309169483"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="309169483"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 07:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784532388"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="784532388"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga004.jf.intel.com with ESMTP; 20 Jan 2023 07:05:30 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	pbonzini@redhat.com,
	mjrosato@linux.ibm.com
Subject: [PATCH] kvm/vfio: Fix potential deadlock on vfio group_lock
Date: Fri, 20 Jan 2023 07:05:28 -0800
Message-Id: <20230120150528.471752-1-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, kevin.tian@intel.com,
 yi.l.liu@intel.com, frankja@linux.ibm.com, pmorel@linux.ibm.com,
 david@redhat.com, imbrenda@linux.ibm.com, seanjc@google.com,
 intel-gfx@lists.freedesktop.org, cohuck@redhat.com, farman@linux.ibm.com,
 zhenyuw@linux.intel.com, linux-kernel@vger.kernel.org, pasic@linux.ibm.com,
 jgg@nvidia.com, kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 borntraeger@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Currently it is possible that the final put of a KVM reference comes from
vfio during its device close operation.  This occurs while the vfio group
lock is held; however, if the vfio device is still in the kvm device list,
then the following call chain could result in a deadlock:

VFIO holds group->group_lock/group_rwsem
  -> kvm_put_kvm
   -> kvm_destroy_vm
    -> kvm_destroy_devices
     -> kvm_vfio_destroy
      -> kvm_vfio_file_set_kvm
       -> vfio_file_set_kvm
        -> try to hold group->group_lock/group_rwsem

The key function is the kvm_destroy_devices() which triggers destroy cb
of kvm_device_ops. It calls back to vfio and try to hold group_lock. So
if this path doesn't call back to vfio, this dead lock would be fixed.
Actually, there is a way for it. KVM provides another point to free the
kvm-vfio device which is the point when the device file descriptor is
closed. This can be achieved by providing the release cb instead of the
destroy cb. Also rename kvm_vfio_destroy() to be kvm_vfio_release().

	/*
	 * Destroy is responsible for freeing dev.
	 *
	 * Destroy may be called before or after destructors are called
	 * on emulated I/O regions, depending on whether a reference is
	 * held by a vcpu or other kvm component that gets destroyed
	 * after the emulated I/O.
	 */
	void (*destroy)(struct kvm_device *dev);

	/*
	 * Release is an alternative method to free the device. It is
	 * called when the device file descriptor is closed. Once
	 * release is called, the destroy method will not be called
	 * anymore as the device is removed from the device list of
	 * the VM. kvm->lock is held.
	 */
	void (*release)(struct kvm_device *dev);

Fixes: 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM")
Reported-by: Alex Williamson <alex.williamson@redhat.com>
Suggested-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 virt/kvm/vfio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index 495ceabffe88..e94f3ea718e5 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -336,7 +336,7 @@ static int kvm_vfio_has_attr(struct kvm_device *dev,
 	return -ENXIO;
 }
 
-static void kvm_vfio_destroy(struct kvm_device *dev)
+static void kvm_vfio_release(struct kvm_device *dev)
 {
 	struct kvm_vfio *kv = dev->private;
 	struct kvm_vfio_group *kvg, *tmp;
@@ -363,7 +363,7 @@ static int kvm_vfio_create(struct kvm_device *dev, u32 type);
 static struct kvm_device_ops kvm_vfio_ops = {
 	.name = "kvm-vfio",
 	.create = kvm_vfio_create,
-	.destroy = kvm_vfio_destroy,
+	.release = kvm_vfio_release,
 	.set_attr = kvm_vfio_set_attr,
 	.has_attr = kvm_vfio_has_attr,
 };
-- 
2.34.1

