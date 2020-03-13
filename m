Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F461183F88
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Mar 2020 04:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A776E03F;
	Fri, 13 Mar 2020 03:19:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C2F6E03F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Mar 2020 03:19:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 20:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="278065549"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2020 20:19:56 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] drm/i915/gvt: hold reference of VFIO group during
 opening of vgpu
Date: Thu, 12 Mar 2020 23:10:25 -0400
Message-Id: <20200313031025.7936-1-yan.y.zhao@intel.com>
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

hold reference count of the VFIO group for each vgpu at vgpu opening and
release the reference at vgpu releasing.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 074c4efb58eb..811cee28ae06 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -131,6 +131,7 @@ struct kvmgt_vdev {
 	struct work_struct release_work;
 	atomic_t released;
 	struct vfio_device *vfio_device;
+	struct vfio_group *vfio_group;
 };
 
 static inline struct kvmgt_vdev *kvmgt_vdev(struct intel_vgpu *vgpu)
@@ -792,6 +793,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long events;
 	int ret;
+	struct vfio_group *vfio_group;
 
 	vdev->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
 	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
@@ -814,6 +816,14 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 		goto undo_iommu;
 	}
 
+	vfio_group = vfio_group_get_external_user_from_dev(mdev_dev(mdev));
+	if (IS_ERR_OR_NULL(vfio_group)) {
+		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
+		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
+		goto undo_register;
+	}
+	vdev->vfio_group = vfio_group;
+
 	/* Take a module reference as mdev core doesn't take
 	 * a reference for vendor driver.
 	 */
@@ -830,6 +840,10 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	return ret;
 
 undo_group:
+	vfio_group_put_external_user(vdev->vfio_group);
+	vdev->vfio_group = NULL;
+
+undo_register:
 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
 					&vdev->group_notifier);
 
@@ -884,6 +898,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	kvmgt_guest_exit(info);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
+	vfio_group_put_external_user(vdev->vfio_group);
 
 	vdev->kvm = NULL;
 	vgpu->handle = 0;
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
