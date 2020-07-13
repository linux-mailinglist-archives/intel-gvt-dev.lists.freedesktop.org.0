Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5617A21E3BE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jul 2020 01:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B4F6E837;
	Mon, 13 Jul 2020 23:40:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4104B6E837
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Jul 2020 23:40:56 +0000 (UTC)
IronPort-SDR: Q/UK58FvTVZ2Kz/wbTaR5KZhozmWl8l6NPl3Mo/Sl/cmEUpSVO+MJjmkHt2lwrcTXLW7C6G/Cn
 gNiJ1hjesQyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166866757"
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="166866757"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 16:40:55 -0700
IronPort-SDR: 1h4vH42+Z+z04lQiJsHsZ/SrGC+OgsckHNxN2wpcL/TuqQCZFhkeb9V8EMvow3MFHWYQN5Jmel
 VTJOyInCWhbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="299353622"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga002.jf.intel.com with ESMTP; 13 Jul 2020 16:40:50 -0700
Date: Tue, 14 Jul 2020 07:29:57 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: devel@ovirt.org, openstack-discuss@lists.openstack.org,
 libvir-list@redhat.com
Subject: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200713232957.GD5955@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: shaohe.feng@intel.com, corbet@lwn.net, kevin.tian@intel.com,
 berrange@redhat.com, kvm@vger.kernel.org, eskultet@redhat.com,
 cohuck@redhat.com, jian-feng.ding@intel.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, dgilbert@redhat.com, bao.yumeng@zte.com.cn,
 alex.williamson@redhat.com, zhenyuw@linux.intel.com, smooney@redhat.com,
 xin-ran.wang@intel.com, dinechin@redhat.com, hejie.xu@intel.com,
 intel-gvt-dev@lists.freedesktop.org, eauger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

hi folks,
we are defining a device migration compatibility interface that helps upper
layer stack like openstack/ovirt/libvirt to check if two devices are
live migration compatible.
The "devices" here could be MDEVs, physical devices, or hybrid of the two.
e.g. we could use it to check whether
- a src MDEV can migrate to a target MDEV,
- a src VF in SRIOV can migrate to a target VF in SRIOV,
- a src MDEV can migration to a target VF in SRIOV.
  (e.g. SIOV/SRIOV backward compatibility case)

The upper layer stack could use this interface as the last step to check
if one device is able to migrate to another device before triggering a real
live migration procedure.
we are not sure if this interface is of value or help to you. please don't
hesitate to drop your valuable comments.


(1) interface definition
The interface is defined in below way:

             __    userspace
              /\              \
             /                 \write
            / read              \
   ________/__________       ___\|/_____________
  | migration_version |     | migration_version |-->check migration
  ---------------------     ---------------------   compatibility
     device A                    device B


a device attribute named migration_version is defined under each device's
sysfs node. e.g. (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/migration_version).
userspace tools read the migration_version as a string from the source device,
and write it to the migration_version sysfs attribute in the target device.

The userspace should treat ANY of below conditions as two devices not compatible:
- any one of the two devices does not have a migration_version attribute
- error when reading from migration_version attribute of one device
- error when writing migration_version string of one device to
  migration_version attribute of the other device

The string read from migration_version attribute is defined by device vendor
driver and is completely opaque to the userspace.
for a Intel vGPU, string format can be defined like
"parent device PCI ID" + "version of gvt driver" + "mdev type" + "aggregator count".

for an NVMe VF connecting to a remote storage. it could be
"PCI ID" + "driver version" + "configured remote storage URL"

for a QAT VF, it may be
"PCI ID" + "driver version" + "supported encryption set".

(to avoid namespace confliction from each vendor, we may prefix a driver name to
each migration_version string. e.g. i915-v1-8086-591d-i915-GVTg_V5_8-1)


(2) backgrounds

The reason we hope the migration_version string is opaque to the userspace
is that it is hard to generalize standard comparing fields and comparing
methods for different devices from different vendors.
Though userspace now could still do a simple string compare to check if
two devices are compatible, and result should also be right, it's still
too limited as it excludes the possible candidate whose migration_version
string fails to be equal.
e.g. an MDEV with mdev_type_1, aggregator count 3 is probably compatible
with another MDEV with mdev_type_3, aggregator count 1, even their
migration_version strings are not equal.
(assumed mdev_type_3 is of 3 times equal resources of mdev_type_1).

besides that, driver version + configured resources are all elements demanding
to take into account.

So, we hope leaving the freedom to vendor driver and let it make the final decision
in a simple reading from source side and writing for test in the target side way.


we then think the device compatibility issues for live migration with assigned
devices can be divided into two steps:
a. management tools filter out possible migration target devices.
   Tags could be created according to info from product specification.
   we think openstack/ovirt may have vendor proprietary components to create
   those customized tags for each product from each vendor.
   e.g.
   for Intel vGPU, with a vGPU(a MDEV device) in source side, the tags to
   search target vGPU are like:
   a tag for compatible parent PCI IDs,
   a tag for a range of gvt driver versions,
   a tag for a range of mdev type + aggregator count

   for NVMe VF, the tags to search target VF may be like:
   a tag for compatible PCI IDs,
   a tag for a range of driver versions,
   a tag for URL of configured remote storage.

b. with the output from step a, openstack/ovirt/libvirt could use our proposed
   device migration compatibility interface to make sure the two devices are
   indeed live migration compatible before launching the real live migration
   process to start stream copying, src device stopping and target device
   resuming.
   It is supposed that this step would not bring any performance penalty as
   -in kernel it's just a simple string decoding and comparing
   -in openstack/ovirt, it could be done by extending current function
    check_can_live_migrate_destination, along side claiming target resources.[1]


[1] https://specs.openstack.org/openstack/nova-specs/specs/stein/approved/libvirt-neutron-sriov-livemigration.html

Thanks
Yan

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
