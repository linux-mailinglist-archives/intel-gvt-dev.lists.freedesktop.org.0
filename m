Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF56BCFC7
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410AA10ECC7;
	Thu, 16 Mar 2023 12:42:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800F610E19F;
 Thu, 16 Mar 2023 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678970545; x=1710506545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=21n59NueoZg+YCLGA7KIVcAZ1swA7rO+1yGotBMrp8E=;
 b=C2VHYO2GNbE0sx9KG1RKO1UgBA0jPFCSUGLFijqhwlgv73vIhvh0LPHY
 I5HF5nWlCJLG0cYlzbDb4hLlu1SrVLq9BWySm80FpxzgUBUWGURgF8SrY
 t5ElKKCi77etfkk8mlqMe6yjcWINgq64GNf3Dbb6shBa9bLO6ETtfZ5rS
 yl/SCgD0UrOK6CegEkkbxtuE9QjnqdqBzC6pY3sMALraV7NSDTRjbPHcV
 VlvedpnadZmmMRAu36E71mdC5Wr8/w6v17NMDU09R/Vz9wzGocBJWxA2O
 WVrLeDUwbdrhBTv6wKMcIKqgUhu1c+bUR89aPYr78WlquETZ4FhWyJwxp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="321812113"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="321812113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="1009208007"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009208007"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2023 05:42:13 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH 6/7] vfio: Accpet device file from vfio PCI hot reset path
Date: Thu, 16 Mar 2023 05:41:55 -0700
Message-Id: <20230316124156.12064-7-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316124156.12064-1-yi.l.liu@intel.com>
References: <20230316124156.12064-1-yi.l.liu@intel.com>
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
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 xudong.hao@intel.com, peterx@redhat.com, yan.y.zhao@intel.com,
 eric.auger@redhat.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This extends both vfio_file_is_valid() and vfio_file_has_dev() to accept
device file from the vfio PCI hot reset.

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

