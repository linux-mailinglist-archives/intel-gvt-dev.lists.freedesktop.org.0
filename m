Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C052053C4E9
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Jun 2022 08:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BCD113A89;
	Fri,  3 Jun 2022 06:33:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572DC113A89
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Jun 2022 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hL0qdlLPGNQz2kcCUdvTM+8nVVuLUSOHVZ6rpwpj6XQ=; b=cx8RDfp916tlLF3pTFkj5FrxxT
 x4mU0pdjLgE9NDq/gNV9kW4C7Sl5ymhOhYci8q56Y0Abq1fX/ugAweHbdLhHEEMxwBiCjn4X1Vnac
 nWfThUw5aV83/kwdEILRoXV04JStwiNsoS7EiEQO/FIh5nAhA5ZLvitrs9t1Vabeo2zt/HdYFJbWf
 SEAPqz1E7vstMdzPdyqSAnwS6WeRoZkeHwHHV7SRoIzSJVaH1lKD5RE+Z39O5gJdIxDMUbLA12hHM
 omr/SgPFD/QD4xm/Z9XuFPkigPAGaYIYeuR+f3guiuHKBssELETv+f7Q4EVaOdsPaQRNu0O6cafnl
 WH4hdGrQ==;
Received: from [2001:4bb8:185:a81e:b29a:8b56:eb9a:ca3b] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nx0sS-00612w-G3; Fri, 03 Jun 2022 06:33:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 5/8] vfio/mdev: remove mdev_from_dev
Date: Fri,  3 Jun 2022 08:33:25 +0200
Message-Id: <20220603063328.3715-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220603063328.3715-1-hch@lst.de>
References: <20220603063328.3715-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-s390@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 kvm@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Just open code it in the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vfio/mdev/mdev_core.c | 6 ++----
 include/linux/mdev.h          | 4 ----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 34b01d45cfe9f..3575e893b5e43 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -56,10 +56,8 @@ static void mdev_device_remove_common(struct mdev_device *mdev)
 
 static int mdev_device_remove_cb(struct device *dev, void *data)
 {
-	struct mdev_device *mdev = mdev_from_dev(dev);
-
-	if (mdev)
-		mdev_device_remove_common(mdev);
+	if (dev->bus == &mdev_bus_type)
+		mdev_device_remove_common(to_mdev_device(dev));
 	return 0;
 }
 
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index cbb53dcd20d9d..5811b5a52a511 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -102,9 +102,5 @@ static inline struct device *mdev_dev(struct mdev_device *mdev)
 {
 	return &mdev->dev;
 }
-static inline struct mdev_device *mdev_from_dev(struct device *dev)
-{
-	return dev->bus == &mdev_bus_type ? to_mdev_device(dev) : NULL;
-}
 
 #endif /* MDEV_H */
-- 
2.30.2

