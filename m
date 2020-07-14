Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB021EDCA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jul 2020 12:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A9A6E82D;
	Tue, 14 Jul 2020 10:22:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1690B6E82D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jul 2020 10:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594722123;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9DSX05+68uv6zmOhHnKkH5fM6ROz5UyBxekKN+QVPUM=;
 b=VrwT6slMktuyCbHY1P3bpjianUWXYzz8H5yqwQls9kZaK5r4BmDW5BHrLeZz4aOU9nUR75
 6BHZQK6NagmPkrzRfgoaWZDJCg+ZrQTnULpdHLZycLzkozRh+cyYpFGQz0BU3kXMt5zt2f
 +lPPAgW6aZ2HoJmwzNsTvaR07hhE1XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Op6OYhoLM56Ia5-745wFjQ-1; Tue, 14 Jul 2020 06:21:55 -0400
X-MC-Unique: Op6OYhoLM56Ia5-745wFjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD1F1DE0;
 Tue, 14 Jul 2020 10:21:53 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 373032B6F1;
 Tue, 14 Jul 2020 10:21:31 +0000 (UTC)
Date: Tue, 14 Jul 2020 11:21:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200714102129.GD25187@redhat.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713232957.GD5955@joy-OptiPlex-7040>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, alex.williamson@redhat.com, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, cohuck@redhat.com, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote:
> hi folks,
> we are defining a device migration compatibility interface that helps upper
> layer stack like openstack/ovirt/libvirt to check if two devices are
> live migration compatible.
> The "devices" here could be MDEVs, physical devices, or hybrid of the two.
> e.g. we could use it to check whether
> - a src MDEV can migrate to a target MDEV,
> - a src VF in SRIOV can migrate to a target VF in SRIOV,
> - a src MDEV can migration to a target VF in SRIOV.
>   (e.g. SIOV/SRIOV backward compatibility case)
> 
> The upper layer stack could use this interface as the last step to check
> if one device is able to migrate to another device before triggering a real
> live migration procedure.
> we are not sure if this interface is of value or help to you. please don't
> hesitate to drop your valuable comments.
> 
> 
> (1) interface definition
> The interface is defined in below way:
> 
>              __    userspace
>               /\              \
>              /                 \write
>             / read              \
>    ________/__________       ___\|/_____________
>   | migration_version |     | migration_version |-->check migration
>   ---------------------     ---------------------   compatibility
>      device A                    device B
> 
> 
> a device attribute named migration_version is defined under each device's
> sysfs node. e.g. (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/migration_version).
> userspace tools read the migration_version as a string from the source device,
> and write it to the migration_version sysfs attribute in the target device.
> 
> The userspace should treat ANY of below conditions as two devices not compatible:
> - any one of the two devices does not have a migration_version attribute
> - error when reading from migration_version attribute of one device
> - error when writing migration_version string of one device to
>   migration_version attribute of the other device
> 
> The string read from migration_version attribute is defined by device vendor
> driver and is completely opaque to the userspace.
> for a Intel vGPU, string format can be defined like
> "parent device PCI ID" + "version of gvt driver" + "mdev type" + "aggregator count".
> 
> for an NVMe VF connecting to a remote storage. it could be
> "PCI ID" + "driver version" + "configured remote storage URL"
> 
> for a QAT VF, it may be
> "PCI ID" + "driver version" + "supported encryption set".
> 
> (to avoid namespace confliction from each vendor, we may prefix a driver name to
> each migration_version string. e.g. i915-v1-8086-591d-i915-GVTg_V5_8-1)
> 
> 
> (2) backgrounds
> 
> The reason we hope the migration_version string is opaque to the userspace
> is that it is hard to generalize standard comparing fields and comparing
> methods for different devices from different vendors.
> Though userspace now could still do a simple string compare to check if
> two devices are compatible, and result should also be right, it's still
> too limited as it excludes the possible candidate whose migration_version
> string fails to be equal.
> e.g. an MDEV with mdev_type_1, aggregator count 3 is probably compatible
> with another MDEV with mdev_type_3, aggregator count 1, even their
> migration_version strings are not equal.
> (assumed mdev_type_3 is of 3 times equal resources of mdev_type_1).
> 
> besides that, driver version + configured resources are all elements demanding
> to take into account.
> 
> So, we hope leaving the freedom to vendor driver and let it make the final decision
> in a simple reading from source side and writing for test in the target side way.
> 
> 
> we then think the device compatibility issues for live migration with assigned
> devices can be divided into two steps:
> a. management tools filter out possible migration target devices.
>    Tags could be created according to info from product specification.
>    we think openstack/ovirt may have vendor proprietary components to create
>    those customized tags for each product from each vendor.

>    for Intel vGPU, with a vGPU(a MDEV device) in source side, the tags to
>    search target vGPU are like:
>    a tag for compatible parent PCI IDs,
>    a tag for a range of gvt driver versions,
>    a tag for a range of mdev type + aggregator count
> 
>    for NVMe VF, the tags to search target VF may be like:
>    a tag for compatible PCI IDs,
>    a tag for a range of driver versions,
>    a tag for URL of configured remote storage.

Requiring management application developers to figure out this possible
compatibility based on prod specs is really unrealistic. Product specs
are typically as clear as mud, and with the suggestion we consider
different rules for different types of devices, add up to a huge amount
of complexity. This isn't something app developers should have to spend
their time figuring out.

The suggestion that we make use of vendor proprietary helper components
is totally unacceptable. We need to be able to build a solution that
works with exclusively an open source software stack.

IMHO there needs to be a mechanism for the kernel to report via sysfs
what versions are supported on a given device. This puts the job of
reporting compatible versions directly under the responsibility of the
vendor who writes the kernel driver for it. They are the ones with the
best knowledge of the hardware they've built and the rules around its
compatibility.

> b. with the output from step a, openstack/ovirt/libvirt could use our proposed
>    device migration compatibility interface to make sure the two devices are
>    indeed live migration compatible before launching the real live migration
>    process to start stream copying, src device stopping and target device
>    resuming.
>    It is supposed that this step would not bring any performance penalty as
>    -in kernel it's just a simple string decoding and comparing
>    -in openstack/ovirt, it could be done by extending current function
>     check_can_live_migrate_destination, along side claiming target resources.[1]




> 
> 
> [1] https://specs.openstack.org/openstack/nova-specs/specs/stein/approved/libvirt-neutron-sriov-livemigration.html
> 
> Thanks
> Yan
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
