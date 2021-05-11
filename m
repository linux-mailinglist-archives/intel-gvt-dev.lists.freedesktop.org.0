Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1A37A211
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 May 2021 10:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEEC6E9FF;
	Tue, 11 May 2021 08:31:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A6E6E9FF;
 Tue, 11 May 2021 08:31:33 +0000 (UTC)
IronPort-SDR: DyrGVN8SqLtpi3VnPnw1pXNcOfHexmPzshjDGabw83pYJcOJRTR7GUgS3J0GT7AQK9dk1L+XDK
 ptkrKq7jg/5w==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284875143"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="284875143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:31:33 -0700
IronPort-SDR: UixSdcZJa4QV/0/jhh2zleKHHHl3rxr9X6GYODaJ6QWPGb7RtpPBpzrgqIpl2rwkFH8VyI/0OR
 K7WjQXmKOUrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536895420"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2021 01:31:32 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] Revert "vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV"
Date: Tue, 11 May 2021 16:33:32 +0800
Message-Id: <20210511083332.1740601-4-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This reverts commit 07e543f4f9d116d6b4240644191dee6388ef4a85.

As I915_GVT dependency issue is resolved, revert this.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 8f15bfb5faac..93f4d059fc89 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -102,7 +102,6 @@ config DRM_I915_GVT
 	bool "Enable Intel GVT-g graphics virtualization host support"
 	depends on DRM_I915
 	depends on 64BIT
-	depends on VFIO_MDEV
 	default n
 	help
 	  Choose this option if you want to enable Intel GVT-g graphics
-- 
2.31.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
