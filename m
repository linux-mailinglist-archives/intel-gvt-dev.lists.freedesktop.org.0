Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3069D995
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Feb 2023 04:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACF010E17F;
	Tue, 21 Feb 2023 03:48:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB3A10E0CA;
 Tue, 21 Feb 2023 03:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676951298; x=1708487298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8DPY5S868JEbRpn1B/fXQEqfkIAhwKvbhC9dKwz6lw=;
 b=WPCU3Mkcg19FUDRlQ62MD+ZhXhA4n3QylIc7hCQhZM85jMyC/i5sGwVT
 0x68enL+R7pS8LH8S2tNS67TxMarv0QijSQ28SKMtEKp5qrzrwk1cj6tp
 zw/MpESfbaE8AnjtAwiq3IC+hXciUKmxnNX7yJQo4LAVHpaDPott2FjcW
 VSBGLd99x13b+XWrDM3SARzM05N6B7PJ/UYJS0OJJ5nhYYl8IAvz5LPKg
 VplWB+wifDjXz7VXWChsVIENG/a+fwn0fXxzkjf2WBEKXOGw/RYH2FCmY
 gE3ar/+Aa5ve7Z62sQa5smB8ehGxN4YU208QfDigj/JCVBU/g3DSlu7IO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397218426"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="397218426"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 19:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="664822157"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="664822157"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 20 Feb 2023 19:48:17 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v4 05/19] kvm/vfio: Accept vfio device file from userspace
Date: Mon, 20 Feb 2023 19:47:58 -0800
Message-Id: <20230221034812.138051-6-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221034812.138051-1-yi.l.liu@intel.com>
References: <20230221034812.138051-1-yi.l.liu@intel.com>
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
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, joro@8bytes.org,
 cohuck@redhat.com, xudong.hao@intel.com, peterx@redhat.com,
 yan.y.zhao@intel.com, eric.auger@redhat.com, terrence.xu@intel.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, intel-gfx@lists.freedesktop.org,
 chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This defines KVM_DEV_VFIO_FILE* and make alias with KVM_DEV_VFIO_GROUP*.
Old userspace uses KVM_DEV_VFIO_GROUP* works as well.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 Documentation/virt/kvm/devices/vfio.rst | 50 ++++++++++++++++---------
 include/uapi/linux/kvm.h                | 16 ++++++--
 virt/kvm/vfio.c                         | 16 ++++----
 3 files changed, 53 insertions(+), 29 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vfio.rst b/Documentation/virt/kvm/devices/vfio.rst
index 5722e283f1b5..50bf76fc24e5 100644
--- a/Documentation/virt/kvm/devices/vfio.rst
+++ b/Documentation/virt/kvm/devices/vfio.rst
@@ -9,24 +9,37 @@ Device types supported:
   - KVM_DEV_TYPE_VFIO
 
 Only one VFIO instance may be created per VM.  The created device
-tracks VFIO groups in use by the VM and features of those groups
-important to the correctness and acceleration of the VM.  As groups
-are enabled and disabled for use by the VM, KVM should be updated
-about their presence.  When registered with KVM, a reference to the
-VFIO-group is held by KVM.
+tracks VFIO files (group or device) in use by the VM and features
+of those groups/devices important to the correctness and acceleration
+of the VM.  As groups/devices are enabled and disabled for use by the
+VM, KVM should be updated about their presence.  When registered with
+KVM, a reference to the VFIO file is held by KVM.
 
 Groups:
-  KVM_DEV_VFIO_GROUP
-
-KVM_DEV_VFIO_GROUP attributes:
-  KVM_DEV_VFIO_GROUP_ADD: Add a VFIO group to VFIO-KVM device tracking
-	kvm_device_attr.addr points to an int32_t file descriptor
-	for the VFIO group.
-  KVM_DEV_VFIO_GROUP_DEL: Remove a VFIO group from VFIO-KVM device tracking
-	kvm_device_attr.addr points to an int32_t file descriptor
-	for the VFIO group.
-  KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE: attaches a guest visible TCE table
+  KVM_DEV_VFIO_FILE
+	alias: KVM_DEV_VFIO_GROUP
+
+KVM_DEV_VFIO_FILE attributes:
+  KVM_DEV_VFIO_FILE_ADD: Add a VFIO file (group/device) to VFIO-KVM device
+	tracking
+
+	alias: KVM_DEV_VFIO_GROUP_ADD
+
+	kvm_device_attr.addr points to an int32_t file descriptor for the
+	VFIO file.
+  KVM_DEV_VFIO_FILE_DEL: Remove a VFIO file (group/device) from VFIO-KVM
+	device tracking
+
+	alias: KVM_DEV_VFIO_GROUP_DEL
+
+	kvm_device_attr.addr points to an int32_t file descriptor for the
+	VFIO file.
+
+  KVM_DEV_VFIO_FILE_SET_SPAPR_TCE: attaches a guest visible TCE table
 	allocated by sPAPR KVM.
