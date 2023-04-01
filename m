Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5861B6D316F
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 16:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF01210E105;
	Sat,  1 Apr 2023 14:44:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415EA10E105;
 Sat,  1 Apr 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680360273; x=1711896273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7k2A4DGuW0zc8hE6tthl+NEC6pCTmIh+4U8pGHD+swY=;
 b=BcfRgSNq7q/B9/DKCRmtxVVCHIX7ncJ2YpsPyQsCAR3WsfiKHk/Y4eRZ
 4W05+KAfa/fIya1U9Kn46jpclXu8nORSknZSgMZLFu57B/KKmToZfLOLF
 fCOO0MrM6urGpx51VPZVM0MG+vWwS9iRZNdadqlojHN7onAN1AGf0/y3S
 N9erGY70Ix2Nd/s/PTZyprUdc00XpAAM8bIBKcMhVdMZwdmjm6WE4OSCh
 OONCJ9vavY70aSlCj8Mq/1N+nzQkJ69vdTb0ij7RVbWla598mqxvKNFRF
 mgDYsVpOEmn+u/rckBe4snqzP1g7QC+OyhGx8p/f6ipz5Ve/KsJETke5s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340385089"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="340385089"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 07:44:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662705813"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="662705813"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 07:44:32 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v3 02/12] vfio/pci: Only check ownership of opened devices in
 hot reset
Date: Sat,  1 Apr 2023 07:44:19 -0700
Message-Id: <20230401144429.88673-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401144429.88673-1-yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
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

If the affected device is not opened by any user, it's safe to reset it
given it's not in use.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yanting Jiang <yanting.jiang@intel.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 14 +++++++++++---
 include/uapi/linux/vfio.h        |  8 ++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 65bbef562268..5d745c9abf05 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2429,10 +2429,18 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 
 	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
 		/*
-		 * Test whether all the affected devices are contained by the
-		 * set of groups provided by the user.
+		 * Test whether all the affected devices can be reset by the
+		 * user.
+		 *
+		 * Resetting an unused device (not opened) is safe, because
+		 * dev_set->lock is held in hot reset path so this device
+		 * cannot race being opened by another user simultaneously.
+		 *
+		 * Otherwise all opened devices in the dev_set must be
+		 * contained by the set of groups provided by the user.
 		 */
-		if (!vfio_dev_in_groups(cur_vma, groups)) {
+		if (cur_vma->vdev.open_count &&
+		    !vfio_dev_in_groups(cur_vma, groups)) {
 			ret = -EINVAL;
 			goto err_undo;
 		}
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 0552e8dcf0cb..f96e5689cffc 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -673,6 +673,14 @@ struct vfio_pci_hot_reset_info {
  * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
  *				    struct vfio_pci_hot_reset)
  *
+ * Userspace requests hot reset for the devices it uses.  Due to the
+ * underlying topology, multiple devices can be affected in the reset
+ * while some might be opened by another user.  To avoid interference
+ * the calling user must ensure all affected devices, if opened, are
+ * owned by itself.
+ *
+ * The ownership is proved by an array of group fds.
+ *
  * Return: 0 on success, -errno on failure.
  */
 struct vfio_pci_hot_reset {
-- 
2.34.1

