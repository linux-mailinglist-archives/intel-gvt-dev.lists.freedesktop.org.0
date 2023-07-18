Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC5757E7E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 15:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C747B10E380;
	Tue, 18 Jul 2023 13:56:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5810E34A;
 Tue, 18 Jul 2023 13:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689688569; x=1721224569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YaRGpjj7I+GMXdcc3KIUaOmLLrRW7d35dueJ3AuGdR4=;
 b=UVCWN6bf01hLl1k7t+4ZbZMQLcjA8+/AMjjZqz6Moc2sE51gut8olMkH
 2ttJjQNbEnDIlOjLGikEt8f2V8L/mhxsryvvHCtu884/MjfLYz2pYJfJF
 gJ1qqxY2cEqV7Nzni0RYXS8wNSMtcQjuaVaTldBbDpg+ZbfI9gsWdnSDF
 EdpQucnSukf+p14DFC9jeoGEqR5gS3MoHQ8cnSDL5FNKZtga5grGd9TYm
 IqK+RIAnC7w0AfQK9gY43/LLYihEsEiczFv2JbXuZ0JYKiwGvHJUA6u0V
 lelZadVFW2gknIfbdQhN+xs4t/D/xSKwuF6HfzP21ld7noihHrMuO50Ob Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452590774"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452590774"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970251076"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="970251076"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 06:56:08 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v15 19/26] vfio: Test kvm pointer in
 _vfio_device_get_kvm_safe()
Date: Tue, 18 Jul 2023 06:55:44 -0700
Message-Id: <20230718135551.6592-20-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718135551.6592-1-yi.l.liu@intel.com>
References: <20230718135551.6592-1-yi.l.liu@intel.com>
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

This saves some lines when adding the kvm get logic for the vfio_device
cdev path.

This also renames _vfio_device_get_kvm_safe() to be vfio_device_get_kvm_safe().

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/group.c     | 7 +------
 drivers/vfio/vfio.h      | 6 +++---
 drivers/vfio/vfio_main.c | 5 ++++-
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 41a09a2df690..5c17ad812313 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -160,12 +160,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
 {
 	spin_lock(&device->group->kvm_ref_lock);
-	if (!device->group->kvm)
-		goto unlock;
-
-	_vfio_device_get_kvm_safe(device, device->group->kvm);
-
-unlock:
+	vfio_device_get_kvm_safe(device, device->group->kvm);
 	spin_unlock(&device->group->kvm_ref_lock);
 }
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index fb8f2fac3d23..c2aa65382592 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -340,11 +340,11 @@ enum { vfio_noiommu = false };
 #endif
 
 #ifdef CONFIG_HAVE_KVM
-void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
+void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
 void vfio_device_put_kvm(struct vfio_device *device);
 #else
-static inline void _vfio_device_get_kvm_safe(struct vfio_device *device,
-					     struct kvm *kvm)
+static inline void vfio_device_get_kvm_safe(struct vfio_device *device,
+					    struct kvm *kvm)
 {
 }
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 8a9ebcc6980b..5f7c3151d8c0 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -373,7 +373,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 
 #ifdef CONFIG_HAVE_KVM
-void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
+void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
 {
 	void (*pfn)(struct kvm *kvm);
 	bool (*fn)(struct kvm *kvm);
@@ -381,6 +381,9 @@ void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
 
 	lockdep_assert_held(&device->dev_set->lock);
 
+	if (!kvm)
+		return;
+
 	pfn = symbol_get(kvm_put_kvm);
 	if (WARN_ON(!pfn))
 		return;
-- 
2.34.1

