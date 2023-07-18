Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F1757E80
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 15:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42A010E381;
	Tue, 18 Jul 2023 13:56:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA54210E372;
 Tue, 18 Jul 2023 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689688570; x=1721224570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7JlSkImz3ShAuDaiIZ+sh4zHfMa5cWhubnsyO0SRRR4=;
 b=QHszI13SMZQl+EGo7WfRDGdoqM+oSxI5oFRRLHjgjg1M9/DP2rRHjzod
 UJMYkiQww4CY1fwKxoUy/M2zPNnPEEmgLXorPO6ODndgO/C2NabB7qesI
 2sF1UeLFkgeeToYGQWEuULYNWO5xDqs2sVuWbVpq2rDL5KoTTseCXrBgL
 UpdG2lpg13tIaK2u2XtbKd7g0aGBnONZuGZt/HD99US26djDTqUIqqdXR
 vvH64f4kYNfg8FaVXZ8Zv9peW3RHFQzIcthyno3IsZG/iwLAxHulaMAdW
 gO0fyq8Ps+u9n0hWiz1gK/KgbLr/wcLwDN6EJa5U+e/RMu7cZZrbQI0Gb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452590791"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="452590791"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970251096"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="970251096"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 06:56:09 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v15 20/26] iommufd: Add iommufd_ctx_from_fd()
Date: Tue, 18 Jul 2023 06:55:45 -0700
Message-Id: <20230718135551.6592-21-yi.l.liu@intel.com>
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

It's common to get a reference to the iommufd context from a given file
descriptor. So adds an API for it. Existing users of this API are compiled
only when IOMMUFD is enabled, so no need to have a stub for the IOMMUFD
disabled case.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 drivers/iommu/iommufd/main.c | 24 ++++++++++++++++++++++++
 include/linux/iommufd.h      |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 32ce7befc8dd..4bbb20dff430 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -377,6 +377,30 @@ struct iommufd_ctx *iommufd_ctx_from_file(struct file *file)
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_file, IOMMUFD);
 
+/**
+ * iommufd_ctx_from_fd - Acquires a reference to the iommufd context
+ * @fd: File descriptor to obtain the reference from
+ *
+ * Returns a pointer to the iommufd_ctx, otherwise ERR_PTR. On success
+ * the caller is responsible to call iommufd_ctx_put().
+ */
+struct iommufd_ctx *iommufd_ctx_from_fd(int fd)
+{
+	struct file *file;
+
+	file = fget(fd);
+	if (!file)
+		return ERR_PTR(-EBADF);
+
+	if (file->f_op != &iommufd_fops) {
+		fput(file);
+		return ERR_PTR(-EBADFD);
+	}
+	/* fget is the same as iommufd_ctx_get() */
+	return file->private_data;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_fd, IOMMUFD);
+
 /**
  * iommufd_ctx_put - Put back a reference
  * @ictx: Context to put back
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 3a3216cb9482..9657c58813dc 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -54,6 +54,7 @@ void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
 struct iommufd_ctx *iommufd_ctx_from_file(struct file *file);
+struct iommufd_ctx *iommufd_ctx_from_fd(int fd);
 void iommufd_ctx_put(struct iommufd_ctx *ictx);
 bool iommufd_ctx_has_group(struct iommufd_ctx *ictx, struct iommu_group *group);
 
-- 
2.34.1

