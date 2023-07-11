Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A0F74E4CA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jul 2023 04:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09910E2FE;
	Tue, 11 Jul 2023 02:59:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA1210E2FA;
 Tue, 11 Jul 2023 02:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689044392; x=1720580392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBfqEkX2XMrQX6lmuLi0sp6h6juMN8+5Q2BJx5EK628=;
 b=c1jrFOjMug1cynwWMf03sn7IPuOHk8LTpw9hL2yRiqxe/Iyg+EAAS0pE
 sOMVEjy7kjjkXrxbqQ8KiNd1xp+Xe+QoZKvTQzconUglee6+H1KXpvMSY
 qgHms0A7ob77wx4ZN9fL5mzU9CLo2dcH1Hv09xbwWyyWdvwIBitRZJ+UM
 AYmsOtO5rT61enaxdWZ435EJWsEyvChDF3BlziTmtShilfwsrNF65qsN6
 9mGim/RRaUOM9StmAnptPfIgRLbiVN3oYCmjYw4KkTSbdR4Ffrx47zOJl
 eG3ckiW6lS9stu01CIVDW64vlTx6i7+juXg6BOZonbZUi47OidnF9zO2q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361973185"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="361973185"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724250917"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="724250917"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 19:59:50 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	jgg@nvidia.com,
	kevin.tian@intel.com
Subject: [PATCH v14 20/26] iommufd: Add iommufd_ctx_from_fd()
Date: Mon, 10 Jul 2023 19:59:22 -0700
Message-Id: <20230711025928.6438-21-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711025928.6438-1-yi.l.liu@intel.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
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
 drivers/iommu/iommufd/main.c | 23 +++++++++++++++++++++++
 include/linux/iommufd.h      |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 32ce7befc8dd..e99a338d4fdf 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -377,6 +377,29 @@ struct iommufd_ctx *iommufd_ctx_from_file(struct file *file)
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
+	struct iommufd_ctx *iommufd;
+	struct fd f;
+
+	f = fdget(fd);
+	if (!f.file)
+		return ERR_PTR(-EBADF);
+
+	iommufd = iommufd_ctx_from_file(f.file);
+
+	fdput(f);
+	return iommufd;
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

