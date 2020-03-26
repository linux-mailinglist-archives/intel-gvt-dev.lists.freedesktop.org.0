Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC41937F6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Mar 2020 06:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF676E277;
	Thu, 26 Mar 2020 05:41:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EA96E277
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Mar 2020 05:41:40 +0000 (UTC)
IronPort-SDR: K2lXw25Vr/NpZUeSp2BCSri8LlNMrm8f0O0WAFvwHgVY6EIrkdE7FmON3iAeRut4Ld7lnECcWQ
 rVyg2u7TOB7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 22:41:40 -0700
IronPort-SDR: sFznkQhR+w+6OcLtC/sm6RMZ1bl5a3O1T3PyMuBYlLSeNP+h21TgDIHDcNTDkgXRsVCVqf6W2x
 1ptFnUhGLHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="393862307"
Received: from zhaji-mobl3.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.249.174.174])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 22:41:38 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: alex.williamson@redhat.com
Subject: [PATCH v2 1/2] Documentation/driver-api/vfio-mediated-device.rst:
 update for aggregation support
Date: Thu, 26 Mar 2020 13:41:35 +0800
Message-Id: <20200326054136.2543-2-zhenyuw@linux.intel.com>
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
 .../driver-api/vfio-mediated-device.rst       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 25eb7d5b834b..29c29432a847 100644
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
@@ -281,6 +284,22 @@ Example::
 
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
+would fail and return error.
+
+2) max_aggregation (read only)
+
+Show maxium instances for aggregation.
+
 Mediated device Hot plug
 ------------------------
 
-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