+
+	alias: KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE
+
 	kvm_device_attr.addr points to a struct::
 
 		struct kvm_vfio_spapr_tce {
@@ -40,7 +53,10 @@ KVM_DEV_VFIO_GROUP attributes:
 	- @tablefd is a file descriptor for a TCE table allocated via
 	  KVM_CREATE_SPAPR_TCE.
 
+	only accepts vfio group file as SPAPR has no iommufd support
+
 ::
 
-The GROUP_ADD operation above should be invoked before vfio_device's
-open_device op which is called in the ioctl VFIO_GROUP_GET_DEVICE_FD.
+The FILE/GROUP_ADD operation above should be invoked before vfio_device's
+open_device op which is called in the ioctl VFIO_GROUP_GET_DEVICE_FD
+or VFIO_DEVICE_BIND_IOMMUFD.
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 55155e262646..484a8133bc69 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1401,10 +1401,18 @@ struct kvm_device_attr {
 	__u64	addr;		/* userspace address of attr data */
 };
 
-#define  KVM_DEV_VFIO_GROUP			1
-#define   KVM_DEV_VFIO_GROUP_ADD			1
-#define   KVM_DEV_VFIO_GROUP_DEL			2
-#define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE		3
+#define  KVM_DEV_VFIO_FILE	1
+
+#define   KVM_DEV_VFIO_FILE_ADD			1
+#define   KVM_DEV_VFIO_FILE_DEL			2
+#define   KVM_DEV_VFIO_FILE_SET_SPAPR_TCE	3
+
+/* KVM_DEV_VFIO_GROUP aliases are for compile time uapi compatibility */
+#define  KVM_DEV_VFIO_GROUP	KVM_DEV_VFIO_FILE
+
+#define   KVM_DEV_VFIO_GROUP_ADD	KVM_DEV_VFIO_FILE_ADD
+#define   KVM_DEV_VFIO_GROUP_DEL	KVM_DEV_VFIO_FILE_DEL
+#define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE	KVM_DEV_VFIO_FILE_SET_SPAPR_TCE
 
 enum kvm_device_type {
 	KVM_DEV_TYPE_FSL_MPIC_20	= 1,
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index 857d6ba349e1..d869913baafd 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -286,18 +286,18 @@ static int kvm_vfio_set_file(struct kvm_device *dev, long attr,
 	int32_t fd;
 
 	switch (attr) {
-	case KVM_DEV_VFIO_GROUP_ADD:
+	case KVM_DEV_VFIO_FILE_ADD:
 		if (get_user(fd, argp))
 			return -EFAULT;
 		return kvm_vfio_file_add(dev, fd);
 
-	case KVM_DEV_VFIO_GROUP_DEL:
+	case KVM_DEV_VFIO_FILE_DEL:
 		if (get_user(fd, argp))
 			return -EFAULT;
 		return kvm_vfio_file_del(dev, fd);
 
 #ifdef CONFIG_SPAPR_TCE_IOMMU
-	case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
+	case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:
 		return kvm_vfio_file_set_spapr_tce(dev, arg);
 #endif
 	}
@@ -309,7 +309,7 @@ static int kvm_vfio_set_attr(struct kvm_device *dev,
 			     struct kvm_device_attr *attr)
 {
 	switch (attr->group) {
-	case KVM_DEV_VFIO_GROUP:
+	case KVM_DEV_VFIO_FILE:
 		return kvm_vfio_set_file(dev, attr->attr,
 					 u64_to_user_ptr(attr->addr));
 	}
@@ -321,12 +321,12 @@ static int kvm_vfio_has_attr(struct kvm_device *dev,
 			     struct kvm_device_attr *attr)
 {
 	switch (attr->group) {
-	case KVM_DEV_VFIO_GROUP:
+	case KVM_DEV_VFIO_FILE:
 		switch (attr->attr) {
-		case KVM_DEV_VFIO_GROUP_ADD:
-		case KVM_DEV_VFIO_GROUP_DEL:
+		case KVM_DEV_VFIO_FILE_ADD:
+		case KVM_DEV_VFIO_FILE_DEL:
 #ifdef CONFIG_SPAPR_TCE_IOMMU
-		case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
+		case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:
 #endif
 			return 0;
 		}
-- 
2.34.1

