Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8761A1BA7
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Apr 2020 07:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F436E94B;
	Wed,  8 Apr 2020 05:58:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B716E94B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  8 Apr 2020 05:58:29 +0000 (UTC)
IronPort-SDR: y1iJEIm59nVa459SO/ayh1i3mmIhg3rFE7TiRuj6EHVhjx2CtcA3PQfuFPoJ9kUGt3lnfBSrIo
 8XkMqggEX2Yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 22:58:28 -0700
IronPort-SDR: nigPgWNZ4HNvtX3+5bC0TRUwPQav0GP4vhUeO2QxmnWEU0zKC8QvU3RwW2r3XytmLQrmZZvWtE
 cG7gw2j3TKXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="286448333"
Received: from jianli5-mobl2.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.249.173.130])
 by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2020 22:58:27 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: alex.williamson@redhat.com
Subject: [PATCH v3 1/2] Documentation/driver-api/vfio-mediated-device.rst:
 update for aggregation support
Date: Wed,  8 Apr 2020 13:58:23 +0800
Message-Id: <20200408055824.2378-2-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326054136.2543-1-zhenyuw@linux.intel.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
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
Cc: "Jiang, Dave" <dave.jiang@intel.com>, kevin.tian@intel.com,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Update doc for mdev aggregation support. Describe mdev generic
parameter directory under mdev device directory.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: "Jiang, Dave" <dave.jiang@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 .../driver-api/vfio-mediated-device.rst       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 25eb7d5b834b..fcc031adcf63 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -269,6 +269,9 @@ Directories and Files Under the sysfs for Each mdev Device
   |--- [$MDEV_UUID]
          |--- remove
          |--- mdev_type {link to its type}
+         |--- mdev [optional]
+	     |--- aggregated_instances [optional]
+	     |--- max_aggregation [optional]
          |--- vendor-specific-attributes [optional]
 
 * remove (write only)
@@ -281,6 +284,25 @@ Example::
 
 	# echo 1 > /sys/bus/mdev/devices/$mdev_UUID/remove
 
+* mdev directory (optional)
+
+Vendor driver could create mdev directory to specify extra generic parameters
+on mdev device by its type. Currently aggregation parameters are defined.
+Vendor driver should provide both items to support.
+
+1) aggregated_instances (read/write)
+
+Set target aggregated instances for device. Reading will show current
+count of aggregated instances. Writing value larger than max_aggregation
+would fail and return error. Multiple writes could be done to adjust the
+setting but ensure to not exceed max_aggregation. Normally write won't
+be success after device open.
+
+2) max_aggregation (read only)
+
+Show maxium allowed instances which can be aggregated for this device. Maxium
+aggregation could be dynamic changed by vendor driver.
+
 Mediated device Hot plug
 ------------------------
 
-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
