Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396C6B08CB
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 14:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12F010E5DF;
	Wed,  8 Mar 2023 13:29:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E8F10E5FC;
 Wed,  8 Mar 2023 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282162; x=1709818162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KV5nYt7nyzNQTkdxfsQ1VW0eB5Eh57ig35tZj0LnWI=;
 b=hqeGGi38gt6LTgRdW9QWioo3TX9p+vvgsry7YvPKe1FTc3m7rX3089DY
 1xQse+cArh4mpmNx2VPcqdUO0xIWvZ5N/eSlEciGOdCobl1G0qhhG5TCR
 PlqlWSGi0Zi9i96b/g/AnmmTNKkyrKfg1PbhYp5o2K3KGRvip/CKDnbKO
 SqimYZvN8YmaQnR8XyqFDCRaVgLKWLzr7EYtYV0JvJmUCg7Ybc3trZZgf
 yt0BW7TK8yNdzprc14abuk/5H52D5ajcRoi0CNQhw+2Gl7S9/qj+v5kl3
 BlBsJMDdaGT6zuSj3yNmXEI8sufLr4GXuSLetLq2v8PF2Pr5/VX36UjyS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336165199"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336165199"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922789347"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922789347"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:29:21 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v6 09/24] vfio/pci: Only need to check opened devices in the
 dev_set for hot reset
Date: Wed,  8 Mar 2023 05:28:48 -0800
Message-Id: <20230308132903.465159-10-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308132903.465159-1-yi.l.liu@intel.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
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

If the affected device is not opened by any user, it is not necessary to
check its ownership as it will not be opened by any user if a user is hot
resetting a device within this dev_set.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 17 +++++++++++++++--
 include/uapi/linux/vfio.h        |  8 ++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 65bbef562268..f13b093557a9 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2429,10 +2429,23 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 
 	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
 		/*
-		 * Test whether all the affected devices are contained by the
+		 * Test whether all the affected devices can be reset by the
+		 * user.  The affected devices may already been opened or not
+		 * yet.
+		 *
+		 * For the devices not opened yet, user can reset them as it
+		 * reason is that the hot reset is done under the protection
+		 * of the dev_set->lock, and device open is also under this
+		 * lock.  During the hot reset, such devices can not be opened
+		 * by other users.
+		 *
+		 * For the devices that have been opened, needs to check the
+		 * ownership.  If the user provides a set of group fds, test
+		 * whether all the opened affected devices are contained by the
 		 * set of groups provided by the user.
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

