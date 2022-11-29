Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19D63BD0B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 10:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CD210E3A0;
	Tue, 29 Nov 2022 09:35:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506A810E3A4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Nov 2022 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669714545; x=1701250545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YKHhu/G9B2KaPVN3RAKV3BFoAD9eOLEH10z2Gkl2nBY=;
 b=gV2vbl3OsCQqkhbXsZEoqhwcKd87huD58G19s09LIgazvVnTpP1wzbHs
 XO3OXNdXXZaRXY1b5KUF9dSk9RH8Zi2VuzVQewawss6E9yNuKR5tt9OeS
 wXQ85otw8VOg225APdlPdYcvHpdr/xoSWUgkfEqtuVRd/LKQrhdDCgw+X
 ErCHrXOF7v5V+lRy2HKMHkeJwuAhW6ImXRcVe9AON5Ct1PofN2p/N+FBI
 xpdsyuekYBrIWgCwwN3T7AFA8afDlpW9lwhClO7bHuE/1B89NSXTJUTsm
 PY+dpRQRtaXZZoq374/xZdxoftjjYAT7pt1ctTtseNUldjVi0Y/qF5/DE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295442198"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295442198"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 01:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="818156895"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="818156895"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga005.jf.intel.com with ESMTP; 29 Nov 2022 01:35:40 -0800
From: Yi Liu <yi.l.liu@intel.com>
To: jgg@nvidia.com
Subject: [iommufd PATCH v2 2/2] vfio/ap: validate iova during dma_unmap and
 trigger irq disable
Date: Tue, 29 Nov 2022 01:35:35 -0800
Message-Id: <20221129093535.359357-3-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129093535.359357-1-yi.l.liu@intel.com>
References: <20221129093535.359357-1-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 alex.williamson@redhat.com, chao.p.peng@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

Currently, each mapped iova is stashed in its associated vfio_ap_queue;
when we get an unmap request, validate that it matches with one or more
of these stashed values before attempting unpins.

Each stashed iova represents IRQ that was enabled for a queue.  Therefore,
if a match is found, trigger IRQ disable for this queue to ensure that
underlying firmware will no longer try to use the associated pfn after
the page is unpinned. IRQ disable will also handle the associated unpin.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/s390/crypto/vfio_ap_ops.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 0b4cc8c597ae..8bf353d46820 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1535,13 +1535,29 @@ static int vfio_ap_mdev_set_kvm(struct ap_matrix_mdev *matrix_mdev,
 	return 0;
 }
 
+static void unmap_iova(struct ap_matrix_mdev *matrix_mdev, u64 iova, u64 length)
+{
+	struct ap_queue_table *qtable = &matrix_mdev->qtable;
+	struct vfio_ap_queue *q;
+	int loop_cursor;
+
+	hash_for_each(qtable->queues, loop_cursor, q, mdev_qnode) {
+		if (q->saved_iova >= iova && q->saved_iova < iova + length)
+			vfio_ap_irq_disable(q);
+	}
+}
+
 static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
 				   u64 length)
 {
 	struct ap_matrix_mdev *matrix_mdev =
 		container_of(vdev, struct ap_matrix_mdev, vdev);
 
-	vfio_unpin_pages(&matrix_mdev->vdev, iova, 1);
+	mutex_lock(&matrix_dev->mdevs_lock);
+
+	unmap_iova(matrix_mdev, iova, length);
+
+	mutex_unlock(&matrix_dev->mdevs_lock);
 }
 
 /**
-- 
2.34.1

