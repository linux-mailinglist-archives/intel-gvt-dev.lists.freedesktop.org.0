Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4026C9FC4
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 11:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46A210E398;
	Mon, 27 Mar 2023 09:35:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C497E10E398;
 Mon, 27 Mar 2023 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679909706; x=1711445706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=prR90xwsDCfDNxJjL9hXgdF5o6pMTiJmwWoTjfPFxLM=;
 b=Ide1G07qrFIf/qC5ex7HwL+PjPlSGRkq2afL/BI4nPI6BvaNvX2JMWzS
 0TzHbEAVgNZYmkmt2Byc9EbACF3nJQdcR2Euq/ZYVVFHuzBClJi30n8eI
 RM9Hq6VyQQVmf5goT1w+hBZd53xBdEvxBgNd0HVfMv1IxRdmh3PTMQlAw
 3c0BfGZlcQ0Nc8BVP7ivMapW4RU7ovUO8Lk8fCXs8MAKd7sOvoWniZ4C4
 QouoCa2qCW46cUN2C0zckm00s/IV8k+Eo90fAe7+IgrwFkBDgaPyLvIcX
 fVboqu7CpFmKV3qqVwkvgUghoFQaFlVqEHNaaP1deWn+wm5Zg5SUANB2H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="319879559"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="319879559"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 02:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="633554656"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="633554656"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga003.jf.intel.com with ESMTP; 27 Mar 2023 02:35:06 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 07/10] vfio: Accpet device file from vfio PCI hot reset path
Date: Mon, 27 Mar 2023 02:34:55 -0700
Message-Id: <20230327093458.44939-8-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327093458.44939-1-yi.l.liu@intel.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, yi.l.liu@intel.com, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This extends both vfio_file_is_valid() and vfio_file_has_dev() to accept
device file from the vfio PCI hot reset.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/vfio_main.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index fe7446805afd..ebbb6b91a498 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1154,13 +1154,23 @@ const struct file_operations vfio_device_fops = {
 	.mmap		= vfio_device_fops_mmap,
 };
 
+static struct vfio_device *vfio_device_from_file(struct file *file)
+{
+	struct vfio_device *device = file->private_data;
+
+	if (file->f_op != &vfio_device_fops)
+		return NULL;
+	return device;
+}
+
 /**
  * vfio_file_is_valid - True if the file is valid vfio file
  * @file: VFIO group file or VFIO device file
  */
 bool vfio_file_is_valid(struct file *file)
 {
-	return vfio_group_from_file(file);
+	return vfio_group_from_file(file) ||
+	       vfio_device_from_file(file);
 }
 EXPORT_SYMBOL_GPL(vfio_file_is_valid);
 
@@ -1174,12 +1184,17 @@ EXPORT_SYMBOL_GPL(vfio_file_is_valid);
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
 {
 	struct vfio_group *group;
+	struct vfio_device *vdev;
 
 	group = vfio_group_from_file(file);
-	if (!group)
-		return false;
+	if (group)
+		return vfio_group_has_dev(group, device);
+
+	vdev = vfio_device_from_file(file);
+	if (vdev)
+		return vdev == device;
 
-	return vfio_group_has_dev(group, device);
+	return false;
 }
 EXPORT_SYMBOL_GPL(vfio_file_has_dev);
 
-- 
2.34.1

