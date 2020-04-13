Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E061A62C9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Apr 2020 08:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480866E188;
	Mon, 13 Apr 2020 06:02:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EF86E188
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Apr 2020 06:01:59 +0000 (UTC)
IronPort-SDR: c0mb1jinXxWyznEtpYrYUg60SSyvffwbbzIupgGyhyBwMDD8ohTRNfHA6fExtc2vk4F3xbYS3f
 XWqrbcXgUHew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2020 23:01:59 -0700
IronPort-SDR: O5wdGuyQlc7bo5KmVytTBytv4gIaY33RmF0q8WDMiPNVI4GCYyrC5X6Yd4Ae+HQAXSFb7BKflg
 896Qwv3gpldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,377,1580803200"; d="scan'208";a="453054045"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2020 23:01:52 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5 0/4] introduction of migration_version attribute for VFIO
 live migration
Date: Mon, 13 Apr 2020 01:52:01 -0400
Message-Id: <20200413055201.27053-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 libvir-list@redhat.com, Zhengxiao.zx@alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, corbet@lwn.net, yi.l.liu@intel.com, eskultet@redhat.com,
 ziye.yang@intel.com, mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com,
 Yan Zhao <yan.y.zhao@intel.com>, xin.zeng@intel.com, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, dinechin@redhat.com, alex.williamson@redhat.com,
 changpeng.liu@intel.com, berrange@redhat.com, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This patchset introduces a migration_version attribute under sysfs of VFIO
Mediated devices.

This migration_version attribute is used to check migration compatibility
between two mdev devices.

Currently, it has two locations:
(1) under mdev_type node,
    which can be used even before device creation, but only for mdev
    devices of the same mdev type.
(2) under mdev device node,
    which can only be used after the mdev devices are created, but the src
    and target mdev devices are not necessarily be of the same mdev type
(The second location is newly added in v5, in order to keep consistent
with the migration_version node for migratable pass-though devices)

Patch 1 defines migration_version attribute for the first location in
Documentation/vfio-mediated-device.txt

Patch 2 uses GVT as an example for patch 1 to show how to expose
migration_version attribute and check migration compatibility in vendor
driver.

Patch 3 defines migration_version attribute for the second location in
Documentation/vfio-mediated-device.txt

Patch 4 uses GVT as an example for patch 3 to show how to expose
migration_version attribute and check migration compatibility in vendor
driver.

(The previous "Reviewed-by" and "Acked-by" for patch 1 and patch 2 are
kept in v5, as there are only small changes to commit messages of the two
patches.)

v5:
added patch 2 and 4 for mdev device part of migration_version attribute.

v4:
1. fixed indentation/spell errors, reworded several error messages
2. added a missing memory free for error handling in patch 2

v3:
1. renamed version to migration_version
2. let errno to be freely defined by vendor driver
3. let checking mdev_type be prerequisite of migration compatibility check
4. reworded most part of patch 1
5. print detailed error log in patch 2 and generate migration_version
string at init time

v2:
1. renamed patched 1
2. made definition of device version string completely private to vendor
driver
3. reverted changes to sample mdev drivers
4. described intent and usage of version attribute more clearly.


Yan Zhao (4):
  vfio/mdev: add migration_version attribute for mdev (under mdev_type
    node)
  drm/i915/gvt: export migration_version to mdev sysfs (under mdev_type
    node)
  vfio/mdev: add migration_version attribute for mdev (under mdev device
    node)
  drm/i915/gvt: export migration_version to mdev sysfs (under mdev
    device node)

 .../driver-api/vfio-mediated-device.rst       | 183 ++++++++++++++++++
 drivers/gpu/drm/i915/gvt/Makefile             |   2 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |  39 ++++
 drivers/gpu/drm/i915/gvt/gvt.h                |   7 +
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  55 ++++++
 drivers/gpu/drm/i915/gvt/migration_version.c  | 170 ++++++++++++++++
 drivers/gpu/drm/i915/gvt/vgpu.c               |  13 +-
 7 files changed, 466 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gvt/migration_version.c

-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
