Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336116BCF2E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 13:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A8710ECDE;
	Thu, 16 Mar 2023 12:15:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DA310ECDF;
 Thu, 16 Mar 2023 12:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678968932; x=1710504932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ed/7XLQtYPRpjbI2Jc0ve/djdP1J5ibXosRcrYxHLiE=;
 b=NA/hDSRL0OwmurgDgqElMvbE59Mh5FD4XxjdO4G8d6kVZZUkfDlJzPYJ
 hNVipH62H58aSxNK84d+FtSHDPpbQOz0YIpnkK2xAXw/8KJPyXbDQmmUQ
 GF+Ktk+PxH9Z8FLfmngQgt4HkcgrTp1l7eOclT42q29uZ1hNH0fGqv+Kc
 1pJIgqL2QBXg3B1BvC047WQOLdJZHFlvpe2rmWKaZtxgFYqTplGbjSIxF
 bdhVkP4aDVgewLW4HeokPEgn5w6JdNeex4rOGkXXypbhDyqYhPkncbIQ1
 UNp8F9gUJgPz1bKd5Yzw4EN5IzxCDqhhOh4jRWDNYV46qCMiED0CgBM+H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336661418"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336661418"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="679874221"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="679874221"
Received: from unknown (HELO 984fee00a4c6.jf.intel.com) ([10.165.58.231])
 by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 05:15:31 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v2 5/5] vfio: Check the presence for iommufd callbacks in
 __vfio_register_dev()
Date: Thu, 16 Mar 2023 05:15:26 -0700
Message-Id: <20230316121526.5644-6-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316121526.5644-1-yi.l.liu@intel.com>
References: <20230316121526.5644-1-yi.l.liu@intel.com>
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

After making the no-DMA drivers (samples/vfio-mdev) providing iommufd
callbacks, __vfio_register_dev() should check the presence of the iommufd
callbacks if CONFIG_IOMMUFD is enabled.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/vfio/iommufd.c   | 3 ---
 drivers/vfio/vfio_main.c | 5 +++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 345ff8cf29e7..9aabd8b31c15 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -32,9 +32,6 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 		return 0;
 	}
 
-	if (WARN_ON(!vdev->ops->bind_iommufd))
-		return -ENODEV;
-
 	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
 	if (ret)
 		return ret;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 43bd6b76e2b6..89497c933490 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -255,8 +255,9 @@ static int __vfio_register_dev(struct vfio_device *device,
 {
 	int ret;
 
-	if (WARN_ON(device->ops->bind_iommufd &&
-		    (!device->ops->unbind_iommufd ||
+	if (WARN_ON(IS_ENABLED(CONFIG_IOMMUFD) &&
+		    (!device->ops->bind_iommufd ||
+		     !device->ops->unbind_iommufd ||
 		     !device->ops->attach_ioas)))
 		return -EINVAL;
 
-- 
2.34.1

