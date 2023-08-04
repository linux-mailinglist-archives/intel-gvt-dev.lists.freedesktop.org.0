Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3949C76F8BC
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  4 Aug 2023 06:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C3B10E237;
	Fri,  4 Aug 2023 04:06:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E985710E236;
 Fri,  4 Aug 2023 04:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691121911; x=1722657911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VOVOcupBLREotYSG73lgI3PFl+i5iHLs3Akr9zjWLSw=;
 b=kyoHXQNvpOsV9bTvfBa3AdeockG8jLvn8iROtF4NbgafoRrighYG1jI/
 hRathtWlJefuDHh7oesqYmaWQLD7peKD1NVUVc/Q6aH9ztbh87umfBx+W
 FBRgNHwOtuZGXFNV9eJAWSMjnQ0JblHRoZ78SzQv0RkKclJxOIQes1EoH
 zOVk1cWwG8ZSY3ClDOEnzgT97b0tI2xKqkrUTUR54h2e2BCXDeGq6NKI+
 9vWDS9/Bi/TsF8bik3dmrQqCmWVg6yoXI9yArxm49NsxmQlhm2TPKqlIw
 CuW9Dxa+40LRBQFDoZV2Ah6U+gcEAdNDa/YyZ2let0knLtfK6JG/1Nigb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436384287"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="436384287"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 21:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="903719896"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="903719896"
Received: from debian-skl.sh.intel.com ([10.239.160.45])
 by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 21:05:08 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Replace dead 01.org link
Date: Fri,  4 Aug 2023 12:05:44 +0800
Message-Id: <20230804040544.1972958-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

01.org is dead so replace old gvt link with current wiki page.

Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 MAINTAINERS                      | 2 +-
 drivers/gpu/drm/i915/Kconfig     | 2 +-
 drivers/gpu/drm/i915/intel_gvt.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d516295978a4..805d33a107aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10436,7 +10436,7 @@ M:	Zhi Wang <zhi.a.wang@intel.com>
 L:	intel-gvt-dev@lists.freedesktop.org
 L:	intel-gfx@lists.freedesktop.org
 S:	Supported
-W:	https://01.org/igvt-g
+W:	https://github.com/intel/gvt-linux/wiki
 T:	git https://github.com/intel/gvt-linux.git
 F:	drivers/gpu/drm/i915/gvt/
 
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 01b5a8272a27..854255966d3d 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -140,7 +140,7 @@ config DRM_I915_GVT_KVMGT
 
 	  Note that this driver only supports newer device from Broadwell on.
 	  For further information and setup guide, you can visit:
-	  http://01.org/igvt-g.
+	  https://github.com/intel/gvt-linux/wiki.
 
 	  If in doubt, say "N".
 
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index e98b6d69a91a..9b6d87c8b583 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -41,7 +41,7 @@
  * To virtualize GPU resources GVT-g driver depends on hypervisor technology
  * e.g KVM/VFIO/mdev, Xen, etc. to provide resource access trapping capability
  * and be virtualized within GVT-g device module. More architectural design
- * doc is available on https://01.org/group/2230/documentation-list.
+ * doc is available on https://github.com/intel/gvt-linux/wiki.
  */
 
 static LIST_HEAD(intel_gvt_devices);
-- 
2.40.1

