Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDE68B807
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Feb 2023 10:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4193910E337;
	Mon,  6 Feb 2023 09:05:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA0D10E33F;
 Mon,  6 Feb 2023 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675674351; x=1707210351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sk4MskotHZ8uN59dIiP9V3PVvfa9npT2eNqKJTcS4g8=;
 b=ca+uDT1CAnfJXuKnbLgMkd4E1PwRycR3SYhlwnPKK3FW0b5dVakrXFns
 GtqpkaKdLJ0DzyFW8z1LUG7h5VF9SHe35TLnjwAktLhYgEHEFxYYqlKjP
 P61YOD86tP7ROQx/oBo2lqeRh8oxzDlGxUYMnAW+UG+8UMzOu1pYHYUWn
 0MRpvWPlJShzuMV5ypBK3MCxi7/MTODvfTAMIPY2RA8/Tpmuk4UqH0Oqt
 ZKDTAATYp5mjw8II4Vc3ZPz4O1rHY0PRLyzPmaQADD5t3Ly+4geHGI0sQ
 WVcpnQFvCbmhj7YSZwaRqfsuV9Q/hNVdUSdtz3il0Z/dhK273EzSuhkfc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309495822"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="309495822"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911862813"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="911862813"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 01:05:47 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 05/14] kvm/vfio: Accept vfio device file from userspace
Date: Mon,  6 Feb 2023 01:05:23 -0800
Message-Id: <20230206090532.95598-6-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206090532.95598-1-yi.l.liu@intel.com>
References: <20230206090532.95598-1-yi.l.liu@intel.com>
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
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, jasowang@redhat.com,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, peterx@redhat.com,
 eric.auger@redhat.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 chao.p.peng@linux.intel.com, lulu@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This defines KVM_DEV_VFIO_FILE* and make alias with KVM_DEV_VFIO_GROUP*.
Old userspace uses KVM_DEV_VFIO_GROUP* works as well.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 Documentation/virt/kvm/devices/vfio.rst | 40 ++++++++++++++-----------
 include/uapi/linux/kvm.h                | 16 +++++++---
 virt/kvm/vfio.c                         | 16 +++++-----
 3 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vfio.rst b/Documentation/virt/kvm/devices/vfio.rst
index 2d20dc561069..7f84ec26ca4a 100644
--- a/Documentation/virt/kvm/devices/vfio.rst
+++ b/Documentation/virt/kvm/devices/vfio.rst
@@ -9,23 +9,26 @@ Device types supported:
   - KVM_DEV_TYPE_VFIO
 
 Only one VFIO instance may be created per VM.  The created device
-tracks VFIO groups in use by the VM and features of those groups
-important to the correctness and acceleration of the VM.  As groups
-are enabled and disabled for use by the VM, KVM should be updated
-about their presence.  When registered with KVM, a reference to the
-VFIO-group is held by KVM.
+tracks VFIO files (group or device) in use by the VM and features
+of those groups/devices important to the correctness and acceleration
+of the VM. As groups/devices are enabled and disabled for use by the
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
+  - alias: KVM_DEV_VFIO_GROUP
+
+KVM_DEV_VFIO_FILE attributes:
+  KVM_DEV_VFIO_FILE_ADD: Add a VFIO file (group/device) to VFIO-KVM device
+	tracking kvm_device_attr.addr points to an int32_t file descriptor
+	for the VFIO file.
+	- alias: KVM_DEV_VFIO_GROUP_ADD
+  KVM_DEV_VFIO_FILE_DEL: Remove a VFIO file (group/device) from VFIO-KVM
+	device tracking kvm_device_attr.addr points to an int32_t file
+	descriptor for the VFIO file.
+	- alias: KVM_DEV_VFIO_GROUP_DEL
+  KVM_DEV_VFIO_FILE_SET_SPAPR_TCE: attaches a guest visible TCE table
 	allocated by sPAPR KVM.
 	kvm_device_attr.addr points to a struct::
 
@@ -36,6 +39,7 @@ KVM_DEV_VFIO_GROUP attributes:
 
 	where:
 
-	- @groupfd is a file descriptor for a VFIO group;
-	- @tablefd is a file descriptor for a TCE table allocated via
-	  KVM_CREATE_SPAPR_TCE.
+	*) @groupfd is a file descriptor for a VFIO group;
+	*) @tablefd is a file descriptor for a TCE table allocated via
+	   KVM_CREATE_SPAPR_TCE.
+	- alias: KVM_DEV_VFIO_FILE_SET_SPAPR_TCE
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

